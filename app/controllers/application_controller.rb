class ApplicationController < ActionController::Base
  include SessionsHelper

  protect_from_forgery with: :exception
  after_action :flash_to_headers

  private
    def flash_to_headers
      # only run this in case it's an Ajax request.
      return unless request.xhr?
      # add flash to header
      response.headers['X-Flash'] = flash.to_h.to_json
      # make sure flash does not appear on the next page
      # flash.discard
    end

end
