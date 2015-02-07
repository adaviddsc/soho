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
    redirect_to new_self_ability_path
  end

  def destroy
    @ability = Ability.find(params[:id])
    @ability.destroy
    redirect_to new_self_ability_path
  end

private
  def ability_params
  	params.require(:ability).permit(:user_id, :workCategory, :abilityContent, :abilityDetail)
  end

end
