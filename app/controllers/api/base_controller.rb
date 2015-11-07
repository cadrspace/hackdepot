include ActionController::MimeResponds
include ActionController::StrongParameters

class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
end
