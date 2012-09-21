class ImportsController < ApplicationController
	include ActionView::Helpers::NumberHelper

	def index
		@import = Import.new
		@last_import = Import.last
	end

	def create
		@import = Import.new(params[:import])
		begin
			if @import.import
				flash[:notice] = "File successfully imported. The purchase total for this import was #{number_to_currency @import.total_price}"
				redirect_to imports_path
			else
				flash[:error] = "There was a problem importing your file."
			 	render :index
			end
		rescue Exception => e
			flash[:error] = "There was a problem importing your file. Check the file for possible erroneous data (e.g. invalid prices/quantities/formatting)."
			@import = Import.new
			render :index
		end
	end
end
