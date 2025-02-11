FROM alpine:3.18.6

ENV NOMBRE=abc

WORKDIR /app

RUN apk add --no-cache python3 py3-pip
RUN pip3 install flask==3.1.0

COPY myfirstapy.py .
COPY config.py .

EXPOSE 5000

ENTRYPOINT ["python3", "myfirstapy.py"]
