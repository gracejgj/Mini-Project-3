require 'csv'

@accounts = []

class AtmFunction
  def log_in(user)
    table = CSV.parse(File.read('user.csv'), { headers: true })

    user.each do |user|
      if user.uname == uname && user.pwd == pwd
        puts "Login Successful!"
        ATMSystem.main_menu
      end
    end
  end

  def save_deposit(dep)
    CSV.open('account.csv', 'a+', { headers: true } ) do |csv|
      csv << dep
    end
  end

  def update_pass(user, upd)
    table = CSV.table('user.csv', { headers: true })

    table.delete_if do |row|
      row[:uname] == user
    end

    File.open('user.csv', 'w') do |f|
      f.write(table.to_csv)
    end

    CSV.open('user.csv', 'a+', { headers: true }) do |csv|
      csv << upd
    end
  end

end
