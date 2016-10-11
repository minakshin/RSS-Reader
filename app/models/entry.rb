# Entry model
class Entry < ActiveRecord::Base
  belongs_to :feed
end
