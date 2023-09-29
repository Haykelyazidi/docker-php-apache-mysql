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
        
    stage('Update docker compose File') {
        environment {
            GIT_REPO_NAME = "docker-php-apache-mysql"
            GIT_USER_NAME = "Haykelyazidi"
        }
        steps {
           
                sh '''            
                    git config --global user.email "haykel.yazidi@gmail.com"
                    git config --global user.name "Haykelyazidi"
                   
                    sed -i "s/phpcompose.*/phpcompose:\${BUILD_NUMBER}/" docker-compose.yml
                    mkdir manifestes
                    cd manifestes
                    kompose --file ../docker-compose.yml convert
                    git add .
                    git commit -m "Update docker compose image to version ${imageTag}"
                    '''
                    withCredentials([string(credentialsId: 'github_credentials', variable: 'token_hub')]) {                                   
                     sh 'git push https://${token_hub}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master'                   
                   
                   }

          
        }
    }
        
        
        
             
        stage("Build Docker Image"){
            steps {
                script {
            
            sh "docker-compose up -d"
                
            
                }
          }
        }
          stage("Docker Push"){
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker_hub', variable: 'DOCKER_CREDENTIALS')]) {
                     sh "echo $DOCKER_CREDENTIALS | docker login -u haydevops --password-stdin"
                     sh "docker-compose push"
        }
          
      
              }
          }
        }
        

      
    }
        
        
        
}
