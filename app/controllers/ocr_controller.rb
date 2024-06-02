# frozen_string_literal: true

class OcrController < ApplicationController
  def extract_text
    text = Base64OcrProcessor.new(params[:image]).call

    # render extracted text
    render json: { text: text }
  end
end
