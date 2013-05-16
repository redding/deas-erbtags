require 'assert'
require 'deas-tags/tag'

module Deas::Tags::Tag

  class BaseTests < Assert::Context
    desc "the basic tag method"
    setup do
      @opts = { :class => 'big', :id => '1234' }
      @content = "Loud Noises"
      @opts_attrs = Factory.html_attrs(@opts)
      @template = Factory.tags_template
    end
    subject{ @template }

    should have_imeth :tag

    should "create an empty html tag" do
      assert_equal "<br />", @template.tag(:br)
    end

    should "create an html tag with attributes" do
      assert_equal "<br#{@opts_attrs} />", @template.tag(:br, @opts)
    end

    should "create an html tag with content" do
      exp_markup = "<h1>#{@content}</h1>"
      assert_equal exp_markup, @template.tag(:h1, @content)
    end

    should "create an html tag with attributes and content" do
      exp_markup = "<h1#{@opts_attrs}>#{@content}</h1>"
      assert_equal exp_markup, @template.tag(:h1, @content, @opts)
    end

  end

end
