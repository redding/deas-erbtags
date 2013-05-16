# Deas::Tags

Template helpers for creating basic html tags.

## Usage

```ruby
require 'deas-tags'

class MyDeasServer
  include Deas::Server

  # ...

  template_helpers(Deas::Tags) # include them all

  # OR just include some...

  template_helpers(Deas::Tags::LinkTo)
  template_helpers(Deas::Tags::ImageTag)

  # ...

end
```

## Tags

All helpers are based off of the basic `tag` helper:

```ruby
tag(:br)                             # => <br />
tag(:h1, 'shizam', :title => "boom") # => <h1 title="boom">shizam</h1>
```

### LinkTo

TODO

### MailTo

TODO

### ImageTag

TODO

### FormTags

TODO

## Installation

Add this line to your application's Gemfile:

    gem 'deas-tags'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deas-tags

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
