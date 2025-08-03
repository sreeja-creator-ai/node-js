pipeline {
  agent any

  stages {
    stage('Clone Repository') {
      steps {
        git 'https://github.com/sreeja-creator-ai/node-js.git'
      }
    }

    stage('Build & Deploy Containers') {
      steps {
        sh 'docker-compose down || true'
        sh 'docker-compose build'
        sh 'docker-compose up -d'
      }
    }

    stage('Run Migrations & Collect Static') {
      steps {
        sh 'docker-compose exec web python manage.py migrate'
        sh 'docker-compose exec web python manage.py collectstatic --noinput'
      }
    }
  }

  post {
    always {
      echo 'Pipeline execution completed.'
    }
  }
}
