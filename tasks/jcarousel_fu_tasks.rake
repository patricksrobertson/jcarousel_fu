require 'fileutils'

PUBLIC = File.join Rails.root, "public"
CSS = File.join PUBLIC, "stylesheets"
JS = File.join PUBLIC, "javascripts", "jquery.j_carousel"
IMGS = File.join PUBLIC, "images"
JCAROUSEL_FU_PATH = File.join Rails.root, "vendor", "plugins", "jcarousel_fu"

namespace :jcarousel_fu do
  
  namespace :install do
    
    desc 'Install the css files'
    task :css do
      css_files = Dir.glob(File.join(JCAROUSEL_FU_PATH, "stylesheets", "*.css"))
      FileUtils.cp_r css_files, CSS
      puts "CSS Files installed."
    end
    
    desc 'Installs the js files'
    task :js do
      Dir.mkdir JS unless File.exists?(JS)
      js_files = Dir.glob(File.join(JCAROUSEL_FU_PATH,"javascripts","*"))
      FileUtils.cp_r js_files, JS
      puts "JS Files installed."
    end
    
    desc 'Installs the images'
    task :images do
      public_path = File.join(IMGS,"j_carousel")
      Dir.mkdir public_path unless File.exists?(public_path)
      imgs = Dir.glob(File.join(JCAROUSEL_FU_PATH,"images","*.{png,gif}"))
      FileUtils.cp_r imgs, public_path
      puts "Images installed."
    end
    
    desc 'Installs everything'
    task :all, 
         :needs => ['jcarousel_fu:install:css', 'jcarousel_fu:install:js', 'jcarousel_fu:install:images'] do
      puts "jCarousel_fu has been installed!"
      puts "--"
      puts "Just put <%= include_jcarousel_fu %> in the head of your page"
    end
    
  end
  
end