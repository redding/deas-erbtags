module Deas; end
module Deas::ErbTags

  module Utils

    def self.html_attrs(attrs="", ns=nil)
      return attrs.to_s if !attrs.kind_of?(::Hash)

      attrs.collect do |k_v|
        [ns ? "#{ns}_#{k_v.first}" : k_v.first.to_s, k_v.last]
      end.sort.collect do |k_v|
        if k_v.last.kind_of?(::Hash)
          html_attrs(k_v.last, k_v.first)
        elsif k_v.last.kind_of?(::Array)
          " #{k_v.first}=\"#{escape_attr_value(k_v.last.join(' '))}\""
        else
          " #{k_v.first}=\"#{escape_attr_value(k_v.last)}\""
        end
      end.join
    end

    ESCAPE_ATTRS = {
      "&" => "&amp;",
      "<" => "&lt;",
      '"' => "&quot;"
    }
    ESCAPE_ATTRS_PATTERN = Regexp.union(*ESCAPE_ATTRS.keys)
    def self.escape_attr_value(value)
      value.to_s.gsub(ESCAPE_ATTRS_PATTERN){|c| ESCAPE_ATTRS[c] }
    end

  end

  # alias for brevity
  U = Utils

end
