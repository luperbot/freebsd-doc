=============================
30.11. SMTP-Authentifizierung
=============================

.. raw:: html

   <div class="navheader">

30.11. SMTP-Authentifizierung
`Zur?ck <SMTP-dialup.html>`__?
Kapitel 30. Elektronische Post (E-Mail)
?\ `Weiter <mail-agents.html>`__

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

30.11. SMTP-Authentifizierung
-----------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Geschrieben von James Gorham.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ein Mail-Server, der SMTP-Authentifizierung verwendet, bietet einige
Vorteile. Die erforderliche Authentifizierung erh?ht die Sicherheit von
sendmail und Benutzer, die auf wechselnden entfernten Rechnern arbeiten,
k?nnen denselben Mail-Server verwenden ohne Ihr Benutzerprogramm jedes
Mal neu zu konfigurieren.

.. raw:: html

   <div class="procedure">

#. Installieren Sie den Port
   `security/cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2/pkg-descr>`__.
   Der Port verf?gt ?ber einige Optionen, die w?hrend der ?bersetzung
   festgelegt werden. F?r die in diesem Abschnitt beschriebene Methode
   zur SMTP-Authentifizierung muss die Option ``LOGIN`` aktiviert
   werden.

#. Editieren Sie nach der Installation von
   `security/cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2/pkg-descr>`__
   die Datei ``/usr/local/lib/sasl2/Sendmail.conf`` (erstellen Sie die
   Datei, wenn sie nicht existiert) und f?gen Sie die folgende Zeile
   hinzu:

   .. code:: programlisting

       pwcheck_method: saslauthd

#. Danach installieren Sie den Port
   `security/cyrus-sasl2-saslauthd <http://www.freebsd.org/cgi/url.cgi?ports/security/cyrus-sasl2-saslauthd/pkg-descr>`__,
   und f?gen die folgende Zeile in ``/etc/rc.conf`` ein:

   .. code:: programlisting

       saslauthd_enable="YES"

   Zuletzt m?ssen Sie noch den saslauthd-Daemon starten:

   .. code:: screen

       # /usr/local/etc/rc.d/saslauthd start

   Dieser Daemon agiert als Broker zwischen sendmail und Ihrer
   FreeBSD-\ ``passwd``-Datenbank. Dadurch m?ssen zum Versenden von
   E-Mails keine zus?tzlichen Accounts und Passw?rter angelegt werden.
   Die Benutzer verwenden dasselbe Passwort zum Anmelden wie zum
   Verschicken von E-Mails.

#. F?gen Sie jetzt in ``/etc/make.conf`` die nachstehenden Zeilen hinzu:

   .. code:: programlisting

       SENDMAIL_CFLAGS=-I/usr/local/include/sasl -DSASL
       SENDMAIL_LDFLAGS=-L/usr/local/lib
       SENDMAIL_LDADD=-lsasl2

   Beim ?bersetzen von sendmail werden damit die
   `cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl2/pkg-descr>`__-Bibliotheken
   benutzt. Stellen Sie daher vor dem ?bersetzen von sendmail sicher,
   dass der Port
   `cyrus-sasl2 <http://www.freebsd.org/cgi/url.cgi?ports/cyrus-sasl2/pkg-descr>`__
   installiert ist.

#. ?bersetzen Sie sendmail mit den nachstehenden Kommandos:

   .. code:: screen

       # cd /usr/src/lib/libsmutil
       # make cleandir && make obj && make
       # cd /usr/src/lib/libsm
       # make cleandir && make obj && make
       # cd /usr/src/usr.sbin/sendmail
       # make cleandir && make obj && make && make install

   sendmail sollte sich ohne Probleme ?bersetzen lassen, wenn die
   Dateien in ``/usr/src`` nicht ver?ndert wurden und die ben?tigten
   Bibliotheken installiert sind.

#. Nachdem Sie sendmail installiert haben, editieren Sie
   ``/etc/mail/freebsd.mc`` beziehungsweise die verwendete
   ``.mc``-Datei. Viele Administratoren verwenden die Ausgabe von
   `hostname(1) <http://www.FreeBSD.org/cgi/man.cgi?query=hostname&sektion=1>`__,
   um der ``.mc``-Datei einen eindeutigen Namen zu geben. F?gen Sie die
   folgenden Zeilen in die ``.mc``-Datei ein:

   .. code:: programlisting

       dnl set SASL options
       TRUST_AUTH_MECH(`GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl
       define(`confAUTH_MECHANISMS', `GSSAPI DIGEST-MD5 CRAM-MD5 LOGIN')dnl

   Diese Anweisungen konfigurieren die Methoden, die sendmail zur
   Authentifizierung verwendet. Lesen Sie die mitgelieferte
   Dokumentation, wenn Sie eine andere Methode als ``pwcheck`` verwenden
   wollen.

#. Abschlie?end rufen Sie
   `make(1) <http://www.FreeBSD.org/cgi/man.cgi?query=make&sektion=1>`__
   im Verzeichnis ``/etc/mail`` auf. Damit wird aus der ``.mc``-Datei
   eine neue ``.cf``-Datei (zum Beispiel ``freebsd.cf``) erzeugt. Das
   Kommando ``make install restart`` installiert die Datei nach
   ``/etc/mail/sendmail.cf`` und startet sendmail neu. Weitere
   Informationen entnehmen Sie bitte ``/etc/mail/Makefile``.

.. raw:: html

   </div>

Wenn alles funktioniert hat, tragen Sie in Ihrem Mail-Benutzerprogramm
das Passwort f?r die Authentifizierung ein und versenden Sie zum Testen
eine E-Mail. Wenn Sie Probleme haben, setzen Sie den ``LogLevel`` von
sendmail auf ``13`` und untersuchen die Fehlermeldungen in
``/var/log/maillog``.

Weitere Information erhalten Sie im WWW auf der `Webseite von
sendmail <http://www.sendmail.org/~ca/email/auth.html>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-------------------------------+------------------------------------+
| `Zur?ck <SMTP-dialup.html>`__?             | `Nach oben <mail.html>`__     | ?\ `Weiter <mail-agents.html>`__   |
+--------------------------------------------+-------------------------------+------------------------------------+
| 30.10. E-Mail ?ber Einwahl-Verbindungen?   | `Zum Anfang <index.html>`__   | ?30.12. E-Mail-Programme           |
+--------------------------------------------+-------------------------------+------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
