=======================
28.10.?Mail User Agents
=======================

.. raw:: html

   <div class="navheader">

28.10.?Mail User Agents
`Prev <SMTP-Auth.html>`__?
Chapter?28.?Electronic Mail
?\ `Next <mail-fetchmail.html>`__

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

28.10.?Mail User Agents
-----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Marc Silver.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A MUA is an application that is used to send and receive email. As email
“evolves” and becomes more complex, MUAs are becoming increasingly
powerful and provide users increased functionality and flexibility. The
``mail`` category of the FreeBSD Ports Collection contains numerous
MUAs. These include graphical email clients such as Evolution or Balsa
and console based clients such as mutt or alpine.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

28.10.1.?\ ``mail``
~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__ is
the default MUA installed with FreeBSD. It is a console based MUA that
offers the basic functionality required to send and receive text-based
email. It provides limited attachment support and can only access local
mailboxes.

Although ``mail`` does not natively support interaction with POP or IMAP
servers, these mailboxes may be downloaded to a local ``mbox`` using an
application such as fetchmail.

In order to send and receive email, run ``mail``:

.. code:: screen

    % mail

The contents of the user's mailbox in ``/var/mail`` are automatically
read by ``mail``. Should the mailbox be empty, the utility exits with a
message indicating that no mail could be found. If mail exists, the
application interface starts, and a list of messages will be displayed.
Messages are automatically numbered, as can be seen in the following
example:

.. code:: screen

    Mail version 8.1 6/6/93.  Type ? for help.
    "/var/mail/marcs": 3 messages 3 new
    >N  1 root@localhost        Mon Mar  8 14:05  14/510   "test"
     N  2 root@localhost        Mon Mar  8 14:05  14/509   "user account"
     N  3 root@localhost        Mon Mar  8 14:05  14/509   "sample"

Messages can now be read by typing **t** followed by the message number.
This example reads the first email:

.. code:: screen

    & t 1
    Message 1:
    From root@localhost  Mon Mar  8 14:05:52 2004
    X-Original-To: marcs@localhost
    Delivered-To: marcs@localhost
    To: marcs@localhost
    Subject: test
    Date: Mon,  8 Mar 2004 14:05:52 +0200 (SAST)
    From: root@localhost (Charlie Root)

    This is a test message, please reply if you receive it.

As seen in this example, the message will be displayed with full
headers. To display the list of messages again, press **h**.

If the email requires a reply, press either **R** or **r** ``mail``
keys. **R** instructs ``mail`` to reply only to the sender of the email,
while **r** replies to all other recipients of the message. These
commands can be suffixed with the mail number of the message to reply
to. After typing the response, the end of the message should be marked
by a single **.** on its own line. An example can be seen below:

.. code:: screen

    & R 1
    To: root@localhost
    Subject: Re: test

    Thank you, I did get your email.
    .
    EOT

In order to send a new email, press **m**, followed by the recipient
email address. Multiple recipients may be specified by separating each
address with the **,** delimiter. The subject of the message may then be
entered, followed by the message contents. The end of the message should
be specified by putting a single **.** on its own line.

.. code:: screen

    & mail root@localhost
    Subject: I mastered mail

    Now I can send and receive email using mail ... :)
    .
    EOT

While using ``mail``, press **?** to display help at any time. Refer to
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__
for more help on how to use ``mail``.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__
was not designed to handle attachments and thus deals with them poorly.
Newer MUAs handle attachments in a more intelligent way. Users who
prefer to use ``mail`` may find the
`converters/mpack <http://www.freebsd.org/cgi/url.cgi?ports/converters/mpack/pkg-descr>`__
port to be of considerable use.

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

28.10.2.?mutt
~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

mutt is a powerful MUA, with many features, including:

.. raw:: html

   <div class="itemizedlist">

-  The ability to thread messages.

-  PGP support for digital signing and encryption of email.

-  MIME support.

-  Maildir support.

-  Highly customizable.

.. raw:: html

   </div>

Refer to ``http://www.mutt.org`` for more information on mutt.

mutt may be installed using the
`mail/mutt <http://www.freebsd.org/cgi/url.cgi?ports/mail/mutt/pkg-descr>`__
port. After the port has been installed, mutt can be started by issuing
the following command:

.. code:: screen

    % mutt

mutt will automatically read and display the contents of the user
mailbox in ``/var/mail``. If no mails are found, mutt will wait for
commands from the user. The example below shows mutt displaying a list
of messages:

.. raw:: html

   <div class="mediaobject">

|image0|

.. raw:: html

   </div>

To read an email, select it using the cursor keys and press **Enter**.
An example of mutt displaying email can be seen below:

.. raw:: html

   <div class="mediaobject">

|image1|

.. raw:: html

   </div>

Similar to
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__,
mutt can be used to reply only to the sender of the message as well as
to all recipients. To reply only to the sender of the email, press
**r**. To send a group reply to the original sender as well as all the
message recipients, press **g**.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

By default, mutt uses the
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ editor
for creating and replying to emails. Each user can customize this by
creating or editing the ``.muttrc`` in their home directory and setting
the ``editor`` variable or by setting the ``EDITOR`` environment
variable. Refer to ``http://www.mutt.org/`` for more information about
configuring mutt.

.. raw:: html

   </div>

To compose a new mail message, press **m**. After a valid subject has
been given, mutt will start
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ so the
email can be written. Once the contents of the email are complete, save
and quit from ``vi``. mutt will resume, displaying a summary screen of
the mail that is to be delivered. In order to send the mail, press
**y**. An example of the summary screen can be seen below:

.. raw:: html

   <div class="mediaobject">

|image2|

.. raw:: html

   </div>

mutt contains extensive help which can be accessed from most of the
menus by pressing **?**. The top line also displays the keyboard
shortcuts where appropriate.

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

28.10.3.?alpine
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

alpine is aimed at a beginner user, but also includes some advanced
features.

.. raw:: html

   <div class="warning" xmlns="">

Warning:
~~~~~~~~

alpine has had several remote vulnerabilities discovered in the past,
which allowed remote attackers to execute arbitrary code as users on the
local system, by the action of sending a specially-prepared email. While
*known* problems have been fixed, alpine code is written in an insecure
style and the FreeBSD Security Officer believes there are likely to be
other undiscovered vulnerabilities. Users install alpine at their own
risk.

.. raw:: html

   </div>

The current version of alpine may be installed using the
`mail/alpine <http://www.freebsd.org/cgi/url.cgi?ports/mail/alpine/pkg-descr>`__
port. Once the port has installed, alpine can be started by issuing the
following command:

.. code:: screen

    % alpine

The first time alpine runs, it displays a greeting page with a brief
introduction, as well as a request from the alpine development team to
send an anonymous email message allowing them to judge how many users
are using their client. To send this anonymous message, press **Enter**.
Alternatively, press **E** to exit the greeting without sending an
anonymous message. An example of the greeting page is shown below:

.. raw:: html

   <div class="mediaobject">

|image3|

.. raw:: html

   </div>

The main menu is then presented, which can be navigated using the cursor
keys. This main menu provides shortcuts for the composing new mails,
browsing mail directories, and administering address book entries. Below
the main menu, relevant keyboard shortcuts to perform functions specific
to the task at hand are shown.

The default directory opened by alpine is ``inbox``. To view the message
index, press **I**, or select the MESSAGE INDEX option shown below:

.. raw:: html

   <div class="mediaobject">

|image4|

.. raw:: html

   </div>

The message index shows messages in the current directory and can be
navigated by using the cursor keys. Highlighted messages can be read by
pressing **Enter**.

.. raw:: html

   <div class="mediaobject">

|image5|

.. raw:: html

   </div>

In the screenshot below, a sample message is displayed by alpine.
Contextual keyboard shortcuts are displayed at the bottom of the screen.
An example of one of a shortcut is **r**, which tells the MUA to reply
to the current message being displayed.

.. raw:: html

   <div class="mediaobject">

|image6|

.. raw:: html

   </div>

Replying to an email in alpine is done using the pico editor, which is
installed by default with alpine. pico makes it easy to navigate the
message and is easier for novice users to use than
`vi(1) <http://www.FreeBSD.org/cgi/man.cgi?query=vi&sektion=1>`__ or
`mail(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mail&sektion=1>`__.
Once the reply is complete, the message can be sent by pressing
**Ctrl**+**X**. alpine will ask for confirmation before sending the
message.

.. raw:: html

   <div class="mediaobject">

|image7|

.. raw:: html

   </div>

alpine can be customized using the SETUP option from the main menu.
Consult ``http://www.washington.edu/alpine/`` for more information.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------------+
| `Prev <SMTP-Auth.html>`__?   | `Up <mail.html>`__      | ?\ `Next <mail-fetchmail.html>`__   |
+------------------------------+-------------------------+-------------------------------------+
| 28.9.?SMTP Authentication?   | `Home <index.html>`__   | ?28.11.?Using fetchmail             |
+------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |image0| image:: mail/mutt1.png
.. |image1| image:: mail/mutt2.png
.. |image2| image:: mail/mutt3.png
.. |image3| image:: mail/pine1.png
.. |image4| image:: mail/pine2.png
.. |image5| image:: mail/pine3.png
.. |image6| image:: mail/pine4.png
.. |image7| image:: mail/pine5.png
