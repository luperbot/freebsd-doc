===============================
23.3.?Finding i18n Applications
===============================

.. raw:: html

   <div class="navheader">

23.3.?Finding i18n Applications
`Prev <using-localization.html>`__?
Chapter?23.?Localization - i18n/L10n Usage and Setup
?\ `Next <lang-setup.html>`__

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

23.3.?Finding i18n Applications
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

i18n applications are programmed using i18n kits under libraries. These
allow developers to write a simple file and translate displayed menus
and texts to each language.

The `FreeBSD Ports Collection <../../../../ports/index.html>`__ contains
many applications with built-in support for wide or multibyte characters
for several languages. Such applications include ``i18n`` in their names
for easy identification. However, they do not always support the
language needed.

Some applications can be compiled with the specific charset. This is
usually done in the port's ``Makefile`` or by passing a value to
configure. Refer to the i18n documentation in the respective FreeBSD
port's source for more information on how to determine the needed
configure value or the port's ``Makefile`` to determine which compile
options to use when building the port.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------+------------------------------------------------------+
| `Prev <using-localization.html>`__?   | `Up <l10n.html>`__      | ?\ `Next <lang-setup.html>`__                        |
+---------------------------------------+-------------------------+------------------------------------------------------+
| 23.2.?Using Localization?             | `Home <index.html>`__   | ?23.4.?Locale Configuration for Specific Languages   |
+---------------------------------------+-------------------------+------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
