require './function'

class Login
  #attr_accessor :pwd, :balance

  def log
    puts "Account login"
    puts "Enter username"
    @uname = gets.chomp
    puts "Enter password"
    @pwd = gets.chomp

    function = AtmFunction.new

    #puts ATMSystem.main_menu
  end

end

start = Login.new
start.log
