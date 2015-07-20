============================
12.17. Verwendung von sysctl
============================

.. raw:: html

   <div class="navheader">

12.17. Verwendung von ``sysctl``
`Zur?ck <dads-dot-error.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-rerolling-distfiles.html>`__

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

12.17. Verwendung von ``sysctl``
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Vom Gebrauch von sysctl wird, au?er in Targets, abgeraten. Das liegt
daran, dass die Auswertung aller ``makevar``\ s, wie sie w?hrend
``make index`` verwendet werden, dann den Befehl ausf?hren muss, welches
den Prozess weiter verlangsamt.

Die Verwendung von
`sysctl(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sysctl&sektion=8>`__
sollte immer durch die Variable ``SYSCTL`` erfolgen, da diese den
vollst?ndigen Pfad enth?lt und ?berschrieben werden kann, so dies als
notwendig erachtet wird.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------------------------------+-------------------------------------+-------------------------------------------------+
| `Zur?ck <dads-dot-error.html>`__?                               | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-rerolling-distfiles.html>`__   |
+-----------------------------------------------------------------+-------------------------------------+-------------------------------------------------+
| 12.16. Vermeiden Sie den Gebrauch des ``.error``-Konstruktes?   | `Zum Anfang <index.html>`__         | ?12.18. Erneutes Ausliefern von Distfiles       |
+-----------------------------------------------------------------+-------------------------------------+-------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
