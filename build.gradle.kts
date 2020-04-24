plugins {
    java
    kotlin("jvm") version "1.3.72"
}

group = "org.example"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
    jcenter()
}

dependencies {
    implementation(kotlin("stdlib-jdk8"))
    implementation("org.jetbrains.exposed:exposed-core:latest.release")
    implementation("org.jetbrains.exposed:exposed-dao:latest.release")
    implementation("org.jetbrains.exposed:exposed-jdbc:latest.release")

    testImplementation("junit:junit:latest.release")
    testImplementation("io.mockk:mockk:latest.release")
    testImplementation("io.kotest:kotest-runner-junit5-jvm:latest.release") // for kotest framework
    testImplementation("io.kotest:kotest-assertions-core-jvm:latest.release") // for kotest core jvm assertions
    testImplementation("io.kotest:kotest-property-jvm:latest.release") // for kotest property test

    implementation("org.postgresql:postgresql:42.2.12") //Sql Driver

}

configure<JavaPluginConvention> {
    sourceCompatibility = JavaVersion.VERSION_1_8
}
tasks {
    compileKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
    compileTestKotlin {
        kotlinOptions.jvmTarget = "1.8"
    }
}