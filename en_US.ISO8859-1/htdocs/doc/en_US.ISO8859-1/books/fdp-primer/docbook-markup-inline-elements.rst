=====================
9.6.?In-line Elements
=====================

.. raw:: html

   <div class="navheader">

9.6.?In-line Elements
`Prev <docbook-markup-block-elements.html>`__?
Chapter?9.?DocBook Markup
?\ `Next <docbook-markup-images.html>`__

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

9.6.?In-line Elements
---------------------

.. raw:: html

   </div>

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

9.6.1.?Emphasizing Information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To emphasize a particular word or phrase, use ``emphasis``. This may be
presented as italic, or bold, or might be spoken differently with a
text-to-speech system.

There is no way to change the presentation of the emphasis within the
document, no equivalent of HTML's ``b`` and ``i``. If the information
being presented is important, then consider presenting it in
``important`` rather than ``emphasis``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.19.?\ ``emphasis``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>&os; is without doubt <emphasis>the</emphasis>
      premiere &unix;-like operating system for the Intel
      architecture.</para>

Appearance:

FreeBSD is without doubt *the* premiere UNIX?-like operating system for
the Intel architecture.

.. raw:: html

   </div>

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

9.6.2.?Acronyms
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many computer terms are *acronyms*, words formed from the first letter
of each word in a phrase. Acronyms are marked up into ``acronym``
elements. It is helpful to the reader when an acronym is defined on the
first use, as shown in the example below.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.20.?Acronyms

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Request For Comments (<acronym>RFC</acronym>) 1149
      defined the use of avian carriers for transmission of
      Internet Protocol (<acronym>IP</acronym>) data.  The
      quantity of <acronym>IP</acronym> data currently
      transmitted in that manner is unknown.</para>

Appearance:

Request For Comments (RFC) 1149 defined the use of avian carriers for
transmission of Internet Protocol (IP) data. The quantity of IP data
currently transmitted in that manner is unknown.

.. raw:: html

   </div>

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

9.6.3.?Quotations
~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To quote text from another document or source, or to denote a phrase
that is used figuratively, use ``quote``. Most of the markup tags
available for normal text are also available from within a ``quote``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.21.?Quotations

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>However, make sure that the search does not go beyond the
      <quote>boundary between local and public administration</quote>,
      as <acronym>RFC</acronym> 1535 calls it.</para>

Appearance:

However, make sure that the search does not go beyond the “boundary
between local and public administration”, as RFC 1535 calls it.

.. raw:: html

   </div>

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

9.6.4.?Keys, Mouse Buttons, and Combinations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To refer to a specific key on the keyboard, use ``keycap``. To refer to
a mouse button, use ``mousebutton``. And to refer to combinations of key
presses or mouse clicks, wrap them all in ``keycombo``.

``keycombo`` has an attribute called ``action``, which may be one of
``click``, ``double-click``, ``other``, ``press``, ``seq``, or
``simul``. The last two values denote whether the keys or buttons should
be pressed in sequence, or simultaneously.

The stylesheets automatically add any connecting symbols, such as ``+``,
between the key names, when wrapped in ``keycombo``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.22.?Keys, Mouse Buttons, and Combinations

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>To switch to the second virtual terminal, press
      <keycombo action="simul"><keycap>Alt</keycap>
        <keycap>F1</keycap></keycombo>.</para>

    <para>To exit <command>vi</command> without saving changes, type
      <keycombo action="seq"><keycap>Esc</keycap><keycap>:</keycap>
        <keycap>q</keycap><keycap>!</keycap></keycombo>.</para>

    <para>My window manager is configured so that
      <keycombo action="simul"><keycap>Alt</keycap>
        <mousebutton>right</mousebutton>
      </keycombo> mouse button is used to move windows.</para>

Appearance:

To switch to the second virtual terminal, press **Alt**+**F1**.

To exit ``vi`` without saving changes, type **Esc** **:** **q** **!**.

My window manager is configured so that **Alt**+right mouse button is
used to move windows.

.. raw:: html

   </div>

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

9.6.5.?Applications, Commands, Options, and Cites
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Both applications and commands are frequently referred to when writing
documentation. The distinction between them is that an application is
the name of a program or suite of programs that fulfill a particular
task. A command is the filename of a program that the user can type and
run at a command line.

It is often necessary to show some of the options that a command might
take.

Finally, it is often useful to list a command with its manual section
number, in the “command(number)” format so common in Unix manuals.

Mark up application names with ``application``.

To list a command with its manual section number (which should be most
of the time) the DocBook element is ``citerefentry``. This will contain
a further two elements, ``refentrytitle`` and ``manvolnum``. The content
of ``refentrytitle`` is the name of the command, and the content of
``manvolnum`` is the manual page section.

This can be cumbersome to write, and so a series of `general
entities <xml-primer-entities.html#xml-primer-general-entities>`__ have
been created to make this easier. Each entity takes the form
``&man.manual-page``.\ *``manual-section``*;.

The file that contains these entities is in
``doc/share/xml/man-refs.ent``, and can be referred to using this FPI:

.. code:: programlisting

    PUBLIC "-//FreeBSD//ENTITIES DocBook Manual Page Entities//EN"

Therefore, the introduction to FreeBSD documentation will usually
include this:

.. code:: programlisting

    <!DOCTYPE book PUBLIC "-//FreeBSD//DTD DocBook V4.1-Based Extension//EN" [

    <!ENTITY % man PUBLIC "-//FreeBSD//ENTITIES DocBook Manual Page Entities//EN">
    %man;

    …

    ]>

Use ``command`` to include a command name “in-line” but present it as
something the user should type.

Use ``option`` to mark up the options which will be passed to a command.

When referring to the same command multiple times in close proximity, it
is preferred to use the ``&man.command``.\ *``section``*; notation to
markup the first reference and use ``command`` to markup subsequent
references. This makes the generated output, especially HTML, appear
visually better.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.23.?Applications, Commands, and Options

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para><application>Sendmail</application> is the most
      widely used Unix mail application.<para>

    <para><application>Sendmail</application> includes the
      <citerefentry>
        <refentrytitle>sendmail</refentrytitle>
        <manvolnum>8</manvolnum>
      </citerefentry>, &man.mailq.1;, and &man.newaliases.1;
      programs.</para>

    <para>One of the command line parameters to <citerefentry>
        <refentrytitle>sendmail</refentrytitle>
        <manvolnum>8</manvolnum>
      </citerefentry>, <option>-bp</option>, will display the current
      status of messages in the mail queue.  Check this on the command
      line by running <command>sendmail -bp</command>.</para>

Appearance:

Sendmail is the most widely used Unix mail application.

Sendmail includes the
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__,
`mailq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=mailq&sektion=1>`__,
and
`newaliases(1) <http://www.FreeBSD.org/cgi/man.cgi?query=newaliases&sektion=1>`__
programs.

One of the command line parameters to
`sendmail(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sendmail&sektion=8>`__,
``-bp``, will display the current status of messages in the mail queue.
Check this on the command line by running ``sendmail -bp``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Notice how the ``&man.command``.\ *``section``*; notation is easier to
follow.

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

9.6.6.?Files, Directories, Extensions, Device Names
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To refer to the name of a file, a directory, a file extension, or a
device name, use ``filename``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.24.?\ ``filename``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>The source for the Handbook in English is found in
      <filename>/usr/doc/en_US.ISO8859-1/books/handbook/</filename>.
      The main file is called <filename>book.xml</filename>.
      There is also a <filename>Makefile</filename> and a
      number of files with a <filename>.ent</filename> extension.</para>

    <para><filename>kbd0</filename> is the first keyboard detected
      by the system, and appears in
      <filename>/dev</filename>.</para>

Appearance:

The source for the Handbook in English is found in
``/usr/doc/en_US.ISO8859-1/books/handbook/``. The main file is called
``book.xml``. There is also a ``Makefile`` and a number of files with a
``.ent`` extension.

``kbd0`` is the first keyboard detected by the system, and appears in
``/dev``.

.. raw:: html

   </div>

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

9.6.7.?The Name of Ports
~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

FreeBSD Extension:
~~~~~~~~~~~~~~~~~~

These elements are part of the FreeBSD extension to DocBook, and do not
exist in the original DocBook DTD.

.. raw:: html

   </div>

To include the name of a program from the FreeBSD Ports Collection in
the document, use the ``package`` tag. Since the Ports Collection can be
installed in any number of locations, only include the category and the
port name; do not include ``/usr/ports``.

By default, ``package`` refers to a binary package. To refer to a port
that will be built from source, set the ``role`` attribute to ``port``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.25.?\ ``package`` Tag

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Install the <package>net/wireshark</package> binary
      package to view network traffic.</para>

    <para><package role="port">net/wireshark</package> can also be
      built and installed from the Ports Collection.</para>

Appearance:

Install the
`net/wireshark <http://www.freebsd.org/cgi/url.cgi?ports/net/wireshark/pkg-descr>`__
binary package to view network traffic.

`net/wireshark <http://www.freebsd.org/cgi/url.cgi?ports/net/wireshark/pkg-descr>`__
can also be built and installed from the Ports Collection.

.. raw:: html

   </div>

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

9.6.8.?Hosts, Domains, IP Addresses, User Names, Group Names, and Other System Items
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

FreeBSD Extension:
~~~~~~~~~~~~~~~~~~

These elements are part of the FreeBSD extension to DocBook, and do not
exist in the original DocBook DTD.

.. raw:: html

   </div>

Information for “system items” is marked up with ``systemitem``. The
``class`` attribute is used to identify the particular type of
information shown.

.. raw:: html

   <div class="variablelist">

``class="domainname"``
    The text is a domain name, such as ``FreeBSD.org`` or
    ``ngo.org.uk``. There is no hostname component.

``class="etheraddress"``
    The text is an Ethernet MAC address, expressed as a series of 2
    digit hexadecimal numbers separated by colons.

``class="fqdomainname"``
    The text is a Fully Qualified Domain Name, with both hostname and
    domain name parts.

``class="ipaddress"``
    The text is an IP address, probably expressed as a dotted quad.

``class="netmask"``
    The text is a network mask, which might be expressed as a dotted
    quad, a hexadecimal string, or as a ``/`` followed by a number (CIDR
    notation).

``class="systemname"``
    With ``class="systemname"`` the marked up information is the simple
    hostname, such as ``freefall`` or ``wcarchive``.

``class="username"``
    The text is a username, like ``root``.

``class="groupname"``
    The text is a groupname, like ``wheel``.

.. raw:: html

   </div>

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.26.?\ ``systemitem`` and Classes

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>The local machine can always be referred to by the
      name <systemitem class="systemname">localhost</systemitem>, which will have the IP
      address <systemitem class="ipaddress">127.0.0.1</systemitem>.</para>

    <para>The <systemitem class="domainname">FreeBSD.org</systemitem>
      domain contains a number of different hosts, including
      <systemitem class="fqdomainname">freefall.FreeBSD.org</systemitem> and
      <systemitem class="fqdomainname">bento.FreeBSD.org</systemitem>.</para>

    <para>When adding an <acronym>IP</acronym> alias to an
      interface (using <command>ifconfig</command>)
      <emphasis>always</emphasis> use a netmask of
      <systemitem class="netmask">255.255.255.255</systemitem> (which can
      also be expressed as
      <systemitem class="netmask">0xffffffff</systemitem>).</para>

    <para>The <acronym>MAC</acronym> address uniquely identifies
      every network card in existence.  A typical
      <acronym>MAC</acronym> address looks like
      <systemitem class="etheraddress">08:00:20:87:ef:d0</systemitem>.</para>

    <para>To carry out most system administration functions
      requires logging in as <systemitem class="username">root</systemitem>.</para>

Appearance:

The local machine can always be referred to by the name ``localhost``,
which will have the IP address ``127.0.0.1``.

The ``FreeBSD.org`` domain contains a number of different hosts,
including ``freefall.FreeBSD.org`` and ``bento.FreeBSD.org``.

When adding an IP alias to an interface (using ``ifconfig``) *always*
use a netmask of ``255.255.255.255`` (which can also be expressed as
``0xffffffff``).

The MAC address uniquely identifies every network card in existence. A
typical MAC address looks like ``08:00:20:87:ef:d0``.

To carry out most system administration functions requires logging in as
``root``.

.. raw:: html

   </div>

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

9.6.9.?Email Addresses
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Email addresses are marked up as ``email`` elements. In the HTML output
format, the wrapped text becomes a hyperlink to the email address. Other
output formats that support hyperlinks may also make the email address
into a link.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.27.?\ ``email`` with a Hyperlink

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>An email address that does not actually exist, like
      <email>notreal@example.com</email>, can be used as an
      example.</para>

Appearance:

An email address that does not actually exist, like
``<notreal@example.com>``, can be used as an example.

.. raw:: html

   </div>

.. raw:: html

   </div>

A FreeBSD-specific extension allows setting the ``role`` attribute to
``nolink`` to prevent the creation of the hyperlink to the email
address.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.28.?\ ``email`` Without a Hyperlink

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Sometimes a link to an email address like
      <email role="nolink">notreal@example.com</email> is not
      desired.</para>

Appearance:

Sometimes a link to an email address like ``<notreal@example.com>`` is
not desired.

.. raw:: html

   </div>

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

9.6.10.?Describing ``Makefile``\ s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

FreeBSD Extension:
~~~~~~~~~~~~~~~~~~

These elements are part of the FreeBSD extension to DocBook, and do not
exist in the original DocBook DTD.

.. raw:: html

   </div>

Two elements exist to describe parts of ``Makefile``\ s, ``buildtarget``
and ``varname``.

``buildtarget`` identifies a build target exported by a ``Makefile``
that can be given as a parameter to ``make``. ``varname`` identifies a
variable that can be set (in the environment, on the command line with
``make``, or within the ``Makefile``) to influence the process.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.29.?\ ``buildtarget`` and ``varname``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Two common targets in a <filename>Makefile</filename>
      are <buildtarget>all</buildtarget> and
      <buildtarget>clean</buildtarget>.</para>

    <para>Typically, invoking <buildtarget>all</buildtarget> will
      rebuild the application, and invoking
      <buildtarget>clean</buildtarget> will remove the temporary
      files (<filename>.o</filename> for example) created by the
      build process.</para>

    <para><buildtarget>clean</buildtarget> may be controlled by a
      number of variables, including <varname>CLOBBER</varname>
      and <varname>RECURSE</varname>.</para>

Appearance:

Two common targets in a ``Makefile`` are ``all`` and ``clean``.

Typically, invoking ``all`` will rebuild the application, and invoking
``clean`` will remove the temporary files (``.o`` for example) created
by the build process.

``clean`` may be controlled by a number of variables, including
``CLOBBER`` and ``RECURSE``.

.. raw:: html

   </div>

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

9.6.11.?Literal Text
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Literal text, or text which should be entered verbatim, is often needed
in documentation. This is text that is excerpted from another file, or
which should be copied exactly as shown from the documentation into
another file.

Some of the time, ``programlisting`` will be sufficient to denote this
text. But ``programlisting`` is not always appropriate, particularly
when you want to include a portion of a file “in-line” with the rest of
the paragraph.

On these occasions, use ``literal``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.30.?\ ``literal``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>The <literal>maxusers 10</literal> line in the kernel
      configuration file determines the size of many system tables, and is
      a rough guide to how many simultaneous logins the system will
      support.</para>

Appearance:

The ``maxusers 10`` line in the kernel configuration file determines the
size of many system tables, and is a rough guide to how many
simultaneous logins the system will support.

.. raw:: html

   </div>

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

9.6.12.?Showing Items That the User *Must* Fill In
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There will often be times when the user is shown what to do, or referred
to a file or command line, but cannot simply copy the example provided.
Instead, they must supply some information themselves.

``replaceable`` is designed for this eventuality. Use it *inside* other
elements to indicate parts of that element's content that the user must
replace.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.31.?\ ``replaceable``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <screen>&prompt.user; <userinput>man <replaceable>command</replaceable></userinput></screen>

Appearance:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    % man command

.. raw:: html

   </div>

``replaceable`` can be used in many different elements, including
``literal``. This example also shows that ``replaceable`` should only be
wrapped around the content that the user *is* meant to provide. The
other content should be left alone.

Usage:

.. code:: programlisting

    <para>The <literal>maxusers <replaceable>n</replaceable></literal>
      line in the kernel configuration file determines the size of many system
      tables, and is a rough guide to how many simultaneous logins the system will
      support.</para>

    <para>For a desktop workstation, <literal>32</literal> is a good value
      for <replaceable>n</replaceable>.</para>

Appearance:

The ``maxusers n`` line in the kernel configuration file determines the
size of many system tables, and is a rough guide to how many
simultaneous logins the system will support.

For a desktop workstation, ``32`` is a good value for *``n``*.

.. raw:: html

   </div>

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

9.6.13.?Showing GUI Buttons
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Buttons presented by a graphical user interface are marked with
``guibutton``. To make the text look more like a graphical button,
brackets and non-breaking spaces are added surrounding the text.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.32.?\ ``guibutton``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <para>Edit the file, then click
      <guibutton>[&nbsp;Save&nbsp;]</guibutton> to save the
      changes.</para>

Appearance:

Edit the file, then click [?Save?] to save the changes.

.. raw:: html

   </div>

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

9.6.14.?Quoting System Errors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

System errors generated by FreeBSD are marked with ``errorname``. This
indicates the exact error that appears.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Example?9.33.?\ ``errorname``

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

Usage:

.. code:: programlisting

    <screen><errorname>Panic: cannot mount root</errorname></screen>

Appearance:

.. raw:: html

   <div class="informalexample">

.. code:: screen

    Panic: cannot mount root

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------------+--------------------------------+--------------------------------------------+
| `Prev <docbook-markup-block-elements.html>`__?   | `Up <docbook-markup.html>`__   | ?\ `Next <docbook-markup-images.html>`__   |
+--------------------------------------------------+--------------------------------+--------------------------------------------+
| 9.5.?Block Elements?                             | `Home <index.html>`__          | ?9.7.?Images                               |
+--------------------------------------------------+--------------------------------+--------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
