pipeline {
  agent any
  environment {
    ARTIFACTORY_CREDENTIALS = credentials('irannetoac-jfrog')
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/irannetoac/devops-essential.git'
      }
    }

//     stage('build') {
//       steps {
//         sh './gradlew clean build --info'
//       }
//     }
//
//     stage('test') {
//       steps {
//         sh './gradlew test'
//       }
//     }
//
//     stage('publish') {
//       steps {
//         sh './gradlew artifactoryPublish'
//       }
//     }
//
//     stage('build docker image') {
//       steps {
//         sh 'docker build . -t irannetoac.jfrog.io/default-docker-local/demo-application:latest'
//       }
//     }
//
//     stage('artifactory login') {
//       steps {
//         sh 'echo $ARTIFACTORY_CREDENTIALS_PSW | docker login irannetoac.jfrog.io -u $ARTIFACTORY_CREDENTIALS_USR --password-stdin'
//       }
//     }
//
//     stage('push docker image') {
//       steps {
//         sh 'docker push irannetoac.jfrog.io/default-docker-local/demo-application:latest'
//       }
//     }

    stage('provisioning the infrastructure'){
      steps {
          withCredentials([sshUserPrivateKey(
              credentialsId: 'MyKeyPair',
              keyFileVariable: 'AWS_KEY')])
          {
              sh 'cp "AWS_KEY" files/jenkins-aws.pem'
              sh 'cd terraform && ${TERRAFORM} init && ${TERRAFORM} plan -out && ${TERRAFORM} apply -auto-approve && cat tf_output.yml && ${TERRAFORM} destroy'
          }
      }
    }

//     stage('deploying application') {
//       steps {
//         sh 'ansible-galaxy collection install community.docker'
//       }
//     }

  }
}
