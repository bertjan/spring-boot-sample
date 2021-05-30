pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'jdk8'
    }
    stages {
        stage('build') {
            steps {
                sh '''
                   mvn clean package
                   '''
            }
        }
        stage('dockerimage') {
            steps {
                sh '''
                   echo "build docker image"
                   '''
            }
        }
        stage('pushdockerimage') {
            steps {
                sh '''
                   echo "push docker image"
                   '''
            }
        }
        stage('pulldockerimage') {
            steps {
                sh '''
                   echo "pull docker image"
                   '''
            }
        }
        stage('deploy') {
            steps {
                sh '''
                   echo "deploy image in swarm"
                   '''
            }
        }
    }
}