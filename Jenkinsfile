pilpeline {
	agent nay
	stages {
		stage('Preparing Environment') {
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
		stage('Planning Resources') {
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
	}
}
