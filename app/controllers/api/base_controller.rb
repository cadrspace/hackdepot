include ActionController::MimeResponds
include ActionController::StrongParameters

module Api
  class ApplicationController < ActionController::Base
    include DeviseTokenAuth::Concerns::SetUserByToken
    protect_from_forgery with: :null_session
    respond_to :json
  end
end
