class SelvesController < ApplicationController
  def update
  	@self = Self.find_by(user_id: current_user.id)
  	@self.update(self_params)
  	redirect_to edit_self_path
  end

  def edit
  	@self = Self.find_by(user_id: current_user.id)
  	render :template => "selves/info"
  end

  def privicy
  	render :template => "selves/info"
  end

private
  def self_params
  	params.require(:self).permit(:user_id, :avatar, :name, :cellphone, :sex, :birth, :marriage, :workStatus, :education)
  end

end
