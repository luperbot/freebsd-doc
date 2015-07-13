======================
26.5.?Dial-out Service
======================

.. raw:: html

   <div class="navheader">

26.5.?Dial-out Service
`Prev <dialup.html>`__?
Chapter?26.?Serial Communications
?\ `Next <serialconsole-setup.html>`__

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

26.5.?Dial-out Service
----------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The following are tips for getting the host to connect over the modem to
another computer. This is appropriate for establishing a terminal
session with a remote host.

This kind of connection can be helpful to get a file on the Internet if
there are problems using PPP. If PPP is not working, use the terminal
session to FTP the needed file. Then use zmodem to transfer it to the
machine.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

26.5.1.?Using a Stock Hayes Modem
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A generic Hayes dialer is built into ``tip``. Use ``at=hayes`` in
``/etc/remote``.

The Hayes driver is not smart enough to recognize some of the advanced
features of newer modems messages like ``BUSY``, ``NO DIALTONE``, or
``CONNECT 115200``. Turn those messages off when using ``tip`` with
``ATX0&W``.

The dial timeout for ``tip`` is 60 seconds. The modem should use
something less, or else ``tip`` will think there is a communication
problem. Try ``ATS7=45&W``.

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

26.5.2.?Using ``AT`` Commands
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Create a “direct” entry in ``/etc/remote``. For example, if the modem is
hooked up to the first serial port, ``/dev/cuau0``, use the following
line:

.. code:: programlisting

    cuau0:dv=/dev/cuau0:br#19200:pa=none

Use the highest bps rate the modem supports in the ``br`` capability.
Then, type ``tip cuau0`` to connect to the modem.

Or, use ``cu`` as ``root`` with the following command:

.. code:: screen

    # cu -lline -sspeed

*``line``* is the serial port, such as ``/dev/cuau0``, and *``speed``*
is the speed, such as ``57600``. When finished entering the AT commands,
type ``~.`` to exit.

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

26.5.3.?The ``@`` Sign Does Not Work
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The ``@`` sign in the phone number capability tells ``tip`` to look in
``/etc/phones`` for a phone number. But, the ``@`` sign is also a
special character in capability files like ``/etc/remote``, so it needs
to be escaped with a backslash:

.. code:: programlisting

    pn=\@

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

26.5.4.?Dialing from the Command Line
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Put a “generic” entry in ``/etc/remote``. For example:

.. code:: programlisting

    tip115200|Dial any phone number at 115200 bps:\
            :dv=/dev/cuau0:br#115200:at=hayes:pa=none:du:
    tip57600|Dial any phone number at 57600 bps:\
            :dv=/dev/cuau0:br#57600:at=hayes:pa=none:du:

This should now work:

.. code:: screen

    # tip -115200 5551234

Users who prefer ``cu`` over ``tip``, can use a generic ``cu`` entry:

.. code:: programlisting

    cu115200|Use cu to dial any number at 115200bps:\
            :dv=/dev/cuau1:br#57600:at=hayes:pa=none:du:

and type:

.. code:: screen

    # cu 5551234 -s 115200

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

26.5.5.?Setting the bps Rate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Put in an entry for ``tip1200`` or ``cu1200``, but go ahead and use
whatever bps rate is appropriate with the ``br`` capability. ``tip``
thinks a good default is 1200?bps which is why it looks for a
``tip1200`` entry. 1200?bps does not have to be used, though.

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

26.5.6.?Accessing a Number of Hosts Through a Terminal Server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Rather than waiting until connected and typing ``CONNECT host`` each
time, use ``tip``'s ``cm`` capability. For example, these entries in
``/etc/remote`` will let you type ``tip pain`` or ``tip muffin`` to
connect to the hosts ``pain`` or ``muffin``, and ``tip       deep13`` to
connect to the terminal server.

.. code:: programlisting

    pain|pain.deep13.com|Forrester's machine:\
            :cm=CONNECT pain\n:tc=deep13:
    muffin|muffin.deep13.com|Frank's machine:\
            :cm=CONNECT muffin\n:tc=deep13:
    deep13:Gizmonics Institute terminal server:\
            :dv=/dev/cuau2:br#38400:at=hayes:du:pa=none:pn=5551234:

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

26.5.7.?Using More Than One Line with ``tip``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This is often a problem where a university has several modem lines and
several thousand students trying to use them.

Make an entry in ``/etc/remote`` and use ``@`` for the ``pn``
capability:

.. code:: programlisting

    big-university:\
            :pn=\@:tc=dialout
    dialout:\
            :dv=/dev/cuau3:br#9600:at=courier:du:pa=none:

Then, list the phone numbers in ``/etc/phones``:

.. code:: programlisting

    big-university 5551111
    big-university 5551112
    big-university 5551113
    big-university 5551114

``tip`` will try each number in the listed order, then give up. To keep
retrying, run ``tip`` in a ``while`` loop.

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

26.5.8.?Using the Force Character
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

**Ctrl**+**P** is the default “force” character, used to tell ``tip``
that the next character is literal data. The force character can be set
to any other character with the ``~s`` escape, which means “set a
variable.”

Type ``~sforce=single-char`` followed by a newline. *``single-char``* is
any single character. If *``single-char``* is left out, then the force
character is the null character, which is accessed by typing
**Ctrl**+**2** or **Ctrl**+**Space**. A pretty good value for
*``single-char``* is **Shift**+**Ctrl**+**6**, which is only used on
some terminal servers.

To change the force character, specify the following in ``~/.tiprc``:

.. code:: programlisting

    force=single-char

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

26.5.9.?Upper Case Characters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This happens when **Ctrl**+**A** is pressed, which is ``tip``'s “raise
character”, specially designed for people with broken caps-lock keys.
Use ``~s`` to set ``raisechar`` to something reasonable. It can be set
to be the same as the force character, if neither feature is used.

Here is a sample ``~/.tiprc`` for Emacs users who need to type
**Ctrl**+**2** and **Ctrl**+**A**:

.. code:: programlisting

    force=^^
    raisechar=^^

The ``^^`` is **Shift**+**Ctrl**+**6**.

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

26.5.10.?File Transfers with ``tip``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When talking to another UNIX?-like operating system, files can be sent
and received using ``~p`` (put) and ``~t`` (take). These commands run
``cat`` and ``echo`` on the remote system to accept and send files. The
syntax is:

.. raw:: html

   <div class="cmdsynopsis">

``~p`` local-file [remote-file]

.. raw:: html

   </div>

.. raw:: html

   <div class="cmdsynopsis">

``~t`` remote-file [local-file]

.. raw:: html

   </div>

There is no error checking, so another protocol, like zmodem, should
probably be used.

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

26.5.11.?Using zmodem with ``tip``?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To receive files, start the sending program on the remote end. Then,
type ``~C rz`` to begin receiving them locally.

To send files, start the receiving program on the remote end. Then, type
``~C sz     files`` to send them to the remote system.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------+-----------------------------+------------------------------------------+
| `Prev <dialup.html>`__?   | `Up <serialcomms.html>`__   | ?\ `Next <serialconsole-setup.html>`__   |
+---------------------------+-----------------------------+------------------------------------------+
| 26.4.?Dial-in Service?    | `Home <index.html>`__       | ?26.6.?Setting Up the Serial Console     |
+---------------------------+-----------------------------+------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
