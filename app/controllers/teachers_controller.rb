class TeachersController < ApplicationController
  before_action :require_login

  def home
    @students = Student.where(is_deleted: false).all
  end
end
