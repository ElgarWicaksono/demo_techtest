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
                kubeconfig(caCertificate: '''LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCakNDQWU2Z0F3SUJBZ0lCQVRBTkJna3Fo
a2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwdGFXNXAKYTNWaVpVTkJNQjRYRFRJME1EUXlN
akE0TURjek9Wb1hEVE0wTURReU1UQTRNRGN6T1Zvd0ZURVRNQkVHQTFVRQpBeE1LYldsdWFXdDFZ
bVZEUVRDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBT1ZtCnRnb3Iz
NC9mRjZiZnV5TG9HVWtlQ3kveWsvNkVwbmNuS1RSNW9DYVJlN2s4Y0ZFRDdpbENTcHpUSlZnbmFK
Q2gKMzlWckhGSWFwa0JvMm5YZ0NZTG9WZlJkRWJPdUkxeFg5dXlpYzVYdkEraXdSVzM0VUZRNGhB
K04rR3NxMHVQdApyN3Z4NldvVytwdUJQTG5WTTdjSTZCanp3dWt6MWRaYlJEcW5YODE5VXk4MU40
TFVrUUVHWm1jd2s1M2NoRlBwClFtS20zWmtuVVNpbVZRQVhRRGVYSVllaHp2dDJJR3RQM1A4U3di
Y0pUS3oyaTZjeTFlSWc4dnF5TWxHc2ZHbUYKYS9VSHZTS1RxVGpXZng1VGttSkV1bzRDRXpvNTFp
TDJkdndnZkVlN3gycFROSVBQdms3NHdSeHRNMm5wcFdwSAp0ZURGV2s3OUwza3JKWnIxWGIwQ0F3
RUFBYU5oTUY4d0RnWURWUjBQQVFIL0JBUURBZ0trTUIwR0ExVWRKUVFXCk1CUUdDQ3NHQVFVRkJ3
TUNCZ2dyQmdFRkJRY0RBVEFQQmdOVkhSTUJBZjhFQlRBREFRSC9NQjBHQTFVZERnUVcKQkJTWitW
elB4VFhHNEF3RUpkdHU5dVpDUytTcUhqQU5CZ2txaGtpRzl3MEJBUXNGQUFPQ0FRRUFDM3F5MEN4
cQoxYlkrZGlGcnBxMU40aWtaVGdlN3BqTklxWFdqYjVHZ2NTNkZxbjUzdGFhWXcwZk9taDhlUUFj
dnZCdUp2VDRnCjIwUWxEU0tjaFR0QXdhbDA0QzJjUmtxY2JDV2JVNnhmNXN6ekxjbHRXb3lybjl5
YVMxbkduN2JvRHd0amh5dE4KejBZdzBLWjlvTkdjZWtLdzc0SjJNUmRwZWFXazgrTjNwZjRUT3pY
WEo4clpxR0tpanB6SGxEQXlCOUIwL3pZOQpNeFRRZTJjNE5ML3QyUHBMcG1DRk9kN1dpblU0Um1q
bHRxdjVBcHBoMTJUaWwwR1Y5MDhZV2JhZEd0Y0VYaU96CmNGR3JxbVhCT2FXeGg5L0hzdmJwWWk0
dThLOW5lQTd5aVJ5S3E3M3RGSmk4VVBKOTV6TUFUeGNCdmJlVnJJZEoKMHZXNXRWMHJ6dlVFSVE9
PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==''',credentialsId: 'kubeconfig-minikube', serverUrl: 'https://127.0.0.1:32769') {
                    echo 'Deploying on k8s cluster.....'
                    sh 'kubectl get pods -A'
                }
            }
        }
    }
}