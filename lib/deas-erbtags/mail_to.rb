require 'deas-erbtags/tag'
require 'deas-erbtags/link_to'

module Deas::ErbTags
  module MailTo

    def self.included(receiver)
      receiver.class_eval{ include Tag, LinkTo, Method }
    end

    module Method

      def mail_to(*args)
        opts, email, content = [
          args.last.kind_of?(::Hash) ? args.pop : {},
          args.pop,
          args.last
        ]
        display = (content || email).dup
        display.gsub!(/@/, opts.delete(:at)) if opts.has_key?(:at)
        display.gsub!(/\./, opts.delete(:dot)) if opts.has_key?(:dot)

        return display if opts.delete(:disabled)
        link_to(display, "mailto: #{email}", opts)
      end

    end

  end
end
