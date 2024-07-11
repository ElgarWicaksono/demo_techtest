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
                sh 'export GITBRANCH=$(git rev-parse --abbrev-ref HEAD); 
                export GITHASH=$(git rev-parse HEAD | cut -b 1-8); 
                docker build -t elgarwicaksono/demo-techtest:$GITBRANCH-$GITHASH .
                '
            }
        }
    }
}