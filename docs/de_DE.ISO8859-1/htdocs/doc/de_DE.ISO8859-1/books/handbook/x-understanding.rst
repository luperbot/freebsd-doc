=================
6.2. X-Grundlagen
=================

.. raw:: html

   <div class="navheader">

6.2. X-Grundlagen
`Zur?ck <x11.html>`__?
Kapitel 6. Das X-Window-System
?\ `Weiter <x-install.html>`__

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

6.2. X-Grundlagen
-----------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Anwendern anderer grafischer Benutzeroberfl?chen, wie
Microsoft??Windows? oder Mac?OS?, kommt X beim ersten Mal oft
befremdlich vor.

Man braucht kein weitreichendes Verst?ndnis der X-Komponenten und Ihres
Zusammenspiels, um X anzuwenden. Um die St?rken von X auszunutzen,
sollten Sie allerdings die Grundlagen verstehen.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.2.1. Warum hei?t es X?
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X ist nicht die erste grafische Benutzeroberfl?che, die f?r UNIX?
geschrieben wurde. Die Entwickler von X arbeiteten vorher an einem
anderen System, das W (von engl. *window*: Fenster) hie?. X ist schlicht
der n?chste Buchstabe im Alphabet.

X wird „X“, „X-Window-System“ oder „X11“ genannt. Sagen Sie bitte nicht
„X-Windows“: das kommt bei einigen Leuten schlecht an (die Hilfeseite
`X(7) <http://www.FreeBSD.org/cgi/man.cgi?query=X&sektion=7>`__ f?hrt
dies n?her aus).

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

6.2.2. Das Client/Server-Modell von X
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

X wurde von Anfang an netzwerktransparent entworfen und verwendet ein
Client-Server-Modell. In diesem Modell l?uft der Server auf dem Rechner,
an dem die Tastatur, der Bildschirm und die Maus angeschlossen ist. Der
Server ist f?r Dinge wie die Verwaltung des Bildschirms und die
Verarbeitung von Tastatur- und Maus-Eingaben sowie anderer Ein- und
Ausgabeger?te (beispielsweise k?nnte ein „Tablet“ zur Eingabe oder ein
Videoprojektor zur Ausgabe verwendet werden) verantwortlich. Jede
X-Anwendung, beispielsweise ein XTerm oder Netscape? ist ein Client. Der
Client sendet dem Server Nachrichten wie „Zeichne an diesen Koordinaten
ein Fenster“ und der Server sendet dem Client Nachrichten der Art „Der
Benutzer hat gerade den Ok-Knopf gedr?ckt“.

In kleinen Umgebungen laufen der X-Server und die X-Clients auf
demselben Rechner. Es ist aber durchaus m?glich, den X-Server auf einem
weniger leistungsf?higen Arbeitsplatzrechner laufen zu lassen und die
X-Anwendungen (die Clients) auf dem leistungsf?higen und teuren Server
der Arbeitsgruppe zu betreiben. In diesem Fall kommunizieren der
X-Server und die X-Clients ?ber das Netz.

Dieses Modell verwirrt viele Leute, die erwarten, dass der X-Server der
dicke Rechner im Maschinenraum und der X-Client ihr Arbeitsplatzrechner
ist.

Merken Sie sich einfach, dass der X-Server der Rechner mit dem
Bildschirm und der Maus ist und die X-Clients Programme sind, die in den
Fenstern laufen.

Das X-Protokoll ist unabh?ngig vom verwendeten Betriebssystem und
Rechnertyp. Ein X-Server kann durchaus auch unter Microsoft??Windows?
oder Apples Mac?OS? betrieben werden, wie viele kostenlose und
kommerzielle Anwendungen zeigen.

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

6.2.3. Der Window-Manager
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die X-Philosophie „Werkzeuge statt Richtlinien“ ist wie die
UNIX-Philosophie. Es wird nicht vorgeschrieben, wie eine Aufgabe zu
l?sen ist, stattdessen erh?lt der Benutzer Werkzeuge, ?ber die er frei
verf?gen kann.

Dies geht so weit, dass X nicht bestimmt, wie Fenster auf dem Bildschirm
auszusehen haben, wie sie mit der Maus zu verschieben sind, welche
Tastenkombination benutzt werden muss, um zwischen den Fenstern zu
wechseln (z.B. **Alt**+**Tab** unter Microsoft??Windows?), oder ob die
Fensterrahmen Schaltfl?chen zum Schlie?en haben.

X gibt die Verantwortung f?r all diese Sachen an eine Anwendung ab, die
*Window-Manager* genannt wird. Unter X gibt es zahlreiche
Window-Manager: AfterStep, Blackbox, ctwm, Enlightenment, fvwm, Sawfish,
twm, Window Maker um nur einige zu nennen. Jeder dieser Window-Manager
sieht anders aus: Manche stellen virtuelle Bildschirme zur Verf?gung, in
anderen lassen sich die Tastenkombinationen zur Verwaltung des
Bildschirms anpassen, einige besitzen eine Startleiste oder etwas
?hnliches und in manchen l?sst sich das Aussehen und Verhalten ?ber die
Anwendung von *Themes* beliebig einstellen. Die eben genannten
Window-Manager und viele weitere finden Sie in der Kategorie ``x11-wm``
der Ports-Sammlung.

Die grafischen Benutzeroberfl?chen KDE und GNOME besitzen eigene
Window-Manager, die in den grafischen Arbeitsplatz integriert sind.

Die Window-Manager werden unterschiedlich konfiguriert. Einige erwarten
eine manuell erstellte Konfigurationsdatei, andere bieten grafische
Werkzeuge f?r die meisten Konfigurationsarbeiten an. Die
Konfigurationsdatei von Sawfish ist sogar in einem Lisp-Dialekt
geschrieben.

.. raw:: html

   <div class="note" xmlns="">

Fokus:
~~~~~~

Der Window-Manager ist f?r die Methode, mit der ein Fenster den Fokus
bekommt, verantwortlich. Jedes System, das Fenster verwendet, muss
entscheiden, wie ein Fenster aktiviert wird, damit es Eingaben empfangen
kann. Das aktive Fenster sollte zudem sichtbar gekennzeichnet werden.

Eine gel?ufige Methode, den Fokus zu wechseln, wird „click-to-focus“
genannt. Die Methode wird in Microsoft??Windows? benutzt: Ein Fenster
wird aktiv, wenn es mit der Maus angeklickt wird.

X legt nicht fest, wie der Fokus einzustellen ist, stattdessen bestimmt
der Window-Manager welches Fenster den Fokus zu einem gegebenen
Zeitpunkt erh?lt. Alle Window-Manager stellen die Methode
„click-to-focus“ bereit, die meisten stellen auch noch andere Methoden
bereit.

Verbreitete Methoden, den Fokus einzustellen, sind:

.. raw:: html

   <div class="variablelist" xmlns="http://www.w3.org/1999/xhtml">

focus-follows-mouse
    Den Fokus hat das Fenster, unter dem sich der Mauszeiger befindet.
    Das muss nicht unbedingt das Fenster, sein, das sich vorne befindet.
    Wird der Mauszeiger in ein anderes Fenster bewegt, so erh?lt dieses
    Fenster den Fokus, ohne das es angeklickt werden muss.

sloppy-focus
    Diese Methode erweitert die Methode „focus-follows-mouse“. Wenn die
    Maus mit „focus-follows-mouse“ aus dem Fenster auf die Oberfl?che
    bewegt wird, verliert das aktive Fenster den Fokus. Da dann kein
    Fenster mehr den Fokus hat, gehen alle Eingaben verloren. Die
    Methode „sloppy-focus“ wechselt den Fokus nur, wenn sich der
    Mauszeiger in ein neues Fenster bewegt und nicht, wenn er das aktive
    Fenster verl?sst.

click-to-focus
    Das aktive Fenster wird durch einen Mausklick festgelegt (dabei kann
    das Fenster vor alle anderen Fenster gesetzt werden). Alle Eingaben
    werden dann, unabh?ngig von der Position des Mauszeigers, dem
    aktiven Fenster zugeordnet.

.. raw:: html

   </div>

Viele Window-Manager unterst?tzen noch andere Methoden, so wie
Abwandlungen der hier vorgestellten Methoden. Schauen Sie sich dazu
bitte die Hilfeseiten Ihres Window-Managers an.

.. raw:: html

   </div>

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

6.2.4. Widgets
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Die X-Philosophie dehnt sich auch auf die Widgets aus, die von den
Anwendungen benutzt werden.

Ein *Widget* bezeichnet Objekte, die manipuliert werden k?nnen, wie
*buttons* (Schaltfl?chen), *check buttons* (Mehrfachauswahlknopf),
*radio buttons* (Einfachauswahlknopf), Icons und Auswahllisten. Unter
Microsoft??Windows? werden Widgets *Controls* genannt.

Microsoft??Windows? und Apples Mac?OS? geben strenge Richtlinien f?r
Widgets vor: Von den Entwicklern wird erwartet, dass Sie Anwendungen mit
einheitlichem Aussehen und einheitlicher Bedienung (*look and feel*)
entwickeln. X gibt weder einen Stil noch Widgets vor, die benutzt werden
m?ssen.

Erwarten Sie daher nicht, dass alle X-Anwendungen gleich aussehen oder
sich gleich bedienen lassen. Es gibt mehrere verbreitete
Widget-Sammlungen, beispielsweise die Athena-Widgets vom MIT, Motif?
(abgeschr?gte Ecken und drei Graut?ne, danach wurden die Widgets von
Microsoft??Windows? entworfen) oder OpenLook.

Die meisten neuen X-Anwendungen benutzen heute modern aussehende
Widgets, wie Qt, das von KDE benutzt wird oder GTK+, das von GNOME
benutzt wird. Damit wird eine gewisse Einheitlichkeit in Bedienung und
Aussehen erreicht, die sicher neuen Benutzern die Arbeit erleichtert.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+-------------------------------+----------------------------------+
| `Zur?ck <x11.html>`__?            | `Nach oben <x11.html>`__      | ?\ `Weiter <x-install.html>`__   |
+-----------------------------------+-------------------------------+----------------------------------+
| Kapitel 6. Das X-Window-System?   | `Zum Anfang <index.html>`__   | ?6.3. X11 installieren           |
+-----------------------------------+-------------------------------+----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
