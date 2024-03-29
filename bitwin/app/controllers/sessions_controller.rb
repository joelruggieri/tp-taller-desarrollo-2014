class SessionsController < ApplicationController
  #basado en ejemplos de https://www.railstutorial.org/

  def new
  end
  
  def create
    user = User.find_by(nickname: params[:session][:nickname].downcase)
    if user && user.authenticate(params[:session][:password])
   	  login user     
    end
     redirect_to root_path
  end

  def destroy
    logout
    redirect_to root_url
  end
end
