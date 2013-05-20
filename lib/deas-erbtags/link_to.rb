require 'deas-erbtags/tag'
require 'deas-erbtags/capture'

module Deas::ErbTags
  module LinkTo

    def self.included(receiver)
      receiver.class_eval{ include Tag, Capture, Method }
    end

    module Method

      def link_to(*args, &block)
        opts, href, content = [
          args.last.kind_of?(::Hash) ? args.pop : {},
          args.pop,
          args.last
        ]
        opts.update(:href => href.to_s) if !href.nil?

        if block_given?
          capture_tag(:a, opts, &block)
        else
          tag(:a, content || href, opts)
        end
      end

    end

  end
end
