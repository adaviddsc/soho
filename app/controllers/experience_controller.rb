class ExperienceController < ApplicationController
  def index
  	render :template => "selves/info"
  end

  def edit
    @experience = Experience.find(params[:id])
    if @experience.user_id == current_user.id
      @experience_action = "update"
      render :template => "selves/info"
    else
      redirect_to edit_self_path
    end
  end

  def update
    @experience = Experience.find(params[:id])
    @experience.update(experience_params)
    redirect_to edit_self_experience_path
  end

  def new
  	@experience = Experience.new
    @experience_action = "create"
  	render :template => "selves/info"
  end

  def create
  	params[:experience]["user_id"] = current_user.id
  	if Experience.new(experience_params).save
  	  redirect_to self_experience_index_path
  	else
  	  render :text => "fail"
  	end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to self_experience_index_path
  end

private
  def experience_params
  	params.require(:experience).permit(:user_id, :workCompany, :workStart, :workEnd, :workSalary, :workCategory, :workStyle, :workExperience)
  end

end
