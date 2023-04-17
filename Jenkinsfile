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
        sh 'echo "DOCKER_HUB" | docker login --username "siddharth5497" --password-stdin'

      }
    }
    stage('Push') {
      steps {
        sh 'docker push drupal'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
