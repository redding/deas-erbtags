# Deas::ErbTags

Template helpers for creating html tags using Erb (or Erubis, etc).

## Usage

```ruby
require 'deas-erbtags'

class MyDeasServer
  include Deas::Server

  # ...

  template_helpers(Deas::ErbTags) # include them all

  # OR just include some...

  template_helpers(Deas::ErbTags::LinkTo)
  template_helpers(Deas::ErbTags::ImageTag)

  # ...

end
```

## Methods

All helper methods are based off of the basic `tag` method.  Tag calls should be invoked with `<%= ... -%>`:

```erb
<%= tag(:br) -%>                             # => <br />
<%= tag(:h1, 'shizam', :title => "boom") -%> # => <h1 title="boom">shizam</h1>
```

**Note**: all tag methods take an option hash of html attributes (like above).  This use-case is assumed in the examples below.

### `capture_tag`

The `capture_tag` method is used to create tags with nested erb markup.  Like the `tag` method, it creates other tags with a similar API.  Unlike the `tag` method, it takes a block that contains nested markup and does not take content as an arg.  Capture tags should be invoked with the `<% ... %>`:

```erb
<% content_tag(:div, :id => 'outer') do %>
  <%= tag(:div, 'inner') -%>
<% end %>
  # => <div id="outer">\n  <div>inner</div>\n</div>\n
```

**Note**: the convention is that if a tag method is called with a block, `capture_tag` will be used to generate the tag and it should be invoked with `<% ... %>`.

### `link_to`

```ruby
link_to "http://google.com"
  # => <a href="http://google.com">http://google.com</a>

link_to "google", "http://google.com"
  # => <a href="http://google.com">google</a>

link_to("http://google.com"){ tag(:span, 'google') }
  # => <a href="http://google.com">\n<span>google</span>\n</a>\n
```

### `mail_to`

```ruby
mail_to "me@domain.com"
  # => <a href="mailto:me@domain.com">me@domain.com</a>

mail_to "me@domain.com", :at => "_at_", :dot => "_dot_"
  # => <a href="mailto:me@domain.com">me_at_domain_dot_com</a>

mail_to "me@domain.com", :disabled => true
  # => me@domain.com
```

### `image_tag`

```ruby
image_tag '/logo.jpg'  #  => <img src="/logo.jpg" />
```

### FormTags

TODO

## Installation

Add this line to your application's Gemfile:

    gem 'deas-erbtags'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deas-erbtags

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
