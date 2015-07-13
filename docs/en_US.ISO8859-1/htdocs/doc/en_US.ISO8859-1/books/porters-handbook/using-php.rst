======================================
6.14.?Web Applications, Apache and PHP
======================================

.. raw:: html

   <div class="navheader">

6.14.?Web Applications, Apache and PHP
`Prev <using-java.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-python.html>`__

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

6.14.?Web Applications, Apache and PHP
--------------------------------------

.. raw:: html

   </div>

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

6.14.1.?Apache
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.16.?Variables for Ports That Use Apache

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_APACHE``         | The port requires Apache. Possible values: ``yes`` (gets any version), ``22``, ``24``, ``22-24``, ``22+``, etc. The default APACHE version is ``22``. More details are available in ``ports/Mk/bsd.apache.mk`` and at `wiki.freebsd.org/Apache/ <http://wiki.freebsd.org/Apache/>`__.   |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APXS``               | Full path to the ``apxs`` binary. Can be overridden in the port.                                                                                                                                                                                                                        |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``HTTPD``              | Full path to the ``httpd`` binary. Can be overridden in the port.                                                                                                                                                                                                                       |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHE_VERSION``     | The version of present Apache installation (read-only variable). This variable is only available after inclusion of ``bsd.port.pre.mk``. Possible values: ``22``, ``24``.                                                                                                               |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEMODDIR``       | Directory for Apache modules. This variable is automatically expanded in ``pkg-plist``.                                                                                                                                                                                                 |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEINCLUDEDIR``   | Directory for Apache headers. This variable is automatically expanded in ``pkg-plist``.                                                                                                                                                                                                 |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APACHEETCDIR``       | Directory for Apache configuration files. This variable is automatically expanded in ``pkg-plist``.                                                                                                                                                                                     |
+------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.17.?Useful Variables for Porting Apache Modules

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``MODULENAME``      | Name of the module. Default value is ``PORTNAME``. Example: ``mod_hello``                                        |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``SHORTMODNAME``    | Short name of the module. Automatically derived from ``MODULENAME``, but can be overridden. Example: ``hello``   |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``AP_FAST_BUILD``   | Use ``apxs`` to compile and install the module.                                                                  |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``AP_GENPLIST``     | Also automatically creates a ``pkg-plist``.                                                                      |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``AP_INC``          | Adds a directory to a header search path during compilation.                                                     |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``AP_LIB``          | Adds a directory to a library search path during compilation.                                                    |
+---------------------+------------------------------------------------------------------------------------------------------------------+
| ``AP_EXTRAS``       | Additional flags to pass to ``apxs``.                                                                            |
+---------------------+------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

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

6.14.2.?Web Applications
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Web applications must be installed into ``PREFIX/www/appname``. This
path is available both in ``Makefile`` and in ``pkg-plist`` as
``WWWDIR``, and the path relative to ``PREFIX`` is available in
``Makefile`` as ``WWWDIR_REL``.

The user and group of web server process are available as ``WWWOWN`` and
``WWWGRP``, in case the ownership of some files needs to be changed. The
default values of both are ``www``. Use ``WWWOWN?= myuser`` and
``WWWGRP?=       mygroup`` if the port needs different values. This
allows the user to override them easily.

Do not depend on Apache unless the web app explicitly needs Apache.
Respect that users may wish to run a web app on different web server
than Apache.

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

6.14.3.?PHP
~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.18.?Variables for Ports That Use PHP

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHP``           | The port requires PHP. The value ``yes`` adds a dependency on PHP. The list of required PHP extensions can be specified instead. Example: ``pcre xml gettext``   |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``DEFAULT_PHP_VER``   | Selects which major version of PHP will be installed as a dependency when no PHP is installed yet. Default is ``5``. Possible values: ``4``, ``5``               |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``IGNORE_WITH_PHP``   | The port does not work with PHP of the given version. Possible values: ``4``, ``5``                                                                              |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHPIZE``        | The port will be built as a PHP extension.                                                                                                                       |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHPEXT``        | The port will be treated as a PHP extension, including installation and registration in the extension registry.                                                  |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``USE_PHP_BUILD``     | Set PHP as a build dependency.                                                                                                                                   |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_CLI``      | Want the CLI (command line) version of PHP.                                                                                                                      |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_CGI``      | Want the CGI version of PHP.                                                                                                                                     |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_MOD``      | Want the Apache module version of PHP.                                                                                                                           |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_SCR``      | Want the CLI or the CGI version of PHP.                                                                                                                          |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``WANT_PHP_WEB``      | Want the Apache module or the CGI version of PHP.                                                                                                                |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

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

6.14.4.?PEAR Modules
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Porting PEAR modules is a very simple process.

Add ``USES=pear`` to the port's ``Makefile``. The framework will install
the relevant files in the right places and automatically generate the
plist at install time.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.8.?Example Makefile for PEAR Class

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    PORTNAME=       Date
    PORTVERSION=    1.4.3
    CATEGORIES= devel www pear

    MAINTAINER= example@domain.com
    COMMENT=    PEAR Date and Time Zone Classes

    USES=   pear

    .include <bsd.port.mk>

.. raw:: html

   </div>

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

6.14.4.1.?Horde Modules
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In the same way, porting Horde modules is a simple process.

Add ``USES=horde`` to the port's ``Makefile``. The framework will
install the relevant files in the right places and automatically
generate the plist at install time.

The ``USE_HORDE_BUILD`` and ``USE_HORDE_RUN`` variables can be used to
add buildtime and runtime dependencies on other Horde modules. See
``Mk/Uses/horde.mk`` for a complete list of available modules.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.9.?Example Makefile for Horde Module

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    PORTNAME= Horde_Core
    PORTVERSION=    2.14.0
    CATEGORIES= devel www pear

    MAINTAINER= horde@FreeBSD.org
    COMMENT=    Horde Core Framework libraries

    OPTIONS_DEFINE= KOLAB SOCKETS
    KOLAB_DESC= Enable Kolab server support
    SOCKETS_DESC=   Depend on sockets PHP extension

    USES=   horde
    USE_PHP=    session

    USE_HORDE_BUILD=    Horde_Role
    USE_HORDE_RUN=  Horde_Role Horde_History Horde_Pack \
            Horde_Text_Filter Horde_View

    KOLAB_USE=  HORDE_RUN=Horde_Kolab_Server,Horde_Kolab_Session
    SOCKETS_USE=    PHP=sockets

    .include <bsd.port.mk>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------+-------------------------+-----------------------------------+
| `Prev <using-java.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-python.html>`__   |
+-------------------------------+-------------------------+-----------------------------------+
| 6.13.?Using Java?             | `Home <index.html>`__   | ?6.15.?Using Python               |
+-------------------------------+-------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
