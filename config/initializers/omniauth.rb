Rails.application.config.middleware.use OmniAuth::Builder do
	provider :github, 'd78181e1ec709f32d844',
				'7fd79b37dd8a4423c598b9jkf6ae6d4fe358af11dc'
	provider :Tsina, '317279585','7c8fa88bb73265c0a0f19b08a77d597f'
	provider :Taobao, '12584221', 'd60014ad428681e2e7e2be3ef7eb9705'
	provider :Tqq, '100624260', 'dc531c32113852a5e8cb90a432e89bc0'
end