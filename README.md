docker-varnish
==============

Container for running [Varnish Cache](https://www.varnish-cache.org/). Automatically checks vcl validity before running varnish and reports compile errors in stdout.

*Usage:*

* Build: `docker build -t varnish .`
* Run: `docker run -d -v /my/test.vcl:/etc/varnish/default.vcl -p 80:80 varnish`

*Advanced*

* Set memory size: `docker run` with `-e MEMSIZE=128m`
* Use pre-set secret: `-e SECRET=7d40f8f1-9107-4cce-a2b6-f5caf6fc7b9d`
* Expose control terminal: `-p 1234:6082`

*Extras*

* test.vcl - example default.vcl file
* monitorvcl - example showing how reload varnish when the vcl is modified
* Apache-format logs are sent to the docker host with rsyslog with programname 'varnish', channel local6.notice
