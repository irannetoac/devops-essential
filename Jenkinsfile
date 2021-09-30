pipeline {

    agent {
        label 'any' //The id of the slave/agent where the build should be executed, if it doesn't matter use "agent any" instead.
    }

    triggers {
        cron('H */8 * * *') //regular builds
        pollSCM('* * * * *') //polling for changes, here once a minute
    }

    stages {
        stage('Checkout') {
            steps { 
                //Checking out the repo
                checkout changelog: true, poll: true, scm: [$class: 'GitSCM', branches: [[name: '*/master']], browser: [$class: 'GithubWeb', repoUrl: 'https://github.com/irannetoac/devops-essential.git'], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: []]
            }
        }
        stage('Unit & Integration Tests') {
            steps {
                script {
                    try {
                        sh './gradlew clean test --no-daemon' //run a gradle task
                    }
                }
            }
        }

        // stage('Publish Artifact to Nexus') {
        //     steps {
        //         sh './gradlew publish --no-daemon'
        //     }
        // }
    }
}