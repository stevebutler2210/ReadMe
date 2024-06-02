# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_user

  def create
    book = Book.find_or_create_by(external_id: book_params[:external_id]) do |new_book|
      new_book.assign_attributes(book_params) if new_book.new_record?
    end

    @user.books << book

    render json: BookSerializer.new(book).serializable_hash[:data][:attributes]

  rescue ActiveRecord::RecordInvalid
    @user.books << Book.find_by(external_id: book_params[:external_id])

    render json: BookSerializer.new(@user.books.last).serializable_hash[:data][:attributes]
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def book_params
    params.require(:book).permit(:external_id, :title, :thumbnail_url, authors: [])
  end
end
