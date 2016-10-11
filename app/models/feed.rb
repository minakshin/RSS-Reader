# Feed model, contains data related to feed and feed has many entries
class Feed < ActiveRecord::Base
  has_many :entries, dependent: :destroy
end
