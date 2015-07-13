====================
3.7.?Race Conditions
====================

.. raw:: html

   <div class="navheader">

3.7.?Race Conditions
`Prev <secure-trust.html>`__?
Chapter?3.?Secure Programming
?\ `Next <l10n.html>`__

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

3.7.?Race Conditions
--------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A race condition is anomalous behavior caused by the unexpected
dependence on the relative timing of events. In other words, a
programmer incorrectly assumed that a particular event would always
happen before another.

Some of the common causes of race conditions are signals, access checks,
and file opens. Signals are asynchronous events by nature so special
care must be taken in dealing with them. Checking access with
``access(2)`` then ``open(2)`` is clearly non-atomic. Users can move
files in between the two calls. Instead, privileged applications should
``seteuid()`` and then call ``open()`` directly. Along the same lines,
an application should always set a proper umask before ``open()`` to
obviate the need for spurious ``chmod()`` calls.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------+-------------------------+---------------------------------------------------------------------+
| `Prev <secure-trust.html>`__?   | `Up <secure.html>`__    | ?\ `Next <l10n.html>`__                                             |
+---------------------------------+-------------------------+---------------------------------------------------------------------+
| 3.6.?Trust?                     | `Home <index.html>`__   | ?Chapter?4.?Localization and Internationalization - L10N and I18N   |
+---------------------------------+-------------------------+---------------------------------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
