# Build dockker images

## node-base

```sh
docker build -t hungtran/node-base  -f Dockerfile-node-base .
```

### Push image

```sh
docker login
dockers docker push hungtran/node-base
```
