class Document < ApplicationRecord
  belongs_to :bucket
  include DocumentUploader::Attachment(:document)
end
