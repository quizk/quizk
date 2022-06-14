module Ops
  module Operators
    class SessionsController < Devise::SessionsController
      layout 'ops/login'
    end
  end
end
