# Service For parsing rss feeds
class RssParser
  require 'rss'
  attr_accessor :feed

  def initialize(object)
    @feed = object
  end

  def process
    read_feed
  end

  private

  def read_feed
    parse_feed = RSS::Parser.parse(feed.url)
    parse_feed.items.map do |item|
      Rails.logger.info "Feeding entries for #{item.title}"
      begin
        feed_entries(item)
      rescue
        Rails.logger.info "error for ==  #{item.title}"
      end
    end
  end

  def feed_entries(item)
    entry = feed.entries.where(title: item.title).first_or_initialize
    entry.update_attributes(
      content: item.description, author: item.author,
      url: item.link, published_date: item.pubDate
    )
  end
end
