
```
chmod +x bin/bundle

chmod +x bin/console

chmod +x bin/docker-entrypoint.sh
```

# REST API

[Grape](https://github.com/ruby-grape/grape/tree/v2.0.0?tab=readme-ov-file#versioning)


## Puma

```
bundle exec puma
```

```
curl http://localhost:3000/v1/hello_world/
```

[systemd](https://github.com/puma/puma/blob/master/docs/systemd.md)


## Active Record

```shell
SERVICE_APP_ENV=development rake --tasks
```

```shell
SERVICE_APP_ENV=development rake db:create_migration create_user
```


# Jobs

```shell
SERVICE_APP_ENV=development SIDEKIQ_REDIS_URL='redis://127.0.0.1:6379/0' bundle exec sidekiq -r ./config/environment.rb
```


# Docker

```
docker build -f restapi.Dockerfile . -t restapi-service -t restapi-service:1.0

docker build -f jobs.Dockerfile . -t jobs-service -t jobs-service:1.0

```

If you want to set environment variables when you run a container

```
docker run -e SERVICE_APP_ENV='development' -e SIDEKIQ_REDIS_URL='redis://redis:6379/0' jobs-service

```


```
docker-compose up

docker-compose run --rm -e SERVICE_APP_ENV=test restapi rspec

docker-compose exec -e SERVICE_APP_ENV=test restapi rspec
```

Creating DB

```
docker-compose exec restapi rake db:create
```

```
docker-compose exec restapi rake db:migrate
```

List of tasks

```
docker-compose exec restapi rake -T
```

## Production Environment

```
docker build -f restapi.Dockerfile.prod -t <username>/<image name>:prod .
docker build -f jobs.Dockerfile.prod -t <username>/<image name>:prod .
```