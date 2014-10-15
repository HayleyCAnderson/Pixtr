class GroupMembershipsController < ApplicationController
  before_action :require_login

  def create
    @group = Group.find(params[:id])
    @group.users << current_user

    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.users.delete(current_user)

    redirect_to group_path(@group)
  end
end