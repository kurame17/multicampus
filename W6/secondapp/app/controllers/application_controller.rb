class ApplicationController < ActionController::Base
  # CRLF 해킹 방지
  protect_from_forgery with: :exception
end
