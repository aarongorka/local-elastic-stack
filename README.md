# local-elk-stack

A local environment for outputting your Docker logs to. Run `make up` to bring up the ELK stack in the background.

Your kibana instance will be available at [http://localhost:5601].

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

## Data

The Elasticsearch database is stored in a named volume, so your logs and dashboards will persist across reboots. You can delete all data related to this stack with `make clean`.

## Limitations

If you still want to view your logs in your local console, you'll need to use `docker-compose run` or similar. `docker-compose up` will display nothing but a warning as it relies on the logs being stored locally.
