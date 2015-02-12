module FindHelper
  def find_abilityFocus(ability_id,user_email)
  	if AbilityFocus.find_by(:ability_id => ability_id, :user => user_email)
  	  return true
  	else
  	  return false
  	end
  end

  def find_jobFocus(job_id,user_email)
  	if JobFocus.find_by(:job_id => job_id, :user => user_email)
  	  return true
  	else
  	  return false
  	end
  end

  def find_abilityBrowse(ability_id,user_email)
    if AbilityBrowse.find_by(:ability_id => ability_id, :user => user_email)
      return true
    else
      return false
    end
  end

  def find_jobBrowse(job_id,user_email)
    if JobBrowse.find_by(:job_id => job_id, :user => user_email)
      return true
    else
      return false
    end
  end
end
