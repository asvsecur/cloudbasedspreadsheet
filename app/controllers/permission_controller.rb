class PermissionController < ApplicationController
  def index
    @data =  User.normal_users
  end

  def create
    data_id = params[:data_id]
    user_id = params[:set_user_id]
    user = User.find(user_id)
    current_accessible_datum = user.accessible_datum
    current_accessible_datum = [current_accessible_datum] << [data_id]
    user.update_attribute(:accessible_datum, [current_accessible_datum].flatten.uniq) if data_id && user_id
    user.save!
    redirect_to user_permission_index_path(current_user)
  end

end
