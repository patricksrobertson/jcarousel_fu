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
  
  it "should not auto scroll when I tell it no to" do
    html = helper.jcarousel_slideshow(:images=>["images_1.jpg","images_2.jpg"],:auto_scroll=>false)
    html.should_not have_tag("ul.auto-scroll")
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
  
  it "should animate when given an animation speed in milliseconds" do
    html = helper.jcarousel_slideshow(:animation=>"500",
                                      :auto_scroll=>"8",
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul[auto=?]","8")
      with_tag("ul[animation=?]","500")
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
  
  it "should scroll by the number of my choosing" do
    html = helper.jcarousel_slideshow(:scroll=>"2",
                                      :auto_scroll=>"8",
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul.auto-scroll")
      with_tag("ul[auto=?]","8")
      with_tag("ul[scroll=?]","2")
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
  
  it "should show multiple images at a time if I ask it to" do
    html = helper.jcarousel_slideshow(:visible=>"3",
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul[visible=?]","3")
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
  
  it "should allow me to use a different set of div/ul names if I want to make my own javascript" do
    html = helper.jcarousel_slideshow(:visible=>"3",
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"],
                                      :jcarousel_name=>"bob-jcarousel")
    html.should have_tag("div#bob-jcarousel.jcarousel-skin-tango") do
      with_tag("ul[visible=?]","3")
      with_tag("ul.bob-jcarousel") do
        with_tag("li") do
          with_tag("img[src=?]","/images/images_1.jpg")
        end
        with_tag("li") do
          with_tag("img[src=?]","/images/images_2.jpg")
        end
      end
    end   
  end
  
  it "should allow me to use a different css skin if I so desire" do
    html = helper.jcarousel_slideshow(:css_style=>"jcarousel-skin-mambo",
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-mambo") do
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
  
  it "should let me disable the previous button" do
    html = helper.jcarousel_slideshow(:disable_prev=>true,
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul[disable_prev=?]","true")
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
  
  it "should let me disable the next button" do
    html = helper.jcarousel_slideshow(:disable_next=>true,
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul[disable_next=?]","true")
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

  it "should let me disable both buttons" do
    html = helper.jcarousel_slideshow(:disable_next=>true,
                                      :disable_prev=>true,
                                      :auto_scroll=>false,
                                      :images=>["images_1.jpg","images_2.jpg"])
    html.should have_tag("div#jcarousel-slides.jcarousel-skin-tango") do
      with_tag("ul[disable_next=?]","true")
      with_tag("ul[disable_prev=?]","true")
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
