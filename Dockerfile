FROM alpine:3.7

ENV GRAALVM_VERSION=1.0.0-rc2 \
    JAVA_HOME=/usr/lib/jvm/graalvm-ce-1.0.0-rc2 \
    PATH=/usr/lib/jvm/graalvm-ce-1.0.0-rc2/bin:$PATH

RUN apk --no-cache add ca-certificates wget gcc
RUN mkdir /usr/lib/jvm; \
    wget "https://github.com/oracle/graal/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-${GRAALVM_VERSION}-linux-amd64.tar.gz" \
        | tar -zxC /usr/lib/jvm --strip-components 1; \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub; \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk; \
    apk add glibc-2.27-r0.apk
