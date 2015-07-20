========================
5.13. Konfliktbehandlung
========================

.. raw:: html

   <div class="navheader">

5.13. Konfliktbehandlung
`Zur?ck <makefile-wrkdir.html>`__?
Kapitel 5. Die Konfiguration des Makefile
?\ `Weiter <install.html>`__

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

5.13. Konfliktbehandlung
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es gibt drei verschiedene Variablen, um einen Konflikt zwischen Paketen
und Ports zu dokumentieren: ``CONFLICTS``, ``CONFLICTS_INSTALL`` sowie
``CONFLICTS_BUILD``.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

``CONFLICTS`` setzt automatisch die Variable ``IGNORE``, die
ausf?hrlicher in `Abschnitt?12.14, „Einen Port durch ``BROKEN``,
``FORBIDDEN`` oder ``IGNORE`` als nicht installierbar
markieren“ <dads-noinstall.html>`__ beschrieben wird.

.. raw:: html

   </div>

Beim Entfernen eines von mehreren in Konflikt stehenden Ports ist es
ratsam, die ``CONFLICTS``-Eintr?ge in den anderen Ports f?r einige
Monate beizubehalten, um Nutzer zu unterst?tzen, die ihre Ports nur
sporadisch aktualisieren.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

5.13.1. ``CONFLICTS_INSTALL``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Falls Ihr Paket nicht mit anderen Paketen koexistieren kann (wegen
Dateikonflikten, Laufzeit-Inkompatibilit?ten usw.), f?hren Sie bitte die
anderen Paketnamen in der Variable ``CONFLICTS_INSTALL`` auf. Sie k?nnen
hier Shell-Globs wie ``*`` und ``?`` verwenden. Paketnamen sollten in
der gleichen Weise aufgez?hlt werden, wie sie in ``/var/db/pkg``
auftauchen. Bitte stellen Sie sicher, dass ``CONFLICTS`` nicht mit dem
Paket des Ports selbst ?bereinstimmt, da ansonsten das Erzwingen der
Installation durch ``FORCE_PKG_REGISTER`` nicht l?nger funktionieren
wird.

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

5.13.2. ``CONFLICTS_BUILD``
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port nicht gebaut werden kann, wenn ein bestimmter Port bereits
installiert ist, geben Sie diesen in der Variable ``CONFLICTS_BUILD``
an. Sie k?nnen hier Shell-Globs wie ``*`` und ``?`` verwenden.
Paketnamen sollten in der gleichen Weise aufgez?hlt werden, wie sie in
``/var/db/pkg`` auftauchen. Die CONFLICTS\_BUILD-Pr?fung erfolgt vor dem
Bau des Ports. Baukonflikte werden im erzeugten Paket nicht verzeichnet.

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

5.13.3. ``CONFLICTS``
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Ihr Port nicht gebaut werden kann, wenn ein bestimmter Port bereits
installiert ist und das aus dem Port erzeugte Paket nicht mit dem
anderen Paket koexistieren kann, geben Sie das andere Paket in der
Variable ``CONFLICTS`` an. Sie k?nnen hier Shell-Globs wie ``*`` und
``?`` verwenden. Paketnamen sollten in der gleichen Weise aufgez?hlt
werden, wie sie in ``/var/db/pkg`` auftauchen. Bitte stellen Sie sicher,
dass ``CONFLICTS_INSTALL`` nicht mit dem Paket des Ports selbst
?bereinstimmt, da ansonsten das Erzwingen der Installation durch
``FORCE_PKG_REGISTER`` nicht l?nger funktionieren wird. Die
CONFLICTS-Pr?fung erfolgt vor dem Bau des Ports und vor der Installation
des gebauten Ports.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+---------------------------------+-----------------------------------+
| `Zur?ck <makefile-wrkdir.html>`__?                | `Nach oben <makefile.html>`__   | ?\ `Weiter <install.html>`__      |
+---------------------------------------------------+---------------------------------+-----------------------------------+
| 5.12. Die Festlegung des Arbeitsverzeichnisses?   | `Zum Anfang <index.html>`__     | ?5.14. Installation von Dateien   |
+---------------------------------------------------+---------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
