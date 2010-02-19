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
    html = helper.jcarousel_slideshow(:images=>["images_1.jpg","images_2.jpg"])
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
  
  
  it "should auto increment at a default speed when I say so" do
    html = helper.jcarousel_slideshow(:images=>["images_1.jpg","images_2.jpg"],:auto_scroll=>true)
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
  
  it "should auto increment every 8 seconds when that is specified" do
    html = helper.jcarousel_slideshow(:images=>["images_1.jpg","images_2.jpg"],
                                      :auto_scroll=>"8")
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul[auto=?]","8")
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
  
  it "should load content if I want content instead of just images" do
    html = helper.jcarousel_slideshow(:content=>["images_1.jpg","images_2.jpg"],
                                      :auto_scroll=>"8")
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul[auto=?]","8")
      with_tag("ul.jcarousel-slides") do
        with_tag("li", "images_1.jpg") 
        with_tag("li", "images_2.jpg")
      end
    end   
  end  
  
  it "should make content the priority over images" do
    html = helper.jcarousel_slideshow(:content=>["images_1.jpg","images_2.jpg"],
                                      :auto_scroll=>"8",
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul[auto=?]","8")
      with_tag("ul.jcarousel-slides") do
        with_tag("li", "images_1.jpg") 
        with_tag("li", "images_2.jpg")
      end
    end   
  end
end
