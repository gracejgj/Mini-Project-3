#require './login'
require './function'

class ATMSystem

  def log_menu
    puts "Welcome to ATM System"
    puts "1 - Login"
    puts "2 - Exit"

    input = gets.chomp

    case input
      when '1'
        signin
      when '2'
        exiting
      else
        puts "Invalid option. Please try again"
        log_menu
    end
  end

  def signin
    function = AtmFunction.new

    puts "Account login"
    puts "Enter username"
    uname = gets.chomp
    puts "Enter password"
    pass = gets.chomp

    function.log_in(uname, pass)
  end

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
    deposit = gets.chomp

    dep = [deposit]
    function.save_deposit(dep)
    puts "You have deposited RM#{deposit} into your account."
  end

  def withdraw
    function = AtmFunction.new
    puts "Enter the amount to withdraw: "
    amount = gets.chomp

    function.with_draw(amount)
    puts "You have withdraw RM#{amount} from your account"
  end

  def update
    function = AtmFunction.new

    puts "Enter username to update: "
    uname = gets.chomp
    puts "Update new password: "
    pass = gets.chomp

    upd = [pass]
    function.update_pass(uname, upd)
    puts "succesfully changed password into #{pass}"
  end

  def exiting
    puts "Have a nice day!"
  end

end


start = ATMSystem.new
start.log_menu
