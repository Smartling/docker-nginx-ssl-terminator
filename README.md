Service docker container for SSL connection termination before other containers

Please use UPSTREAM environment variable in order add needed amount of upstreams.
They should be separated by comma and without blank spaces.

Example:
```
docker run -d -e UPSTREAM="localhost:5000,127.0.0.1:443"
```

This will create following upstreams:

upstream terminator {
    server localhost:5000;
    server 127.0.0.1:443;
}
