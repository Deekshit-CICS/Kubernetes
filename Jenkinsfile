pipeline {
    agent any
    environment {     
//     DOCKERHUB_CREDENTIALS= credentials('DockerHub')     
    PROJECT_ID = 'utility-vista-372807'
    CLUSTER_NAME = 'deploydk'
    LOCATION = 'us-central1-c'
    CREDENTIALS_ID = 'My First Project'
    }
    stages {   
        stage ('Checkout Repository'){
            steps{
                git branch: 'main', changelog: false, credentialsId: 'GitHub', poll: false, url: 'https://github.com/Deekshit-CICS/Kubernetes.git'
            }
        }
        stage('Build') {
            steps {
                sh 'cd MyWebApp1; pwd; /opt/apache-maven-3.8.7/bin/mvn -X compile'                 
                echo 'Maven Build has Completed Successfully'   
            }
        }
        stage('Deploy to Artifactory') {
            steps {
                sh 'cd MyWebApp1; pwd; /opt/apache-maven-3.8.7/bin/mvn -X deploy'                 
                echo 'Maven Build has Completed Successfully'   
            }
        }
        /* stage('Build Docker Image') {
            steps {
                echo "Print Existing Images"
                sh 'docker images'
                sh 'pwd'
                echo "Building docker Image"
                sh 'docker build -t dockerdk194/mytomcat /var/lib/jenkins/workspace/JavaSpringBoot-Kubernetes-Deployment'
            }
        }
        stage('Login to Docker HUB') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'               
            	echo 'Login Completed'    
            }
        }
        stage('Push Image to Docker Registry') {
            steps {
                sh 'docker push dockerdk194/mytomcat'                 
                echo 'Push Image Completed'   
            }
        }

        stage('Deploy to GKE') {
            steps{
                step([
                $class: 'KubernetesEngineBuilder',
                projectId: env.PROJECT_ID,
                clusterName: env.CLUSTER_NAME,
                location: env.LOCATION,
                manifestPattern: '/var/lib/jenkins/workspace/JavaSpringBoot-Kubernetes-Deployment/mytomcat.yaml',
                credentialsId: env.CREDENTIALS_ID,
                verifyDeployments: true])
            }
        }*/
    }
    /*post{
    always {  
      sh 'docker logout'           
    }      
  } */
}

