=====================================================================================
12.15. Kennzeichnen eines Ports zur Entfernung durch DEPRECATED oder EXPIRATION\_DATE
=====================================================================================

.. raw:: html

   <div class="navheader">

12.15. Kennzeichnen eines Ports zur Entfernung durch ``DEPRECATED`` oder
``EXPIRATION_DATE``
`Zur?ck <dads-noinstall.html>`__?
Kapitel 12. Was man machen respektive vermeiden sollte
?\ `Weiter <dads-dot-error.html>`__

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

12.15. Kennzeichnen eines Ports zur Entfernung durch ``DEPRECATED`` oder ``EXPIRATION_DATE``
--------------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Denken Sie bitte daran, dass ``BROKEN`` und ``FORBIDDEN`` nur als
tempor?rer Ausweg verwendet werden sollten, wenn ein Port nicht
funktioniert. Dauerhaft defekte Ports sollten komplett aus der
Ports-Sammlung entfernt werden.

Wenn es sinnvoll ist, k?nnen Benutzer vor der anstehenden Entfernung
eines Ports mit ``DEPRECATED`` und ``EXPIRATION_DATE`` gewarnt werden.
Ersteres ist einfach eine Zeichenkette, die angibt, warum der Port
entfernt werden soll. Letzteres ist eine Zeichenkette im ISO 8601-Format
(JJJJ-MM-TT). Beides wird dem Benutzer gezeigt.

Es ist m?glich ``DEPRECATED`` ohne ``EXPIRATION_DATE`` zu setzen (zum
Beispiel, um eine neuere Version des Ports zu empfehlen), aber das
Gegenteil ist sinnlos.

Es gibt keine Vorschrift wie lange die Vorwarnzeit sein muss.
Gegenw?rtig ist es ?blich einen Monat f?r sicherheitsrelevante Probleme
und zwei Monate f?r Build-Probleme anzusetzen. Dies gibt allen
interessierten Committern ein wenig Zeit die Probleme zu beheben.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------------------------------------------------------------+-------------------------------------+-----------------------------------------------------------------+
| `Zur?ck <dads-noinstall.html>`__?                                                                      | `Nach oben <porting-dads.html>`__   | ?\ `Weiter <dads-dot-error.html>`__                             |
+--------------------------------------------------------------------------------------------------------+-------------------------------------+-----------------------------------------------------------------+
| 12.14. Einen Port durch ``BROKEN``, ``FORBIDDEN`` oder ``IGNORE`` als nicht installierbar markieren?   | `Zum Anfang <index.html>`__         | ?12.16. Vermeiden Sie den Gebrauch des ``.error``-Konstruktes   |
+--------------------------------------------------------------------------------------------------------+-------------------------------------+-----------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
