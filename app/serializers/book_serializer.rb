# frozen_string_literal: true

class BookSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :authors, :external_id, :thumbnail_url
end
