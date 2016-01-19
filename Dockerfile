FROM fedora:23

EXPOSE 8080:8080
EXPOSE 8787:8787

USER root
RUN useradd ovirt \
    && touch /var/lib/rpm/* \
    && dnf install -y \
    firefox \
    git \
    java-1.8.0-openjdk-devel \
    maven \
    postgresql \
    http://resources.ovirt.org/pub/yum-repo/ovirt-release-master.rpm
RUN dnf install -y \
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
    base-x


USER ovirt
WORKDIR /home/ovirt

ADD ovirt.bashrc .bashrc
RUN curl -o idea15.tar.gz https://d1opms6zj7jotq.cloudfront.net/idea/ideaIC-15.0.3.tar.gz \
    && tar -zxvf idea15.tar.gz \
    && ln -s $(dirname $(tar -tvf  idea15.tar.gz | head a   -1 |tr -s ' '| cut -d " " -f6)) idea15 \
    && mkdir -p bin src src/ovirt-engine deploy \
    && ln -s /home/ovirt/idea15/bin/idea.sh /home/ovirt/bin/intellij

CMD bash
