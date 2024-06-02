# frozen_string_literal: true

class GoogleBooksParser
  def initialize(api_book)
    @api_book = api_book
  end

  def call
    parse_book
  end

  private

  attr_reader :api_book

  def parse_book
      {
        title: api_book["volumeInfo"]["title"],
        authors: api_book["volumeInfo"]["authors"],
        external_id: api_book["volumeInfo"]["industryIdentifiers"] ? api_book["volumeInfo"]["industryIdentifiers"].first["identifier"] || api_book["id"] : api_book["id"],
        image: api_book["volumeInfo"]["imageLinks"]["thumbnail"]
      }
  end
end
