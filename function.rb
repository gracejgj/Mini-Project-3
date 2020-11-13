require 'csv'

class AtmFunction
  def log_in(uname, pass)
    login_passed = false
    CSV.foreach('user.csv', headers: true).find do |row|
      if login_passed = row['username'] == uname && row['pass'] == pass
        puts "logged in"
        login_passed = true
        main = ATMSystem.new
        main.main_menu
      else
        puts "invalid. try again"
        login_passed == false
        main = ATMSystem.new
        main.log_menu
      end
    end
  end

  def save_deposit(deposit)
    CSV.open('user.csv', 'a+', { headers: true } ) do |csv|
      csv << deposit

    end
  end

  def with_draw(amount)
    main = ATMSystem.new

    CSV.open('user.csv', 'wb', headers: true) do |csv_out| #reading
      CSV.foreach('user.csv') do |row| #writng
        balance = row[2]
        if amount <= balance
          new_bal = balance - amount
          puts "new account balance is RM#{new_bal}"
        else
          puts "Insufficient amount. exiting.."
          main.main_menu
        end
      end
    end
  end

  def update_pass(user, new_pass)
    table = CSV.read('user.csv', headers: true )

    table.delete_if do |row|
      row[:pass] == new_pass
    end

    File.open('user.csv', 'w') do |f|
      f.write(table.to_csv)
    end

    CSV.open('user.csv', 'w+', headers: true) do |csv|
      csv << new_pass
    end
  end
end
