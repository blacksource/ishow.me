class SinaOauth
	def self.get_authentication(oa)
		Authentication.create(:provider=>oa["provider"], :uid=>oa["uid"],
			:oauth_token=>oa["credentials"]["token"], :oauth_token_secret=>oa["credentials"]["secret"],
			:user_name=>oa["user_info"]["username"], :image=>oa["user_info"]["image"])
	end
end