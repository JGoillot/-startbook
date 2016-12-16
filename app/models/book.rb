class Book < ApplicationRecord

  def picture
    if cover_url.blank?
      image_amazon = ImageAmazon.run(self.title)
      self.cover_url = image_amazon
      self.save
    end
    self.cover_url
  end

end
