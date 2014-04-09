class Salon < ActiveRecord::Base
  has_many :stylists

  validates :phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates_uniqueness_of :phone_number

  def lookup_by_phone
    #gets the full yelp details to flesh out the record from just its phone number
      digits = self.phone_number
      full_url = YELP_LOOKUP_URL + digits + "&ywsid=" + YWS_ID
    unless self.name
      raw_response = HTTParty.get(full_url)


      data = JSON.parse(raw_response.body)["businesses"][0]
        self.update(:name => data["name"],
                         :address => data["address1"],
                         :city => data["city"],
                         :yelp_rating_image_url => data["rating_img_url"],
                         :zipcode => data["zip"],
                         :state => data["state"],
                         :photo_url => data["photo_url"],
                         :yelp_rating => data["avg_rating"]
                         )
    end

  end
end

