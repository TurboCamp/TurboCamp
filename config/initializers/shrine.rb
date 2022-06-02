# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/file_system'
require 'shrine/storage/s3'

s3_options = {
  bucket: ENV.fetch('S3_BUCKET', nil),
  access_key_id: ENV.fetch('S3_KEYID', nil),
  secret_access_key: ENV.fetch('S3_ACCESSKEY', nil),
  region: ENV.fetch('S3_REGION', nil)
}

s3 = Shrine.storages = {
  cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options),
  store: Shrine::Storage::S3.new(prefix: 'store', **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data
Shrine.plugin :restore_cached_data
Shrine.plugin :validation
Shrine.plugin :validation_helpers
Shrine.plugin :download_endpoint, prefix: '/attachments'
Shrine.plugin :derivatives
Shrine.plugin :determine_mime_type
