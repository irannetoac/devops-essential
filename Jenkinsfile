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
        gradlew('clean', 'build')
      }
    }

    stage('test') {
      steps {
        gradlew('test')
      }
    }

    stage('publish') {
      steps {
        gradlew('publish')
      }
    }
  }
}