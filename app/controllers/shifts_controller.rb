class ShiftsController < ApplicationController
  def index
    @organisation = Organisation.find(params[:organisationId])
    @users = User.where(organisationId: @organisationId)
    @shifts = Shifts.where(userId: @organisationId)

    # Organisation id == 3
    # Get all users where orgId == 3
    # get all shifts where user id IN users
Article.where(author: author)
Author.joins(:articles).where(articles: { author: author })

  end

  def create
  end

end