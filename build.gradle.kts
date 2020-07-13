plugins {
  id("org.hypertrace.docker-plugin") version "0.2.3"
  id("org.hypertrace.docker-publish-plugin") version "0.2.3"
}

hypertraceDocker {
  defaultImage {
    imageName.set("helm-gcs-packager")
  }
}