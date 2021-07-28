FROM jenkins/jenkins:lts
ENV JAVA_OPTIONS=-Djenkins.install.runSetupWizard=false

USER root
RUN mkdir /provision
COPY build/required-plugins.txt /provision/required-plugins.txt
RUN bash -c 'install-plugins.sh </provision/required-plugins.txt'

USER jenkins
