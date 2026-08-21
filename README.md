# sdrtrunk-docker

Run SDRTrunk in Docker, using [linuxserver/webtop](https://docs.linuxserver.io/images/docker-webtop/) for a web-based VNC server with audio support. Contains SDR support for RTL-SDR, AirSpy, HackRF, and SDRPlay.

## Getting Started

To get started with running SDRTrunk in Docker, follow these steps:

### Prerequisites

1. Ensure you have Docker and Docker Compose installed on your host machine.
2. Run the following script to set up necessary udev rules:
    ```sh
    bash ./install-on-host-machine/install-udev.sh
    ```

### Running the Service

1. Clone the repository:
    ```sh
    git clone https://github.com/CrimeIsDown/sdrtrunk-docker.git
    cd sdrtrunk-docker
    ```

2. Start the Docker Compose service:
    ```sh
    docker compose up -d
    ```

3. Access SDRTrunk by navigating to `http://localhost:3000` in your web browser.

The Compose configuration persists Webtop's complete `/config` directory in
`./appdata` by default. This retains application preferences that are stored
outside SDRTrunk's own configuration directory. Set `WEBTOP_CONFIG_DIR` to use
a different host location.

### Raspberry Pi 5

The image supports 64-bit Raspberry Pi OS. Docker Compose v2 passes the target
platform to the build automatically. If an older Compose installation cannot
detect it, build explicitly for arm64:

```sh
docker compose build --build-arg TARGETPLATFORM=linux/arm64
docker compose up -d
```

SDRplay's API requires a 4 KiB-page kernel. Raspberry Pi OS installations using
the newer 16 KiB-page kernel are not compatible with the vendor API; use the
standard 4 KiB kernel when an SDRplay device is required.

### Stopping the Service

To stop the service, run:
```sh
docker compose down
```

### Additional Information

For more details on configuring and using SDRTrunk, refer to the [official SDRTrunk documentation](https://github.com/DSheirer/sdrtrunk).
