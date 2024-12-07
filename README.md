# sdrtrunk-docker

Run SDRTrunk in Docker, using [linuxserver/webtop](https://docs.linuxserver.io/images/docker-webtop/) for a web-based VNC server with audio support. Contains SDR support for RTL-SDR, AirSpy, HackRF, and SDRPlay.

## Getting Started

To get started with running SDRTrunk in Docker, follow these steps:

### Prerequisites

1. Ensure you have Docker and Docker Compose installed on your host machine.
2. Run the following script to set up necessary udev rules:
    ```sh
    ./install-on-host-machine/install-udev.sh
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

### Stopping the Service

To stop the service, run:
```sh
docker compose down
```

### Additional Information

For more details on configuring and using SDRTrunk, refer to the [official SDRTrunk documentation](https://github.com/DSheirer/sdrtrunk).
