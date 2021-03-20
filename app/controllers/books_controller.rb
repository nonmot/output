class BooksController < ApplicationController
    include GoogleBooksApi

    def create
        @book = Book.new(title: params[:title], auther: params[:author], group_id: params[:group_id])
        @group = Group.find_by(id: params[:group_id])
        if @book.save
            redirect_to @group
        else
            redirect_back fallback_location: @group
        end
    end

    def destroy
        @book = Book.find_by(id: params[:id])
        @book.destroy
        redirect_back fallback_location: root_url
    end

    def search
    end

    def result
        @books = GoogleBook.search(params[:keyword])
        @group = Group.find_by(id: params[:group_id])
    end
end
