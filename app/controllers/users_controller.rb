class UsersController < ApplicationController
  def index
    if user_signed_in?
      redirect_to  new_user_datum_path(current_user)
    end
  end

  def doc
    send_file Rails.root.join('private', 'Broker Details.docx'), :type=>"application/doc", :x_sendfile=>true
  end

end
