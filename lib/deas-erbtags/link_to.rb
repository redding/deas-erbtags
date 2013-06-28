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
        tag = opts.delete(:tag) || opts.delete('tag') || :a

        if block_given?
          capture_tag(tag, opts, &block)
        else
          tag(tag, content || href, opts)
        end
      end

    end

  end
end
