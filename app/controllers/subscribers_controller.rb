class SubscribersController < ApplicationController
 before_filter :authenticate_subscriber!

  def new
    @subscriber = Subscriber.new
  end
 
  def create
    @subscriber = Subscriber.new(params[:subscriber])
    if @subscriber.save
       # Instantiate a Twilio client
      client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: ENV['from'],
        to: @subscriber.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )
        redirect_to @subscriber
    else
      render action: "new"
    end
  end
  
  def index
    @subscribers = Subscriber.all
  end

  def show
    @subscriber = Subscriber.find(params[:id])
  end

  def update
    @subscriber = Subscriber.find(params[:id])
    respond_to do |format|
      if @subscriber.update_attributes (params[:subscriber])
        format.html {redirect_to '/subscribers', notice: "subscription was successfully updated."}
      else
        format.html {render action: "edit"}
      end
    end
  end

  def edit
    @subscriber = Subscriber.find(params[:id])
  end

  def destroy
    @subscriber = Subscriber.find(params[:id])
    @subscriber.destroy
    respond_to do |format|
      format.html {redirect_to new_subscribers_path}

    if @subscriber.destroy
       # Instantiate a Twilio client
      client = Twilio::REST::Client.new(ENV['sid'], ENV['token'])
      
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: ENV['from'],
        to: @subscriber.phone,
        body: "Okay! You're unsubscribed and will no longer receive craigstexts"
      )
        

      end
    end
  end 

  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def subscriber_params
      params.required(:subscriber).permit(:email, :password, :password_confirmation, :name)
    end
end





