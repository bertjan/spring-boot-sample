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
                   docker build -t acquiredemo:v0.2 .
                   '''
            }
        }
        stage('pushdockerimage') {
            steps {
                sh '''
                   echo "push docker image"
                   docker login --username=erarunkumar --password=Oracle9i https://index.docker.io
                   docker tag acquiredemo:v0.2 docker.io/acquiredemo/springbootsample:v0.2
                   docker images
                   docker push docker.io/acquiredemo/springbootsample:v0.2                    
                   '''
            }
        }
        stage('pulldockerimage') {
            steps {
                sh '''
                   echo "pull docker image"
                   docker login --username=erarunkumar --password=Oracle9i https://index.docker.io
                   docker pull acquiredemo/springbootsample:v0.2
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