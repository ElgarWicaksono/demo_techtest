#setup
Setup jenkins with docker       https://www.jenkins.io/doc/book/installing/docker/
Create springboot project       https://start.spring.io/
    issue:
        - pom.xml dependancy issue
Create github repo              https://github.com/ElgarWicaksono/demo_techtest
Create Docker Hub repo          https://hub.docker.com/repository/docker/elgarwicaksono/demo-techtest/general

#Jenkins Pipeline
Create Jenkins Pipeline         docker pull elgarwicaksono/demo-techtest:version-12417f8e

#minikube
minikube service techtest-demo --url

#improvements
fix minikube integration
Run pipeline when commited to master      https://plugins.jenkins.io/basic-branch-build-strategies/