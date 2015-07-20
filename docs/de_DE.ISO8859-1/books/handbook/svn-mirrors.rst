============================
A.7. Subversion Mirror Sites
============================

.. raw:: html

   <div class="navheader">

A.7. Subversion Mirror Sites
`Zur?ck <svn.html>`__?
Anhang A. Bezugsquellen f?r FreeBSD
?\ `Weiter <cvsup.html>`__

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

A.7. Subversion Mirror Sites
----------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Alle Spiegel f?hren alle Repositories.

Der Master FreeBSD Subversion Server, ``svn.FreeBSD.org`` ist ?ffentlich
zug?nglich. Auf ihn kann allerdings nur lesend zugegriffen werden. Dies
kann sich in Zukunft ?ndern, solange jedoch werden die Nutzer dazu
aufgefordert, einen der offiziellen Spiegel zu verwenden. Um das FreeBSD
Subversion Repository ?ber einen Browser anzuzeigen, verwenden Sie
http://svnweb.FreeBSD.org/.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Das FreeBSD svn Mirror Netzwerk befindet sich noch in den Anf?ngen, und
Ver?nderungen werden stattfinden. Verlassen Sie sich also nicht darauf,
dass diese Liste statisch ist. Insbesondere werden sich die
SSL-Zertifikate irgendwann ?ndern.

.. raw:: html

   </div>

.. raw:: html

   <div class="informaltable">

+--------------------------------+---------------------------------------------------------------------------------------------------+--------------------+------------------------------------------------------------------------+
| Name                           | Protokolle                                                                                        | Standort           | SSL-Fingerabdruck                                                      |
+================================+===================================================================================================+====================+========================================================================+
| ``svn.us-west.FreeBSD.org``    | svn, `http <http://svn0.us-west.FreeBSD.org/>`__, `https <https://svn0.us.west.FreeBSD.org/>`__   | USA, Kalifornien   | SHA1 ``79:35:8F:CA:6D:34:D9:30:44:D1:00:AF:33:4D:E6:11:44:4D:15:EC``   |
+--------------------------------+---------------------------------------------------------------------------------------------------+--------------------+------------------------------------------------------------------------+
| ``svn0.us-east.FreeBSD.org``   | svn, `http <http://svn0.us-east.FreeBSD.org/>`__, `https <https://svn0.us-east.FreeBSD.org/>`__   | USA, New Jersey    | SHA1 ``06:D1:23:DE:5E:7A:F7:2B:7A:7E:74:95:5F:54:8D:5C:B0:D6:2E:8F``   |
+--------------------------------+---------------------------------------------------------------------------------------------------+--------------------+------------------------------------------------------------------------+

.. raw:: html

   </div>

HTTPS ist das bevorzugte Protokoll, es sch?tzt Sie vor anderen
Computern, die vort?uschen, der FreeBSD-Mirror zu sein (gemeinhin
bekannt als „man in the middle-Angriff“), oder anderweitig versuchen
schlechte Daten an den Endnutzer zu senden.

Bei der ersten Verbindung zu einem HTTPS Mirror, wird der Benutzer
aufgefordert, den Fingerabdruck des Servers zu ?berpr?fen:

.. code:: screen

    Error validating server certificate for 'https://svn0.us-west.freebsd.org:443':
     - The certificate is not issued by a trusted authority. Use the
       fingerprint to validate the certificate manually!
    Certificate information:
     - Hostname: svnmir.ysv.FreeBSD.org
     - Valid: from Fri, 24 Aug 2012 22:04:04 GMT until Sat, 24 Aug 2013 22:04:04 GMT
     - Issuer: clusteradm, FreeBSD.org, CA, US
     - Fingerprint: 79:35:8f:ca:6d:34:d9:30:44:d1:00:af:33:4d:e6:11:44:4d:15:ec
    (R)eject, accept (t)emporarily or accept (p)ermanently?

Vergleichen Sie den Fingerabdruck mit dem in der obigen Tabelle. Wenn
der Fingerabdruck ?bereinstimmt, kann das Sicherheitszertifikat des
Server zeitweise oder dauerhaft akzeptiert werden. Ein tempor?res
Zertifikat wird nach einer einzigen Sitzung mit dem Server ablaufen, und
die ?berpr?fung wird bei der n?chsten Verbindung wiederholt werden.
Akzeptieren Sie das Zertifikat dauerhaft, werden die
Authentifizierungsinformationen in ``~/.subversion/auth`` gespeichert,
und der Benutzer wird nicht wieder gefragt den Fingerabdruck zu pr?fen,
solange bis das Zertifikat abgelaufen ist.

Wenn HTTPS aufgrund von Firewall- oder anderen Problemen nicht verwendet
werden kann, dann ist ``SVN`` die n?chste Wahl. Sollte beides nicht
verf?gbar sein, nutzen Sie HTTP

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+--------------------------------+---------------------------------------+
| `Zur?ck <svn.html>`__?          | `Nach oben <mirrors.html>`__   | ?\ `Weiter <cvsup.html>`__            |
+---------------------------------+--------------------------------+---------------------------------------+
| A.6. Benutzen von Subversion?   | `Zum Anfang <index.html>`__    | ?A.8. Benutzen von CVSup (veraltet)   |
+---------------------------------+--------------------------------+---------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
