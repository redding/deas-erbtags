require 'assert'
require 'deas-erbtags/tag'
require 'deas-erbtags/image_tag'

module Deas::ErbTags::ImageTag

  class BaseTests < Assert::Context
    desc "the `ImageTag` module"
    setup do
      @template = Factory.template(Deas::ErbTags::ImageTag)
    end
    subject{ @template }

    should have_imeth :image_tag

    should "include the `Tag` module" do
      assert_includes Deas::ErbTags::Tag, subject.class.included_modules
    end

    should "create an img tag with the given src" do
      img = subject.tag(:img, {:src => '/logo.jpg'})
      assert_equal img, subject.image_tag('/logo.jpg')
    end

    should "create an img tag with attrs" do
      img = subject.tag(:img, {
        :src => '/logo.jpg',
        :id => 'image'
      })
      assert_equal img, subject.image_tag('/logo.jpg', :id => 'image')
    end

  end

end
