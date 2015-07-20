===============
9.3. Port Tools
===============

.. raw:: html

   <div class="navheader">

9.3. Port Tools
`Zur?ck <testing-portlint.html>`__?
Kapitel 9. Ihren Port testen
?\ `Weiter <porting-prefix.html>`__

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

9.3. Port Tools
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Programm
`ports-mgmt/porttools <http://www.freebsd.org/cgi/url.cgi?ports/ports-mgmt/porttools/pkg-descr>`__
ist Teil der Ports-Sammlung.

``port`` ist das Front-End-Skript, das Ihnen dabei behilflich sein kann
Ihre Arbeit als Tester zu vereinfachen. Um einen neuen Port zu testen
oder einen bereits bestehenden Port zu aktualisieren, k?nnen Sie
``port test`` verwenden, damit die Tests, inklusive der
```portlint`` <testing-portlint.html>`__-?berpr?fung, durchgef?hrt
werden. Dieser Befehl sp?rt ausserdem alle nicht in ``pkg-plist``
enthaltenen Dateien auf und gibt eine Liste dieser aus. Hier ein
Beispiel:

.. code:: screen

    # port test /usr/ports/net/csup

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+--------------------------------+---------------------------------------+
| `Zur?ck <testing-portlint.html>`__?   | `Nach oben <testing.html>`__   | ?\ `Weiter <porting-prefix.html>`__   |
+---------------------------------------+--------------------------------+---------------------------------------+
| 9.2. Portlint?                        | `Zum Anfang <index.html>`__    | ?9.4. ``PREFIX`` und ``DESTDIR``      |
+---------------------------------------+--------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
