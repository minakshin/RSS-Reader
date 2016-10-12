# Feed model, contains data related to feed and feed has many entries
class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy, inverse_of: :feed
  validates :url, presence: :true,
                  uniqueness: true,
                  format: {
                    with: URI::regexp,
                    message: 'Please provide valid url'
                  }
  validates :name, presence: :true

  after_save :parse_feed

  def parse_feed
    RssParser.new(self).parse!
  end
end
