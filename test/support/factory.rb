require 'ostruct'
require 'deas-erbtags/utils'
require 'deas-erbtags/tag'

module Factory

  def self.template(*included_modules)
    template_class = Class.new do
      include *included_modules

      attr_reader :_out_buf
      def initialize
        @_out_buf = ""
      end

      # he expected API for the Deas template scope to access erb settings
      def sinatra_call
        OpenStruct.new({
          :settings => OpenStruct.new({
            :erb => { :outvar => '@_out_buf' }
          })
        })
      end

      def render(*args, &block)
        cap_content = "#{(block || Proc.new {}).call}"
        RenderArgs.new(args, cap_content).inspect
      end

      def partial(*args, &block)
        cap_content = "#{(block || Proc.new {}).call}"
        RenderArgs.new(args, cap_content).inspect
      end

    end

    template_class.new
  end

  def self.html_attrs(opts)
    Deas::ErbTags::Utils.html_attrs(opts)
  end

  RenderArgs = Struct.new(:args, :captured_content)

end
