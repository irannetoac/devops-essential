pipeline {
  agent any
  environments {
    ARTIFACTORY_CREDENTIALS = credentials('irannetac-jfrog')
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
        sh 'docker build . -t demo-application:latest'
      }
    }

    stage('artifactory login') {
      steps {
        sh 'echo $ARTIFACTORY_CREDENTIALS_PSW | docker login irannetoac.jfrog.io -u $ARTIFACTORY_CREDENTIALS_USR --password-stdin'
      }
    }

    stage('push docker image') {
      steps {
        sh 'docker push demo-application:latest'
      }
    }
  }
  post {
    always {
        sh 'docker logout'
    }
  }
}
