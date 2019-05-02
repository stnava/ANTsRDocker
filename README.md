An attempt at making a portable ANTsR docker app, with some
visualization capabilities via RStudio.

```
docker build --build-arg WHEN=2019-05-01 -t  antsr .
```

to push an update

```
 docker tag antsrnet:latest stnava/antsrnet:latest
 docker push  stnava/antsnet:latest
```


Users should run


```
docker run -p 8888:8888 antsrnet:latest
```

and then open the listed weblink.
