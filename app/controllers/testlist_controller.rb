class TestlistController < ApplicationController

	def booklist
		@book = Book.all
	end		


	def bookshow
		@book = Book.find(params[:id])
	end


	def bookparams
		params.require(:booksnew).permit(:title, :price , :decripction , :subject_id) 
	end 	

	def createbook
		@book = Book.new(bookparams) 

		if @book.save
			redirect_to :action => 'booklist'
		else
		#	render :action => 'addnew'	
		end	
	end	

	def addnew 
		@subject = Subject.all
	end 		






end