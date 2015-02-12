class SelvesController < ApplicationController
  def update
  	@self = Self.find_by(user_id: current_user.id)
  	@self.update(self_params)
  	redirect_to edit_self_path
  end

  def edit
  	render :template => "selves/info"
  end

  def privicy
    @self_privicy = Self.find_by(user_id: current_user.id)
  	render :template => "selves/info"
  end

  def privicy_update
    self_privicy = Self.find_by(user_id: current_user.id)
    self_privicy.update(self_privicy_params)
    redirect_to privicy_self_path
  end

  def bgimg
    self_bgimg = Self.find_by(user_id: current_user.id)
    self_bgimg.update(:bgimg => params[:self]["bgimg"])
    redirect_to edit_self_path
  end

private
  def self_params
  	params.require(:self).permit(:user_id, :avatar, :name, :cellphone, :sex, :birth, :marriage, :workStatus, :education)
  end

  def self_privicy_params
    params.require(:self).permit(:name_privicy, :cellphone_privicy, :sex_privicy, :birth_privicy, :marriage_privicy, :workStatus_privicy, :education_privicy)
  end
end
