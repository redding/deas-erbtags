require 'assert'
require 'deas-erbtags/tag'
require 'deas-erbtags/capture'
require 'deas-erbtags/link_to'

module Deas::ErbTags::LinkTo

  class BaseTests < Assert::Context
    desc "the `LinkTo` module"
    setup do
      @template = Factory.template(Deas::ErbTags::LinkTo)
    end
    subject{ @template }

    should have_imeth :link_to

    should "include the `Tag` module" do
      assert_includes Deas::ErbTags::Tag, subject.class.included_modules
    end

    should "include the `Capture` module" do
      assert_includes Deas::ErbTags::Capture, subject.class.included_modules
    end

    should "create an anchor tag with no content or href" do
      no_href_content = subject.tag(:a)
      assert_equal no_href_content, subject.link_to
    end

    should "create an anchor tag with just an href" do
      href = subject.tag(:a, 'www.google.com', {:href => 'www.google.com'})
      assert_equal href, subject.link_to('www.google.com')
    end

    should "create an anchor tag with an href and content" do
      href_content = subject.tag(:a, 'google', {:href => 'www.google.com'})
      assert_equal href_content, subject.link_to('google', 'www.google.com')
    end

    should "create an anchor tag with an href, content, and attrs" do
      href_content_opts = subject.tag(:a, 'google', {
        :href => 'www.google.com',
        :id => 'google_link'
      })
      link_to = subject.link_to('google', 'www.google.com', {
        :id => 'google_link'
      })
      assert_equal href_content_opts, link_to
    end

    should "create an anchor tag with an href and captured content" do
      span = subject.tag(:span, 'google')
      exp = subject.tag(:a, "\n#{span}\n", {:href => 'www.google.com'}) + "\n"

      assert_equal exp, subject.link_to('www.google.com'){ span }
    end

    should "create a link using a tag other than the anchor tag" do
      href_content = subject.tag(:button, 'google', {:href => 'www.google.com'})

      assert_equal href_content, subject.link_to('google', 'www.google.com', {
        :tag => 'button'
      })
      assert_equal href_content, subject.link_to('google', 'www.google.com', {
        'tag' => 'button'
      })
    end

  end

end
