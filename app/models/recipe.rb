class Recipe < ActiveRecord::Base
	include HTTParty
	ENV['FOOD2FORK_KEY']= '88535d5cf2d2129b287a70b1bb747c8b'
	ENV['FOOD2FORK_SERVER_AND_PORT']='www.food2fork.com'
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT']||'www.food2fork.com'
	base_uri "http://#{hostport}/api"
	default_params key: ENV['FOOD2FORK_KEY'],
				   fields: "image_url,title,social_rank",
				   q:"search"
	
	format :json
	def self.for term
		get("/search",query:{q:term})["recipes"]
	end
end
