class UsersController < ApplicationController
  class UsersController < ApplicationController
    def directory

      @users = User.all
  
      # Filter by admin
      @users = @users.where(admin: true) if params[:admin] == "1"
  
      # Filter by alumn
      @users = @users.where(alumn: true) if params[:alumn] == "1"
  
      # Filter by student
      @users = @users.where(student: true) if params[:student] == "1"
  
      # Filter by professor
      @users = @users.where(professor: true) if params[:professor] == "1"
  
      # Filter by other fields
      @users = @users.where(country_of_residence: params[:country_of_residence]) if params[:country_of_residence].present?
      @users = @users.where(company: params[:company]) if params[:company].present?
      @users = @users.where(industry_of_occupation: params[:industry_of_occupation]) if params[:industry_of_occupation].present?
  
      # Filter by date of birth range
      if params[:dob].present?
        begin
          dob_date = Date.parse(params[:dob])
          @users = @users.where(dob: dob_date)
        rescue ArgumentError
          flash.now[:alert] = "Invalid date format."
        end
      end

      render directory

    end
  end
  
  def edit
    @user = current_user
  end

  # Handle the form submission and update the user
  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_profile_path, notice: "Profile updated successfully."
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  # Strong parameters to allow updating specific fields
  def user_params
    params.require(:user).permit(
      :admin,
      :alumn,
      :dob,
      :profile_picture,
      :country_of_residence,
      :industry_of_occupation,
      :company,
      :city_of_residence,
      :student,
      :professor
    )
  end

end
