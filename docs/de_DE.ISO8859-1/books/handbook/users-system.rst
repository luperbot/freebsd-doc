=====================
14.4. System-Accounts
=====================

.. raw:: html

   <div class="navheader">

14.4. System-Accounts
`Zur?ck <users-superuser.html>`__?
Kapitel 14. Benutzer und grundlegende Account-Verwaltung
?\ `Weiter <users-user.html>`__

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

14.4. System-Accounts
---------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Systembenutzer starten Dienste wie DNS, Mail-Server, Web-Server und so
weiter. Der Grund daf?r ist die Sicherheit; wenn die Programme von dem
Superuser gestartet werden, k?nnen Sie ohne Einschr?nkungen handeln.

Beispiele von Systembenutzern sind ``daemon``, ``operator``, ``bind``
(f?r den Domain Name Service) und ``news`` und ``www``.

``nobody`` ist der generische unprivilegierte Systembenutzer. Bedenken
Sie aber, dass je mehr Dienste ``nobody`` benutzen, desto mehr Dateien
und Prozesse diesem Benutzer geh?ren und dieser Benutzer damit umso
privilegierter wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+-------------------------------+-----------------------------------+
| `Zur?ck <users-superuser.html>`__?   | `Nach oben <users.html>`__    | ?\ `Weiter <users-user.html>`__   |
+--------------------------------------+-------------------------------+-----------------------------------+
| 14.3. Der Superuser-Account?         | `Zum Anfang <index.html>`__   | ?14.5. Benutzer-Accounts          |
+--------------------------------------+-------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
