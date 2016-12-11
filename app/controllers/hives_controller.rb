class HivesController < ApplicationController
	#syntactic sugar for more info http://rubylearning.com/satishtalim/ruby_syntactic_sugar.html
	def index
		@hives = Hive.all
	end

	#allowing us to create new instaces of the Hive object via our form
	def new 
		@hive = Hive.new
	end

  #finds our new record via find(activerecord method that with like for an id)
	def show 
		find_params
	end

	# here we can use new, build or create and to see our errors we can use that ! sign I told you about
	# for new/build we set at the end of save like save! 
	#to see our errors that are perventing our record we can use save! generally we do not use ! in production.
	# for create we can  use create! because create creates and save in one go.
	def create 
		@hive = Hive.new(hive_params)
		if @hive.save!
			redirect_to @hive
		else
			render "new"
		end
	end

	#allows to find our record via the id like in the show so we can edit it.
	def edit
		find_params
	end

	def update
		find_params
		hive.update(hive_params) #if we wanted to specify what we wanted the user could update we could and not use strong params
		if hive.save
			redirect_to hive
		else
			render "show" # we use render here for better user experience because render do not make a full http request
		end		
	end

	def destroy
		find_params
		@hive.destroy
		redirect_to @hives
	end	

	private 
	def hive_params #This is a better security practice to help prevent accidentally allowing users to update sensitive model attributes.
		params.require(:hive).permit(:bee_type, :queen_name, :honey_description, :location)
	end

	def find_params #this is a way to keep your actions DRY(Don't Repeat Yourself)
		@hive = Hive.find(params[:id])
	end
end
