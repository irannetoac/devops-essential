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

    stage('build') {
      steps {
        sh './gradlew clean build --info'
      }
    }

    stage('test') {
      steps {
        sh './gradlew test'
      }
    }

    stage('publish') {
      steps {
        sh './gradlew artifactoryPublish'
      }
    }

    stage('build docker image') {
      steps {
        sh '${DOCKER} build . -t irannetoac.jfrog.io/default-docker-local/demo-application:latest'
      }
    }

    stage('artifactory login') {
      steps {
        sh 'echo $ARTIFACTORY_CREDENTIALS_PSW | ${DOCKER} login irannetoac.jfrog.io -u $ARTIFACTORY_CREDENTIALS_USR --password-stdin'
      }
    }

    stage('push docker image') {
      steps {
        sh '${DOCKER} push irannetoac.jfrog.io/default-docker-local/demo-application:latest'
      }
    }

    stage('provisioning the infrastructure'){
      steps {
          withCredentials([sshUserPrivateKey(
              credentialsId: 'MY_KEY_PAIR',
              keyFileVariable: 'MY_KEY_PAIR')])
          {
              sh 'rm terraform/jenkins-aws.pem && touch terraform/jenkins-aws.pem && cat "$MY_KEY_PAIR" >> terraform/jenkins-aws.pem && chmod +x terraform/jenkins-aws.pem'
              sh 'cd terraform && ${TERRAFORM} init && ${TERRAFORM} plan && ${TERRAFORM} apply -auto-approve && cat tf_output.yml'
          }
      }
    }
  }
//     post {
//       always {
//           sh 'cd terraform && ${TERRAFORM} destroy -auto-approve'
//       }
//     }
}
