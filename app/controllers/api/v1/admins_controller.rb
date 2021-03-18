module Api
  module V1
    class AdminsController < ApplicationController
      before_action :authorized, only: [:auto_login]

      def create
        @admin = Admin.create(admin_params)
        exp = Time.now.to_i + 1.day

        if @admin.valid?
          token = encode_token({ admin_id: @admin.id, exp: exp })
          render json: { admin: @admin, token: token }
        else
          render json: { error: 'Invalid Username or Password' }
        end
      end

      def login
        @admin = Admin.find_by(username: params[:username])
        exp = Time.now.to_i + 12.hours

        if @admin && @admin.authenticate(params[:password])
          token = encode_token({ admin_id: @admin.id, exp: exp })
          render json: { message: 'Succesfully loged in', token: token }
        else
          render json: { error: 'Invalid Username or Password' }
        end
      end

      def auto_login
        render json: @admin
      end

      private

      def admin_params
        params.require(:admin).permit(:username, :password)
      end
    end
  end
end
