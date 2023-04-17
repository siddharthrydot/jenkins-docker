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
  stage('Publish') {
      environment {
          DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
      }
      steps {
          withCredentials([usernamePassword(credentialsId: DOCKER_HUB_CREDENTIALS, usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
              sh "docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}"
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
