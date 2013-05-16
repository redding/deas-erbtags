require 'deas-erbtags/utils'
require 'deas-erbtags/tag'

module Factory

  def self.template(*included_modules)
    template_class = Class.new do
      include *included_modules
    end
    template_class.new
  end

  def self.html_attrs(opts)
    Deas::ErbTags::Utils.html_attrs(opts)
  end

end
