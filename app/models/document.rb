class Document < ApplicationRecord
  include DocumentUpload::Attachment(:document)
end
