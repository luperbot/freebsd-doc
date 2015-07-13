====================================
3.8.?Choosing the Installation Media
====================================

.. raw:: html

   <div class="navheader">

3.8.?Choosing the Installation Media
`Prev <install-choosing.html>`__?
Chapter?3.?Installing FreeBSD?8.\ *``X``*
?\ `Next <install-final-warning.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="sect1">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

3.8.?Choosing the Installation Media
------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If installing from a CD/DVD, use the arrow keys to highlight Install
from a FreeBSD CD/DVD. Ensure that [?OK?] is highlighted, then press
**Enter** to proceed with the installation.

For other methods of installation, select the appropriate option and
follow the instructions.

Press **F1** to display the Online Help for installation media. Press
**Enter** to return to the media selection menu.

.. raw:: html

   <div class="figure">

.. raw:: html

   <div class="figure-title">

Figure?3.27.?Choose Installation Media

.. raw:: html

   </div>

.. raw:: html

   <div class="figure-contents">

.. raw:: html

   <div class="mediaobject">

|Choose Installation Media|

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

FTP Installation Modes:
~~~~~~~~~~~~~~~~~~~~~~~

There are three FTP installation modes to choose from: active FTP,
passive FTP, or via a HTTP proxy.

.. raw:: html

   <div class="variablelist" xmlns="http://www.w3.org/1999/xhtml">

FTP Active: Install from an FTP server
    This option makes all FTP transfers use “Active” mode. This will not
    work through firewalls, but will often work with older FTP servers
    that do not support passive mode. If the connection hangs with
    passive mode (the default), try using active mode.

FTP Passive: Install from an FTP server through a firewall
    This option instructs
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
    to use passive mode for all FTP operations. This allows the user to
    pass through firewalls that do not allow incoming connections on
    random TCP ports.

FTP via a HTTP proxy: Install from an FTP server through a http proxy
    This option instructs
    `sysinstall(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysinstall&sektion=8>`__
    to use the HTTP protocol to connect to a proxy for all FTP
    operations. The proxy will translate the requests and send them to
    the FTP server. This allows the user to pass through firewalls that
    do not allow FTP, but offer a HTTP proxy. In this case, specify the
    proxy in addition to the FTP server.

.. raw:: html

   </div>

For a proxy FTP server, give the name of the server as part of the
username, after an “@” sign. The proxy server then “fakes” the real
server. For example, to install from ``ftp.FreeBSD.org``, using the
proxy FTP server ``foo.example.com``, listening on port 1234, go to the
options menu, set the FTP username to ``ftp@ftp.FreeBSD.org`` and the
password to an email address. As the installation media, specify FTP (or
passive FTP, if the proxy supports it), and the URL
``ftp://foo.example.com:1234/pub/FreeBSD``.

Since ``/pub/FreeBSD`` from ``ftp.FreeBSD.org`` is proxied under
``foo.example.com``, the proxy will fetch the files from
``ftp.FreeBSD.org`` as the installer requests them.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------+--------------------------------------------+
| `Prev <install-choosing.html>`__?   | `Up <install.html>`__   | ?\ `Next <install-final-warning.html>`__   |
+-------------------------------------+-------------------------+--------------------------------------------+
| 3.7.?Choosing What to Install?      | `Home <index.html>`__   | ?3.9.?Committing to the Installation       |
+-------------------------------------+-------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |Choose Installation Media| image:: install/media.png
