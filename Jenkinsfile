pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    GITHUB_CREDENTIALS = credentials('GitHub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t drupal .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password'
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
