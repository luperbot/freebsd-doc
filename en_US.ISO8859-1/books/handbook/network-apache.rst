========================
29.8.?Apache HTTP Server
========================

.. raw:: html

   <div class="navheader">

29.8.?Apache HTTP Server
`Prev <network-dns.html>`__?
Chapter?29.?Network Servers
?\ `Next <network-ftp.html>`__

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

29.8.?Apache HTTP Server
------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Murray Stokely.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The open source Apache HTTP Server is the most widely used web server.
FreeBSD does not install this web server by default, but it can be
installed from the
`www/apache24 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache24/pkg-descr>`__
package or port.

This section summarizes how to configure and start version 2.\ *``x``*
of the Apache HTTP Server on FreeBSD. For more detailed information
about Apache?2.X and its configuration directives, refer to
`httpd.apache.org <http://httpd.apache.org/>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.1.?Configuring and Starting Apache
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In FreeBSD, the main Apache HTTP Server configuration file is installed
as ``/usr/local/etc/apache2x``/httpd.conf, where *``x``* represents the
version number. This ASCII text file begins comment lines with a ``#``.
The most frequently modified directives are:

.. raw:: html

   <div class="variablelist">

``ServerRoot "/usr/local"``
    Specifies the default directory hierarchy for the Apache
    installation. Binaries are stored in the ``bin`` and ``sbin``
    subdirectories of the server root and configuration files are stored
    in the ``etc/apache2x`` subdirectory.

``ServerAdmin you@example.com``
    Change this to the email address to receive problems with the
    server. This address also appears on some server-generated pages,
    such as error documents.

``ServerName           www.example.com:80``
    Allows an administrator to set a hostname which is sent back to
    clients for the server. For example, ``www`` can be used instead of
    the actual hostname. If the system does not have a registered DNS
    name, enter its IP address instead. If the server will listen on an
    alternate report, change ``80`` to the alternate port number.

``DocumentRoot         "/usr/local/www/apache2x``/data"
    The directory where documents will be served from. By default, all
    requests are taken from this directory, but symbolic links and
    aliases may be used to point to other locations.

.. raw:: html

   </div>

It is always a good idea to make a backup copy of the default Apache
configuration file before making changes. When the configuration of
Apache is complete, save the file and verify the configuration using
``apachectl``. Running ``apachectl       configtest`` should return
``Syntax       OK``.

To launch Apache at system startup, add the following line to
``/etc/rc.conf``:

.. code:: programlisting

    apache24_enable="YES"

If Apache should be started with non-default options, the following line
may be added to ``/etc/rc.conf`` to specify the needed flags:

.. code:: programlisting

    apache24_flags=""

If apachectl does not report configuration errors, start ``httpd`` now:

.. code:: screen

    # service apache24 start

The ``httpd`` service can be tested by entering ``http://localhost`` in
a web browser, replacing *``localhost``* with the fully-qualified domain
name of the machine running ``httpd``. The default web page that is
displayed is ``/usr/local/www/apache24``/data/index.html.

The Apache configuration can be tested for errors after making
subsequent configuration changes while ``httpd`` is running using the
following command:

.. code:: screen

    # service apache24 configtest

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

It is important to note that ``configtest`` is not an
`rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
standard, and should not be expected to work for all startup scripts.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.2.?Virtual Hosting
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Virtual hosting allows multiple websites to run on one Apache server.
The virtual hosts can be *IP-based* or *name-based*. IP-based virtual
hosting uses a different IP address for each website. Name-based virtual
hosting uses the clients HTTP/1.1 headers to figure out the hostname,
which allows the websites to share the same IP address.

To setup Apache to use name-based virtual hosting, add a ``VirtualHost``
block for each website. For example, for the webserver named
``www.domain.tld`` with a virtual domain of ``www.someotherdomain.tld``,
add the following entries to ``httpd.conf``:

.. code:: screen

    <VirtualHost *>
    ServerName www.domain.tld
    DocumentRoot /www/domain.tld
    </VirtualHost>

    <VirtualHost *>
    ServerName www.someotherdomain.tld
    DocumentRoot /www/someotherdomain.tld
    </VirtualHost>

For each virtual host, replace the values for ``ServerName`` and
``DocumentRoot`` with the values to be used.

For more information about setting up virtual hosts, consult the
official Apache documentation at:
``http://httpd.apache.org/docs/vhosts/``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.3.?Apache Modules
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Apache uses modules to augment the functionality provided by the basic
server. Refer to ``http://httpd.apache.org/docs/current/mod/`` for a
complete listing of and the configuration details for the available
modules.

In FreeBSD, some modules can be compiled with the
`www/apache24 <http://www.freebsd.org/cgi/url.cgi?ports/www/apache24/pkg-descr>`__
port. Type ``make       config`` within ``/usr/ports/www/apache24`` to
see which modules are available and which are enabled by default. If the
module is not compiled with the port, the FreeBSD Ports Collection
provides an easy way to install many modules. This section describes
three of the most commonly used modules.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.3.1.?\ ``mod_ssl``
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``mod_ssl`` module uses the OpenSSL library to provide strong
cryptography via the Secure Sockets Layer (SSLv3) and Transport Layer
Security (TLSv1) protocols. This module provides everything necessary to
request a signed certificate from a trusted certificate signing
authority to run a secure web server on FreeBSD.

In FreeBSD, ``mod_ssl`` module is enabled by default in both the package
and the port. The available configuration directives are explained at
``http://httpd.apache.org/docs/current/mod/mod_ssl.html``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.3.2.?\ ``mod_perl``
^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``mod_perl`` module makes it possible to write Apache modules in
Perl. In addition, the persistent interpreter embedded in the server
avoids the overhead of starting an external interpreter and the penalty
of Perl start-up time.

The ``mod_perl`` can be installed using the
`www/mod\_perl2 <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_perl2/pkg-descr>`__
package or port. Documentation for using this module can be found at
``http://perl.apache.org/docs/2.0/index.html``.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.3.3.?\ ``mod_php``
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   <div>

Written by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

*PHP: Hypertext Preprocessor* (PHP) is a general-purpose scripting
language that is especially suited for web development. Capable of being
embedded into HTML, its syntax draws upon C, Java™, and Perl with the
intention of allowing web developers to write dynamically generated
webpages quickly.

To gain support for PHP5 for the Apache web server, install the
`www/mod\_php5 <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_php5/pkg-descr>`__
package or port. This will install and configure the modules required to
support dynamic PHP applications. The installation will automatically
add this line to ``/usr/local/etc/apache24``/httpd.conf:

.. code:: programlisting

    LoadModule php5_module        libexec/apache24/libphp5.so

Then, perform a graceful restart to load the PHP module:

.. code:: screen

    # apachectl graceful

The PHP support provided by
`www/mod\_php5 <http://www.freebsd.org/cgi/url.cgi?ports/www/mod_php5/pkg-descr>`__
is limited. Additional support can be installed using the
`lang/php5-extensions <http://www.freebsd.org/cgi/url.cgi?ports/lang/php5-extensions/pkg-descr>`__
port which provides a menu driven interface to the available PHP
extensions.

Alternatively, individual extensions can be installed using the
appropriate port. For instance, to add PHP support for the MySQL
database server, install ``databases/php5-mysql``.

After installing an extension, the Apache server must be reloaded to
pick up the new configuration changes:

.. code:: screen

    # apachectl graceful

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.4.?Dynamic Websites
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to mod\_perl and mod\_php, other languages are available for
creating dynamic web content. These include Django and Ruby on Rails.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.4.1.?Django
^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Django is a BSD-licensed framework designed to allow developers to write
high performance, elegant web applications quickly. It provides an
object-relational mapper so that data types are developed as Python
objects. A rich dynamic database-access API is provided for those
objects without the developer ever having to write SQL. It also provides
an extensible template system so that the logic of the application is
separated from the HTML presentation.

Django depends on ``mod_python``, and an SQL database engine. In
FreeBSD, the
`www/py-django <http://www.freebsd.org/cgi/url.cgi?ports/www/py-django/pkg-descr>`__
port automatically installs ``mod_python`` and supports the PostgreSQL,
MySQL, or SQLite databases, with the default being SQLite. To change the
database engine, type ``make config`` within
``/usr/ports/www/py-django``, then install the port.

Once Django is installed, the application will need a project directory
along with the Apache configuration in order to use the embedded Python
interpreter. This interpreter is used to call the application for
specific URLs on the site.

To configure Apache to pass requests for certain URLs to the web
application, add the following to ``httpd.conf``, specifying the full
path to the project directory:

.. code:: screen

    <Location "/">
        SetHandler python-program
        PythonPath "['/dir/to/the/django/packages/'] + sys.path"
        PythonHandler django.core.handlers.modpython
        SetEnv DJANGO_SETTINGS_MODULE mysite.settings
        PythonAutoReload On
        PythonDebug On
    </Location>

Refer to ``https://docs.djangoproject.com/en/1.6/`` for more information
on how to use Django.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

29.8.4.2.?Ruby on Rails
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ruby on Rails is another open source web framework that provides a full
development stack. It is optimized to make web developers more
productive and capable of writing powerful applications quickly. On
FreeBSD, it can be installed using the
`www/rubygem-rails <http://www.freebsd.org/cgi/url.cgi?ports/www/rubygem-rails/pkg-descr>`__
package or port.

Refer to ``http://rubyonrails.org/documentation`` for more information
on how to use Ruby on Rails.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+---------------------------------+---------------------------------------+
| `Prev <network-dns.html>`__?      | `Up <network-servers.html>`__   | ?\ `Next <network-ftp.html>`__        |
+-----------------------------------+---------------------------------+---------------------------------------+
| 29.7.?Domain Name System (DNS)?   | `Home <index.html>`__           | ?29.9.?File Transfer Protocol (FTP)   |
+-----------------------------------+---------------------------------+---------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
