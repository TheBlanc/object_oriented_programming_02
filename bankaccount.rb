class BankAccount
  @@interest_rate = 1.15
  @@accounts = []

  def initialize
    @balance = 0
  end

  # Class Methods
  def self.create
    new_account = BankAccount.new
    @@accounts.push(new_account)
    return new_account
  end

  def self.accounts
    return @@accounts
  end

  def self.total_funds
    total_funds = 0
    @@accounts.each do |account|
      total_funds += account.balance
    end
    return total_funds
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance *= @@interest_rate
    end
    return @@accounts
  end

  # @balance reader method
  def balance
    @balance
  end

  # @balance writer method
  def balance=(amount)
    @balance = amount
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end





account1 = BankAccount.create
account2 = BankAccount.create
account3 = BankAccount.create

account1.balance = 100
account2.balance = 200
account3.balance = 300

p account1
p account2
p account3

p BankAccount.accounts

p BankAccount.total_funds

p BankAccount.interest_time

p BankAccount.total_funds

account1.withdraw(100)
p "account 1 #{account1}"
p "account 1 #{account1.balance}"
