class BookController < ApplicationController
	layout 'standard'
	
	def list
		@books =Book.all
	end	

	def show
		@book = Book.find(params[:id])
	end

	def new 
		@book = Book.new
		@subjects  = Subject.all
	end


	def book_params
      params.require(:books).permit(:title, :price, :subject_id, :description)
   end

	def create 
		# puts "========================="
		# puts (params[:books][:title].inspect)
		# puts "========================="
		@book = Book.new(book_params)

		if @book.save
			redirect_to :action => 'list'
		else
			@subject = Subject.all
			render :action => 'new'	
		end	
	end

	def edit
		@book = Book.find(params[:id])
		@subjects  = Subject.all
	end

 def book_param
      params.require(:book).permit(:title, :price, :subject_id, :description)
   end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_param)
		#	puts book.errors
			redirect_to :action =>'show',:id =>@book
		else
			@subject = Subject.all
			render :action =>'list'	
		end

	end


	def delete
		Book.find(params[:id]).destroy
		redirect_to :action =>'list'
	end

	def show_subjects
		@subject = Subject.find(params[:id])
	end

end