# local-elk-stack

A local environment for outputting your Docker logs to. Run `make up` to bring up the ELK stack, and leave it running.

In your project, update the service you want to ship logs from in your `docker-compose.yml` with the `logging` section:

```
  virtualenv:
    image: lambci/lambda:build-python3.6
    env_file: .env
    working_dir: /usr/src/app
    entrypoint: []
    volumes:
      - ./:/usr/src/app:Z
    logging:
      driver: gelf
      options:
        gelf-address: "udp://127.0.0.1:12201"
```
Your kibana instance will be available at `http://localhost:5601`.
