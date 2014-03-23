class RegistrationsController < ApplicationController
  before_filter :asd
  def asd
    raise "assdf/"
  end
  def new
    @user = User.new
  end
 
  def create
    raise params.inspect
    @user = User.new(params[:user])
    if @user.save
       # Instantiate a Twilio client
      client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: ENV['from'],
        to: @user.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )
        redirect_to @user
    else
      render action: "new"
    end
  end
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    raise params.inspect
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html {redirect_to '/users', notice: "subscription was successfully updated."}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html {redirect_to users_path}
    end
  end 


private
  def sign_up_params
    @sign_up_params ||= params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone)
  end
  
end