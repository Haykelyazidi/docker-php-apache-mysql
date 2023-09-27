pipeline {
    
    
    
    agent any
   
    
    environment {
        
       
    }
    stages {
        stage("Clone code from VCS") {
            steps {
                script {
                    git 'https://github.com/ranjit4github/docker-php-apache-mysql.git';
                }
            }
        }
        

        
        
        
             
        stage("Build Docker Image"){
            steps {
                sh "docker-compose -f docker-compose.yml build"
          }
        }
          stage("Docker Push"){
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_hub', variable: 'DOCKER_CREDENTIALS')]) {
                     sh "echo $DOCKER_CREDENTIALS | docker login -u haydevops --password-stdin"
                     sh "docker-compose -f docker-compose.yml push"
        }
          
      
              }
          }
        }
        

      
    }
        
        
        
}
