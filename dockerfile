FROM centos:centos7

WORKDIR /

RUN echo 'alias ls="ls -al"' >> ~/.bashrc

RUN yum -y update
RUN yum -y install gcc gcc-c++ git tar openssl openssl-devel bzip2 readline-devel zip unzip sqlite-devel postgresql-devel
RUN yum -y install tree

WORKDIR /app

# install rust
ENV RUST_VERSION stable
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
ENV PATH $PATH:$HOME/.cargo/bin
RUN bash -l -c "rustc --version"
