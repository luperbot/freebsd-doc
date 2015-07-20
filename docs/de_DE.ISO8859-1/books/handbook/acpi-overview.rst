========================================
12.16. Energie- und Ressourcenverwaltung
========================================

.. raw:: html

   <div class="navheader">

12.16. Energie- und Ressourcenverwaltung
`Zur?ck <adding-swap-space.html>`__?
Kapitel 12. Konfiguration und Tuning
?\ `Weiter <ACPI-debug.html>`__

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

12.16. Energie- und Ressourcenverwaltung
----------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Verfasst von Hiten Pandya und Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Es ist wichtig, Hardware effizient einzusetzen. Vor der Einf?hrung des
*Advanced Configuration and Power Interface* (ACPI) konnten
Stromverbrauch und W?rmeabgabe eines Systems nur schlecht von
Betriebssystemen gesteuert werden. Die Hardware wurde vom BIOS
gesteuert, was die Kontrolle der Energieverwaltung f?r den Anwender
erschwerte. Das *Advanced Power Management (APM)* erlaubte es lediglich,
einige wenige Funktionen zu steuern, obwohl die ?berwachung von Energie-
und Ressourcenverbrauch zu den wichtigsten Aufgaben eines
Betriebssystems geh?rt, um auf verschiedene Ereignisse, beispielsweise
einen unerwarteten Temperaturanstieg, reagieren k?nnen.

Dieser Abschnitt erkl?rt das Advanced Configuration and Power Interface
(ACPI).

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

12.16.1. Was ist ACPI?
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Advanced Configuration and Power Interface (ACPI) ist ein Standard
verschiedener Hersteller, der die Verwaltung von Hardware und
Energiesparfunktionen festlegt. Die ACPI-Funktionen k?nnen von einem
Betriebssystem gesteuert werden. Der Vorg?nger des ACPI, „Advanced Power
Management“ (APM), erwies sich in modernen Systemen als unzureichend.

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

12.16.2. M?ngel des Advanced Power Managements (APM)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das *Advanced Power Management (APM)* steuert den Energieverbrauch eines
Systems auf Basis der Systemaktivit?t. Das APM-BIOS wird von dem
Hersteller des Systems zur Verf?gung gestellt und ist auf die spezielle
Hardware angepasst. Der APM-Treiber des Betriebssystems greift auf das
*APM Software Interface* zu, das den Energieverbrauch regelt. APM findet
sich in der Regel nur noch in Systemen, die vor 2001 produziert wurden.

Das APM hat haupts?chlich vier Probleme. Erstens l?uft die
Energieverwaltung unabh?ngig vom Betriebssystem in einem
(herstellerspezifischen) BIOS. Beispielsweise kann das APM-BIOS die
Festplatten nach einer konfigurierbaren Zeit ohne die Zustimmung des
Betriebssystems herunterfahren. Zweitens befindet sich die ganze
APM-Logik im BIOS; das Betriebssystem hat gar keine APM-Komponenten. Bei
Problemen mit dem APM-BIOS muss das Flash-ROM aktualisiert werden. Diese
Prozedur ist gef?hrlich, da sie im Fehlerfall das System unbrauchbar
machen kann. Zum Dritten ist APM eine Technik, die herstellerspezifisch
ist und nicht koordiniert wird. Fehler im BIOS eines Herstellers werden
nicht unbedingt im BIOS anderer Hersteller korrigiert. Das letzte
Problem ist, dass im APM-BIOS nicht gen?gend Platz vorhanden ist, um
eine durchdachte oder eine auf den Zweck der Maschine zugeschnittene
Energieverwaltung zu implementieren.

Das *Plug and Play BIOS (PNPBIOS)* war ebenfalls unzureichend. Das
PNPBIOS verwendet eine 16-Bit-Technik. Damit das Betriebssystem das
PNPBIOS ansprechen kann, muss es in einer 16-Bit-Emulation laufen.

Der APM-Treiber von FreeBSD ist in der Hilfeseite
`apm(4) <http://www.FreeBSD.org/cgi/man.cgi?query=apm&sektion=4>`__
beschrieben.

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

12.16.3. Konfiguration des ACPI
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Das Modul ``acpi.ko`` wird standardm??ig beim Systemstart vom
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__
geladen und sollte daher *nicht* fest in den Kernel eingebunden werden.
Dadurch kann ``acpi.ko`` ohne einen Neubau des Kernels ersetzt werden
und das Modul ist leichter zu testen. Wenn Sie in der Ausgabe von
`dmesg(8) <http://www.FreeBSD.org/cgi/man.cgi?query=dmesg&sektion=8>`__
das Wort ACPI sehen, ist das Modul geladen worden. Das ACPI-Modul im
laufenden Betrieb zu laden, f?hrt oft nicht zum gew?nschten Ergebnis.
Treten bei Ihrem System Probleme auf, k?nnen Sie ACPI auch komplett
deaktivieren. Dazu definieren Sie die Variable
``hint.acpi.0.disabled="1"`` in der Datei ``/boot/loader.conf``.
Alternativ k?nnen Sie die Variable auch am
`loader(8) <http://www.FreeBSD.org/cgi/man.cgi?query=loader&sektion=8>`__-Prompt
eingeben. Das Modul kann im laufenden Betrieb nicht entfernt werden, da
es zur Kommunikation mit der Hardware verwendet wird.

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

ACPI und APM k?nnen nicht zusammen verwendet werden. Das zuletzt
geladene Modul beendet sich, sobald es bemerkt, dass das andere Modul
geladen ist.

.. raw:: html

   </div>

Mit
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8>`__
k?nnen Sie das System in einen Ruhemodus (*sleep mode*) versetzen. Es
gibt verschiedene Modi (von ``1`` bis ``5``), die Sie auf der
Kommandozeile mit ``-s`` angeben k?nnen. F?r die meisten Anwender sind
die Modi ``1`` und ``3`` v?llig ausreichend. Der Modus ``5`` schaltet
das System aus (*Soft-off*) und entspricht dem folgenden Befehl:

.. code:: screen

    # halt -p

Verschiedene Optionen k?nnen als
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__-Variablen
gesetzt werden. Lesen Sie dazu die Manualpages zu
`acpi(4) <http://www.FreeBSD.org/cgi/man.cgi?query=acpi&sektion=4>`__
sowie
`acpiconf(8) <http://www.FreeBSD.org/cgi/man.cgi?query=acpiconf&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+--------------------------------------+-----------------------------------+
| `Zur?ck <adding-swap-space.html>`__?    | `Nach oben <config-tuning.html>`__   | ?\ `Weiter <ACPI-debug.html>`__   |
+-----------------------------------------+--------------------------------------+-----------------------------------+
| 12.15. Hinzuf?gen von Swap-Bereichen?   | `Zum Anfang <index.html>`__          | ?12.17. ACPI-Fehlersuche          |
+-----------------------------------------+--------------------------------------+-----------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
