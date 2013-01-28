Semistatic
=============

This project rocks and uses MIT-LICENSE.

On the application route file
-----------------------------

```ruby
  Rails.application.routes.draw do
    match ':slug.html' => 'semistatic/page_view#show', as: :page
    mount Semistatic::Engine => "/admin"
  end
```

The config file
-----------------------------

```yml
  #config/semistatic.yaml
  pages:
    about:
      parts:
        title:
          type: String
        body:
          type: Html
    profile:
      parts:
        avatar:
          type: image
          # paperclip styles. Use the original key to set the image size
          styles:
            original: 200x200>
            thumb: 50x50>
        about:
          type: html
        slogan:
          type: string
```

The templates
-----------------------------

Create the templates inside app/views/templates. Use the the @presenter instance val to
ouput the field content with <%= @presenter.output(:field_name) %>

about page: app/views/layouts/templates/about.html.erb

```ruby
  <h1><%= @presenter.output(:page_title) %></h1>

  <div class="body">
    <%= @presenter.output(:body) %>
  </div>
```

profile page: app/views/layouts/templates/profile.html.erb

```ruby
  <h1><%= @presenter.output(:page_title) %></h1>

  <figure>
    <%= @presenter.output(:avatar) %>
  </figure>

  <p class="slogan"><%= @presenter.output(:slogan) %></p>

  <div class="about"><%= @presenter.output(:about) %></div>
```

Overriding the controller
-----------------------------

Semistatic uses the ActiveSupport::Concearn pattern to extend its functionalities.

To override, say, the crud controller, should create a file
app/controllers/semistatic/pages_controller.rb with the following content:

```ruby
  # app/controllers/semistatic/pages_controller.rb

  module Semistatic
    class PartsController < ApplicationController
      include Semistatic::Concerns::Controller::PartsController

      included do
        before_filter :require_authentication
      end
    end
  end
```