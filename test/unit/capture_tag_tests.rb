require 'assert'
require 'deas-erbtags/tag'
require 'deas-erbtags/capture_tag'

module Deas::ErbTags::CaptureTag

  class BaseTests < Assert::Context
    desc "the `CaptureTag` module"
    setup do
      @template = Factory.template(Deas::ErbTags::CaptureTag)
    end
    subject{ @template }

    should have_imeth :capture_tag

    should "include the `Tag` module" do
      assert_includes Deas::ErbTags::Tag, subject.class.included_modules
    end

    should "create content by capturing content from a given block" do
      div_div = subject.tag(:div, "\n#{subject.tag(:div, "\ninner\n")}\n\n", {
        :id => 'outer'
      }) + "\n"
      buf_content_div = subject.capture_tag(:div, :id => 'outer') do
        capture_tag(:div){ 'inner' }
      end

      assert_equal div_div, buf_content_div
    end

    should "create content by returning content from a given block" do
      div_div = subject.tag(:div, "\n#{subject.tag(:div, "inner")}\n", {
        :id => 'outer'
      }) + "\n"
      returned_content_div = subject.capture_tag(:div, :id => 'outer') do
        tag(:div, 'inner')
      end

      assert_equal div_div, returned_content_div
    end

    should "create empty tags if no block given" do
      empty_div = subject.tag(:div, "\n\n", :id => 'outer') + "\n"
      assert_equal empty_div, subject.capture_tag(:div, :id => 'outer')
    end

  end

end
