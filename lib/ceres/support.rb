unless Object.name == "NSObject"
  raise Exception, "Can only run Ceres under MacRuby."
end

require 'ceres/support/core'