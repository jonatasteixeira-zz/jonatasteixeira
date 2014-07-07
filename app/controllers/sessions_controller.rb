class SessionsController < ApplicationController
  include SessionsHelper 
  
  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by_email(session_params[:username_or_email]) || User.find_by_username(session_params[:username_or_email]) 
    respond_to do |format|
      if user && user.authenticate(session_params[:password])
        sign_in user
        format.html { redirect_to :root, :success => 'Post was successfully removed.' } 
        format.json { render :root, status: :logged }
      else
        format.html { render action: :new, :error => 'Invalid password, username or email' }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    sign_out
    respond_to do |format|
        format.html { redirect_to :root, :notice => 'You are logged out' }
        format.json { render json: user.errors, status: :unprocessable_entity }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
      params.require(:login).permit(:username_or_email, :password)
  end

end
