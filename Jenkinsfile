pipeline {
    
    
    
    agent any
   
    
    
    stages {
        stage("Clone code from VCS") {
            steps {
                script {
                    git 'https://github.com/Haykelyazidi/docker-php-apache-mysql.git';
                }
            }
        }
        

        
        
        
             
        stage("Build Docker Image"){
            steps {
                script {
            def customTag = "haydevops/php-sql-dockercompose:${BUILD_NUMBER}"
            docker-compose(
                buildArguments: "-t ${customTag}",
                dockerComposeFile: 'docker-compose.yml'
            )
                }
          }
        }
          stage("Docker Push"){
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_hub', variable: 'DOCKER_CREDENTIALS')]) {
                     sh "echo $DOCKER_CREDENTIALS | docker login -u haydevops --password-stdin"
                     sh "docker push ${customTag}"
        }
          
      
              }
          }
        }
        

      
    }
        
        
        
}
