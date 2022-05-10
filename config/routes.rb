Rails.application.routes.draw do
  devise_for :operators, controllers: { sessions: 'ops/operators/sessions' }

  draw :ops
end
