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

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :download_endpoint , prefix: "/attachments"
Shrine.plugin :derivatives
