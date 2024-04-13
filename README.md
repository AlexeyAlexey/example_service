

chmod +x bin/bundle
chmod +x bin/console


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
