# Transfer
#   initialize
#     can initialize a Transfer
#     initializes with a sender
#     initializes with a receiver
#     always initializes with a status of 'pending'
#     initializes with a transfer amount
#   #valid?
#     can check that both accounts are valid
#     calls on the sender and receiver's #valid? methods
#   #execute_transaction
#     can execute a successful transaction between two accounts (FAILED - 1)
#     each transfer can only happen once (FAILED - 2)
#     rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 3)
#   #reverse_transfer
#     can reverse a transfer between two accounts (FAILED - 4)
#     it can only reverse executed transfers (FAILED - 5)

require 'pry'


class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
#    @transfer = transfer   
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 


  def valid?
    sender.valid? && receiver.valid?
  end 

# can execute a successful transaction between two accounts (sender.valid?)                 
# && ~>  each transfer can only happen once
          
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"  
      sender.balance -= amount 
      receiver.balance += amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer 
    if status == "complete"
      receiver.balance -= amount
      sender.balance += amount 
      self.status = "reversed"
    end 
  end 
end
