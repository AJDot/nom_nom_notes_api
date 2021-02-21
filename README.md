# README

## Start postgres server

```bash
pg_ctl -D /usr/local/var/postgres start
```

## Token Generation

secret_tokenizer_base:

```ruby
SecureRandom.base64(10)
```
