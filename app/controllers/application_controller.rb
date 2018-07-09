class ApplicationController < ActiveRecord::Base
  protect_from_forgery with: :exception
  include SessionsHelper
end
