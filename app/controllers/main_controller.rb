class MainController < ApplicationController

	def index
		session.init activities: [], gold: 0
		@activities = session[:activities]
		@gold = session[:gold]
	end

	def fate
		@ranges = {
			farm:    10 .. 20,
			cave:     5 .. 10,
			house:    2 ..  5,
			casino: -50 .. 50
		}
		@place = params[:place]
		# Calculate Gold
		@potential_gold = @ranges[@place.to_sym]
		@new_gold = rand(@potential_gold)
		session[:gold] += @new_gold
		# Log activity
		@won_lost = @new_gold < 0 ? "lost" : "won" # but that would be IMPOSSIBLE to read.
		if @place == "casino" # I could make this one line with nested ternaries, 
			@message = "Entered a casino and #{@won_lost} #{@new_gold.abs} golds"
			@message += @won_lost == "won" ? "" : "... Ouch.."
		else
			@message = "Earned #{@new_gold} golds from the #{@place}"
		end
		@new_activity = {
			css: @won_lost,
			desc: @message,
			time: Time.new.strftime("(%Y/%m/%d %I:%M %p)")
		}
		session[:activities] << @new_activity
		redirect_to '/'
	end

	def clear
		session.clear
		redirect_to '/'
	end

end