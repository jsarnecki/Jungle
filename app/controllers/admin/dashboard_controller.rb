class Admin::DashboardController < ApplicationController

  admin_username = ENV["ADMIN_USERNAME"]
  admin_password = ENV["ADMIN_PASSWORD"]

  http_basic_authenticate_with name: admin_username, password: admin_password  


  def show
  end
end
