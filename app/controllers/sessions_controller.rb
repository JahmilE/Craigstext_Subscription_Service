class SessionsController < Devise::SessionsController
  def new
    @user = User.new
  end
 
  def create
    raise 'asdfasdf'
    @user = User.new(params[:user])
    if @user.save
        redirect_to @user
    else
      render action: "new"
    end
  end
  
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    raise 'asdfasdf'
    
    @user = user.find(params[:id])
    respond_to do |format|
      if @user.update_attributes (params[:user])
        format.html {redirect_to '/user', notice: "user was successfully updated."}
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
      format.html {redirect_to subscribers_path}
    end
  end 


end