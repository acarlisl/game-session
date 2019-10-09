class SampleUsersController < ApplicationController
  def index
    user = BGGUser.new("DrBarnaby")
    @user_name = user.user_name
    @collection = user.collection
    @total_games = user.total_games
  end
end
