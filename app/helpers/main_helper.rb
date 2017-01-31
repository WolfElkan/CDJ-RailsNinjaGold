module MainHelper
end

class ActionDispatch::Request::Session
	def init kvps
		kvps.to_a.each do |kvp| 
			@key = kvp[0]
			@val = kvp[1]
			if self[@key] == nil
				self[@key] = @val
			end
		end
	end
end
