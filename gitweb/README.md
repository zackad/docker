# Docker image to host git repo into web.

## How to run

```shell
docker run -p 1234:1234 -v /path/to/your/repo:/srv/gitweb/repo zackad/gitweb
```

This will start gitweb server on port 1234 and serve git repository stored on `/srv/gitweb/repo` directory.
