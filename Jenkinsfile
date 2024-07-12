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
                echo 'Deploying on k8s cluster.....'
                kubeconfig(caCertificate: '''-----BEGIN CERTIFICATE-----
                MIIDBjCCAe6gAwIBAgIBATANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwptaW5p
                a3ViZUNBMB4XDTI0MDQyMjA4MDczOVoXDTM0MDQyMTA4MDczOVowFTETMBEGA1UE
                AxMKbWluaWt1YmVDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOVm
                tgor34/fF6bfuyLoGUkeCy/yk/6EpncnKTR5oCaRe7k8cFED7ilCSpzTJVgnaJCh
                39VrHFIapkBo2nXgCYLoVfRdEbOuI1xX9uyic5XvA+iwRW34UFQ4hA+N+Gsq0uPt
                r7vx6WoW+puBPLnVM7cI6Bjzwukz1dZbRDqnX819Uy81N4LUkQEGZmcwk53chFPp
                QmKm3ZknUSimVQAXQDeXIYehzvt2IGtP3P8SwbcJTKz2i6cy1eIg8vqyMlGsfGmF
                a/UHvSKTqTjWfx5TkmJEuo4CEzo51iL2dvwgfEe7x2pTNIPPvk74wRxtM2nppWpH
                teDFWk79L3krJZr1Xb0CAwEAAaNhMF8wDgYDVR0PAQH/BAQDAgKkMB0GA1UdJQQW
                MBQGCCsGAQUFBwMCBggrBgEFBQcDATAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQW
                BBSZ+VzPxTXG4AwEJdtu9uZCS+SqHjANBgkqhkiG9w0BAQsFAAOCAQEAC3qy0Cxq
                1bY+diFrpq1N4ikZTge7pjNIqXWjb5GgcS6Fqn53taaYw0fOmh8eQAcvvBuJvT4g
                20QlDSKchTtAwal04C2cRkqcbCWbU6xf5szzLcltWoyrn9yaS1nGn7boDwtjhytN
                z0Yw0KZ9oNGcekKw74J2MRdpeaWk8+N3pf4TOzXXJ8rZqGKijpzHlDAyB9B0/zY9
                MxTQe2c4NL/t2PpLpmCFOd7WinU4Rmjltqv5Apph12Til0GV908YWbadGtcEXiOz
                cFGrqmXBOaWxh9/HsvbpYi4u8K9neA7yiRyKq73tFJi8UPJ95zMATxcBvbeVrIdJ
                0vW5tV0rzvUEIQ==
                -----END CERTIFICATE-----''', serverUrl: 'https://127.0.0.1:32769') {
                    sh 'kubectl get pod'
                }
            }
        }
    }
}