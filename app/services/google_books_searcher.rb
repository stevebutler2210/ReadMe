# frozen_string_literal: true

class GoogleBooksSearcher
  def initialize(query)
    @query = query
  end

  def call
    response = search

    parse_response(response)
  end

  private

  attr_reader :query

  def search
    response = Faraday.get("https://www.googleapis.com/books/v1/volumes?q=#{query}")
    JSON.parse(response.body)
  end

  def parse_response(response)
    response["items"].map do |item|
      GoogleBooksParser.new(item).call
    end
  end
end
