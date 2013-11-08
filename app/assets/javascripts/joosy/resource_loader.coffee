#= require joosy/resources

Joosy.ResourceLoader =
  defineResource: (name, path, parent) ->
    class @[name] extends parent
      @entity inflection.underscore(name)
      @source path

  namespaceFromLevels: (levels) ->
    levels.map((x) ->
      res = x.replace(/^\//, '').split('/')
      if res.length > 1
        # resource, has second (mask) part
        res = inflection.singularize(res[0])
      else
        # scope
        res = res[0]
      inflection.camelize res
    ).join('.')

  loadResources: (routes) ->
    for route in routes
      levels   = route.match /\/[^\/]+(\/:[^\/]+)?/g
      continue unless levels instanceof Array
      rootPath = levels.pop()
      name     = inflection.camelize inflection.singularize(rootPath.replace(/^\//, ''))

      parent = if window[name] && Joosy.Module.hasAncestor(window[name], Joosy.Resources.REST)
        window[name]
      else if !window[name]
        @defineResource.call window, name, rootPath, Joosy.Resources.REST
      else
        Joosy.Resources.REST

      if (ns = @namespaceFromLevels(levels)) != ''
        Joosy.namespace ns, ->
          Joosy.ResourceLoader.defineResource.call @, name, route, parent
