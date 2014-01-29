class PagesController < ApplicationController

  def home
    @school_searcher = SchoolSearcher.new
  end

end
