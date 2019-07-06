class HashtagsController < ApplicationController
  def show
    @results = Search.new(term: hashtag)
  end

  private

  def hashtag
    "##{params[:id]}"
  end
end
