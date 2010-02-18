require File.dirname(__FILE__) + '/spec_helper'
describe JcarouselFu, :type=> :helper do
  
  it "should create an empty slideshow when given no images" do
    html = helper.jcarousel_slideshow 
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.jcarousel-slides") do
      end
    end
  end
  
  it "should create a slideshow when provided images" do
    html = helper.jcarousel_slideshow(["image_1.jpg","image_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.jcarousel-slides") do
        with_tag("li") do
          with_tag("img[src=?]","/images/image_1.jpg")
        end
        with_tag("li") do
          with_tag("img[src=?]","/images/image_2.jpg")
        end
      end
    end
  end
end
