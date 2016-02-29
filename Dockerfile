FROM fedora:23

EXPOSE 8080:8080
EXPOSE 8787:8787

USER root

RUN useradd ovirt
RUN touch /var/lib/rpm/* \
    && dnf install -y \
    git \
    java-1.8.0-openjdk-devel \
    maven \
    postgresql \
    http://resources.ovirt.org/pub/yum-repo/ovirt-release-master.rpm \
    && dnf install -y \
    ovirt-engine-wildfly \
    m2crypto \
    python-psycopg2 \
    python-cheetah \
    libxml2-python \
    python-daemon \
    otopi \
    ovirt-host-deploy \
    ovirt-setup-lib \
    pyflakes \
    python-pep8 \
    patternfly1 \
    make \
    which \
    zenity \
    unzip \
    bind-utils \
    && dnf groupinstall -y \
    base-x \
    && dnf clean all

USER ovirt
WORKDIR /home/ovirt

RUN curl -o idea15.tar.gz https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-15.0.3.tar.gz \
    && tar -zxvf idea15.tar.gz \
    && mkdir -p bin src src/ovirt-engine deploy

ADD ovirt.bashrc .bashrc

CMD bash
