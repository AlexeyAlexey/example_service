

chmod +x bin/bundle
chmod +x bin/console


# REST API

[Grape](https://github.com/ruby-grape/grape/tree/v2.0.0?tab=readme-ov-file#versioning)


## Puma

```
bundle exec puma
```

```
curl http://localhost:3000/api/v1/hello_world/
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
SERVICE_APP_ENV=development bundle exec sidekiq -r ./config/environment.rb
```
