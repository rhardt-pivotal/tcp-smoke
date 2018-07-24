# tcp-smoke
concourse job to smoke-test CF tcp routing

```
cf push my-tcp -f manifest.yml --no-route
cf map-route my-tcp my-tcp-apps.com --port 8675
cat <<EOF > values.yml
tcp-app-host: my-tcp.apps.com
tcp-app-port: 8675
expected-response: PONG!
EOF
fly -t lavidalocal tcp-smoke -c ./tcp-smoke-pipeline.yml -l ./values.yml
```
