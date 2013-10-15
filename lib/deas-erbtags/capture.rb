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

      def erb_write(content)
        self.erb_outvar << "#{content}\n"
      end

      def capture(&content)
        outvar = self.erb_outvar_name
        begin
          orig_outvar = self.erb_outvar
          instance_variable_set(outvar, "\n")

          result = instance_eval(&(content || Proc.new {}))

          if instance_variable_get(outvar) == "\n"
            "\n#{result}"
          else
            instance_variable_get(outvar)
          end
        ensure
          instance_variable_set(outvar, orig_outvar)
        end
      end

      def capture_tag(name, *args, &content)
        opts = args.last.kind_of?(::Hash) ? args.pop : {}
        self.erb_write tag(name, "#{capture(&content)}\n", opts)
      end

      def capture_render(*args, &content)
        self.erb_write self.render(*args, &Proc.new{ capture(&content) })
      end

      def capture_partial(*args, &content)
        self.erb_write self.partial(*args, &Proc.new{ capture(&content) })
      end

    end

  end
end
