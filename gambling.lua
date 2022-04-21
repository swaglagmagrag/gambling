local money = 10 
local name = "" 
local helped = false 

function begin() 
  local a = "Hello, welcome to my gambling site! Before we do anything, what's your name?" 
  local b = "Welcome " .. name .. "! Where would you like to go?" 
  local c = {"Snake Eyes", "50/50", "Blackjack"} 
  local d = "Welcome back " .. name .. "! Where would you like to go?" 
  local e = "So, where would you like to go?" 
  if name == "" then 
    print(a) 
    name = io.read()
    return begin() 
  elseif helped == true then 
    print(e) 
    helped = false 
  else 
    print(b) 
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
    return 50/50()
  elseif i == "return"
    print("Thank you for visiting!")
    return 
  end 
end

function 50/50() 
   local first = true 
   local a = "Welcome to 50/50! If you need any help playing, just let me know!" 
   local b = "So, how much are you gonna gamble?" 
   if first == true then 
    print(a) 
    first = false 
    return 50/502() 
   else 
    print(b) 
    return 50/502() 
   end 
end 

function 50/502() 
  local a = "Congrats, you won " 
  local b = "Sorry, you lost " 
  local i = tonumber(io.read()) 
  if i == nil or i < 0 then 
   print("Please use a number, and make sure its above 0!") 
  elseif i > money then 
    print("Please dont try to gamble more than you have!") 
    return 50/502() 
  end 
  local c = math.random(2) 
  local pl = 1 
  if c ~= pl then 
    money = money - i 
    print(b .. i .. ".") 
  else 
    money = money + i 
    print(a .. i .. ".") 
  end 
  return 50/50() 
end 
