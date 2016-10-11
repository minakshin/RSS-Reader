# Entry model
class Entry < ActiveRecord::Base
  belongs_to :feed

  scope :sort_by_published_date, lambda {
    order(published_date: :desc)
  }
end
