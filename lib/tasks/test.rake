require 'rake'
namespace :user do
  desc "create_user"
  task :create => :environment do
  	if Self.create(name: "test").save
  	  Self.delete_all(name: "test")
  	  puts "success"
  	else
  	  puts "fail"
  	end
  end



end