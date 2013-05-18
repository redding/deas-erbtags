require 'deas-erbtags/version'
require 'deas-erbtags/utils'

require 'deas-erbtags/tag'
require 'deas-erbtags/link_to'
require 'deas-erbtags/mail_to'
require 'deas-erbtags/image_tag'

module Deas; end
module Deas::ErbTags

  # this implements the "include them all" behavior

  def self.included(receiver)
    receiver.class_eval do
      include Tag, LinkTo, MailTo, ImageTag
    end
  end

end
