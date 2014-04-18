local COLua = require "COLua"
local String = require "COLua.String"
local type = COLua.type

COLua.Number = COLua{ "Number";
  init = function(self, number)
    assert(type(number) == "number", "Can't store a "..type(number).." in an object of class Number")
    self.num = number
    return self
  end,
  -- Metamethods
  __tostring = function(self)
    return tostring(self.num)
  end,
  __add = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num + obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1+obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __sub = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num - obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1 - obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __mul = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num * obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1 * obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __div = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num / obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1 / obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __mod = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num % obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1 % obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __pow = function(obj1, obj2)
    local ret
    if type(obj1) == "Number" then
      ret = obj1.num ^ obj2
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    else
      ret = obj1 ^ obj2.num
      if type(ret) == "number" then
        ret = COLua.Number(ret)
      end
    end
    return ret
  end,
  __unm = function(self)
    return COLua.Number(-self.num)
  end,
  __eq = function(obj1, obj2)
    return (obj1.num == obj2.num)
  end,
  __lt = function(obj1, obj2)
    if type(obj1) == "Number" and type(obj2) ~= "Number" then
      return obj1.num < obj2
    elseif type(obj1) == "Number" and type(obj2) == "Number" then
      return obj1.num < obj2.num
    elseif type(obj1) ~= "Number" and type(obj2) == "Number" then
      return obj1 < obj2.num
    end
  end,
  __le = function(obj1, obj2)
    if type(obj1) == "Number" and type(obj2) ~= "Number" then
      return obj1.num <= obj2
    elseif type(obj1) == "Number" and type(obj2) == "Number" then
      return obj1.num <= obj2.num
    elseif type(obj1) ~= "Number" and type(obj2) == "Number" then
      return obj1 <= obj2.num
    end
  end}

return COLua.Number
