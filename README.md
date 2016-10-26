docker-varnish
==============

Container for running [Varnish Cache](https://www.varnish-cache.org/).

*Usage:*

* Build: `docker build -t varnish .`
* Run: `docker run -d -v /my/test.vcl:/etc/varnish/default.vcl -p 80:80 varnish`

*Advanced*

* Set memory size: `-e MEMSIZE=64M`
* Set a secret: `-e SECRET=00000000-0000-0000-0000-000000000000`
* Expose control terminal: `-p 1234:6082`

*Extras*

* test.vcl - example default.vcl file
