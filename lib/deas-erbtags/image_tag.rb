require 'deas-erbtags/tag'

module Deas::ErbTags
  module ImageTag

    def self.included(receiver)
      receiver.class_eval{ include Tag, Method }
    end

    module Method

      def image_tag(source, *args)
        opts = args.last.kind_of?(::Hash) ? args.pop : {}
        opts.update(:src => source.to_s)

        tag(:img, opts)
      end

    end

  end
end
