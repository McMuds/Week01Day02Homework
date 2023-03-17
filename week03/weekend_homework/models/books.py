from models.book import Book

book1 = Book("Zen and the Art of Motorcycle Maintenance",
             "Robert M. Pirsig", "self-help")
book2 = Book("To Kill a Mockingbird", "Harper Lee", "Fiction")
book3 = Book("The Girl Who Saved the King of Sweden", "Jonas Jonasson", "Fiction")

book_data = [book1, book2, book3]

def add_new_book(book):
    book_data.append(book)