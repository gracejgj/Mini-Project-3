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

  def save_deposit(dep)
    CSV.open('account.csv', 'a+', { headers: true } ) do |csv|
      csv << dep
    end
  end

  def with_draw(amount)

   # TODO: check that amount is valid, else error
   balance -= amount.to_f
   # TODO: check if sufficient funds available
  end

  def update_pass(user, upd)
    table = CSV.table('user.csv', headers: true)

    table.delete_if do |uname, pwd|
      row[0] == user
      row[1] == user
    end

    File.open('user.csv', 'w') do |f|
      f.write(table.to_csv)
    end

    CSV.open('user.csv', 'a+', { headers: true }) do |csv|
      csv << upd
    end
  end
end
