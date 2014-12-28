# Exercise 4-7
### Problem ###
# Outline a reasonable method of solving each of the following problems. Give the order of the worst-case
# complexity of your methods.
# a) You are given a pile of thousands of telephone bills and thousands of checks sent in to pay bills
# Find out who did not pay
### End ###
#
# This problem can be solved in O(n) time where n is the number of telephone bills. First, the checks must
# be placed in a hash with the key being the account number which is assumed to be listed on both the 
# telephone bills and the checks. Then we can iterate over the telephone bills and remove those bills from
# the initial list that have a corresponding list in the hash. The remaining list will be all the telephone bills that 
# are not in the initial list.   

def match_bills_to_checks(bills, checks)
  check_hash = {}
  checks.each do |check|
    check_hash[check] = true
  end
  (bills.count - 1).downto(0).each do |i|
    bills.delete_at(i) if check_hash[bills[i]]
  end
  bills
end

bills = [1,3,5,7,9,11,13,15,16,17]
checks = [1,5,11,15]
puts "Bills not paid #{match_bills_to_checks(bills, checks)}"

# b) You are given a list containing the title, author, call number and published of all the books in a school
# library and another list of 30 publishers. Find out how many of the books in the library were published by
# each company.
#
# This problem can be solved in O(n) time where n is the count of books in the initial list. We need to just
# iterate over the books and when a book has a publisher in the list we can simply increase a count of that
# publisher in a hashtable. If the publisher is not in the list of 30 we can simply disregard it.

def books_per_publisher(books, publishers)
  publisher_count = Hash.new { 0 }
  books.each do |book|
    if publishers.include? book.publisher
      publisher_count[book.publisher] += 1
    end
  end
  publisher_count
end

class Book < Struct.new(:title, :author, :call_number, :publisher); end;

books = [
  Book.new("Book 1", "A Author", 1, "Ruby Books"),
  Book.new("Book 2", "B Author", 1, "Algorithm Books"),
  Book.new("Book 3", "A Author", 1, "Ruby Books"),
  Book.new("Book 4", "C Author", 1, "Python Books")
]

publishers = ["Ruby Books", "Algorithm Books"]

puts "Publisher count #{books_per_publisher(books, publishers)}"

# c) You are given all the book checkout cards used in the campus library during the past year, each of which contains the name of the person
# who took out the book. Determine how many distinct people checked out at least one book.
#
# This problem is similar to the ones before, and can be solved in O(n) time where n is the number of checkout cards. By maintaining
# a hash of account names to checkout counts we will then know the distinct checkout times by adding up the number of keys.

def unique_checkouts(books)
  unique_members = Hash.new { 0 }
  books.each do |book|
    book.checkouts.each do |checkout|
      unique_members[checkout.name] += 1
    end
  end
  unique_members.keys.count
end

class BookCard < Struct.new(:checkouts); end;
class Checkout < Struct.new(:name); end;

books = [
  BookCard.new([
    Checkout.new("James"),
    Checkout.new("Franklin"),
    Checkout.new("Gob"),
    Checkout.new("George Michael")
  ]),
  BookCard.new([
    Checkout.new("Gob"),
    Checkout.new("Tobias"),
    Checkout.new("Carl Weathers"),
    Checkout.new("Michael"),
    Checkout.new("Franklin")
  ])
]
puts "Unique Checkouts for all books #{unique_checkouts(books)}"

