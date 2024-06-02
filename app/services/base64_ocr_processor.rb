# frozen_string_literal: true

class Base64OcrProcessor
  def initialize(base64_image)
    @base64_image = base64_image
  end

  def call
    image = image_file(base64_image)

    text = RTesseract.new(image.path).to_s

    image.close
    image.unlink

    text
  end

  private

  attr_reader :base64_image

  def image_file(base64_image)
    tempfile = Tempfile.new(['ocr', '.jpg'])
    tempfile.set_encoding('ASCII-8BIT')
    tempfile.binmode
    tempfile.write(Base64.decode64(base64_image))
    tempfile.rewind

    tempfile
  end
end
