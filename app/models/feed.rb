# Feed model, contains data related to feed and feed has many entries
class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy

  after_save :parse_feed

  def parse_feed
    RssParser.new(self).process
  end
end
