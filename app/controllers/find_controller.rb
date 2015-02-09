class FindController < ApplicationController
  def people
  	@article_all = Ability.all
  	render :template => "find/announce"
  end

  def work
  	@article_all = Job.all
  	render :template => "find/announce"
  end
end
