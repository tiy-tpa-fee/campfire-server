class User < ApplicationRecord
  has_many :stories
  after_create :update_profile

  def self.authenticate token
    auth = Knock::AuthToken.new(token: token)
    self.find_or_create_by(auth0: auth.payload["sub"]) do |user|
      user.token = token
    end
  end

  def update_profile
    profile = HTTP.post('https://campfire.auth0.com/tokeninfo', json: {
      id_token: token
    }).parse

    self.name = profile["name"]
    self.email = profile["email"]
    self.avatar_url = profile["picture"]
    self.profile = profile

    save
  end
end
