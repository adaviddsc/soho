class FindController < ApplicationController
  def people
  	@ability_all = Ability.all
  end
end
