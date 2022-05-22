require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

s3_options = { 
  bucket: ENV["S3_BUCKET"], # required 
  access_key_id: ENV["S3_ACCESSKEY"],
  secret_access_key: ENV["S3_KEYID"],
  region: ENV["S3_REGION"],
}

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
}

Shrine.plugin :activerecord           # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data    # extracts metadata for assigned cached files
Shrine.plugin :validation
Shrine.plugin :validation_helpers