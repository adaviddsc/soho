module SelvesHelper
  def is_controller_ability_or_job
  	if params[:controller] == "ability" || params[:controller] == "job"
  	  return true
  	else
  	  return false
  	end
  end

  def is_controller_ability
  	if params[:controller] == "ability"
  	  return true
  	else
  	  return false
  	end
  end

  def is_controller_job
  	if params[:controller] == "job"
  	  return true
  	else
  	  return false
  	end
  end

  def is_action_work
    if params[:action] == "work"
      return true
    else
      return false
    end
  end

  def is_action_people
    if params[:action] == "people"
      return true
    else
      return false
    end
  end

  def self_img
    @self_bgimg = Self.find_by(user_id: current_user.id)
  end
end
