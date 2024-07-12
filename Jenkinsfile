pipeline {
    agent any

        environment {
            DOCKER_HUB_USR = credentials('docker-hub-username')
            DOCKER_HUB_PWD = credentials('docker-hub-password')
            GITHASH = sh(script: 'git rev-parse HEAD | cut -b 1-8', returnStdout: true)
            DOCKER_IMAGE = 'elgarwicaksono/demo-techtest:version-'
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
                sh 'docker build -t $DOCKER_IMAGE$GITHASH .'
            }
        }
        stage('Push Image') {
            steps {
                echo 'Pushing Image....'
                sh 'docker login -u $DOCKER_HUB_USR -p $DOCKER_HUB_PWD'
                sh 'docker image push $DOCKER_IMAGE$GITHASH'
            }
        }
        stage('Deploy') {
            steps {
                withKubeConfig(credentialsId: 'kubeconfig-minikube') {
                    echo 'Deploying on k8s cluster.....'
                    sh 'kubectl get pods -A'
                }
            }
        }
    }
}