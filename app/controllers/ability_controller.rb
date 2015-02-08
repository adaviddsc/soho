class AbilityController < ApplicationController
  def index
  	render :template => "selves/announce"
  end

  def new
  	@ability = Ability.new
    @ability_action = "create"
  	render :template => "selves/announce"
  end

  def create
  	params[:ability]["user_id"] = current_user.id
  	if Ability.new(ability_params).save
  	  redirect_to new_self_ability_path
  	else
  	  render :text => "fail"
  	end
  end

  def edit
    @ability = Ability.find(params[:id])
    if @ability.user_id == current_user.id
      @ability_action = "update"
      render :template => "selves/announce"
    else
      redirect_to :root
    end
  end

  def update
    @ability = Ability.find(params[:id])
    @ability.update(ability_params)
    redirect_to edit_self_ability_path
  end

  def destroy
  	AbilityImg.destroy_all(:ability_id => params[:id])
    @ability = Ability.find(params[:id])
	@ability.destroy
    redirect_to new_self_ability_path
  end

  def browse
    browse = AbilityBrowse.find_by(:ability_id => params[:ability_id], :user => current_user.email)
    if browse.nil? && current_user
      AbilityBrowse.new(:ability_id => params[:ability_id], :user => current_user.email).save
    end
  end

private
  def ability_params
  	params.require(:ability).permit(:user_id, :workCategory, :abilityContent, :abilityDetail, ability_imgs_attributes: [:id, :order, :image, :_destroy])
  end

end
