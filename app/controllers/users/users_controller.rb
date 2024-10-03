module Users
  class UsersController < BaseController

    def show
    end

    def edit
    end

    def update
      if current_user.update(user_params)
        flash[:notice] = "Profile updated successfully!"
        redirect_to edit_users_user_path(current_user)
      else
        flash[:alert] = current_user.errors.full_messages.to_sentence
        render :edit
      end
    end

    private
      def user_params
        params.required(:user).permit(:name, :email, :phone, :password, :password_confirmation).compact_blank
      end
  end
end
