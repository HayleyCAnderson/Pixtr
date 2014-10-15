class GroupsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.add_member(current_user)

    if @group.valid?
      redirect_to @group
    else
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)

    redirect_to @group
  end

  def destroy
    Group.find(params[:id]).destroy

    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :cover_photo)
  end
end