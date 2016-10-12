FactoryGirl.define do
  factory :feed do
    name 'Test'
    url 'http://www.ruby-lang.org/en/feeds/news.rss'
    description 'Sample rss reader'
  end
  factory :invalid_feed, parent: :feed do |f|
    f.url nil
  end
end
