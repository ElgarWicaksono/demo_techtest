pipeline {
    agent any

        environment {
            DOCKER_HUB_USERNAME = credentials('docker-hub-username')
            DOCKER_HUB_PASSWORD = credentials('docker-hub-password')
            GITHASH = sh(script: 'git rev-parse HEAD | cut -b 1-8', returnStdout: true)
            DOCKER_IMAGE = 'elgarwicaksono/demo-techtest:version-$GITHASH'
        }

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
                sh '''
                docker build -t $DOCKER_IMAGE .
                '''
            }
        }
        stage('Push Image'){

            steps {
                echo 'Pushing Image....'
                sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                sh 'docker image push $DOCKER_IMAGE'
            }
        }
    }
}