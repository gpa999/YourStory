class RelationshipsController < ApplicationController
  before_action :set_user,:redirect_top 
   
  def create
    user = User.find(params[:follow_id])
    Relationship.create(reliability: relationship_params[:reliability], follow_id: user.id, user_id: current_user.id)
    redirect_to user_path(user)
  end

  def update
    user = User.find(params[:follow_id])
    Relationship.update(reliability: relationship_params[:reliability], follow_id: user.id, user_id: current_user.id)
    redirect_to user_path(user)
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end
  
  def relationship_params
    params.require(:relationship).permit(:reliability)
  end

end
