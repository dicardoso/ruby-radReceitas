Rails.application.routes.draw do
  #resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get "recipes" => "recipes#index"
  root 'recipes#index'
  resources :recipes do 
    resources :comments
  end

end

#commands 

#Migration (atenção, seguir as convenções, nome da migrate singular em ingles)
#rails g migration {Name} field field_text:text number:integer amount:decimal
#rails g migration AddNewFieldsTo{Name} bigtext:text field_two fields:integer

#Migration + Models + Controller + Routes com relacionamento 1xn
#Resource de commendarios para a tabela de Receitas
#rails g resource comment name:string rate:integer comment:text recipe:reference

#Exec migratinos
#rake db:migrate
#rake db:rollback #desfaz a ultima migração
#rake db:seed
#rake db:reset #limpa,cria mas migracoes e roda seed

#Controller
#rails g controller {Name}

#Rodar o server em outra porta
#rails s -p 4000

#Ao mexer no GEMGILE rodar o bundle
#bundle instal --without production

#Ao add novos assets tem q reestartar a aplicação