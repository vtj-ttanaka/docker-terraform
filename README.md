# docker-terraform

1. build

```
docker buildx build -t terraform .
```

2. alias

```
alias terraform='docker run --rm -it -u $UID:$GID -w /wd -v $PWD:/wd terraform'
```
