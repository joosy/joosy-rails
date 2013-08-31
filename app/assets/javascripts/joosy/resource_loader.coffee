#= require joosy/extensions/resources

Joosy.ResourceLoader =
  defineResource: (name, path, parent) ->
    class @[name] extends parent
      @entity name.underscore()
      @source path

  namespaceFromLevels: (levels) ->
    levels.map((x) ->
      res = x.replace(/^\//, '').split('/')
      if res.length > 1
        # resource, has second (mask) part
        res = res[0].singularize()
      else
        # scope
        res = res[0]
      res.camelize()
    ).join('.')

  loadResources: (routes) ->
    for route in routes
      levels   = route.match /\/[^\/]+(\/:[^\/]+)?/g
      continue unless Object.isArray(levels)
      rootPath = levels.pop()
      name     = rootPath.replace(/^\//, '').singularize().camelize()

      parent = if window[name] && Joosy.Module.hasAncestor(window[name], Joosy.Resources.REST)
        window[name]
      else if !window[name]
        @defineResource.call window, name, rootPath, Joosy.Resources.REST
      else
        Joosy.Resources.REST

      if (ns = @namespaceFromLevels(levels)) != ''
        Joosy.namespace ns, ->
          Joosy.ResourceLoader.defineResource.call @, name, route, parent
