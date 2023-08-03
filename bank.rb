class Account
    @@account_array = []
    attr_accessor :name, :balance, :pin
    def initialize(c_id, name, balance, pin)
        @c_id = c_id
        @name = name
        @balance = balance
        @pin = pin
    end   
    private 
    def pin_check
      puts "Welcome to the banking system, #{@name}!\n" + "To access your account, input PIN please"
      @input_pin = gets.chomp.to_i
    end      

   def pin_error 
      return "Access denied: incorrect PIN."
   end

  public

    def access
      if pin_check == @pin  
      puts "Input 
            d: to deposit money, 
            s: to show balance 
            w: to withdraw money, 
            t: to transfer money
            o: to account details
            e: to exit"
      action = gets.chomp.downcase
          while action.downcase == "d" || "s" || "w" || "e" || "o" || "t"
              if action.downcase == "d"
                  deposit
              elsif action.downcase == "s"
               display_balance
              elsif action.downcase == "w"
               withdraw
              elsif action.downcase == "o"
                account_details
              elsif action.downcase == "t"
                transfer_amount
              elsif action.downcase == "e"
                  exit
              end
              puts "Input 
                    d: to deposit money, 
                    s: to show balance 
                    w: to withdraw money,
                    t: to transfer money 
                    o: to account details
                    e: to exit"
              action = gets.chomp.downcase
          end
      else
          puts pin_error 
      end
  end

    def amount
      puts "Input the amount"
      @money = gets.to_i
    end

    def over_error
      print "You don't own that kind of money, dude! Your balance: $#{@balance}"
    end

    def deposit
     @balance += amount
     puts "Deposited: $#{@money}. Updated balance: $#{@balance}."
    end

    def display_balance
      puts "Balance: $#{@balance}."   
    end

    def withdraw
            if  amount <= @balance
              @balance -= @money
               puts "Withdrew: $#{@money}. Updated balance: $#{@balance}."  
            else
                puts over_error
            end
    end

  #   def transfer_amount
  #         if  amount <= @balance
  #           @balance -= @money
  #            puts "transfer: $#{@money}. Updated balance: $#{@balance}."  
  #         else
  #             puts over_error
  #         end
  # end

  def transfer_amount
    puts "enter customer id :"
    @c_id = gets.chomp.to_i
    if @c_id == 2 
      puts " emter amount you want to transfer :"
      @t_money = gets.chomp.to_i
     if @t_money <= @balance
        @balance -= @t_money
     else
      puts " you can't transfer that amount"
     end
     

    else
      puts " invalid customer id !! "
    end

    
  end

    def account_details
      puts "Input for custon details, 
      n: to show name only,
      b: to show name and amount,
      t: to show all transactions"
      action = gets.chomp.downcase
      if action.downcase == "n"
        puts "your name is  #{@name} "
      elsif action.downcase == "b"
        puts "your name is  #{@name}  and your account balance is #{@balance}"
      elsif action.downcase == "t"
        puts "your all remaining amount is  #{@balance} "
      else
        puts "try again !! "
      end

    end
  end  

@checking_account = Account.new(1,"geeta", 10000,123)
@checking_account1 = Account.new(2,"seeta", 20000,1234)
@checking_account2 = Account.new(2,"seeta", 20000,1234)
@checking_account.access

