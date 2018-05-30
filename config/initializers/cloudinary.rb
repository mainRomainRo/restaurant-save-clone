Cloudinary.config do |config|
  CLOUDINARY_URL=ENV['CLOUDINARY_SECRET_URL']
  config.secure = true
  config.cdn_subdomain = true
end
