node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        dir('dockers/node-base') {
          app = docker.build("hungtran/node-base","--build-arg CI=${env.CI} --build-arg BUILD_NUMBER=${env.BUILD_NUMBER} .")
        }
    }

    stage('Push image') {
        getVersion()

        /* Finally, we'll push the image with two tags:
        * First, the incremental build number from Jenkins
        * Second, the 'latest' tag.
        * Pushing multiple tags is cheap, as all the layers are reused. */

        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("${env.VERSION}")
            app.push("latest")
        }
    }
}

def getVersion() {
    script {
        dir('dockers/node-base') {
          env.VERSION = readFile 'version.txt'
        }
    }
}
