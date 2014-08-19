# Creating photographer
Photographer.create(
  name: "Stephen Hirschthal Photography",
  meta_title: "Stephen Hirscthal Photography",
  tagline: "Professional photography through a creative lens.",
  email: "email@example.com",
  password: "default",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  google_analytics_key: "UA-50501824-XX",
  time_zone: "Eastern Time (US & Canada)",
  disqus_short_name: "SteveH"
)

# Creating galleries
base_dir = Rails.root.join('creatives', 'galleries')
Gallery.create!(position: 1, name: 'Maternity', cover: File.new(File.join(base_dir, 'maternity.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
Gallery.create!(position: 2, name: 'Newborn', cover: File.new(File.join(base_dir, 'newborn.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
Gallery.create!(position: 3, name: 'Babies', cover: File.new(File.join(base_dir, 'babies.jpg')), description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')

# Uploading gallery images
Gallery.all.each do |gallery|
  dir = File.join(base_dir, gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading gallery photo: #{file_name}"
    begin
      gallery.photos.create!(photo: File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

# Creating private galleries
PrivateGallery.create!(name: 'Private Gallery Example', expires_on: 2.weeks.from_now)
PrivateGallery.create!(name: 'Another Private Gallery Example', expires_on: 4.weeks.from_now)

# Uploading private gallery images
base_dir = Rails.root.join('creatives', 'private_galleries')
PrivateGallery.all.each do |private_gallery|
  dir = File.join(base_dir, private_gallery.name.parameterize)
  file_names = Dir.glob("#{dir}/*.jpg")
  file_names.each_with_index do |file_name, idx|
    puts "Uploading private gallery photo: #{file_name}"
    begin
      private_gallery.photos.create!(photo: File.new(file_name))
    rescue Exception => e
      puts e.message
    end
  end
end

# Creating pages
Page.create(name: "About", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Stephen Hirschthal is young professional photographer serving the New England area. Blessed with a creative eye, Stephen strives to capture the essence of the people and places he shoots. Stephen provides an array of photography solutions, from weddings and family portraits, to weddings and boudoir/lingerie photos. He prides himself on serving each one of his clients to the best of his ability, and bringing his entire self and full enthusiasm to each job. Peers and clients consider Stephen a flexible, easy-going photographer who listens to the opinions of those he works with. He shoots in many different styles, and largely leaves it up to the models he works with to decide how they are shooting and the style in which they are shooting. He often loves to leave photo shoots 'open-ended' rather than having set poses, encouraging models to bring their personality into focus.")
Page.create(name: "Pricing", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "For more information on pricing, contact Stephen Hirscthal at 860-983-8120 or by email at Stephen.Hirschthal@gmail.com")
Page.create(name: "Services", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "These are my services.")

# Creating posts
Post.create(title: "This is Just an Example", keywords: 'photography, photo, wedding, fashion, model', image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Post.create(title: "Example of Portrait Post", keywords: 'photography, portrait, lifestyle', image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
Post.create(title: "This is how we handle titles that are extraordinarily long.", image: File.new(Rails.root.join('creatives', 'pages', 'about.png')), body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
