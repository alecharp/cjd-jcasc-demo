FROM cloudbees/cloudbees-jenkins-distribution:2.176.2.3

ENV JENKINS_INCREMENTALS_REPO_MIRROR https://repo.jenkins-ci.org/incrementals

# Startup all plugins included into the CloudBees Jenkins Distribution bundle
ENV JAVA_OPTS "-Dcom.cloudbees.jenkins.cjp.installmanager.CJPPluginManager.allRequired=true"

COPY plugins.txt $REF/plugins.txt
RUN bash /usr/local/bin/install-plugins.sh < $REF/plugins.txt

# Apply JCasC
COPY jenkins.yaml /cfg/jenkins.yaml
ENV CASC_JENKINS_CONFIG /cfg/jenkins.yaml
