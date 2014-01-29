# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
EligeTuEscuela::Application.config.secret_key_base = if Rails.env.development? or Rails.env.test?
  '73ef4e2352221a764591d4d843100c34cb9ea32b971f97c1db48fc5ce67741d1b08908f57c84a6f9cb8ba9f3f7e72c763b18c6ce008a0f7f4d1cb99bf95a028b'
else
  ENV['SECRET_TOKEN']
end
