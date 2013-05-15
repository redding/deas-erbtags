require 'deas-tags/tag'

module Factory

  def self.tags_template
    template_class = Class.new do
      include Deas::Tags::Tag
    end
    template_class.new
  end

end
