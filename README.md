docker-varnish
==============

Container for running [Varnish Cache](https://www.varnish-cache.org/).

*Usage:*

* Build: `docker build -t varnish .`
* Run: `docker run -d -v /my/test.vcl:/etc/varnish/default.vcl -p 80:80 varnish`

*Advanced*

* Set memory size - append: `-s malloc,256M`
* Set a secret - mount `-v /path/to/file/containg/uuid:/etc/varnish/secret`
* Expose control terminal: `-p 1234:6082`

*Extras*

* test.vcl - example default.vcl file

*Notes*

The default secret is `00000000-0000-0000-0000-000000000000`. This is INSECURE if you decide to expose the varnish control terminal.
