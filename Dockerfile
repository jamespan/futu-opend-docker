FROM ubuntu:16.04 as builder


RUN apt-get update
RUN apt-get install -y wget

ENV SDK_NAME=FutuOpenD_5.7.1908_Ubuntu16.04

RUN wget -O - https://software-file-1251001049.file.myqcloud.com/${SDK_NAME}.tar.gz | tar -xzf - -C /
RUN rm -rf /${SDK_NAME}/${SDK_NAME}.AppImage
RUN cp -a /${SDK_NAME}/${SDK_NAME} /FutuOpenD

FROM ubuntu:16.04 as prod

COPY --from=0 /FutuOpenD /FutuOpenD
COPY ./FutuOpenD.xml /FutuOpenD/FutuOpenD.xml

CMD ["/FutuOpenD/FutuOpenD"]
