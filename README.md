# README

## Start postgres server

```bash
pg_ctl -D /usr/local/var/postgres start
# OR
brew services start postgresql
```

## Token Generation

secret_tokenizer_base:

```ruby
SecureRandom.base64(10)
```

## Reset DB so interval for cook time works properly
```bash
RAILS_ENV=test rails db:drop && RAILS_ENV=test rails db:create && RAILS_ENV=test rails db:migrate;
```

$env:EDITOR='vim'

rails credentials:edit --environment development

% sudo service redis-server start # redis no longer used after switching auth from jwt sessions to rodauth

$env:PGPASSWORD='Il2ep!!!'
$env:PGUSER='postgres'
heroku pg:pull postgresql-polished-21259 heroku1 --app nom-nom-notes-api

###### Development for LAN (mobile access)
$env:RAILS_ENV='development'
rails s -b 0.0.0.0 -e development
npm run dev:host

###### Test
$env:RAILS_ENV = 'test'
rails s -p 3001
npm run test