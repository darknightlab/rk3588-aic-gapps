FROM ubuntu:latest as ubuntu

WORKDIR /root
RUN apt-get update && apt-get install -y curl unzip

RUN curl -Lo gapps.zip https://github.com/rk-docker/Gapp/raw/12.0.0/BiTGApps-arm64-12.0.0-v2.2-CORE.zip && \
    unzip -d gapps gapps.zip && \
    rm gapps.zip

FROM shangzebei/rk3588
COPY --from=ubuntu /root/gapps /tmp
RUN cd /tmp && sh update-binary.sh && rm -rf /tmp
