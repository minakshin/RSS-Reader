# Entries controller
class EntriesController < ApplicationController

  def rss_reader
    @entries = Entry.sort_by_published_date
  end
end
