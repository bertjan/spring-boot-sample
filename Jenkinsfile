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
                   docker login --username=erarunkumar --password=Oracle9i
                   docker tag acquiredemo:v0.2 erarunkumar/springbootsample:v0.2
                   docker images
                   docker push erarunkumar/springbootsample:v0.2                   
                   '''
            }
        }
        stage('pulldockerimage') {
            agent { label 'ldap' } 
            steps {
                sh '''
                   echo "pull docker image"
                   docker login --username=erarunkumar --password=Oracle9i
                   docker pull erarunkumar/springbootsample:v0.2
                   '''
            }
        }
        stage('deploy') {
            steps {
                sh '''
                   echo "deploy image in swarm"
                   ansible-playbook playbook.yml
                   '''
            }
        }
    }
}