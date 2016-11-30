class Book < ApplicationRecord

  def picture
    if cover_url.blank?
      image_amazon = ImageAmazon.run(name)
      self.cover_url = image_amazon
    end
    self.cover_url
  end

end
