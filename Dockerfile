FROM alpine:3.18.6

ENV NOMBRE=abc
ENV EDAD=123
ARG VERSION=1.0.0

WORKDIR /app

RUN apk add --no-cache python3 py3-pip
RUN pip3 install flask==3.1.0

RUN wget https://github.com/dgongut/apitest/archive/refs/tags/v${VERSION}.tar.gz -P /tmp
RUN tar -xf /tmp/v${VERSION}.tar.gz
RUN mv apitest-${VERSION}/* /app
RUN rm /tmp/v${VERSION}.tar.gz
RUN rm -rf apitest-${VERSION}/

EXPOSE 5000

ENTRYPOINT ["python3", "myfirstapy.py"]
