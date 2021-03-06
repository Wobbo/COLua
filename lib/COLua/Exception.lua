--[[The basic Exception.
  Author: Vexatos]]
local COLua = require "COLua"

COLua.Exception = COLua.Class{"Exception";
  init = function(self, msg)
    self.msg = msg
    return self
  end,

  __tostring = function(self)
    return self:type()..": "..self.msg
  end,

  getMessage = function(self)
    return self.msg
  end,

  throw = function(self, level, traceback)
    if type(self.msg) == "string" and traceback == nil then 
      traceback = true 
    end
    if traceback then
      error(tostring(self),level or 2)
    else
      error(self, level or 2)
    end
  end
}

return COLua.Exception
