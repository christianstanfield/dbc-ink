class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process :resize_to_fill => [300, 300]

end

# If you get the minimagic validation error, install this:
# http://coledotcode.tumblr.com/post/56836607326/setting-up-carrierwave-and-minimagick-with-sinatra
