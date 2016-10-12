# Entry model
class Entry < ActiveRecord::Base
  belongs_to :feed, inverse_of: :entries

  scope :sort_by_published_date, lambda {
    order(published_date: :desc)
  }
end
