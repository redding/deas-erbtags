require 'deas-erbtags/utils'
require 'deas-erbtags/tag'

module Factory

  def self.tags_template
    template_class = Class.new do
      include Deas::ErbTags::Tag
    end
    template_class.new
  end

  def self.html_attrs(opts)
    Deas::ErbTags::Utils.html_attrs(opts)
  end

end
