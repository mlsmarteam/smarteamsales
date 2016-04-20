class UsersController < ApplicationController

  def show
  	@user=User.find(params[:id])
  end

  def new
    @user = User.new
    @doc_types = DocType.order(:name).all
    @cities = City.order(:name).all
  end

  def create
  @user = User.new(user_params)
    if @user.save
    	log_in @user
      redirect_to root_url
    else
      @doc_types = DocType.order(:name).all
      @cities = City.order(:name).all
      render 'new'
    end
  end

  def edit
    @user=User.find(params[:id])
    @doc_types = DocType.order(:name).all
    @cities = City.order(:name).all
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params_edit)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      @doc_types = DocType.order(:name).all
      @cities = City.order(:name).all
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def search
    @users  = User.order(:last_name,:name).where("name LIKE ? and last_name LIKE ? ","%#{params[:name]}%","%#{params[:last_name]}%")
    users = []
    @users.each do |user|
      users << {id: user.id,
                name: user.last_name+', '+user.name
               }
    end
    render json: users.to_json
  end

  def consult
    @user = User.find(params[:id])
    user = []
    user << {name:@user.last_name+', '+@user.name}
    render json: user.to_json
  end

  private
    def user_params
    	params.require(:user).permit(:name,:last_name, :email, :password,
                          	     :password_confirmation)
  	end

    def user_params_edit
        params.require(:user).permit(:doc_type_id,:doc_number,:name,:last_name, 
                                     :email, :password,
                                     :password_confirmation,:city_id)  
    end

end
