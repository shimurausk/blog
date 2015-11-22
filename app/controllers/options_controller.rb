class OptionsController < ApplicationController
  def index
  	@options = Option.first
  end

  def show
  	@options = Option.first
  end

  def edit
  	@options = Option.first
  end

  def update
  	@option = Option.find(params[:id])

		if @option.update(option_params)
			redirect_to @option
			else
			render 'edit'
		end
  end

  private
    def option_params
			params.require(:option).permit(:siteurl,:blogname,:blogdescription,:startofweek)
		end

end
