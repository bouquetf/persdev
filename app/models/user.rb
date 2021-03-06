class User < ActiveRecord::Base
  has_many :domains
  has_many :month_actions
  has_many :day_actions
  has_many :day_agendas

  def self.from_omniauth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
    user
  end
end
