require 'deas-erbtags/utils'

module Deas::ErbTags
  module Tag

    def tag(name, *args)
      opts, content = [
        args.last.kind_of?(::Hash) ? args.pop : {},
        args.first
      ]
      attrs = U.html_attrs(opts)

      "<#{name}#{attrs}#{content ? ">#{content}</#{name}" : ' /'}>"
    end

  end
end
