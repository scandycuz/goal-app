class GoalsController < ApplicationController
  def index
    @goals = current_user.goals
  end
end
