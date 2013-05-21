require "assert"
require 'deas-erbtags/utils'

module Deas::ErbTags::Utils

  class BaseTests < Assert::Context
    desc 'Deas::ErbTags::Helpers'
    subject { Deas::ErbTags::Utils }

    should have_imeths :html_attrs, :escape_attr_value, :insert_html_class

    should "alias itself as `Deas::ErbTags::U`" do
      assert_same Deas::ErbTags::Utils, Deas::ErbTags::U
    end

    should "insert html class values into a given html class string" do
      none = ''
      assert_equal '', subject.insert_html_class(none)
      assert_equal 'a', subject.insert_html_class(none, 'a')
      assert_equal 'a b', subject.insert_html_class(none, 'b', 'a')

      single = 'z-class'
      assert_equal 'z-class', subject.insert_html_class(single)
      assert_equal 'a z-class', subject.insert_html_class(single, 'a')
      assert_equal 'a b z-class', subject.insert_html_class(single, 'a', 'b')

      multi = 'z-class y-class'
      assert_equal 'y-class z-class', subject.insert_html_class(multi)
      assert_equal 'a y-class z-class', subject.insert_html_class(multi, 'a')
      assert_equal 'a b y-class z-class', subject.insert_html_class(multi, 'a', 'b')
    end

  end

  class HashAttrsTests < BaseTests
    desc "the element class hash_attrs util"

    should "convert an empty hash to element attrs" do
      assert_equal '', subject.html_attrs({})
    end

    should "convert a basic hash to element attrs" do
      attrs = subject.html_attrs(:class => "test", :id => "test_1")
      assert_match /^\s{1}/, attrs
      assert_includes 'class="test"', attrs
      assert_includes 'id="test_1"', attrs

      attrs = subject.html_attrs('key' => "string")
      assert_includes 'key="string"', attrs
    end

    should "escape double-quotes in attr values" do
      attrs = subject.html_attrs('escaped' => '"this" is double-quoted')
      assert_includes 'escaped="&quot;this&quot; is double-quoted"', attrs
    end

    should "escape '<' in attr values" do
      attrs = subject.html_attrs('escaped' => 'not < escaped')
      assert_includes 'escaped="not &lt; escaped"', attrs
    end

    should "escape '&' in attr values" do
      attrs = subject.html_attrs('escaped' => 'not & escaped')
      assert_includes 'escaped="not &amp; escaped"', attrs
    end

    should "convert a nested array to element attrs" do
      attrs = subject.html_attrs({
        :class => "testing",
        :id => "test_2",
        :nested => [:something, 'is_awesome', 1]
      })
      assert_match /^\s{1}/, attrs
      assert_included 'class="testing"', attrs
      assert_included 'id="test_2"', attrs
      assert_included 'nested="something is_awesome 1"', attrs
    end

    should "convert a nested hash to element attrs" do
      attrs = subject.html_attrs({
        :class => "testing",
        :id => "test_2",
        :nested => {:something => 'is_awesome'}
      })
      assert_match /^\s{1}/, attrs
      assert_included 'class="testing"', attrs
      assert_included 'id="test_2"', attrs
      assert_included 'nested_something="is_awesome"', attrs
    end

  end

end
