# encoding: utf-8

class BookCoverUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :dropbox

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fit => [75, 10000]
  end

  process :resize_to_fit => [300, 10000]

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
