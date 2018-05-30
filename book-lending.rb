class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  # Returns random book in array
  def self.browse
    return @@on_shelf.sample
  end


  def due_date
    @due_date
  end

  def due_date=(due)
    @due_date = due
  end

  def lent_out?
    if @@on_loan.include?(self)
      @lent_out = true
    else
      @lent_out = false
    end
    return @lent_out
  end

  # Returns nil if nothing is in @@on_loan array
  # def lent_out?
  #   @@on_loan.each do |book|
  #     if book == self
  #       @lent_out = true
  #       break
  #     else
  #       @lent_out = false
  #     end
  #   end
  #   return @lent_out
  # end

  def current_due_date
    @due_date
  end

  def due_date=(date)
    @due_date = date
  end

  # Check if self is checked out, if not then take from shelf and put into loan.
  # Set the due date to be 14 days after being checked out
  def borrow
    if self.lent_out? == true
      return false
    else
      @@on_shelf.delete(self)
      @@on_loan.push(self)
      @lent_out = true
      @due_date = Time.now + (60*60*24*14)
    return true
    end
  end

  def return_to_library
    if self.lent_out? == true
      @@on_loan.delete(self)
      @@on_shelf.push(self)
      @lent_out = false
      @due_date = nil
      return true
    else
      return false
    end
  end

  def self.overdue
    books_overdue = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
        books_overdue.push(book)
      end
    end
    return books_overdue
  end

end

harry_potter = Book.create("Harry Potter", "JK Rowling", 1122334455)
p harry_potter
catch_22 = Book.create("Catch 22", "Joseph Heller", 1233221143)
p catch_22
lotr = Book.create("Lord of the Rings", "JR Tolken", 1987654321)
p lotr
p Book.available
p Book.browse
p "-------------"
p "is harry potter lent out? #{harry_potter.lent_out?}"
p "use borrow"
p harry_potter.borrow
p catch_22.borrow
p Book.available
p Book.borrowed

puts "----------------\n\n\n"
p harry_potter.due_date = (Time.now - (100000))
p catch_22.due_date = (Time.now - (100000))
p harry_potter.current_due_date
p catch_22.current_due_date
p catch_22.current_due_date < Time.now


p Book.overdue
