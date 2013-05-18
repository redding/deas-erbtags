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

## Tags

All helpers are based off of the basic `tag` helper:

```ruby
tag(:br)                             # => <br />
tag(:h1, 'shizam', :title => "boom") # => <h1 title="boom">shizam</h1>
```

**Note**: all tag methods take an option hash of html attributes (like above).  This use-case is assumed in the examples below.

### `link_to`

```ruby
link_to "http://google.com"           # => <a href="http://google.com">http://google.com</a>
link_to "google", "http://google.com" # => <a href="http://google.com">google</a>
```

### MailTo

TODO

### ImageTag

TODO

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
