class GroupMembershipsController < ApplicationController
  before_action :require_login

  def create
    @group = Group.find(params[:id])
    @group.add_member(current_user)

    redirect_to @group
  end

  def destroy
    @group = Group.find(params[:id])
    @group.remove_member(current_user)

    redirect_to @group
  end
end