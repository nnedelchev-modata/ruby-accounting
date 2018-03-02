class TodosController < ApplicationController

    def index
        @items = Todo.all()
    end

    def show
        @item = Todo.find(params[:id])
        @item.status = 1
        @item.save
        if @item
            render json: @item
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    def create
        @item = Todo.create(record_params)
        if @item.save
            render json: @item
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    def unDone
        @item = Todo.find(params[:id])
        @item.status = 0
        @item.save
        if @item
            render json: @item
        else
            render json: @item.errors, status: :unprocessable_entity
        end
    end

    private
    def record_params
        params.require(:record).permit(:name, :status, :id)
    end
end
