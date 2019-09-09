BEGIN{
	puts "                    ****************************"
	puts "                    WELCOME TO OUR BANKING SYSTEM"
	puts "                    ****************************"
}


#class for banking operation
class Banking
	  
      @@cust_amount=1000
      @@cust_withdraw=0
      @@cust_deposit=0
	  def initialize(firstname, lastname,addr,accno,phno,dob)
        @cust_firstname = firstname
        @cust_lastname = lastname
        @cust_addr = addr
        @cust_accno = accno
        @cust_phno =phno
        @cust_dob=dob
      end
      #def begbal(amount)
      #	@@cust_amount=amount
      #	puts "Beggining Balance is: #{@@cust_amount}"
      #end
      def deposit(depos)
      	puts "Your Previous Balance is : #{@@cust_amount}"
      	puts "After Deposit Your Account Balance is: #{@@cust_amount+=depos}"
      end
      def withdraw(withs)
      	if @@cust_amount<withs
      		puts "Sorry,You dont have Sufficient Balance"
      		puts "Your Current Balance is: #{@@cust_amount}"
      	else
      		puts "Your Previous Balance is: #{@@cust_amount}"
      	    puts "After Withdrawal Your Account Balance is: #{@@cust_amount-=withs}"
      end
      end
      
 
      def prints()
      	
        puts "                   ****************************"
        puts "                   YOUR BANKING INFORMATION IS"
        puts "                   ****************************"
        puts "              FISRTNAME:         #{@cust_firstname}"
        puts "              LASTNAME:          #{@cust_lastname}"   
        puts "              PHONE  NO:         #{@cust_phno}"
        puts "              ADDRESS:           #{@cust_addr}"
        puts "              DATE OF BIRTH:     #{@cust_dob}"
        puts "              REMAINING BALANCE: #{@@cust_amount}"
      end	

     def history()
        f=File.new("./mydata.txt","a")
      	time2 = Time.now
      
      	f.puts "                   ****************************"
        f.puts "                   YOUR BANKING INFORMATION IS"
        f.puts "                   ****************************"
        f.puts "              information of Date-" + time2.inspect
        f.puts "              FISRTNAME:         #{@cust_firstname}"
        f.puts "              LASTNAME:          #{@cust_lastname}"
        f.puts "              ACCOUNT NO:        #{@cust_accno}"
        f.puts "              PHONE  NO:         #{@cust_phno}"
        f.puts "              ADDRESS:           #{@cust_addr}"
        f.puts "              DATE OF BIRTH:     #{@cust_dob}"
        f.puts "              REMAINING BALANCE: #{@@cust_amount}"
        f.close


     	data=[]
     	f=File.open("./mydata.txt", "r") 
     	while(line=f.gets)
     		data<<line 
        end
        f.close
        data.each{|l| puts l}
    end
end

# USER SIGNUP
def signup()
#enter necessary information
 puts "Please Enter FirstName"
 fname=gets
 puts "Please Enter LastName"
 lname=gets
 puts "Please Enter Address"
 add=gets
 acc=rand(10000000000..100000000000)
 puts "Please Enter Ph no."
 ph=gets.to_i
 puts "Please Enter  Date of Birth"
 dob=gets
 puts "Enter your Password"
 pass=gets
 begin
  puts "Please Again Confirm your Password"
  cpass=gets
 end while pass!=cpass
 if(pass==cpass)
  	puts "          You are Successfully SignUp Now please Login"
  	login(fname,pass,lname,add,acc,ph,dob)
  end
end
 # PERFORM OPERATION USER
def operation(fname,pass,lname,add,acc,ph,dob)
	 #enter your choice to perform operation
	 b1=[]

         b1[0]=Banking.new(fname,lname,add,acc,ph,dob)
        
        begin
          puts "               ***************ENTER YOUR CHOICE**************"

          puts "                            1.ENTER USER DETAIL"
          puts "                            2.DEPOSIT"
          puts "                            3.WITHDRAWAL"
          puts "                            4.PRINT RECEIPT"
          puts "                            5.TO SEE ALL TRANSACTION HISTORY"
          ch=gets.to_i
          case ch
          when 1
            b1[0].users()
          when 2
          	puts "    Hi , #{fname}"
            puts "Please Enter Amount to be Deposited"
            dep=gets.to_f
            b1[0].deposit(dep)
          when 3
          	puts "    Hi , #{fname}"
            puts "Please Enter Amount to be Withdrawal"
            with=gets.to_f
            b1[0].withdraw(with)
          when 4
            puts "                        Hi , #{fname}"
            b1[0].prints()
          when 5
            b1[0].history()
          else
	        puts "             YOU ENTER A WRONG CHOICE"
          end
           puts "            DO YOU WANT TO CONINUE.. PRESS 1 FOR CONTINUE..."
          ch1=gets.to_i
        end while ch1==1
           
  
	
end

#USER LOGIN
def login(uname,pass,lname,add,acc,ph,dob)
	puts "Please Enter Your username(Your FirstName is your Username) "
	nam=gets
	puts "Please Enter Your Password "
	pa=gets
	if ((nam == uname) && (pa == pass))
		puts "                     Credentials Matched"
		 operation(uname,pass,lname,add,acc,ph,dob)
		 
    else
    	puts "                Your Credentials does not Matched"
    	puts "              Press 1 for Login again or 2 for Signup"
    	choice=gets.to_i
    	if choice==1
    		login(uname,pass,lname,add,acc,ph,dob)
    	elsif choice==2
    	    signup()
        else
        	puts "                You Enter a Wrong Choice"
        end	
  	    
    end
end
#USER Entry
def customer
puts "Enter 1 for Login as a User"
puts "Enter 2 for Signup as a User"
ch2=gets.to_i
if ch2==1
	login(uname="amrit",pass="sandhu",lname="sandhu",add="bathinda",acc=123456789,ph=8847699392,dob="7-feb-1994")
else
  signup()
end
 
end
#ADMIN LOGIN
def loginAdmin(uname,pass)
	puts "Please Enter Your username"
	nam=gets
	puts "Please Enter Your Password "
	pa=gets
	if ((nam == uname) && (pa == pass))
		puts "                     Credentials Matched"
		 operationAdmin()
		 
    else
    	puts "                Your Credentials does not Matched"
    	puts "              Press 1 for Login again or 2 for Signup"
    	choice=gets.to_i
    	if choice==1
    		loginAdmin(uname,pass)
    	elsif choice==2
    	    signupAdmin()
        else
        	puts "                You Enter a Wrong Choice"
        end	
  	    
    end
end
#ADMIN OPERATION
def operationAdmin
  cust_amount=1000
      begin
          puts "               ***************ENTER YOUR CHOICE**************"

          puts "                            1.ENTER USER DETAIL"
          puts "                            2.DEPOSIT"
          puts "                            3.WITHDRAWAL"
          puts "                            4.PRINT RECEIPT"
          ch=gets.to_i
          case ch
          when 1
		       customer = []
           add = []
           puts "How many Customers Detail you want to Enter:"
           c=gets.to_i;
           i=0
           while i<c do
              puts "            Enter #{i+1} Customer Detail"
              puts "Please Enter FisrtName"
              fname=gets
              puts "Please Enter LastName"
              lname=gets
              puts "Please Enter Address"
              add=gets
              acc=rand(10000000000..100000000000)
              puts "Please Enter Ph no."
              ph=gets.to_i
              puts "Please Enter  Date of Birth"
              dob=gets
              add=[FisrtName:fname,LastName:lname,Address:add,Account:acc,Phone:ph,Dob:dob,Amount:cust_amount]
              customer.push(add)
              i+=1
          end
            puts "#{customer}"
         when 2
            
            puts "Please Enter Account no in which you want to be Deposited"
            ac=gets.to_i
           
            for customers in customer do
            
             if !(customers.any? {|h| h[:Account] == ac})
              puts "This Account no does not exist"
              break
              
            else
                puts "Please Enter Amount to be Deposited"
               dep=gets.to_f
               puts "Your Previous Balance is : #{cust_amount}"   
               puts "After Deposit Your Account Balance is: #{cust_amount+=dep}"
                customers.each { |h| h[:Amount] = cust_amount if h[:Account] == ac }
            break
             end
            end
          when 3
            puts "Please Enter Account no in which you want to be Withdrwal"
            ac=gets.to_i
            for customers in customer do
             if !(customers.any? {|h| h[:Account] == ac})

              puts "This Account no does not exist"
              break
              
            else
                puts "Please Enter Amount to be withdrawal"
               with=gets.to_f
               if with>cust_amount
                 puts "Your Current Balance is : #{cust_amount}"
                  puts "You Do't Have Sufficient Balance" 
                 
               else
                puts "Your Previous Balance is : #{cust_amount}"
                  puts "After Withdrawal Your Account Balance is: #{cust_amount-=with}"
                   customers.each { |h| h[:Amount] = cust_amount if h[:Account] == ac }
                end
               break
             end
           end
          

          when 4
              puts " All User Detail is"
              puts " #{customer}"
              
          else
              puts "             YOU ENTER A WRONG CHOICE"
          end
              puts "            DO YOU WANT TO CONINUE.. PRESS 1 FOR CONTINUE..."
              ch1=gets.to_i
        end while ch1==1
      
	end

#ADMIN SIGNUP
def signupAdmin
 puts "Please Enter FirstName"
 fname=gets
 puts "Enter your Password"
 pass=gets
 begin
  puts "Please Again Confirm your Password"
  cpass=gets
 end while pass!=cpass
 if(pass==cpass)
  	puts "          You are Successfully SignUp Now please Login"
  	loginAdmin(fname,pass)
  end
end


#ADMIN ENTRY
def admin
puts "Enter 1 for Login as a Admin"
puts "Enter 2 for Signup as a Admin"
ch2=gets.to_i
if ch2==1
	login(uname="amrit",pass="sandhu",lname="sandhu",add="bathinda",acc=123456789,ph=8847699392,dob="7-feb-1994")
else
  signupAdmin()
end
end


 
	#PROGRAM STARTS FROM
puts "Enter 1 for Admin"
puts "Enter 2 for User"
chh=gets.to_i
if chh==1
	admin()
else
	customer()
end

 END{
	puts "                    *********************"
    puts "                     THANKS FOR VISITING"
    puts "                    *********************"
}