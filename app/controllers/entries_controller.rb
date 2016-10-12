# Entries controller
class EntriesController < ApplicationController
  def rss_reader
    @entries = Entry.sort_by_published_date.paginate(
      page: params[:page],
      per_page: 10
    )
  end
end
