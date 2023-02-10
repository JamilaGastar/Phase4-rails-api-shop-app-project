class ItemsController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    #GET / items
    def index
        items = Item.all
        render json: items, include: :user
    end

    # POST /items
    def create
        item = Item.create(item_params)
        render json: item
    end

    # GET /items/:id
    def show
        item = find_item
        render json: item
    end

    # PATCH /items/:id
    def update
        item = find_item
        item.update(item_params)
        render json: item
    end


    # DELETE /items/:id
    def destroy
        item = find_item
        item.destroy
        head :no_content
    end


    private

    def find_item
        Item.find(params[:id])
    end
    
    def item_params
        params.permit(:name, :image_url, :description, :condition, :size, :price, :stock)
    end

    def render_not_found_response
        render json: { error: "Item not found" }, status: :not_found
    end


end
