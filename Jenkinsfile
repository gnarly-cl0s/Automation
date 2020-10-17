node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        app = docker.build("carlitos23m/nmap-scanner")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * Just an example */
        app.inside {
            sh 'echo "Tests passed"'
	    sh 'echo whoami'
            sh 'echo id'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', '29f6b757-d712-4201-b0b3-b8681020e53e') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
