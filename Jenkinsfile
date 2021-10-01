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
        @gradle clean build
      }
    }

    stage('test') {
      steps {
        @gradle test
      }
    }

    stage('publish') {
      steps {
        @gradle publish
      }
    }
  }
}