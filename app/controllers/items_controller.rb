class ItemsController < ApplicationController

	def index
        @items = Item.all
		render :index

	end

	def show 
		@items = Item.find(params[:id].to_i)
		render :show
	end

	def new
		@items = Item.new
		render :new
	end

	def update
		@items = Item.find(params[:id].to_i)
		if(@items.present?)
			@items.update(items_params)
			redirect_to "/"
		end
	end

	def create 
		@items = Item.new(items_params)
		if(@items.save)
			redirect_to "/"
		end
	end

	def destroy
		@items = Item.find(params[:id].to_i)
		if(@items.present?)
			@items.destroy
			redirect_to "/"

    	end

	end

	def edit 
		@items = Item.find(params[:id].to_i)
		render :edit
	end

	def items_params
		params.require(:item).permit(:serial_number, :description, :supplier, :status, :lender)
	end


end 