# simple-java-maven-app

This repository is for the
[Build a Java app with Maven](https://jenkins.io/doc/tutorials/build-a-java-app-with-maven/)
tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

The repository contains a simple Java application which outputs the string
"Hello world!" and is accompanied by a couple of unit tests to check that the
main application works as expected. The results of these tests are saved to a
JUnit XML report.

The `jenkins` directory contains an example of the `Jenkinsfile` (i.e. Pipeline)
you'll be creating yourself during the tutorial and the `jenkins/scripts` subdirectory
contains a shell script with commands that are executed when Jenkins processes
the "Deliver" stage of your Pipeline.

Based on the above information, we were able to create a fully automated CI-CD process
that begins with the test and build process of this simple maven app and reaches the goal
of deploying it at our own Kubernetes cluster.

* Firstly we simply built and tested our app
* Then we created a Dockerfile to docker build our app and integrated it with jenkins
* Both the jar file and the docker image built, were pushed to a custom local repository
we created at Nexus
* Then the docker image was pulled and deployed in a local minikube cluster

