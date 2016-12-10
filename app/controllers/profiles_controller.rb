class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:notice] = "You have successfully created a new Profile!"
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

def index
  @profile = Profile.all
end

def show
  @profile = current_user.profile
end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :biography, :picture)
  end

end
