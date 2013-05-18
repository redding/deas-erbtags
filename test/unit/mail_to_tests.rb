require 'assert'
require 'deas-erbtags/tag'
require 'deas-erbtags/link_to'
require 'deas-erbtags/mail_to'

module Deas::ErbTags::MailTo

  class BaseTests < Assert::Context
    desc "the `MailTo` module"
    setup do
      @link_content = "my email"
      @email = "me@domain.com"
      @template = Factory.template(Deas::ErbTags::MailTo)
    end
    subject{ @template }

    should have_imeth :mail_to

    should "include the `Tag` module" do
      assert_includes Deas::ErbTags::Tag, subject.class.included_modules
    end

    should "include the `LinkTo` module" do
      assert_includes Deas::ErbTags::LinkTo, subject.class.included_modules
    end

    should "render with just an email address" do
      link_tag = subject.link_to(@email, "mailto: #{@email}")
      assert_equal link_tag, subject.mail_to(@email)
    end

    should "render with custom display value" do
      link_tag = subject.link_to(@link_content, "mailto: #{@email}")
      assert_equal link_tag, subject.mail_to(@link_content, @email)
    end

    should "render obfuscating the email address displayed" do
      obfus = "me_at_domain_dot_com"
      link_tag = subject.link_to(obfus, "mailto: #{@email}")
      mailto = subject.mail_to(@email, :at => "_at_", :dot => "_dot_")

      assert_equal link_tag, mailto
    end

    should "render with link disabled" do
      assert_equal @email, subject.mail_to(@email, :disabled => true)
    end

  end

end
