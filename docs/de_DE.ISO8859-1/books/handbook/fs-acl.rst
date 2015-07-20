==============================================
15.11. Zugriffskontrolllisten f?r Dateisysteme
==============================================

.. raw:: html

   <div class="navheader">

15.11. Zugriffskontrolllisten f?r Dateisysteme
`Zur?ck <openssh.html>`__?
Kapitel 15. Sicherheit
?\ `Weiter <security-portaudit.html>`__

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

15.11. Zugriffskontrolllisten f?r Dateisysteme
----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Beigetragen von Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Zusammen mit anderen Verbesserungen des Dateisystems wie Schnappsch?sse
bietet FreeBSD auch *Zugriffskontrolllisten* (*access control list*,
ACL).

Zugriffskontrolllisten erweitern die normalen Zugriffsrechte von UNIX?
Systemen auf eine kompatible (POSIX?.1e) Weise und bieten feiner
granulierte Sicherheitsmechanismen.

Zugriffskontrolllisten f?r Dateisysteme werden mit der nachstehenden
Zeile in der Kernelkonfiguration aktiviert:

.. code:: programlisting

    options UFS_ACL

Diese Option ist in der ``GENERIC``-Konfiguration aktiviert. Das System
gibt eine Warnung aus, wenn ein Dateisystem mit ACLs eingehangen werden
soll und die Unterst?tzung f?r ACLs nicht im Kernel aktiviert ist. Das
Dateisystem muss weiterhin erweiterte Attribute zur Verf?gung stellen,
damit ACLs verwendet werden k?nnen. Das neue UNIX-Dateisystem UFS2
stellt diese Attribute standardm??ig zur Verf?gung.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Die Konfiguration erweiterter Attribute auf UFS1 ist mit einem h?heren
Aufwand als die Konfiguration erweiterter Attribute auf UFS2 verbunden.
Zudem ist UFS2 mit erweiterten Attributen leistungsf?higer als UFS1.
Zugriffskontrolllisten sollten daher mit UFS2 verwendet werden.

.. raw:: html

   </div>

Die Angabe der Option ``acl`` in ``/etc/fstab`` aktiviert
Zugriffskontrolllisten f?r ein Dateisystem. Die bevorzugte M?glichkeit
ist die Verwendung von Zugriffskontrolllisten mit
`tunefs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=tunefs&sektion=8>`__
(Option ``-a``), im Superblock des Dateisystems festzuschreiben. Diese
M?glichkeit hat mehrere Vorteile:

.. raw:: html

   <div class="itemizedlist">

-  Nochmaliges Einh?ngen eines Dateisystems (Option ``-u`` von
   `mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__)
   ver?ndert den Status der Zugriffskontrolllisten nicht. Die Verwendung
   von Zugriffskontrolllisten kann nur durch Abh?ngen und erneutes
   Einh?ngen eines Dateisystems ver?ndert werden. Das hei?t auch, dass
   Zugriffskontrolllisten nicht nachtr?glich auf dem Root-Dateisystem
   aktiviert werden k?nnen.

-  Die Zugriffskontrolllisten auf den Dateisystemen sind, unabh?ngig von
   den Option in ``/etc/fstab`` oder Namens?nderungen der Ger?te, immer
   aktiv. Dies verhindert auch, dass Zugriffskontrolllisten aus Versehen
   auf Dateisystem ohne Zugriffskontrolllisten aktiviert werden und
   durch falsche Zugriffsrechte Sicherheitsprobleme entstehen.

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Es kann sein, dass sich der Status von Zugriffskontrolllisten sp?ter
durch nochmaliges Einh?ngen des Dateisystems (Option ``-u`` von
`mount(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount&sektion=8>`__)
?ndern l?sst. Die momentane Variante ist aber sicherer, da der Status
der Zugriffskontrolllisten nicht versehentlich ge?ndert werden kann.
Allgemein sollten Zugriffskontrolllisten auf einem Dateisystem, auf dem
sie einmal verwendet wurden, nicht deaktiviert werden, da danach die
Zugriffsrechte falsch sein k?nnen. Werden Zugriffskontrolllisten auf
einem solchen Dateisystem wieder aktiviert, werden die Zugriffsrechte
von Dateien, die sich zwischenzeitlich ge?ndert haben, ?berschrieben,
was zu erneuten Problemen f?hrt.

.. raw:: html

   </div>

Die Zugriffsrechte einer Datei werden durch ein ``+`` (Plus)
gekennzeichnet, wenn die Datei durch Zugriffskontrolllisten gesch?tzt
ist:

.. code:: programlisting

    drwx------  2 robert  robert  512 Dec 27 11:54 private
    drwxrwx---+ 2 robert  robert  512 Dec 23 10:57 directory1
    drwxrwx---+ 2 robert  robert  512 Dec 22 10:20 directory2
    drwxrwx---+ 2 robert  robert  512 Dec 27 11:57 directory3
    drwxr-xr-x  2 robert  robert  512 Nov 10 11:54 public_html

Die Verzeichnisse ``directory1``, ``directory2`` und ``directory3`` sind
durch Zugriffskontrolllisten gesch?tzt, das Verzeichnis ``public_html``
nicht.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

15.11.1. Zugriffskontrolllisten benutzen
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Werkzeug
`getfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=getfacl&sektion=1>`__
zeigt Zugriffskontrolllisten an. Das folgende Kommando zeigt die ACLs
auf der Datei ``test``:

.. code:: screen

    % getfacl test
        #file:test
        #owner:1001
        #group:1001
        user::rw-
        group::r--
        other::r--

Das Werkzeug
`setfacl(1) <http://www.FreeBSD.org/cgi/man.cgi?query=setfacl&sektion=1>`__
?ndert oder entfernt ACLs auf Dateien. Zum Beispiel:

.. code:: screen

    % setfacl -k test

Die Option ``-k`` entfernt alle ACLs einer Datei oder eines
Dateisystems. Besser w?re es, die Option ``-b`` zu verwenden, da sie die
erforderlichen Felder beibeh?lt.

.. code:: screen

    % setfacl -m u:trhodes:rwx,g:web:r--,o::--- test

Mit dem vorstehenden Kommando werden die eben entfernten
Zugriffskontrolllisten wiederhergestellt. Der Befehl gibt die
Fehlermeldung Invalid argument aus, wenn Sie nicht existierende Benutzer
oder Gruppen als Parameter angeben.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+---------------------------------+--------------------------------------------------------------+
| `Zur?ck <openssh.html>`__?   | `Nach oben <security.html>`__   | ?\ `Weiter <security-portaudit.html>`__                      |
+------------------------------+---------------------------------+--------------------------------------------------------------+
| 15.10. OpenSSH?              | `Zum Anfang <index.html>`__     | ?15.12. Sicherheitsprobleme in Software Dritter ?berwachen   |
+------------------------------+---------------------------------+--------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
