require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Facebook", "Zuckerberg", "facebook.com")
s2 = Startup.new("Amazon", "Bezo", "amazon.com")
s3 = Startup.new("Google", "Page", "google.com")

v1 = VentureCapitalist.new("Anna", 100000000)
v2 = VentureCapitalist.new("Barry", 200000) 
v3 = VentureCapitalist.new("Calvin", 2000000000) 

s1.sign_contract(v1, "type1", 50000)
s1.sign_contract(v3, "type1", 50000)
s1.sign_contract(v2, "type1", 50000)
s1.sign_contract(v1, "type1", 70000)

v2.offer_contract(s2, "type1", 400000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line