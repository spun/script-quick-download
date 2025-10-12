This is just a simple script that asks for a resolution and runs the command with the appropriate parameters.

## Run as a container

Access the `quick_download` script using Docker.

### Build image

```bash
docker build -t quick-download-script:1.0 .
```

### Run container

```bash
docker run --rm -it -v "$(pwd):/downloads:Z" localhost/quick-download-script:1.0
```
