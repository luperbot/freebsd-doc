=============================================
Kapitel 6. Regressions- und Performance-Tests
=============================================

.. raw:: html

   <div class="navheader">

Kapitel 6. Regressions- und Performance-Tests
`Zur?ck <policies-shlib.html>`__?
Teil?I.?Grundlagen
?\ `Weiter <ipc.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Kapitel 6. Regressions- und Performance-Tests
---------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

?bersetzt von J?rgen Lock.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Inhaltsverzeichnis

.. raw:: html

   </div>

`6.1.
Mikro-Benchmark-Checkliste <testing.html#testing-micro-benchmark>`__

.. raw:: html

   </div>

Regressions-Tests werden durchgef?hrt, um zu ?berpr?fen, ob ein
bestimmter Teil des Systems wie erwartet funktioniert, und um
sicherzustellen, dass bereits beseitigte Fehler nicht wieder eingebaut
werden.

Die FreeBSD-Regressions-Testwerkzeuge finden Sie im
FreeBSD-Quelltextbaum unter ``src/tools/regression``.

.. raw:: html

   <div class="section">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.1. Mikro-Benchmark-Checkliste
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dieser Abschnitt enth?lt Tipps, wie ordnungsgem??e Mikro-Benchmarks
unter FreeBSD oder f?r FreeBSD selbst erstellt werden.

Es ist nicht m?glich, immer alle der folgenden Vorschl?ge zu
ber?cksichtigen, aber je mehr davon, desto besser wird der Benchmark
kleine Unterschiede nachweisen k?nnen.

.. raw:: html

   <div class="itemizedlist">

-  Schalten Sie APM und alles andere, das den Systemtakt beeinflusst, ab
   (ACPI?).

-  Starten Sie in den Single-User-Modus.
   `cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
   und andere Systemdienste verursachen nur St?rungen. Genauso der
   `sshd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sshd&sektion=8>`__-Systemdienst.
   Falls w?hrend des Tests SSH-Zugriff ben?tigt wird, schalten Sie
   entweder die Neuerstellung des SSHv1-Schl?ssels ab oder beenden Sie
   den ``sshd``-Elternprozess w?hrend der Tests.

-  Beenden Sie
   `ntpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=ntpd&sektion=8>`__.

-  Falls
   `syslog(3) <http://www.FreeBSD.org/cgi/man.cgi?query=syslog&sektion=3>`__-Ereignisse
   erzeugt werden, starten Sie
   `syslogd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=syslogd&sektion=8>`__
   mit leerer ``/etc/syslogd.conf`` oder beenden Sie es.

-  Sorgen Sie f?r m?glichst wenig Disk-I/O; vermeiden Sie es ganz wenn
   m?glich.

-  H?ngen Sie keine Dateisysteme ein, die Sie nicht ben?tigen.

-  H?ngen Sie ``/``, ``/usr`` und die anderen Dateisysteme nur lesbar
   ein wenn m?glich. Dies verhindert, dass atime-Aktualisierungen auf
   der Festplatte (usw.) das Ergebnis verf?lschen.

-  Initialisieren Sie das beschreibbare Test-Dateisystem mit
   `newfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=newfs&sektion=8>`__
   neu und f?llen Sie es aus einer
   `tar(1) <http://www.FreeBSD.org/cgi/man.cgi?query=tar&sektion=1>`__-
   oder
   `dump(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dump&sektion=8>`__-Datei
   vor jedem Lauf. H?ngen Sie es aus und wieder ein, bevor Sie den Test
   starten. Dies sorgt f?r einen konsistenten Dateisystemaufbau. Bei
   einem „worldstone“-Test bezieht sich dies auf ``/usr/obj``
   (Initialisieren Sie es einfach mit ``newfs`` neu und h?ngen Sie es
   ein). Um absolut reproduzierbare Ergebnisse zu bekommen, f?llen Sie
   das Dateisystem aus einer
   `dd(1) <http://www.FreeBSD.org/cgi/man.cgi?query=dd&sektion=1>`__-Datei
   (d.h. ``dd       if=myimage of=/dev/ad0s1h       bs=1m``).

-  Benutzen Sie malloc-gest?tzte oder vorbelastete
   `md(4) <http://www.FreeBSD.org/cgi/man.cgi?query=md&sektion=4>`__-Partitionen.

-  Starten Sie zwischen den einzelnen Durchl?ufen neu, dies sichert
   einen konsistenteren Zustand.

-  Entfernen Sie alle nicht unbedingt ben?tigten Ger?tetreiber aus dem
   Kernel. Wenn z.B. USB f?r den Test nicht ben?tigt wird, entfernen Sie
   es aus dem Kernel. Ger?tetreiber, die sich Hardware zuteilen, haben
   oft „tickende“ Timeouts.

-  Konfigurieren Sie nicht Hardware, die nicht benutzt wird. Entfernen
   Sie Festplatten mit
   `atacontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=atacontrol&sektion=8>`__
   und
   `camcontrol(8) <http://www.FreeBSD.org/cgi/man.cgi?query=camcontrol&sektion=8>`__,
   wenn diese f?r den Test nicht gebraucht werden.

-  Konfigurieren Sie nicht das Netzwerk, es sei denn es wird getestet,
   oder warten Sie, bis der Test fertig ist, wenn Sie das Ergebnis auf
   einen anderen Rechner ?bertragen wollen.

   Falls das System an ein ?ffentliches Netzwerk angeschlossen sein
   muss, achten Sie auf Spitzen im Broadcast-Verkehr. Obwohl dieser kaum
   auff?llt, wird er CPU-Zyklen brauchen. ?hnliches gilt f?r Multicast.

-  Legen Sie jedes Dateisystem auf eine eigene Festplatte. Dies
   minimiert Jitter durch Optimierungen von Lesekopfbewegungen.

-  Minimieren Sie Ausgaben auf serielle oder VGA-Konsolen.
   Ausgabenumleitung in Dateien ergibt weniger Jitter (serielle Konsolen
   werden leicht zum Flaschenhals). Benutzen Sie die Tastatur nicht,
   w?hrend der Test l?uft, sogar **space** oder **back-space** wirken
   sich auf die Ergebnisse aus.

-  Stellen Sie sicher, dass der Test lang genug l?uft, aber nicht zu
   lange. Wenn er zu kurz ist, sind Zeitstempel ein Problem. Wenn er zu
   lang ist, werden Temperatur?nderungen und Drift die Frequenz von
   Quarzkristallen im Rechner beeinflussen. Daumenregel: mehr als eine
   Minute, weniger als eine Stunde.

-  Versuchen Sie, die Temperatur in der Umgebung des Rechners so stabil
   wie m?glich zu halten. Diese beeinflusst sowohl Quarzkristalle als
   auch Festplatten-Algorithmen. Um einen wirklich stabilen Takt zu
   erhalten, w?re es auch m?glich, einen stabilisierten Takt
   anzuschlie?en. D.h. besorgen Sie sich einen OCXO + PLL und koppeln
   Sie das Ausgangssignal mit den Taktgeberschaltkreisen anstelle des
   Quarzkristalls der Hauptplatine. Wenden Sie sich an Poul-Henning
   Kamp, wenn Sie mehr Informationen hier?ber ben?tigen.

-  Lassen Sie den Test mindestens drei Mal laufen, besser mehr als 20
   Mal, sowohl f?r „vor“ als auch f?r „nach“ dem Code. Versuchen Sie
   abzuwechseln (d.h. nicht erst 20 Mal „vorher“ und dann 20 Mal
   „nachher“), dies erm?glicht, umgebungsbedingte Effekte zu erkennen.
   Wechseln Sie nicht 1:1 ab, sondern 3:3; dies erlaubt,
   Wechselwirkungseffekte zu erkennen.

   Ein gutes Muster ist: ``bababa{bbbaaa}*``. Dies gibt Hinweise nach
   den ersten 1+1-L?ufen (sodass Sie den Test stoppen k?nnen, falls er
   v?llig daneben geht), Sie k?nnen die Standardabweichung nach den
   ersten 3+3-L?ufen ?berpr?fen (zeigt an, ob sich ein l?ngerer Lauf
   lohnt), sp?ter Trends und Wechselwirkungen.

-  Benutzen Sie
   `ministat(1) <http://www.FreeBSD.org/cgi/man.cgi?query=ministat&sektion=1>`__,
   um festzustellen, ob Ihre Ergebnisse signifikant sind. ?berlegen Sie
   sich, das Buch „Cartoon guide to statistics“ ISBN: 0062731025 zu
   kaufen. Es ist sehr empfehlenswert, falls Sie Dinge wie
   Standardabweichung und Studentsche t-Verteilung vergessen oder nie
   gelernt haben.

-  Benutzen Sie keinen
   Hintergrund-\ `fsck(8) <http://www.FreeBSD.org/cgi/man.cgi?query=fsck&sektion=8>`__,
   wenn Sie ihn nicht selbst testen wollen. Schalten Sie auch
   ``background_fsck`` in ``/etc/rc.conf`` aus, es sei denn der
   Benchmark wird nicht mindestens 60+„Laufzeit von ``fsck``“ Sekunden
   nach Systemstart gestartet, da
   `rc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=rc&sektion=8>`__
   startet und pr?ft, ob ``fsck`` auf irgendeinem der Dateisysteme
   laufen muss, wenn Hintergrund-\ ``fsck`` eingeschaltet ist. Stellen
   Sie ebenfalls sicher, dass keine Snapshots herumliegen, falls der
   Benchmark nicht ein Test mit Snapshots ist.

-  Falls der Benchmark unerwartet schlechte Performance zeigt,
   ?berpr?fen Sie Dinge wie gro?e Mengen Interrupts von unerwarteten
   Quellen. Es gibt Berichte, dass einige ACPI-Versionen sich „daneben
   benehmen“ und ein ?berma? an Interrupts erzeugen. Um zu helfen,
   ungew?hnliche Testergebnisse zu diagnostizieren, machen Sie ein paar
   Momentaufnahmen von ``vmstat -i`` und suchen Sie nach Ungew?hnlichem.

-  Gehen Sie mit Parametern zur Optimierung von Kernel, Userland und
   Fehlersuche vorsichtig um. Es passiert schnell, irgendetwas
   durchrutschen zu lassen und dann sp?ter festzustellen, dass der Test
   nicht das gleiche verglichen hat.

-  Erstellen Sie nie Benchmarks unter Verwendung der Kernel-Optionen
   ``WITNESS`` und ``INVARIANTS``, wenn der Test nicht diese Merkmale
   selbst untersuchen soll. ``WITNESS`` kann zu 400% und mehr
   Performance-Abnahme f?hren. ?hnliches gilt f?r
   Userland-\ `malloc(3) <http://www.FreeBSD.org/cgi/man.cgi?query=malloc&sektion=3>`__-Parameter,
   Voreinstellungen hierbei unterscheiden sich bei -CURRENT von denen
   bei Production-Releases.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+-------------------------------+----------------------------------------+
| `Zur?ck <policies-shlib.html>`__?   | `Nach oben <Basics.html>`__   | ?\ `Weiter <ipc.html>`__               |
+-------------------------------------+-------------------------------+----------------------------------------+
| 5.5. Shared-Libraries?              | `Zum Anfang <index.html>`__   | ?Teil?II.?Interprozess-Kommunikation   |
+-------------------------------------+-------------------------------+----------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
