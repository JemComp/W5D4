# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string
#  user_id   :integer          not null
#
class ShortenedUrl < ApplicationRecord

    validates :long_url, :short_url, :user_id, presence: true

    def self.random_code
        url = SecureRandom.urlsafe_base64
        ShortenedUrl.exists?(url) ? ShortenedUrl.random_code : url
    end

    def self.create_short_url(user, long_url)
        
        short_url = ShortenedUrl.random_code
        
        ShortenedUrl.create!(long_url: long_url,
                             short_url: short_url,
                             user_id: user.id)
    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
end
