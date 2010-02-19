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
    html = helper.jcarousel_slideshow(["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.jcarousel-slides") do
        with_tag("li") do
          with_tag("img[src=?]","/images/images_1.jpg")
        end
        with_tag("li") do
          with_tag("img[src=?]","/images/images_2.jpg")
        end
      end
    end
  end
  
  
  it "should auto increment when I say so" do
    html = helper.jcarousel_slideshow(["images_1.jpg","images_2.jpg"],:auto_scroll=>true)
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul.jcarousel-slides") do
        with_tag("li") do
          with_tag("img[src=?]","/images/images_1.jpg")
        end
        with_tag("li") do
          with_tag("img[src=?]","/images/images_2.jpg")
        end
      end
    end
  end
    
end
