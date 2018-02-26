class RecordsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @records = Record.order("date DESC")
    end

    def create
        @record = Record.new(record_params)
        if @record.save
            render json: @record
        else
            render json: @record.errors, status: :unprocessable_entity
        end
    end

    def show
        @record = Record.find(params[:id])
        if @record
            render json: @record
        else
            render json: @record.errors, status: :unprocessable_entity
        end
    end

    def update
        @record = Record.find(params[:id])
        if @record.update(record_params)
          render json: @record
        else
          render json: @record.errors, status: :unprocessable_entity
        end
      end

    def destroy
        @record = Record.find(params[:id])
        @record.destroy
        head :no_content
    end

    private
        def record_params
            params.require(:record).permit(:date, :title, :amount, :id)
        end
end
