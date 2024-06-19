Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/inventory", to: "inventory#index"
  post "/inventory/login", to: "inventory#login"
  get "/inventory/home", to: "inventory#home"

  get "/inventory/register", to: "inventory#register"
  post "/inventory/registered", to: "inventory#registered"

  get "/inventory/editImp/:id", to: "inventory#editImp"
  post "/inventory/updateImp", to: "inventory#updateImp"

  post "/inventory/import", to: "inventory#import"
  get "/inventory/deleteImp/:id", to: "inventory#deleteImp"

  get "/inventory/editEmp/:id", to: "inventory#editEmp"
  post "/inventory/updateEmp", to: "inventory#updateEmp"
  get "/inventory/deleteEmp/:id", to: "inventory#deleteEmp"
  get "/inventory/addEmp", to: "inventory#addEmp"
  post "/inventory/addEmpCommit", to: "inventory#addEmpCommit"

  get "/inventory/editSup/:id", to: "inventory#editSup"
  post "/inventory/updateSup", to: "inventory#updateSup"
  get "/inventory/deleteSup/:id", to: "inventory#deleteSup"
  get "/inventory/addSup", to: "inventory#addSup"
  post "/inventory/addSupCommit", to: "inventory#addSupCommit"
  
  get "/inventory/editMed/:id", to: "inventory#editMed"
  post "/inventory/updateMed", to: "inventory#updateMed"
  get "/inventory/deleteMed/:id", to: "inventory#deleteMed"
  get "/inventory/addMed", to: "inventory#addMed"
  post "/inventory/addMedCommit", to: "inventory#addMedCommit"

  post "/inventory/searchMed", to: "inventory#searchMed"
  get "/inventory/showSearchMed", to: "inventory#showSearchMed"

  get "/inventory/history", to: "inventory#history"

  get "/inventory/takeMed/:id", to: "inventory#takeMed"
  post "/inventory/takeMedCommit", to: "inventory#takeMedCommit"  




  
  
end
