require 'deas-erbtags/tag'

module Deas::ErbTags
  module Capture

    def self.included(receiver)
      receiver.class_eval{ include Tag, Methods }
    end

    module Methods

      def erb_outvar_name
        self.sinatra_call.settings.erb[:outvar]
      end

      def erb_outvar
        instance_variable_get(self.erb_outvar_name)
      end

      def capture(content)
        self.erb_outvar << "#{content}\n"
      end

      def capture_tag(name, *args, &content)
        opts = args.last.kind_of?(::Hash) ? args.pop : {}
        outvar = self.erb_outvar_name
        captured_content = begin
          orig_outvar = self.erb_outvar
          instance_variable_set(outvar, "\n")

          result = instance_eval(&content) if !content.nil?

          if instance_variable_get(outvar) == "\n"
            "\n#{result}"
          else
            instance_variable_get(outvar)
          end
        ensure
          instance_variable_set(outvar, orig_outvar)
        end

        self.capture tag(name, "#{captured_content}\n", opts)
      end

      def capture_render(*args, &block)
        self.capture self.render(*args, &block)
      end

    end

  end
end
