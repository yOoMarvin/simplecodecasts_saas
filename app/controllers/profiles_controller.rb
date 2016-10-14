class ProfilesController < ApplicationController
    def new
        # form where a user can fill out their own profile
        @user = User.find(params[:user_id]) #Find user from db which is logged in
        @profile = Profile.new
    end
    
    def create
        @user = User.find (params[:user_id])
        @profile = @user.build_profile(profile_params)
        if @profile.save
            flash[:success] = "Profile Updated!"
            redirect_to user_path(params[:user_id])
        else
            render action: :new
        end
    end
    
    def edit
        @user = User.find (params[:user_id])
        @profile = @user.profile
    end
    
    
    
    private
    def profile_params
        #whitelist params for database
        params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
end