require 'deas-tags/utils'
require 'deas-tags/tag'

module Factory

  def self.tags_template
    template_class = Class.new do
      include Deas::Tags::Tag
    end
    template_class.new
  end

  def self.html_attrs(opts)
    Deas::Tags::Utils.html_attrs(opts)
  end

end
