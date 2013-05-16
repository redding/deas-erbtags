require "assert"
require 'deas-erbtags/utils'

module Deas::ErbTags::Utils

  class BaseTests < Assert::Context
    desc 'Deas::ErbTags::Helpers'
    subject { Deas::ErbTags::Utils }

    should have_imeths :html_attrs, :escape_attr_value

    should "alias itself as `Deas::ErbTags::U`" do
      assert_same Deas::ErbTags::Utils, Deas::ErbTags::U
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
