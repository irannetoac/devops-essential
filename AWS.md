# AWS - Cloud Computing

1. Configured aws cli on my machine. Informing the access key Id and other information

``` 
aws configure 
```

2. Create a key pair to have access to an ec2 instance. The key will be called MyKeyPair.pem

```
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem
```

3. Give the right permissions to the key

```
chmod 400 MyKeyPair.pem
```

4. Configure an inbound rule on the default security group to allow connections in port 8080 (application)
and 3306 (mysql)

```
aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 8080 --cidr 0.0.0.0/0

aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 3306 --cidr 0.0.0.0/0
```

5. Create an free tier ec2 instance with ami linux 2

```
aws ec2 run-instances --image-id ami-0443305dabd4be2bc --count 1 --instance-type t2.micro --key-name MyKeyPair --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=default-ec2-machine}]'
```

6. SSH into the ec2 instance. Enter yes if it is the first time doing that.

```
aws ec2 describe-instances --query "Reservations[*].Instances[*].PublicDnsName" --output=text | pbcopy && ssh -i "MyKeyPair.pem" ec2-user@$(pbpaste)
```

7. Prepare the environment to install docker, docker-compose and git.

```
sudo yum -y update
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null 
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

9. Exit the ec2 machine and create a rds mysql instance named docker-lesson with a db named book

```
aws rds create-db-instance --db-instance-identifier devops-lesson --engine mysql --master-username admin --master-user-password adminadmin --db-name book --db-instance-class db.t2.micro --allocated-storage 10
```

10. I couldn't find a way to set up the new rds address in the application without having to change the code.
So this step would be to change src/main/resources/application.properties spring.datasource.url=<rds_instance_address>
    
11. ssh into the ec2 machine again, pull and start the application

```
git clone https://gitlab.com/devopsclassroom/docker-lesson.git &&
cd docker-lesson &&
docker-compose build &&
docker-compose up &&
```

12. Using insomnia to send request is possible to confirm that the responses are ok

```
curl --request POST \
  --url http://ec2-18-117-117-226.us-east-2.compute.amazonaws.com:8080/ \
  --header 'Content-Type: application/json' \
  --data '{}'


Response: Received  
```

```
curl --request GET \
  --url http://ec2-18-117-117-226.us-east-2.compute.amazonaws.com:8080/

Response: 
[
  {
    "id": 1,
    "title": null,
    "author": null,
    "pages": 0
  }
]
```




































