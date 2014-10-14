class GroupsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
  end
end