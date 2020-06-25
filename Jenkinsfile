

String credentialsId = 'awsCredentials'
pipeline {
	agent any
	environment {
		LOG_SERVER='http://192.168.0.56:10000'
		PLAYBOOK='minimal_http.yml'
		SECRETFILE="/opt/secrets/secret.pem"
			
	}
	stages {
		stage('Create Environment') {
			steps {
				withCredentials([[
						$class: 'AmazonWebServicesCredentialsBinding',
						credentialsId: credentialsId,
						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
				]]) {
					ansiColor('xterm') {
						sh 'terraform init'
					}
				}
			}
		}
		stage('Plan Resources') {
			steps {
				withCredentials([[
						$class: 'AmazonWebServicesCredentialsBinding',
						credentialsId: credentialsId,
						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
				]]) {
					ansiColor('xterm') {
						sh 'terraform plan'
					}
				}
			}
		}
		// Run Ansible teste
		stage('Run Ansible') {
			
			steps {
				script {
					def remote = [:]
			              	remote.name = "jenkins"
					remote.host = "192.168.0.59"
              				remote.port = 22
	              			remote.allowAnyHosts = true

         				withCredentials([sshUserPrivateKey(credentialsId: 'jenkins-ansible-id', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'jenkins')]) {
						remote.user = "jenkins"
	              				remote.identifyFile = ${identity}
						sshCommand remote: remote, command: "echo 'oi' > /tmp/oi.txt"
  					}
				}	
			}
		}
	}
}
