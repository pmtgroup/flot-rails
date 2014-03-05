# Flot Rails #
Rails 3 Wrapper for flot an ...

Attractive JavaScript charts for jQuery
http://www.flotcharts.org/
https://github.com/flot/flot


## Install ##
Just add the line 
```ruby
gem 'flot-rails', :git => "https://github.com/Kjarrigan/flot-rails.git"
```
in your Gemfile and run 
```sh
bundle install
```

## Example Usage ##

Modify the `application.js` like shown below:

```js
//= require jquery
//= require jquery.flot
//= require jquery.flot.pie
```

Then use the pure javascript as shown here: https://github.com/flot/flot/blob/master/API.md
or with my little RailsHelper:

```ruby
module ApplicationHelper
  include Flot
end
```

```erb
<!-- views/my_controller/index.html.erb -->
<%= pie_chart [{label: 'Hello World', data: 50}, {label: 'Foo', data: 25}, {label: 'Bar', data: 25}] %>
```

If you prefer placing your scripts in header instead of the body, then use something like this:
```erb
<!-- views/my_controller/index.html.erb -->
<%= chart(@chart_data, split: true, grid: {hoverable: true}) %>
<%= yield_chart_script_at :flot %>
```
and append a yield in your layout's head:
```erb
<!-- views/layouts/application.html.erb
<head>
  <%= yield :flot %>
</head>
```

### Configuration ###

You can configure the following values by using `Flot.configure` method.

```ruby
Flot.configure do |config|
  # Default height for plot-block.
  config.default_height = 300 # px
  # Default width for plot-block.
  config.default_width  = 600 # px
end
```
