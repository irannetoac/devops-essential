pipeline {
  agent any
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
        sh 'docker --version'
      }
    }
  }
}
