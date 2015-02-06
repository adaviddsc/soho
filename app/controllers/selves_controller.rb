class SelvesController < ApplicationController
  def new
  	if Self.find_by(user_id: current_user.id)
  	  redirect_to edit_self_path
  	else
  	  @self = Self.new
  	  @self_action = "create"
  	  render :template => "selves/info"
  	end
  end

  def update
  	@self = Self.find_by(user_id: current_user.id)
  	@self.update(self_params)
  	redirect_to edit_self_path
  end

  def edit
  	@self = Self.find_by(user_id: current_user.id)
  	@self_action = "update"
  	render :template => "selves/info"
  end

  def create
  	params[:self]["user_id"] = current_user.id
  	if Self.new(self_params).save
  	  redirect_to :action => :new
  	else
  	  render :text => "fail"
  	end
  end

  def privicy
  	render :template => "selves/info"
  end

private
  def self_params
  	params.require(:self).permit(:user_id, :avatar, :name, :cellphone, :sex, :birth, :marriage, :workStatus, :education)
  end

end
