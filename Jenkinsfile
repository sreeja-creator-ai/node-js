
pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/sreeja-creator-ai/node-js.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('node-app')
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('node-app').run('-p 3000:3000')
                }
            }
        }
    }
}
