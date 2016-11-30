require 'open-uri'

class ImageAmazon < ServiceBase
  attr_accessor :book

  def initialize(book)
    @book = book
  end

  def run
    keyword_to_cover(@book)
  end

  private

  def keyword_to_cover(book)
    url = "https://www.amazon.fr/s/&field-keywords=#{book}"
    html_file = open(url)
    html_doc = Nokogiri::HTML(html_file)

    puts "lol"
    # html_doc.text
  end
end
