pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'chmod +x '
                sh './mvnw install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh './mvnw test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}