require 'csv'

class AtmFunction
  def log_in(uname, pass)
    login_passed = false
    CSV.foreach('user.csv', headers: true).find do |row|
      if row['username'] == uname && row['pass'] == pass
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
    main = ATMSystem.new
    CSV.open('user.csv', 'r', headers: true).find do |row|
      puts row
      puts row['balance'].to_i
      puts deposit
      @new_bal = row['balance'].to_i + deposit.to_i

      puts "successfully deposit. current balance is RM#{@new_bal}"
      puts 'here:'
      puts @new_bal
    end
    puts 'there:'
    puts @new_bal

    CSV.open('user.csv', 'r', headers: true).find do |f|
      puts f
      puts f['balance']
      puts f['balance'] = @new_bal
    end

      CSV.table('user.csv', { headers: true }).delete_if do |row|
        row.gets

        puts 'new block:'
        puts row
      end
    end


      # CSV.foreach('user.csv') do |row|
      #
      # #  row['balance'].delete
      #   puts row['balance']
      #   # row['balance'] = new_bal
      #   # f << row
      # end

    # row['balance'] == 'new_bal'

    #  table = CSV.parse(File.read('user.csv'), { headers: true })
    #  table.delete_if do |row|
    #    row['balance'] = balance


    # = File.open('user.csv', 'a+', headers: true, row_sep :auto ) do |csv|
    #  csv.each |row|
    #  csv << new_bal
    #  table.each do |username, pass, balance|
  #end

  def with_draw(amount)
    main = ATMSystem.new
    CSV.open('user.csv', 'a+', headers: true ).find do |row|
      a = row['balance']
      if a <= amount
        b = row['balance'].to_i - amount.to_i
        puts "new account balance is RM#{b}"
        main.log_menu
      #  else
      #    puts "Insufficient amount. exiting.."
      #    main.main_menu
      #puts amount
        end
      end
    end
  end

  def update_pass(new_pass)
    table = CSV.table('user.csv', { headers: true })

    table.delete_if do |row|
      row[:pass] == new_pass
    end

    File.open('user.csv', 'w') do |f|
      f.write(table.to_csv)
    end

    CSV.open('user.csv', 'a+', { headers: true }) do |csv|
      csv << new_pass
  end
end
