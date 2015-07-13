===============
6.12.?Using KDE
===============

.. raw:: html

   <div class="navheader">

6.12.?Using KDE
`Prev <using-qt.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-java.html>`__

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

6.12.?Using KDE
---------------

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

6.12.1.?KDE 4 Variable Definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the application depends on KDE 4, set ``USE_KDE4`` to the list of
required components. ``_build`` and ``_run`` suffixes can be used to
force components dependency type (for example, ``baseapps_run``). If no
suffix is set, a default dependency type will be used. To force both
types, add the component twice with both suffixes (for example,
``automoc4_build automoc4_run``). The most commonly used components are
listed below (up-to-date components are documented at the top of
``/usr/ports/Mk/bsd.kde4.mk``):

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.12.?Available KDE 4 Components

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-----------------------+----------------------------------------------------------+
| Name                  | Description                                              |
+=======================+==========================================================+
| ``kdehier``           | Hierarchy of common KDE directories                      |
+-----------------------+----------------------------------------------------------+
| ``kdelibs``           | KDE core libraries                                       |
+-----------------------+----------------------------------------------------------+
| ``kdeprefix``         | If set, port will be installed into ``${KDE4_PREFIX}``   |
+-----------------------+----------------------------------------------------------+
| ``automoc4``          | Build tool to automatically generate moc files           |
+-----------------------+----------------------------------------------------------+
| ``akonadi``           | Storage server for KDE PIM data                          |
+-----------------------+----------------------------------------------------------+
| ``soprano``           | Library for Resource Description Framework (RDF)         |
+-----------------------+----------------------------------------------------------+
| ``strigi``            | Strigi desktop search library                            |
+-----------------------+----------------------------------------------------------+
| ``libkcddb``          | KDE CDDB (compact disc database) library                 |
+-----------------------+----------------------------------------------------------+
| ``libkcompactdisc``   | KDE library for interfacing with audio CDs               |
+-----------------------+----------------------------------------------------------+
| ``libkdeedu``         | Libraries used by educational applications               |
+-----------------------+----------------------------------------------------------+
| ``libkdcraw``         | KDE LibRaw library                                       |
+-----------------------+----------------------------------------------------------+
| ``libkexiv2``         | KDE Exiv2 library                                        |
+-----------------------+----------------------------------------------------------+
| ``libkipi``           | KDE Image Plugin Interface                               |
+-----------------------+----------------------------------------------------------+
| ``libkonq``           | Konqueror core library                                   |
+-----------------------+----------------------------------------------------------+
| ``libksane``          | KDE SANE ("Scanner Access Now Easy") library             |
+-----------------------+----------------------------------------------------------+
| ``pimlibs``           | Personal information management libraries                |
+-----------------------+----------------------------------------------------------+
| ``kate``              | Advanced text editor framework                           |
+-----------------------+----------------------------------------------------------+
| ``marble``            | Virtual globe and world atlas                            |
+-----------------------+----------------------------------------------------------+
| ``okular``            | Universal document viewer                                |
+-----------------------+----------------------------------------------------------+
| ``korundum``          | KDE Ruby bindings                                        |
+-----------------------+----------------------------------------------------------+
| ``perlkde``           | KDE Perl bindings                                        |
+-----------------------+----------------------------------------------------------+
| ``pykde4``            | KDE Python bindings                                      |
+-----------------------+----------------------------------------------------------+
| ``pykdeuic4``         | PyKDE user interface compiler                            |
+-----------------------+----------------------------------------------------------+
| ``smokekde``          | KDE SMOKE libraries                                      |
+-----------------------+----------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

KDE 4 ports are installed into ``KDE4_PREFIX``. This is achieved by
specifying the ``kdeprefix`` component, which overrides the default
``PREFIX``. The ports, however, respect any ``PREFIX`` set via the
``MAKEFLAGS`` environment variable and/or ``make`` arguments. Currently
``KDE4_PREFIX`` is identical to the default ``PREFIX``,
``${LOCALBASE}``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?6.7.?\ ``USE_KDE4`` Example

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

This is a simple example for a KDE 4 port. ``USES= cmake:outsource``
instructs the port to utilize CMake, a configuration tool widely used by
KDE 4 projects (see `Section?6.5.4, “Using
``cmake``\ ” <building.html#using-cmake>`__ for detailed usage).
``USE_KDE4`` brings dependency on KDE libraries and makes port using
``automoc4`` at build stage. Required KDE components and other
dependencies can be determined through configure log. ``USE_KDE4`` does
not imply ``USE_QT4``. If a port requires some Qt 4 components, specify
them in ``USE_QT4``.

.. code:: programlisting

    USES=        cmake:outsource
    USE_KDE4=   kdelibs kdeprefix automoc4
    USE_QT4=    moc_build qmake_build rcc_build uic_build

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

+-----------------------------+-------------------------+---------------------------------+
| `Prev <using-qt.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-java.html>`__   |
+-----------------------------+-------------------------+---------------------------------+
| 6.11.?Using Qt?             | `Home <index.html>`__   | ?6.13.?Using Java               |
+-----------------------------+-------------------------+---------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
