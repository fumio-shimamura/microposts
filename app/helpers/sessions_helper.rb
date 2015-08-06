module SessionsHelper
	def current_user
		#falseかnilの場合に右の値の代入
		@current_user ||= User.find_by(id: session[:user_id])
	end
	
	def logged_in?
		#値が存在する場合はtrue/ nilの場合はfalse
		!!current_user
	end
	
	def store_location
		# リクエストがGETの場合
		session[:forwarding_url] = request.url if request.get?
	end
end
