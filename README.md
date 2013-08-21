# Joosy::Rails 

![Joosy](http://f.cl.ly/items/2N2J453J2B353F1A0t0I/joocy1.1.png)

Rails bindings for the [Joosy](http://joosy.ws) Framework.

[![Gem Version](https://badge.fury.io/rb/joosy-rails.png)](http://badge.fury.io/rb/joosy-rails)
[![Dependency Status](https://gemnasium.com/joosy/joosy-rails.png)](https://gemnasium.com/joosy/joosy-rails)

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

#### rails g joosy:application (NAME)

Generates basic application and patches route to make it loadable straight away.

By default an application will be generated directly at `app/assets/javascripts`. If you want to isolate it a bit more, pass in the `NAME` argument &mdash; then it will appear at `app/assets/javascripts/NAME`.

#### rails g joosy:layout NAME (APPLICATION)

Generates Joosy layout. `NAME` can contain slashes to automatically generate corresponding path and namespace.

Note that if the application was initially generated with the usage of `NAME` option, you should pass it here as the second parameter (APPLICATION).

#### rails g joosy:page NAME (APPLICATION)

Generates Joosy page. `NAME` can contain slashes to automatically generate corresponding path and namespace.

Note that if the application was initially generated with the usage of `NAME` option, you should pass it here as the second parameter (APPLICATION).

#### rails g joosy:widget NAME (APPLICATION)

Generates Joosy widget. `NAME` can contain slashes to automatically generate corresponding path and namespace.

Note that if the application was initially generated with the usage of `NAME` option, you should pass it here as the second parameter (APPLICATION).

#### rails g joosy:controller NAME (--copy)

Generates a controller serving Joosy application using the NAME given.

By default a controller will inherit from internal `Joosy::Rails::ServeController`. If instead you want to patch it from the ground, use `--copy` option that will make generator to create raw controller that inherits from `ActionController::Base`.

### Serving controller and helpers

This gem provides `joosy` routing helper which can be used in the following way:

```ruby
joosy '/', application: 'dummy'
```

This will map your `dummy` Joosy application to the root url. The `application` option is optional. It should reflect path to application from `app/assets/javascript` (use the value that you passed into the NAME of `rails g joosy:application`).

## Maintainers

* Boris Staal, [@inossidabile](http://staal.io)

## License

Copyright 2013 [Boris Staal](http://staal.io)

It is free software, and may be redistributed under the terms of MIT license.
