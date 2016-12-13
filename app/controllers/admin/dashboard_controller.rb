class Admin::DashboardController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin

  def index
    @lessons = Lesson.all.order_desc
  end
end
