pipeline {
    agent any

    stages {
        stage('Build Maven') {
            steps {
                echo 'Building..'
                sh 'chmod +x ./mvnw'
                sh './mvnw package'
            }
        }
        stage('Build Image') {
            steps {
                echo 'Deploying....'
                sh 'docker build -t elgarwicaksono/demo-techtest:v1 .'
            }
        }
    }
}