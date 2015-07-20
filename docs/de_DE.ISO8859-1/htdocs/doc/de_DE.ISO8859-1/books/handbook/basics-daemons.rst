===============================================
4.8. D?monen, Signale und Stoppen von Prozessen
===============================================

.. raw:: html

   <div class="navheader">

4.8. D?monen, Signale und Stoppen von Prozessen
`Zur?ck <basics-processes.html>`__?
Kapitel 4. Grundlagen des UNIX Betriebssystems
?\ `Weiter <shells.html>`__

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

4.8. D?monen, Signale und Stoppen von Prozessen
-----------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Wenn Sie einen Editor starten, k?nnen Sie ihn leicht bedienen und
Dateien laden. Sie k?nnen das, weil der Editor daf?r Vorsorge getroffen
hat und auf einem *Terminal* l?uft. Manche Programme erwarten keine
Eingaben von einem Benutzer und l?sen sich bei erster Gelegenheit von
ihrem Terminal. Ein Web-Server zum Beispiel verbringt den ganzen Tag
damit, auf Anfragen zu antworten und erwartet keine Eingaben von Ihnen.
Programme, die E-Mail von einem Ort zu einem anderen Ort transportieren
sind ein weiteres Beispiel f?r diesen Typ von Anwendungen.

Wir nennen diese Programme *D?monen*. D?monen stammen aus der
griechischen Mythologie und waren weder gut noch b?se. Sie waren kleine
dienstbare Geister, die meistens n?tzliche Sachen f?r die Menschheit
vollbrachten. ?hnlich wie heutzutage Web-Server und Mail-Server
n?tzliche Dienste verrichten. Seit langer Zeit ist daher das BSD
Maskottchen dieser fr?hlich aussehende D?mon mit Turnschuhen und
Dreizack.

Programme, die als D?mon laufen, werden entsprechend einer Konvention
mit einem „d“ am Ende benannt. BIND steht beispielsweise f?r Berkeley
Internet Name Domain, das tats?chlich laufende Programm hei?t aber
``named``. Der Apache Webserver wird ``httpd`` genannt, der
Druckerspool-D?mon hei?t ``lpd`` usw. Dies ist allerdings eine
Konvention und keine unumst??liche Regel: Der D?mon der Anwendung
sendmail hei?t ``sendmail`` und nicht ``maild``, wie Sie vielleicht
gedacht hatten.

Manchmal m?ssen Sie mit einem D?mon kommunizieren. Dazu verwenden Sie
*Signale*. Sie k?nnen mit einem D?monen oder jedem anderen laufenden
Prozess kommunizieren, indem Sie diesem ein Signal schicken. Sie k?nnen
verschiedene Signale verschicken – manche haben eine festgelegte
Bedeutung, andere werden von der Anwendung interpretiert. Die
Dokumentation zur fraglichen Anwendung wird erkl?ren, wie die Anwendung
Signale interpretiert. Sie k?nnen nur Signale zu Prozessen senden, die
Ihnen geh?ren. Normale Benutzer haben nicht die Berechtigung, Prozessen
anderer Benutzer mit
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
oder
`kill(2) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=2>`__
Signale zu schicken. Der Benutzer ``root`` darf jedem Prozess Signale
schicken.

In manchen F?llen wird FreeBSD Signale senden. Wenn eine Anwendung
schlecht geschrieben ist und auf Speicher zugreift, auf den sie nicht
zugreifen soll, so sendet FreeBSD dem Prozess das *Segmentation
Violation* Signal (``SIGSEGV``). Wenn eine Anwendung den
`alarm(3) <http://www.FreeBSD.org/cgi/man.cgi?query=alarm&sektion=3>`__
Systemaufruf benutzt hat, um nach einiger Zeit benachrichtigt zu werden,
bekommt sie das Alarm Signal (``SIGALRM``) gesendet.

Zwei Signale k?nnen benutzt werden, um Prozesse zu stoppen: ``SIGTERM``
und ``SIGKILL``. Mit ``SIGTERM`` fordern Sie den Prozess h?flich zum
Beenden auf. Der Prozess kann das Signal abfangen und merken, dass er
sich beenden soll. Er hat dann Gelegenheit Logdateien zu schlie?en und
die Aktion, die er vor der Aufforderung sich zu beenden durchf?hrte,
abzuschlie?en. Er kann sogar ``SIGTERM`` ignorieren, wenn er eine Aktion
durchf?hrt, die nicht unterbrochen werden darf.

``SIGKILL`` kann von keinem Prozess ignoriert werden. Das Signal l?sst
sich mit „Mich interessiert nicht, was du gerade machst, h?r sofort auf
damit!“ umschreiben. Wenn Sie einem Prozess ``SIGKILL`` schicken, dann
wird FreeBSD diesen sofort beenden`:sup:`[4]` <#ftn.idp70508240>`__.

Andere Signale, die Sie vielleicht verschicken wollen, sind ``SIGHUP``,
``SIGUSR1`` und ``SIGUSR2``. Diese Signale sind f?r allgemeine Zwecke
vorgesehen und verschiedene Anwendungen werden unterschiedlich auf diese
Signale reagieren.

Nehmen wir an, Sie haben die Konfiguration Ihres Webservers ver?ndert
und m?chten dies dem Server mitteilen. Sie k?nnten den Server nat?rlich
stoppen und ``httpd`` wieder starten. Die Folge w?re eine kurze Zeit, in
der der Server nicht erreichbar ist. Die meisten D?monen lesen Ihre
Konfigurationsdatei beim Empfang eines ``SIGHUP`` neu ein. Da es keinen
Standard gibt, der vorschreibt, wie auf diese Signale zu reagieren ist,
lesen Sie bitte die Dokumentation zu dem in Frage kommenden D?mon.

Mit
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
k?nnen Sie, wie unten gezeigt, Signale verschicken.

.. raw:: html

   <div class="procedure">

.. raw:: html

   <div class="procedure-title">

Prozedur 4.1. Verschicken von Signalen

.. raw:: html

   </div>

Das folgende Beispiel zeigt, wie Sie
`inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
ein Signal schicken. Die Konfigurationsdatei von ``inetd`` ist
``/etc/inetd.conf``. Diese Konfigurationsdatei liest ``inetd`` ein, wenn
er ein ``SIGHUP`` empf?ngt.

#. Suchen Sie die Prozess-ID des Prozesses, dem Sie ein Signal schicken
   wollen. Benutzen Sie dazu
   `pgrep(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pgrep&sektion=1>`__.

   .. code:: screen

       % pgrep -l inetd
       198 inetd -wW

   Die Prozess-ID von
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   ist 198.

#. Senden Sie das Signal mit
   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__.
   Da
   `inetd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=inetd&sektion=8>`__
   unter dem Benutzer ``root`` l?uft, m?ssen Sie zuerst mit
   `su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__
   ``root`` werden:

   .. code:: screen

       % su
       Password:
       # /bin/kill -s HUP 198

   `kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
   wird, wie andere Kommandos von UNIX? Systemen auch, keine Ausgabe
   erzeugen, wenn das Kommando erfolgreich war. Wenn Sie versuchen,
   einem Prozess, der nicht Ihnen geh?rt, ein Signal zu senden, dann
   werden Sie die Meldung kill: *``PID``*: Operation not permitted
   sehen. Wenn Sie sich bei der Eingabe der PID vertippen, werden Sie
   das Signal dem falschen Prozess schicken, was schlecht sein kann.
   Wenn Sie Gl?ck haben, existiert der Prozess nicht und Sie werden mit
   der Ausgabe kill: *``PID``*: No such process belohnt.

   .. raw:: html

      <div class="note" xmlns="">

   Warum soll ich ``/bin/kill`` benutzen?:
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

   Viele Shells stellen ``kill`` als internes Kommando zur Verf?gung,
   das hei?t die Shell sendet das Signal direkt, anstatt ``/bin/kill``
   zu starten. Das kann n?tzlich sein, aber die unterschiedlichen Shells
   benutzen eine verschiedene Syntax, um die Namen der Signale
   anzugeben. Anstatt jede Syntax zu lernen, kann es einfacher sein,
   ``/bin/kill         ...`` direkt aufzurufen.

   .. raw:: html

      </div>

.. raw:: html

   </div>

Andere Signale senden Sie auf die gleiche Weise, ersetzen Sie nur
``TERM`` oder ``KILL`` entsprechend.

.. raw:: html

   <div class="important" xmlns="">

Wichtig:
~~~~~~~~

Es kann gravierende Auswirkungen haben, wenn Sie zuf?llig Prozesse
beenden. Insbesondere
`init(8) <http://www.FreeBSD.org/cgi/man.cgi?query=init&sektion=8>`__
mit der Prozess-ID ist ein Spezialfall. Mit ``/bin/kill -s KILL 1``
k?nnen Sie Ihr System schnell herunterfahren. ?berpr?fen Sie die
Argumente von
`kill(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kill&sektion=1>`__
*immer* zweimal *bevor* Sie **Return** dr?cken.

.. raw:: html

   </div>

.. raw:: html

   <div class="footnotes">

--------------

.. raw:: html

   <div id="ftn.idp70508240" class="footnote">

`:sup:`[4]` <#idp70508240>`__ Das stimmt nicht ganz: Es gibt F?lle, in
denen ein Prozess nicht unterbrochen werden kann. Wenn der Prozesss zum
Beispiel eine Datei von einem anderen Rechner auf dem Netzwerk liest und
dieser Rechner aus irgendwelchen Gr?nden nicht erreichbar ist
(ausgeschaltet, oder ein Netzwerkfehler), dann ist der Prozess nicht zu
unterbrechen. Wenn der Prozess den Lesezugriff nach einem Timeout von
typischerweise zwei Minuten aufgibt, dann wird er beendet.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+-------------------------------+-------------------------------+
| `Zur?ck <basics-processes.html>`__?   | `Nach oben <basics.html>`__   | ?\ `Weiter <shells.html>`__   |
+---------------------------------------+-------------------------------+-------------------------------+
| 4.7. Prozesse?                        | `Zum Anfang <index.html>`__   | ?4.9. Shells                  |
+---------------------------------------+-------------------------------+-------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
