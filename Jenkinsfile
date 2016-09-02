node {
    env.PATH = "${tool'maven-3.3.9'}/bin:${env.PATH}"
    version = '1.0.' +  env.BUILD_NUMBER
    currentBuild.displayName = version

    git 'https://github.com/bertjan/spring-boot-sample'

    sh "echo \'\ninfo.build.version=\'$version >> src/main/resources/application.properties || true"
    sh "mvn -B versions:set -DnewVersion=$version"

    sh 'mvn clean package'

    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'cloudfoundry',
                      usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        stage concurrency: 1, name: 'DEPLOY'
        sh '''
        curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx

        ./cf api https://api.run.pivotal.io
        ./cf auth $USERNAME $PASSWORD
        ./cf target -o bertjan-demo -s development
        ./cf push
     '''
    }
}