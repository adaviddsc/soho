class UserinfoController < ApplicationController
  def info
  	if params[:id].to_i == current_user.id
  	  redirect_to edit_self_path
  	else
  	  @user = User.find(params[:id])
  	end
  end

  def experience
  	if params[:id].to_i == current_user.id
  	  redirect_to self_experience_index_path
  	else
  	  @user = User.find(params[:id])
  	end
  end
end
