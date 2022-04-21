money = 100
name = "" 
helped = false 
a50 = true 
returning = false 
can = false 

function begin() 
  local a = "Hello, welcome to my gambling site! Before we do anything, what's your name?" 
  local b = "Welcome " .. name .. "! Where would you like to go?" 
  local c = {"Snake Eyes", "50/50", "Blackjack"} 
  local d = "Welcome back " .. name .. "! Where would you like to go?" 
  local e = "So, where would you like to go?" 
  if money == 0 then
    can = true
    return mines()
  end
  if name == "" then 
    print(a) 
    name = io.read() 
    return begin() 
  elseif helped == true then 
    print(e) 
    helped = false 
  elseif returning == false then 
    print(b) 
  elseif returning == true then
    print(e)
  else
    print(d) 
    returning = false 
  end 
  local i = io.read() 
  if i == "help" then 
    for k, v in ipairs(c) do 
      if #c - k == 0 then 
        print("and finally, we got " .. v .. ".") 
      elseif #c - k == #c - 1 then 
        print("Well, we've got " .. v .. ",") 
      else 
        print(v .. ",") 
      end 
    end 
    helped = true 
    return begin() 
  elseif i == "50/50" then 
    return a5050() 
  elseif i == "Snake Eyes" or i == "snake eyes" then 
    return snake1()
  elseif i == "Blackjack" or i == "blackjack" then
    print("Sorry, I lost my cards for now! Come back later and I might find more.")
    returning = true
    return begin()
  elseif i == "return" or i == "back" or i == "leave" or i == "stop" then 
    print("Thank you for visiting!") 
    return 
  else 
    print("Sorry, I couldn't understand that.") 
    helped = true
    return begin() 
  end 
end 

function a5050() 
   if money == 0 then 
     print("Sorry, you can't play here if you don't have any money!") 
     return mines() 
   end 
   local a = "Welcome to 50/50! If you need any help playing, just let me know!" 
   local b = "So, how much are you gonna gamble?" 
   if a50 == true then 
    print(a) 
    a50 = false 
    return b5050() 
   else 
    print(b) 
    return b5050() 
   end 
end 

function b5050() 
  local a = "Congrats, you won " 
  local b = "Sorry, you lost " 
  local i = io.read() 
  local f = tonumber(i) 
  if i == "help" then 
      print("You type the amount you would like to gamble, and if you have enough, we will do a coinflip for it! When you want to go back to the main lobby, just type back.") 
      return a5050() 
  elseif i == "back" then 
      returning = true 
      return begin() 
  elseif f == nil or f <= 0 then 
   print("Please use a number, and make sure its above 0!") 
   return a5050() 
  elseif f > money then 
    print("Please dont try to gamble more than you have!") 
    return a5050() 
  end
  if f > 20 and money > f then
    print("Sorry, there is a maximum bet of $20 at this location!") 
    return a5050()
  end 
  local c = math.random(2) 
  local pl = 1 
  if c ~= pl then 
    money = money - f 
    print(b .. "$" .. f .. "! You now have $" .. money .. ".") 
  else 
    money = money + f 
    print(a .. "$" .. f .. "! You now have $" .. money .. ".") 
  end 
  return a5050() 
end 

local returning = false 

function snake1() 
    if money == 0 then 
     print("Sorry, you can't play here if you don't have any money!") 
     return mines() 
    end 
    local win = "Congrats, you won " 
    local lose = "Sorry, you lost " 
    local a = "Welcome to snake eyes! You bet the amount you want, and if both dice land on 1's, then you get 12 times what you put in!" 
    local b = "So, how much would you like to gamble?" 
    if returning == false then 
        print(a .. " " .. b) 
    end 
    local i = io.read() 
    local f = tonumber(i) 
    if i == "help" then 
        print("There ain't much more I can help you with here! If you'd like to go back to the main area, just type back") 
        returning = true 
        return snake1() 
    elseif i == "back" then 
        begin() 
    elseif f == nil or f <= 0 then 
      print("Please use a number, and make sure its above 0!") 
      returning = true 
      return snake1() 
    elseif f > money then 
      print("Please dont try to gamble more than you have!") 
      returning = true 
      return snake1() 
    end 
    local c = math.random(6) 
    local d = math.random(6) 
    if c == 1 and d == 1 then 
        money = money + (f * 12) 
        print(win .. "$" .. f * 12 .. "! You now have $" .. money .. ".") 
        return snake1() 
    else 
        money = money - f
        print(lose .. "$" .. f .. "! You now have $" .. money .. ".")  
        return snake1() 
    end 
end 
firsttime = true 
stillmines = false 
function mines() 
  local a = "Welcome to the mines " .. name .. "! Here, you have to type the character than shows up on the screen, each letter you get correct will give you $1." 
  local b = "Welcome back " .. name .. "!" 
  local c = "Not much more I can help you with here, just type the correct characters to earn some extra cash! Type back when you would like to return" 
  if stillmines == false then
    if firsttime == true then 
      print(a) 
      firsttime = false 
    else 
      print(b) 
    end
  end 
  local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-=+_)(*&^%$#@!/.,<>?';:{}|" 
  local r = math.random(#chars) 
  local c = chars:sub(r,r) 
  print(c)
  local i = io.read() 
  if i == "back" then 
    return begin() 
  elseif i == c then 
    money = money + 1 
    print("Correct! You have earned 1 dollar, and you are now back at $" .. money) 
    stillmines = true 
    return mines() 
  else
    if money == 0 then
      print("Since you still don't have any money, I'll give you a second chance.")
      return mines()
    else
      print("Oops! You got the character wrong, back to the front with you!") 
      return begin()
    end
  end 
end 
begin()
