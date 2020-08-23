require 'open3'

class Api::V1::RelayController < ApplicationController
	def controls
		Open3.popen2("python3 /home/pi/Projects/RelayHat/RelayHat/relay.py #{params[:relay]} #{params[:state]}") do |i, o, t|
			p o.each { |line| Rails.logger.info line }
		end
	end
end
