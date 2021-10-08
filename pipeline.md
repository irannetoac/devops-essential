## CI/CD pipeline

```
Option 1 
Git Provider + Jenkins + Docker + Artifactory + Terraform + AWS / GCP
```

Go to `terraform/` to check out terraform files

See `Jenkinsfile` to see the pipeline configuration 

After install jenkins-lts run this command to start it

``` shell
    brew services start jenkins-lts
```

Config all plugins and paths (image attached)

Config the Artfactory and aws credentials (image attached)

First is needed to config the paths and plugins for Jenkins

Just build the pipeline to execute all steps
