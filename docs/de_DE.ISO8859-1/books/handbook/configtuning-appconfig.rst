===================================
12.4. Konfiguration von Anwendungen
===================================

.. raw:: html

   <div class="navheader">

12.4. Konfiguration von Anwendungen
`Zur?ck <configtuning-core-configuration.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <configtuning-starting-services.html>`__

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

12.4. Konfiguration von Anwendungen
-----------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Installierte Anwendungen haben typischerweise eigene
Konfigurationsdateien, die eine eigene Syntax verwenden. Damit diese
Dateien leicht von der Paketverwaltung gefunden und verwaltet werden
k?nnen, ist es wichtig, sie vom Basissystem zu trennen.

F?r gew?hnlich werden diese Dateien in ``/usr/local/etc`` installiert.
Besitzt eine Anwendung viele Konfigurationsdateien, werden diese in
einem separaten Unterverzeichnis abgelegt.

Wenn ein Port oder ein Paket installiert wird, werden normalerweise auch
Beispiele f?r die Konfigurationsdateien installiert. Diese erkennt man
gew?hnlich an dem Suffix ``.default``. Wenn keine Konfigurationsdateien
f?r eine Anwendung existieren, werden sie durch Kopieren der
``.default`` Dateien erstellt.

Als Beispiel sei ``/usr/local/etc/apache`` gezeigt:

.. code:: literallayout

    -rw-r--r--  1 root  wheel   2184 May 20  1998 access.conf
    -rw-r--r--  1 root  wheel   2184 May 20  1998 access.conf.default
    -rw-r--r--  1 root  wheel   9555 May 20  1998 httpd.conf
    -rw-r--r--  1 root  wheel   9555 May 20  1998 httpd.conf.default
    -rw-r--r--  1 root  wheel  12205 May 20  1998 magic
    -rw-r--r--  1 root  wheel  12205 May 20  1998 magic.default
    -rw-r--r--  1 root  wheel   2700 May 20  1998 mime.types
    -rw-r--r--  1 root  wheel   2700 May 20  1998 mime.types.default
    -rw-r--r--  1 root  wheel   7980 May 20  1998 srm.conf
    -rw-r--r--  1 root  wheel   7933 May 20  1998 srm.conf.default

Anhand der Dateigr??e erkennen Sie, dass sich nur ``srm.conf`` ge?ndert
hat. Eine sp?tere Aktualisierung des Apache-Ports ?berschreibt diese
Datei nicht.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------------------+--------------------------------------+-------------------------------------------------------+
| `Zur?ck <configtuning-core-configuration.html>`__?   | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <configtuning-starting-services.html>`__   |
+------------------------------------------------------+--------------------------------------+-------------------------------------------------------+
| 12.3. Basiskonfiguration?                            | `Zum Anfang <index.html>`__          | ?12.5. Start von Diensten                             |
+------------------------------------------------------+--------------------------------------+-------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
