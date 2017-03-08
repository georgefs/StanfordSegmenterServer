node("small"){
    stage('prepare'){
        checkout scm
    }
    stage('build'){
        sh 'docker build . -t ${ECR_DOMAIN}/stanford:ner'

		docker.withRegistry("https://${ECR_DOMAIN}", "${ECR_KEY}") {
            sh 'docker push ${ECR_DOMAIN}/stanford:ner'
		}
    }
}