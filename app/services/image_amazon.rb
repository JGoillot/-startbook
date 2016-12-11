require 'open-uri'

class ImageAmazon < ServiceBase
  attr_accessor :book

  def initialize(book)
    @book = book
  end

  def run
    keyword_to_data(@book)
  end

  private

  def keyword_to_data(book)
    book = URI.encode(I18n.transliterate(book))
    keywork_book = book.gsub(" ","+")
    url = "https://www.amazon.fr/s/&field-keywords=#{keywork_book}"
    html_file = open(url)
    html_doc = Nokogiri::HTML(html_file)

    puts amazon_url = html_doc.css('#s-results-list-atf').css('li a')[0]['href']

    html_file = open(amazon_url)
    html_doc = Nokogiri::HTML(html_file)

    cover_link = html_doc.css('#img-canvas img').attr('src')
    puts cover_url = cover_link.to_s.gsub("_SY","_SX")

    puts book_rate = html_doc.css('#reviewStarsLinkedCustomerReviews').text.to_s
  end
end
