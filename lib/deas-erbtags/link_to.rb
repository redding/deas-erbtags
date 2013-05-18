require 'deas-erbtags/tag'

module Deas::ErbTags
  module LinkTo

    def self.included(receiver)
      receiver.class_eval{ include Tag, Method }
    end

    module Method

      def link_to(*args)
        opts, href, content = [
          args.last.kind_of?(::Hash) ? args.pop : {},
          args.pop,
          args.last
        ]
        opts.update(:href => href.to_s) if !href.nil?
        content ||= href

        tag(:a, content, opts)
      end

    end

  end
end
