FROM praqma/jenkins4casc:1.0

ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
USER root
RUN mkdir /provision
COPY config/plugins.txt /provision/required-plugins.txt

RUN bash -c 'install-plugins.sh </provision/required-plugins.txt'

USER jenkins
