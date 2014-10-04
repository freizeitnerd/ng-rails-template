class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_action :set_csrf_cookie_for_ng   # after_filter is deprecated

  def set_csrf_cookie_for_ng
    # Angular provides a mechanism to counter XSRF. When performing XHR requests,
    # the $http service reads a token from a cookie (by default, XSRF-TOKEN)
    # and sets it as an HTTP header (X-XSRF-TOKEN).
    # see:
    # http://technpol.wordpress.com/2014/04/17/rails4-angularjs-csrf-and-devise/
    # https://docs.angularjs.org/api/ng/service/$http#cross-site-request-forgery-xsrf-protection
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end


protected

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
end
