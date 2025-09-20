FROM ubuntu:latest

RUN apt-get update && apt-get install -y python3.10 python3-pip git
# Before the line with the error
RUN ls -l /usr/bin/pip*
RUN echo $PATH
RUN pip3 install --upgrade pip

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]