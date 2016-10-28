# RTM-test

1) Run two_daemon.sh (under the top directory) to initiate RTM (two daemons with different priorities)

2) Run mem-run-sub.sh at the subscriber host. This script creates multiple subscriber processes (each of which has mulitple consumers)

3) Run mem-run.sh at the publisher host (normally, publishers co-locate with daemons). This script creates multiple publisher processes (each of
which has multiple producers)
