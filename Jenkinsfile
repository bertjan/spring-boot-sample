pipeline {
    agent any
    tools {
        maven 'maven3'
        jdk 'jdk8'
        ansible 'ansible'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}