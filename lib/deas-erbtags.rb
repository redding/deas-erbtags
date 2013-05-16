require 'deas-erbtags/version'
require 'deas-erbtags/utils'

require 'deas-erbtags/tag'

module Deas; end
module Deas::ErbTags

  # this implements the "include them all" behavior

  def self.included(receiver)
    receiver.class_eval do
      include Tag
    end
  end

end
