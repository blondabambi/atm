require './lib/account'

class Person
  attr_accessor :name, :cash, :account

def initialize (attrs = {})
  @name = set_name(attrs[:name])
  @cash = 100
  # @account = nil
end

def account_attribute
  person.account = nil
end

def create_account
  @account = Account.new({owner: self})
end

def deposit(amount)
  if @account.nil?
    raise 'No account present'
  else
    @cash -= amount
    @account.balance += amount
  end
end

def withdraw(args = {})
  @account == nil ? missing_account : withdraw_funds(args)
end

private

def set_name(obj)
  obj == nil ? missing_name : @name = obj
end

def missing_name
  raise "A name is required"
end

def deposit_funds(amount)
  @cash -= amount
  @account.balance += amount
end

def withdraw_funds(args)
  args[:atm] == nil ? missing_atm : atm = args[:atm]
  account = @account
  amount = args[:amount]
  pin = args[:pin]
  response = atm.withdraw(amount, pin, account, account.account_status)
  response[:status] == true ? increase_cash(response) : response
end

def increase_cash(response)
  @cash += response[:amount]
end

def missing_account
  raise RuntimeError, 'No account present'
end

def missing_atm
  raise RuntimeError, 'An ATM is required'
end

end
