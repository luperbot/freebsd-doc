===============
6.8.?Using Perl
===============

.. raw:: html

   <div class="navheader">

6.8.?Using Perl
`Prev <using-gettext.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-x11.html>`__

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

6.8.?Using Perl
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If ``MASTER_SITES`` is set to ``CPAN``, the correct subdirectory is
usually selected automatically. If the default subdirectory is wrong,
``CPAN/Module`` can be used to change it. ``MASTER_SITES`` can also be
set to the old ``MASTER_SITE_PERL_CPAN``, then the preferred value of
``MASTER_SITE_SUBDIR`` is the top-level hierarchy name. For example, the
recommended value for ``p5-Module-Name`` is ``Module``. The top-level
hierarchy can be examined at
`cpan.org <http://cpan.org/modules/by-module/>`__. This keeps the port
working when the author of the module changes.

The exception to this rule is when the relevant directory does not exist
or the distfile does not exist in that directory. In such case, using
author's id as ``MASTER_SITE_SUBDIR`` is allowed. The ``CPAN:AUTHOR``
macro can be used, which will be translated to the hashed author
directory. For example, ``CPAN:AUTHOR`` will be converted to
``authors/id/A/AU/AUTHOR``.

When a port needs Perl support, it must set ``USES=perl5`` with the
optional ``USE_PERL5`` described in `the perl5 USES
description <uses.html#uses-perl5>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.5.?Read-Only Variables for Ports That Use Perl

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Read only variables   | Means                                                                                                                                                                                                                                                                                  |
+=======================+========================================================================================================================================================================================================================================================================================+
| ``PERL``              | The full path of the Perl 5 interpreter, either in the system or installed from a port, but without the version number. Use this when the software needs the path to the Perl interpreter. To replace “``#!``”lines in scripts, use `USES=shebangfix <uses.html#uses-shebangfix>`__.   |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_VERSION``      | The full version of Perl installed (for example, ``5.8.9``).                                                                                                                                                                                                                           |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_LEVEL``        | The installed Perl version as an integer of the form ``MNNNPP`` (for example, ``500809``).                                                                                                                                                                                             |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_ARCH``         | Where Perl stores architecture dependent libraries. Defaults to ``${ARCH}-freebsd``.                                                                                                                                                                                                   |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``PERL_PORT``         | Name of the Perl port that is installed (for example, ``perl5``).                                                                                                                                                                                                                      |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``SITE_PERL``         | Directory name where site specific Perl packages go. This value is added to ``PLIST_SUB``.                                                                                                                                                                                             |
+-----------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Ports of Perl modules which do not have an official website must link to
``cpan.org`` in the WWW line of ``pkg-descr``. The preferred URL form is
``http://search.cpan.org/dist/Module-Name/`` (including the trailing
slash).

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Do not use ``${SITE_PERL}`` in dependency declarations. Doing so assumes
that ``perl5.mk`` has been included, which is not always true. Ports
depending on this port will have incorrect dependencies if this port's
files move later in an upgrade. The right way to declare Perl module
dependencies is shown in the example below.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.2.?Perl Dependency Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: programlisting

    p5-IO-Tee>=0.64:${PORTSDIR}/devel/p5-IO-Tee

.. raw:: html

   </div>

.. raw:: html

   </div>

For Perl ports that install manual pages, the macro ``PERL5_MAN3`` can
be used inside ``pkg-plist``. For example,

.. code:: programlisting

    lib/perl5/5.14/man/man3/AnyEvent::I3.3.gz

can be replaced with

.. code:: programlisting

    %%PERL5_MAN3%%/AnyEvent::I3.3.gz

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

There are no ``PERL5_MANx`` macros for the other sections (*``x``* in
``1``, ``2`` and ``4`` to ``9``) because those get installed in the
regular directories.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------+-------------------------+--------------------------------+
| `Prev <using-gettext.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-x11.html>`__   |
+----------------------------------+-------------------------+--------------------------------+
| 6.7.?Using GNU ``gettext``?      | `Home <index.html>`__   | ?6.9.?Using X11                |
+----------------------------------+-------------------------+--------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
