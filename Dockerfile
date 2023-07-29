FROM ubuntu:latest as ubuntu

WORKDIR /root
RUN apt-get update && apt-get install -y curl unzip
# download file from https://github.com/BiTGApps/BiTGApps-Release/releases/download/v2.3/BiTGApps-arm64-12.0.0-v2.3-CORE.zip
RUN curl -Lo BiTGApps-arm64-12.0.0-v2.3-CORE.zip https://github.com/BiTGApps/BiTGApps-Release/releases/download/v2.3/BiTGApps-arm64-12.0.0-v2.3-CORE.zip && \
    unzip -d BiTGApps-arm64-12.0.0-v2.3-CORE BiTGApps-arm64-12.0.0-v2.3-CORE.zip && \
    rm BiTGApps-arm64-12.0.0-v2.3-CORE.zip

FROM shangzebei/rk3588
COPY --from=ubuntu /root/BiTGApps-arm64-12.0.0-v2.3-CORE /tmp
RUN cd /tmp && sh update-binary.sh && rm -rf /tmp
