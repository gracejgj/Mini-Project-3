require './login'
require './function'

class ATMSystem
  def main_menu
      puts "Welcome to ATM System"
      puts "1 - Deposit money"
      puts "2 - Withdraw money"
      puts "3 - Update password"
      puts "4 - Exit"

      input = gets.chomp

      case input
        when '1'
          deposit
        when '2'
          withdraw
        when '3'
          update
        when '4'
          exiting
        else
          puts "Invalid option. Please try again"
          main_menu
      end
  end

  def deposit
    function = AtmFunction.new

    puts "Enter the amount of deposit: "
    deposit = gets.chomp.to_i

    dep = [deposit]
    function.save_deposit(dep)
    #@balance = @balance + dep
    puts "You have deposited RM#{deposit} into you account. Current balance is RM#balance"
  end

  def withdraw
    function = AtmFunction.new

    puts "Enter the amount to withdraw: "
    withdrawal = gets.chomp.to_f

    amount = [withdrawal]
    function.with_draw(amount)

      if withdrawal > @balance
        puts "Insufficient amount"
        withdraw
      elsif withdrawal <= @balance
        puts "Please enter y to withdraw RM#{withdrawal}; else n"
        input = gets.chomp.downcase

      if input == 'n'
        withdraw
      elsif input == 'y'
        @balance = @balance - withdrawal
        puts "withdrawn RM#{withdrawal}. Current balance is RM#{@balance}."
      end
    end
  end

  def update
    function = AtmFunction.new

    puts "Enter user to update: "
    user = gets.chomp
    puts "Update new password: "
    pass = gets.chomp
    upd = [pass]

    function.update_pass(user, upd)
  end

  def exiting
    puts "Have a nice day!"
  end

end


start = ATMSystem.new
start.main_menu
