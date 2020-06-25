

String credentialsId = 'awsCredentials'
pipeline {
	agent any
	environment {
		port = 22			
	}
	stages {
//		stage('Create Environment') {
//			steps {
//				withCredentials([[
//						$class: 'AmazonWebServicesCredentialsBinding',
//						credentialsId: credentialsId,
//						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//				]]) {
//					ansiColor('xterm') {
//						sh 'terraform init'
//					}
//				}
//			}
//		}
//		stage('Plan Resources') {
//			steps {
//				withCredentials([[
//						$class: 'AmazonWebServicesCredentialsBinding',
//						credentialsId: credentialsId,
//						accessKeyVariable: 'AWS_ACCESS_KEY_ID',
//						secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
//				]]) {
//					ansiColor('xterm') {
//						sh 'terraform plan'
//					}
//				}
//			}
//		}
		// Run Ansible teste
		stage('Run Ansible') {
			
			steps {
				script {
					def remote = [:]
			              	remote.name = "jenkins"
					remote.host = params.AnsibleServer
              				remote.port = env.port.toInteger()
	              			remote.allowAnyHosts = true
					//Create the credential with ssh-keygen -m PEM
					//The new openssh format isn't supported yet
         				withCredentials([sshUserPrivateKey(credentialsId: params.AnsibleKeyId, 
										keyFileVariable: 'keyFile', 
										passphraseVariable: '', 
										usernameVariable: 'userName')]) {
						remote.user = userName
	              				remote.identityFile = keyFile
						sshCommand remote: remote, command: "echo 'oi' >> /tmp/oi.txt"
  					}
				}	
			}
		}
	}
}
