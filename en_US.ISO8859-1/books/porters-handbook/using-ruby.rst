================
6.18.?Using Ruby
================

.. raw:: html

   <div class="navheader">

6.18.?Using Ruby
`Prev <using-emacs.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-sdl.html>`__

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

6.18.?Using Ruby
----------------

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

Table?6.21.?Useful Variables for Ports That Use Ruby

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------+--------------------------------------------------------------------------------+
| Variable               | Description                                                                    |
+========================+================================================================================+
| ``USE_RUBY``           | The port requires Ruby.                                                        |
+------------------------+--------------------------------------------------------------------------------+
| ``USE_RUBY_EXTCONF``   | The port uses ``extconf.rb`` to configure.                                     |
+------------------------+--------------------------------------------------------------------------------+
| ``USE_RUBY_SETUP``     | The port uses ``setup.rb`` to configure.                                       |
+------------------------+--------------------------------------------------------------------------------+
| ``RUBY_SETUP``         | Set to the alternative name of ``setup.rb``. Common value is ``install.rb``.   |
+------------------------+--------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

This table shows the selected variables available to port authors via
the ports infrastructure. These variables are used to install files into
their proper locations. Use them in ``pkg-plist`` as much as possible.
Do not redefine these variables in the port.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.22.?Selected Read-Only Variables for Ports That Use Ruby

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| Variable                  | Description                                                                        | Example value                                           |
+===========================+====================================================================================+=========================================================+
| ``RUBY_PKGNAMEPREFIX``    | Used as a ``PKGNAMEPREFIX`` to distinguish packages for different Ruby versions.   | ``ruby19-``                                             |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| ``RUBY_VERSION``          | Full version of Ruby in the form of ``x.y.z[.p]``.                                 | ``1.9.3.484``                                           |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| ``RUBY_SITELIBDIR``       | Architecture independent libraries installation path.                              | ``/usr/local/lib/ruby/site_ruby/1.9``                   |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| ``RUBY_SITEARCHLIBDIR``   | Architecture dependent libraries installation path.                                | ``/usr/local/lib/ruby/site_ruby/1.9/amd64-freebsd10``   |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| ``RUBY_MODDOCDIR``        | Module documentation installation path.                                            | ``/usr/local/share/doc/ruby19/patsy``                   |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+
| ``RUBY_MODEXAMPLESDIR``   | Module examples installation path.                                                 | ``/usr/local/share/examples/ruby19/patsy``              |
+---------------------------+------------------------------------------------------------------------------------+---------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

A complete list of available variables can be found in
``/usr/ports/Mk/bsd.ruby.mk``.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------+-------------------------+--------------------------------+
| `Prev <using-emacs.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-sdl.html>`__   |
+--------------------------------+-------------------------+--------------------------------+
| 6.17.?Using Emacs?             | `Home <index.html>`__   | ?6.19.?Using SDL               |
+--------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
