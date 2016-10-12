require 'rss'
# Service For parsing rss feeds
class RssParser
  attr_accessor :feed

  def initialize(feed)
    @feed = feed
  end

  def parse!
    extract_feed
  end

  private

  def rss_feed
    @rss_feed ||= RSS::Parser.parse(feed.url)
  end

  def extract_feed
    return if rss_feed.nil? || rss_feed.items.nil?
    rss_feed.items.each do |item|
      next unless item
      update_entries(item)
    end
  end

  def update_entries(item)
    entry = feed.entries.find_or_initialize_by(
      title: item.title
    )
    entry.update_attributes!(
      content: item.description,
      author: item.author,
      url: item.link,
      published_date: item.pubDate
    )
  end
end
