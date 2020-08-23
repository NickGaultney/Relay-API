require 'open3'

class Api::V1::RelayController < ApplicationController
	skip_before_action :verify_authenticity_token


	def controls
		Open3.popen2("python3 /home/pi/Projects/RelayHat/RelayHat #{params[:relay]} #{params[:state]}") do |i, o, t|
			p o.each { |line| Rails.logger.info line }
		end
		
		render :json "Success!"
	end
end
