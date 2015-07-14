[![Build Status](https://travis-ci.org/soosc/arowana.svg?branch=master)](https://travis-ci.org/soosc/arowana)

## Arowana

Pastebin clone using Ruby on Rails

### Deploy

1. Clone the repository

  ```bash
    git clone git@github.com:soosc/arowana.git
  ```

2. Copy the example config files needed for deploy

  ```bash
    cp config/deploy/production.example.rb config/deploy/production.rb
    cp config/deploy.example.rb config/deploy.rb
    cp .env.example .env
    cp config/database.example.yml config/database.yml
    cp config/secrets.example.yml config/secrets.yml
  ```

3. Create the shared directories on the remote server

  ```bash
    cap production deploy:check:make_linked_dirs
  ```

4. Upload your database.yml and secrets.yml to the remote server

5. Deploy the application

  ```bash
    cap production deploy
  ```

### API

Post a file from curl using:

  ```bash
    curl -F "api_key=123" -F "file=@/tmp/test" localhost:3000/api
  ```
