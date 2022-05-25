require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = { 
  bucket: ENV["S3_BUCKET"], 
  access_key_id: ENV["S3_KEYID"],
  secret_access_key: ENV["S3_ACCESSKEY"],
  region: ENV["S3_REGION"],
}

s3 = Shrine.storages = { 
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store",**s3_options),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data 
Shrine.plugin :restore_cached_data    
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :download_endpoint , prefix: "/attachments"
Shrine.plugin :derivatives
Shrine.plugin :determine_mime_type
