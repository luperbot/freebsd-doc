=========================
19.15. Dateisystem-Quotas
=========================

.. raw:: html

   <div class="navheader">

19.15. Dateisystem-Quotas
`Zur?ck <snapshots.html>`__?
Kapitel 19. Speichermedien
?\ `Weiter <disks-encrypting.html>`__

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

19.15. Dateisystem-Quotas
-------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quotas sind eine optionale Funktion des Betriebssystems, die es Ihnen
erlauben, den Plattenplatz und/oder die Anzahl der Dateien eines
Benutzers oder der Mitglieder einer Gruppe, auf Dateisystemebene zu
beschr?nken. Oft wird dies auf Timesharing-Systemen
(Mehrbenutzersystemen) genutzt, da es dort erw?nscht ist, die
Ressourcen, die ein Benutzer oder eine Gruppe von Benutzern belegen
k?nnen, zu limitieren. Das verhindert, dass ein Benutzer oder eine
Gruppe von Benutzern den ganzen verf?gbaren Plattenplatz belegt.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

19.15.1. Konfiguration des Systems, um Quotas zu aktivieren
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Bevor Quotas benutzt werden k?nnen, m?ssen sie im Kernel konfiguriert
werden, wozu die folgende Zeile der Kernelkonfiguration hinzugef?gt
wird:

.. code:: programlisting

    options QUOTA

Im gew?hnlichen ``GENERIC`` Kernel sind Quotas nicht aktiviert, so dass
Sie einen angepassten Kernel konfigurieren und bauen m?ssen, um Quotas
zu benutzen. Weitere Informationen finden Sie in `Kapitel?9,
*Konfiguration des FreeBSD-Kernels* <kernelconfig.html>`__.

Durch Hinzuf?gen der folgenden Zeile in ``/etc/rc.conf`` wird das
Quota-System in FreeBSD?7.X und ?ltere aktiviert:

.. code:: programlisting

    enable_quotas="YES"

Seit FreeBSD?8.0-RELEASE und dessen Nachfolger f?gen Sie stattdessen die
folgende Zeile hinzu:

.. code:: programlisting

    quota_enable="YES"

Um den Start des Quota-Systems zu beeinflussen, steht eine weitere
Variable zur Verf?gung. Normalerweise wird beim Booten die Integrit?t
der Quotas auf allen Dateisystemen mit
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__
?berpr?ft.
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__
stellt sicher, dass die Quota-Datenbank mit den Daten auf einem
Dateisystem ?bereinstimmt. Dies ist allerdings ein sehr zeitraubender
Prozess, der die Zeit, die das System zum Booten braucht, signifikant
beeinflusst. Eine Variable in ``/etc/rc.config`` erlaubt es Ihnen,
diesen Schritt zu ?berspringen:

.. code:: programlisting

    check_quotas="NO"

Schlie?lich m?ssen Sie noch in ``/etc/fstab`` die Plattenquotas auf
Dateisystemebene aktivieren. Dort k?nnen Sie f?r alle Dateisysteme
Quotas f?r Benutzer, Gruppen oder f?r beide aktivieren.

Um Quotas pro Benutzer f?r ein Dateisystem zu aktivieren, geben Sie f?r
dieses Dateisystem die Option ``userquota`` im Feld Optionen von
``/etc/fstab`` an. Beispiel:

.. code:: programlisting

    /dev/da1s2g   /home    ufs rw,userquota 1 2

Um Quotas f?r Gruppen einzurichten, verwenden Sie ``groupquota``
anstelle von ``userquota``. Um Quotas f?r Benutzer und Gruppen
einzurichten, ?ndern Sie den Eintrag wie folgt ab:

.. code:: programlisting

    /dev/da1s2g    /home    ufs rw,userquota,groupquota 1 2

Die Quotas werden jeweils im Rootverzeichnis des Dateisystems unter dem
Namen ``quota.user`` f?r Benutzer-Quotas und ``quota.group`` f?r
Gruppen-Quotas abgelegt. Obwohl
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
beschreibt, dass diese Dateien an anderer Stelle gespeichert werden
k?nnen, wird das nicht empfohlen, da es den Anschein hat, dass die
verschiedenen Quota-Utilities das nicht richtig unterst?tzen.

Jetzt sollten Sie Ihr System mit dem neuen Kernel booten. ``/etc/rc``
wird dann automatisch die richtigen Kommandos aufrufen, die die
Quota-Dateien f?r alle Quotas, die Sie in ``/etc/fstab`` definiert
haben, anlegen. Deshalb m?ssen vorher auch keine leeren Quota-Dateien
angelegt werden.

Normalerweise brauchen Sie die Kommandos
`quotacheck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotacheck&sektion=8>`__,
`quotaon(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaon&sektion=8>`__
oder
`quotaoff(8) <http://www.FreeBSD.org/cgi/man.cgi?query=quotaoff&sektion=8>`__
nicht h?ndisch aufzurufen, obwohl Sie vielleicht die entsprechenden
Seiten im Manual lesen sollten, um sich mit ihnen vertraut zu machen.

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

19.15.2. Setzen von Quota-Limits
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Nachdem Sie Quotas in Ihrem System aktiviert haben, sollten Sie
?berpr?fen, dass Sie auch tats?chlich aktiviert sind. F?hren Sie dazu
einfach den folgenden Befehl aus:

.. code:: screen

    # quota -v

F?r jedes Dateisystem, auf dem Quotas aktiviert sind, sollten Sie eine
Zeile mit der Plattenauslastung und den aktuellen Quota-Limits sehen.

Mit
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__
k?nnen Sie nun Quota-Limits setzen.

Sie haben mehrere M?glichkeiten, die Limits f?r den Plattenplatz, den
ein Benutzer oder eine Gruppe verbrauchen kann, oder die Anzahl der
Dateien, die angelegt werden d?rfen, festzulegen. Die Limits k?nnen auf
dem Plattenplatz (Block-Quotas) oder der Anzahl der Dateien
(Inode-Quotas) oder einer Kombination von beiden basieren. Jedes dieser
Limits wird weiterhin in zwei Kategorien geteilt: Hardlimits und
Softlimits.

Ein Hardlimit kann nicht ?berschritten werden. Hat der Benutzer einmal
ein Hardlimit erreicht, so kann er auf dem betreffenden Dateisystem
keinen weiteren Platz mehr beanspruchen. Hat ein Benutzer beispielsweise
ein Hardlimit von 500 Kilobytes auf einem Dateisystem und benutzt davon
490 Kilobyte, so kann er nur noch 10 weitere Kilobytes beanspruchen. Der
Versuch, weitere 11 Kilobytes zu beanspruchen, wird fehlschlagen.

Im Gegensatz dazu k?nnen Softlimits f?r eine befristete Zeit
?berschritten werden. Diese Frist betr?gt in der Grundeinstellung eine
Woche. Hat der Benutzer das Softlimit ?ber die Frist hinaus
?berschritten, so wird das Softlimit in ein Hardlimit umgewandelt und
der Benutzer kann keinen weiteren Platz mehr beanspruchen. Wenn er
einmal das Softlimit unterschreitet, wird die Frist wieder
zur?ckgesetzt.

Das folgende Beispiel zeigt die Benutzung von
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.
Wenn
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__
aufgerufen wird, wird der Editor gestartet, der durch ``EDITOR`` gegeben
ist oder vi falls ``EDITOR`` nicht gesetzt ist. In dem Editor k?nnen Sie
die Limits eingeben.

.. code:: screen

    # edquota -u test

.. code:: programlisting

    Quotas for user test:
    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)
            inodes in use: 7, limits (soft = 50, hard = 60)
    /usr/var: kbytes in use: 0, limits (soft = 50, hard = 75)
            inodes in use: 0, limits (soft = 50, hard = 60)

F?r jedes Dateisystem, auf dem Quotas aktiv sind, sehen Sie zwei Zeilen,
eine f?r die Block-Quotas und die andere f?r die Inode-Quotas. Um ein
Limit zu modifizieren, ?ndern Sie einfach den angezeigten Wert. Um
beispielsweise das Blocklimit dieses Benutzers von einem Softlimit von
50 und einem Hardlimit von 75 auf ein Softlimit von 500 und ein
Hardlimit von 600 zu erh?hen, ?ndern Sie die Zeile

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 50, hard = 75)

zu:

.. code:: programlisting

    /usr: kbytes in use: 65, limits (soft = 500, hard = 600)

Die neuen Limits sind wirksam, wenn Sie den Editor verlassen.

Manchmal ist es erw?nscht, die Limits f?r einen Bereich von UIDs zu
setzen. Dies kann mit der ``-p`` Option von
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__
bewerkstelligt werden. Weisen Sie dazu die Limits einem Benutzer zu und
rufen danach ``edquota -p protouser startuid-enduid`` auf. Besitzt
beispielsweise der Benutzer ``test`` die gew?nschten Limits, k?nnen
diese mit dem folgenden Kommando f?r die UIDs 10.000 bis 19.999
dupliziert werden:

.. code:: screen

    # edquota -p test 10000-19999

Weitere Informationen erhalten Sie in
`edquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=edquota&sektion=8>`__.

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

19.15.3. ?berpr?fen von Quota-Limits und Plattennutzung
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Sie k?nnen
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
oder
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__
benutzen, um Quota-Limits und Plattennutzung zu ?berpr?fen. Um die
Limits oder die Plattennutzung individueller Benutzer und Gruppen zu
?berpr?fen, kann
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
benutzt werden. Ein Benutzer kann nur die eigenen Quotas und die Quotas
der Gruppe, der er angeh?rt untersuchen. Nur der Superuser darf sich
alle Limits ansehen. Mit
`repquota(8) <http://www.FreeBSD.org/cgi/man.cgi?query=repquota&sektion=8>`__
erhalten Sie eine Zusammenfassung von allen Limits und der
Plattenausnutzung f?r alle Dateisysteme, auf denen Quotas aktiv sind.

Das folgende Beispiel zeigt die Ausgabe von ``quota -v`` f?r einen
Benutzer, der Quota-Limits auf zwei Dateisystemen besitzt:

.. code:: programlisting

    Disk quotas for user test (uid 1002):
         Filesystem  usage   quota   limit   grace   files   quota   limit   grace
               /usr      65*     50      75   5days       7      50      60
           /usr/var       0      50      75               0      50      60

Im Dateisystem ``/usr`` liegt der Benutzer momentan 15 Kilobytes ?ber
dem Softlimit von 50 Kilobytes und hat noch 5 Tage seiner Frist ?brig.
Der Stern ``*`` zeigt an, dass der Benutzer sein Limit ?berschritten
hat.

In der Ausgabe von
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
werden Dateisysteme, auf denen ein Benutzer keinen Platz verbraucht,
nicht angezeigt, auch wenn diesem Quotas zugewiesen wurden. Mit ``-v``
werden diese Dateisysteme, wie ``/usr/var`` im obigen Beispiel,
angezeigt.

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

19.15.4. Quotas ?ber NFS
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Quotas werden von dem Quota-Subsystem auf dem NFS Server erzwungen. Der
`rpc.rquotad(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rpc.rquotad&sektion=8>`__
D?mon stellt
`quota(1) <http://www.FreeBSD.org/cgi/man.cgi?query=quota&sektion=1>`__
die Quota Informationen auf dem NFS Client zur Verf?gung, so dass
Benutzer auf diesen Systemen ihre Quotas abfragen k?nnen.

Aktivieren Sie ``rpc.rquotad`` in ``/etc/inetd.conf`` wie folgt:

.. code:: programlisting

    rquotad/1      dgram rpc/udp wait root /usr/libexec/rpc.rquotad rpc.rquotad

Anschlie?end starten Sie ``inetd`` neu:

.. code:: screen

    # service inetd restart

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+-----------------------------------------+
| `Zur?ck <snapshots.html>`__?               | `Nach oben <disks.html>`__    | ?\ `Weiter <disks-encrypting.html>`__   |
+--------------------------------------------+-------------------------------+-----------------------------------------+
| 19.14. Schnappsch?sse von Dateisystemen?   | `Zum Anfang <index.html>`__   | ?19.16. Partitionen verschl?sseln       |
+--------------------------------------------+-------------------------------+-----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
