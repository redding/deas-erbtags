require 'deas-erbtags/tag'

module Deas::ErbTags
  module CaptureTag

    def self.included(receiver)
      receiver.class_eval{ include Tag, Method }
    end

    module Method

      def capture_tag(name, *args)
        opts = args.last.kind_of?(::Hash) ? args.pop : {}
        outvar = self.sinatra_call.settings.erb[:outvar]
        captured_content = begin
          orig_outvar = instance_variable_get(outvar)
          instance_variable_set(outvar, "\n")

          result = yield if block_given?

          if instance_variable_get(outvar) == "\n"
            "\n#{result}"
          else
            instance_variable_get(outvar)
          end
        ensure
          instance_variable_set(outvar, orig_outvar)
        end

        tag_markup = tag(name, "#{captured_content}\n", opts)
        instance_variable_get(outvar) << "#{tag_markup}\n"
      end

    end

  end
end
