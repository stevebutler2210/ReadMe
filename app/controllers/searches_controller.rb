# frozen_string_literal: true

class SearchesController < ApplicationController
  def create
    books = GoogleBooksSearcher.new(params[:query]).call

    render json: books
  end
end
