class Api::V1::ApiController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authorized

  def encode_token(payload)
    payload['exp'] = Time.now.to_i + 4 * 3600
    JWT.encode(payload, Rails.application.credentials.jwt_secret)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split('Bearer ')[1]
      begin
        JWT.decode(token, Rails.application.credentials.jwt_secret, true, algorithm: 'HS256', exp_leeway: 30)
      rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::VerificationError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    head :unauthorized unless logged_in?
  end
end
