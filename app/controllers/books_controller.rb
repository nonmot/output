class BooksController < ApplicationController
    include GoogleBooksApi

    def search
    end

    def result
        @books = GoogleBook.search(params[:keyword])
    end
end
