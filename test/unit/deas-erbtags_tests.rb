require 'assert'
require 'deas-erbtags'

module Deas::ErbTags

  class BaseTests < Assert::Context
    desc "Deas::ErbTags"
    setup do
      @template = Factory.template(Deas::ErbTags)
    end
    subject{ @template }

    should have_imeths :tag, :link_to, :mail_to, :image_tag

    should "include all of the individual modules" do
      exp_modules = [
        Tag, Capture, LinkTo, MailTo, ImageTag
      ]

      exp_modules.each do |m|
        assert_includes m, subject.class.included_modules
      end
    end

  end

end
