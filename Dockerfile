FROM centos:7

ARG GO_VERSION
ENV GO_VERSION ${GO_VERSION}

ARG GO_URL
ENV GO_URL ${GO_URL}

RUN cd /root && \
    yum -y install make gcc git wget rpm-build rpm-devel rpmlint python coreutils diffutils patch rpmdevtools && \
    wget --quiet ${GO_URL} && \
    tar -C /usr/local -zxf go${GO_VERSION}.linux-amd64.tar.gz && \ 
    rm -f go${GO_VERSION}.linux-amd64.tar.gz && \
    echo "export PATH=$PATH:/usr/local/go/bin" >> .bashrc

CMD ["/bin/bash"]
