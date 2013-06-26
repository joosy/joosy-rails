# Joosy::Rails 

![Joosy](http://f.cl.ly/items/2N2J453J2B353F1A0t0I/joocy1.1.png)

Rails ties for the [Joosy](http://joosy.ws) Framework

[![Gem Version](https://badge.fury.io/rb/joosy-rails.png)](http://badge.fury.io/rb/joosy-rails)
[![Dependency Status](https://gemnasium.com/joosy/rails.png)](https://gemnasium.com/joosy/rails)

On the menu:

  * Full assets integration
  * Generators
  * Built-in serving controller
  * Routes helpers

## Installation

Add this line to your application's Gemfile:

    gem 'joosy-rails'

And then execute:

    $ bundle

## Usage

### Generators

  * `rails g joosy:application :name` – generates basic application and patches routes to make it loadable straight away.<br>
    **:name** can (and in most cases should) be ommited.<br>

  * `rails g joosy:layout :name (:application)` – generates new `Joosy.Layout`.<br>
    **:name** can include any namespace (i.e. 'deeply/nested/layout').<br>
    **:application** is a name of an application.<br>

  * `rails g joosy:page :name (:application)` – generates new `Joosy.Page`.<br>
    **:name** can include any namespace (i.e. 'deeply/nested/page').<br>
    **:application** is a name of an application.<br>

  * `rails g joosy:widget :name (:application)` – generates new `Joosy.Widget`.<br>
    **:name** can include any namespace (i.e. 'deeply/nested/widget').<br>
    **:application** is a name of an application.

### Serving controller and helpers

This gem provides `joosy` routing helper which can be used in the following way:

```ruby
joosy '/', application: 'dummy'
```

This will map your `dummy` Joosy application to the root url. Note that `application` option is optional and can be ommited just like `:name` option of the application generator.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
