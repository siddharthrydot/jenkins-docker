pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('GitHub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t drupal .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo "DOCKER_HUB" | docker login --username "siddharth5497" --password "8758932135"'
        sh 'docker tag drupal:latest siddharth5497/drupal:1.0'

      }
    }
    stage('Push') {
      steps {
        sh 'docker push siddharth5497/drupal:1.0'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
