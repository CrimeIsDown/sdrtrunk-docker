FROM lscr.io/linuxserver/webtop:ubuntu-openbox

# Install dependencies
RUN apt update && \
    apt -y dist-upgrade && \
    apt install -y expect libgtk-3-0 airspy rtl-sdr hackrf unzip

# Download the SDRplay RSP API and install it with an expect script
COPY install_sdrplay.sh /tmp/install_sdrplay.sh
ARG SDRPLAY_API_VERSION=3.15.2
RUN cd /tmp && \
    curl -sSfL -O https://www.sdrplay.com/software/SDRplay_RSP_API-Linux-${SDRPLAY_API_VERSION}.run && \
    chmod +x SDRplay_RSP_API-Linux-${SDRPLAY_API_VERSION}.run && \
	./install_sdrplay.sh ./SDRplay_RSP_API-Linux-${SDRPLAY_API_VERSION}.run && \
    rm install_sdrplay.sh SDRplay_RSP_API-Linux-${SDRPLAY_API_VERSION}.run

# Add the user to the plugdev group so they can access the SDR devices
RUN usermod -aG plugdev abc

# Download and install SDRTrunk
ARG TARGETPLATFORM
RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=x86_64; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=aarch64; \
    else echo "Unsupported platform $TARGETPLATFORM"; exit 1; fi && \
    curl -L https://github.com/DSheirer/sdrtrunk/releases/download/nightly/sdr-trunk-linux-$ARCHITECTURE-vnightly.zip -o /tmp/sdr-trunk-linux-$ARCHITECTURE-vnightly.zip && \
    unzip /tmp/sdr-trunk-linux-$ARCHITECTURE-vnightly.zip -d /opt && \
    rm /tmp/sdr-trunk-linux-$ARCHITECTURE-vnightly.zip && \
    mv /opt/sdr-trunk-linux-$ARCHITECTURE-vnightly /opt/sdrtrunk

# Copy all custom configration files
COPY root/ /
