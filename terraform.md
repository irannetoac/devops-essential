## Terraform Infrastructure as a code

The files are inside terraform folder in root directory. Please take a look there

To perform the resources creation I ran 
``` shell
    terraform init
    terraform apply #type "yes" when necessary
```
I was able to describe the ec2 and rds instance through terraform (main.tf). That's is my main accomplish.

outputs.tf is an attempt of use terraform resource provisioned variables to use into the application itself
setup.sh is an attempt to automate the application running through terraform.
