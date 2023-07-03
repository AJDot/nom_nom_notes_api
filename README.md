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

sudo service redis-server start

$env:PGPASSWORD='Il2ep!!!'
$env:PGUSER='postgres'
heroku pg:pull postgresql-polished-21259 heroku1 --app nom-nom-notes-api