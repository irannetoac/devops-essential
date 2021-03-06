This is part of a training on AvenueCode projects.

Author: Iran Macedo

This is an application example from AC DevOps training. There are 2 main parts:

* The application is an API to store book information.
* Mongo DB instance (db folder)

## Updated lesson

* Lesson 2 (AWS): [here](https://github.com/irannetoac/devops-essential/blob/master/AWS.md)
* Lesson 3 (IaaC): [here](https://github.com/irannetoac/devops-essential/blob/master/terraform.md)
* Lesson 4 (CI/CD): [here](https://github.com/irannetoac/devops-essential/blob/master/pipeline.md)

## Run with play with docker

1. Create a new instance on `play with docker`
2. `git clone https://gitlab.com/devopsclassroom/docker-lesson.git`
3. `cd docker-lesson`
4. `docker-compose up -d`

### 2 endpoints

1. Register a book

```
curl --request POST \
  --url http://localhost:8080/ \
  --header 'Content-Type: application/json' \
  --cookie JSESSIONID=F4B84791EA97AA5BCA48A7F56EA0D6A1 \
  --data '{}'
```

2. Get all book

```
curl --request GET \
  --url http://localhost:8080/ \
  --cookie JSESSIONID=F4B84791EA97AA5BCA48A7F56EA0D6A1
```

## Docker images

https://hub.docker.com/r/irannetoac/devops-essentials-mongodb

https://hub.docker.com/r/irannetoac/devops-essentials-book


