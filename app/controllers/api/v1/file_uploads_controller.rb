# frozen_string_literal: true

module Api
  module V1
    # Controller to handle file upload actions
    class FileUploadsController < ApplicationController
      before_action :authorize_access_request!, except: %i[show]
      before_action :build_file_upload, only: [:create]
      before_action :set_file_upload, only: %i[show destroy]

      def show
        redirect_to @file_upload.file.url
      end

      def create
        if @file_upload.save
          render json: @file_upload, status: :created
        else
          render json: { error: @file_upload.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @file_upload.destroy
          render json: @file_upload, status: :no_content
        else
          render json: { error: @file_upload.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def build_file_upload
        @file_upload = FileUpload.new(file_upload_params)
      end

      def set_file_upload
        @file_upload = FileUpload.find_by(client_id: params[:id])
      end

      def file_upload_params
        p = params.require(:file_upload).permit(
          *FileUpload.to_params,
        )

        FileUpload.reflect_on_all_associations.each do |reflection|
          p["#{reflection.name}_attributes"] = p.delete(reflection.name) if p.key?(reflection.name)
        end

        p
      end
    end
  end
end
