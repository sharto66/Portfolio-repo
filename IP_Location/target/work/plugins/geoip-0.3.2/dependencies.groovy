grails.project.class.dir = 'target/classes'
grails.project.test.class.dir = 'target/test-classes'
grails.project.test.reports.dir = 'target/test-reports'

//grails.project.dependency.resolver = "maven"
grails.project.dependency.resolution = {
    inherits('global') {

    }
    log 'warn'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()
    }
    dependencies {
        runtime 'com.maxmind.geoip:geoip-api:1.2.12', {
            excludes 'junit', 'mockito-core'
        }
    }

    plugins {
        build(':release:3.0.1', ':rest-client-builder:1.0.3') {
            export = false
        }
    }
}
