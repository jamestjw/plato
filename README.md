# plato

## Dependencies 
```
Gemfile
-----------------------------
ruby '2.6.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'

# Authentication 
gem 'devise'

# Facebook OAuth2
gem 'omniauth-facebook'


package.json
-----------------------------
"react": "^16.12.0",
"react-dom": "^16.12.0",
```

## Set up the application. 
note: seeding the database is necessary, as subscription plans will be loaded then
```
git clone https://github.com/jamestjw/plato.git
cd plato
bundle install 
yarn install --check-files
rails db:migrate
rails db:seed
rails server
```

## Tests
To run all tests (model, controller and integration tests).
```
rails test
``` 

To run system tests
``` 
rails test:system
```

## Explore deployed application
Visit it [here](https://safe-fjord-82834.herokuapp.com/). Best viewed on Google Chrome.

## More details
Check out the wiki for more in depth explanations and documentation of application behaviour.
