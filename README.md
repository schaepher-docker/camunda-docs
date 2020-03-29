# camunda-docs

Source from: https://github.com/camunda/camunda-docs-manual

Dockerfile: https://github.com/schaepher-docker/camunda-docs

# usage

`docker run -d -p "8080:80" schaepher/camunda-docs:latest`

http://localhost:8080

# docker-compose

```yml
version: "3"

services:
  camunda-docs:
    image: schaepher/camunda-docs:latest
    ports:
      - "8080:80"
```

`docker-compose up -d`

http://localhost:8080
