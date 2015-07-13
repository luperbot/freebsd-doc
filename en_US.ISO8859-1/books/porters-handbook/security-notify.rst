====================================
11.3.?Keeping the Community Informed
====================================

.. raw:: html

   <div class="navheader">

11.3.?Keeping the Community Informed
`Prev <security-fix.html>`__?
Chapter?11.?Security
?\ `Next <porting-dads.html>`__

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

11.3.?Keeping the Community Informed
------------------------------------

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

11.3.1.?The VuXML Database
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A very important and urgent step to take as early after a security
vulnerability is discovered as possible is to notify the community of
port users about the jeopardy. Such notification serves two purposes.
First, if the danger is really severe it will be wise to apply an
instant workaround. For example, stop the affected network service or
even deinstall the port completely until the vulnerability is closed.
Second, a lot of users tend to upgrade installed packages only
occasionally. They will know from the notification that they *must*
update the package without delay as soon as a corrected version is
available.

Given the huge number of ports in the tree, a security advisory cannot
be issued on each incident without creating a flood and losing the
attention of the audience when it comes to really serious matters.
Therefore security vulnerabilities found in ports are recorded in `the
FreeBSD VuXML database <http://vuxml.freebsd.org/>`__. The Security
Officer Team members also monitor it for issues requiring their
intervention.

Committers can update the VuXML database themselves, assisting the
Security Officer Team and delivering crucial information to the
community more quickly. Those who are not committers or have discovered
an exceptionally severe vulnerability should not hesitate to contact the
Security Officer Team directly, as described on the `FreeBSD Security
Information <http://www.freebsd.org/security/#how>`__ page.

The VuXML database is an XML document. Its source file ``vuln.xml`` is
kept right inside the port
`security/vuxml <http://www.freebsd.org/cgi/url.cgi?ports/security/vuxml/pkg-descr>`__.
Therefore the file's full pathname will be
``PORTSDIR/security/vuxml/vuln.xml``. Each time a security vulnerability
is discovered in a port, please add an entry for it to that file. Until
familiar with VuXML, the best thing to do is to find an existing entry
fitting the case at hand, then copy it and use it as a template.

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

11.3.2.?A Short Introduction to VuXML
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The full-blown XML format is complex, and far beyond the scope of this
book. However, to gain basic insight on the structure of a VuXML entry
only the notion of tags is needed. XML tag names are enclosed in angle
brackets. Each opening <tag> must have a matching closing </tag>. Tags
may be nested. If nesting, the inner tags must be closed before the
outer ones. There is a hierarchy of tags, that is, more complex rules of
nesting them. This is similar to HTML. The major difference is that XML
is e*X*tensible, that is, based on defining custom tags. Due to its
intrinsic structure XML puts otherwise amorphous data into shape. VuXML
is particularly tailored to mark up descriptions of security
vulnerabilities.

Now consider a realistic VuXML entry:

.. code:: programlisting

    <vuln vid="f4bc80f4-da62-11d8-90ea-0004ac98a7b9"> 
      <topic>Several vulnerabilities found in Foo</topic> 
      <affects>
        <package>
          <name>foo</name> 
          <name>foo-devel</name>
          <name>ja-foo</name>
          <range><ge>1.6</ge><lt>1.9</lt></range> 
          <range><ge>2.*</ge><lt>2.4_1</lt></range>
          <range><eq>3.0b1</eq></range>
        </package>
        <package>
          <name>openfoo</name> 
          <range><lt>1.10_7</lt></range> 
          <range><ge>1.2,1</ge><lt>1.3_1,1</lt></range>
        </package>
      </affects>
      <description>
        <body xmlns="http://www.w3.org/1999/xhtml">
          <p>J. Random Hacker reports:</p> 
          <blockquote
            cite="http://j.r.hacker.com/advisories/1">
            <p>Several issues in the Foo software may be exploited
              via carefully crafted QUUX requests.  These requests will
              permit the injection of Bar code, mumble theft, and the
              readability of the Foo administrator account.</p>
          </blockquote>
        </body>
      </description>
      <references> 
        <freebsdsa>SA-10:75.foo</freebsdsa> 
        <freebsdpr>ports/987654</freebsdpr> 
        <cvename>CAN-2010-0201</cvename> 
        <cvename>CAN-2010-0466</cvename>
        <bid>96298</bid> 
        <certsa>CA-2010-99</certsa> 
        <certvu>740169</certvu> 
        <uscertsa>SA10-99A</uscertsa> 
        <uscertta>SA10-99A</uscertta> 
        <mlist msgid="201075606@hacker.com">http://marc.theaimsgroup.com/?l=bugtraq&amp;m=203886607825605</mlist> 
        <url>http://j.r.hacker.com/advisories/1</url> 
      </references>
      <dates>
        <discovery>2010-05-25</discovery> 
        <entry>2010-07-13</entry> 
        <modified>2010-09-17</modified> 
      </dates>
    </vuln>

The tag names are supposed to be self-explanatory so we shall take a
closer look only at fields which needs to be filled in:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-vx-vid>`__                 | This is the top-level tag of a VuXML |
|                                      | entry. It has a mandatory attribute, |
|                                      | ``vid``, specifying a universally    |
|                                      | unique identifier (UUID) for this    |
|                                      | entry (in quotes). Generate a UUID   |
|                                      | for each new VuXML entry (and do not |
|                                      | forget to substitute it for the      |
|                                      | template UUID unless writing the     |
|                                      | entry from scratch). use             |
|                                      | `uuidgen(1) <http://www.FreeBSD.org/ |
|                                      | cgi/man.cgi?query=uuidgen&sektion=1> |
|                                      | `__                                  |
|                                      | to generate a VuXML UUID.            |
+--------------------------------------+--------------------------------------+
| `|2| <#co-vx-top>`__                 | This is a one-line description of    |
|                                      | the issue found.                     |
+--------------------------------------+--------------------------------------+
| `|3| <#co-vx-nam>`__                 | The names of packages affected are   |
|                                      | listed there. Multiple names can be  |
|                                      | given since several packages may be  |
|                                      | based on a single master port or     |
|                                      | software product. This may include   |
|                                      | stable and development branches,     |
|                                      | localized versions, and slave ports  |
|                                      | featuring different choices of       |
|                                      | important build-time configuration   |
|                                      | options.                             |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="important" xmlns="">  |
|                                      |                                      |
|                                      | Important:                           |
|                                      | ~~~~~~~~~~                           |
|                                      |                                      |
|                                      | It is the submitter's responsibility |
|                                      | to find all such related packages    |
|                                      | when writing a VuXML entry. Keep in  |
|                                      | mind that ``make search name=foo``   |
|                                      | is helpful. The primary points to    |
|                                      | look for are:                        |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="itemizedlist"         |
|                                      |    xmlns="http://www.w3.org/1999/xht |
|                                      | ml">                                 |
|                                      |                                      |
|                                      | -  the ``foo-devel`` variant for a   |
|                                      |    ``foo`` port;                     |
|                                      |                                      |
|                                      | -  other variants with a suffix like |
|                                      |    ``-a4`` (for print-related        |
|                                      |    packages), ``-without-gui`` (for  |
|                                      |    packages with X support           |
|                                      |    disabled), or similar;            |
|                                      |                                      |
|                                      | -  ``jp-``, ``ru-``, ``zh-``, and    |
|                                      |    other possible localized variants |
|                                      |    in the corresponding national     |
|                                      |    categories of the ports           |
|                                      |    collection.                       |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|4| <#co-vx-rng>`__                 | Affected versions of the package(s)  |
|                                      | are specified there as one or more   |
|                                      | ranges using a combination of        |
|                                      | ``<lt>``, ``<le>``, ``<eq>``,        |
|                                      | ``<ge>``, and ``<gt>`` elements.     |
|                                      | Check that the version ranges given  |
|                                      | do not overlap.                      |
|                                      |                                      |
|                                      | In a range specification, ``*``      |
|                                      | (asterisk) denotes the smallest      |
|                                      | version number. In particular,       |
|                                      | ``2.*`` is less than ``2.a``.        |
|                                      | Therefore an asterisk may be used    |
|                                      | for a range to match all possible    |
|                                      | ``alpha``, ``beta``, and ``RC``      |
|                                      | versions. For instance,              |
|                                      | ``<ge>2.*</ge><lt>3.*</lt>`` will    |
|                                      | selectively match every ``2.x``      |
|                                      | version while                        |
|                                      | ``<ge>2.0</ge><lt>3.0</lt>`` will    |
|                                      | not since the latter misses ``2.r3`` |
|                                      | and matches ``3.b``.                 |
|                                      |                                      |
|                                      | The above example specifies that     |
|                                      | affected are versions from ``1.6``   |
|                                      | to ``1.9`` inclusive, versions       |
|                                      | ``2.x`` before ``2.4_1``, and        |
|                                      | version ``3.0b1``.                   |
+--------------------------------------+--------------------------------------+
| `|5| <#co-vx-nm2>`__                 | Several related package groups       |
|                                      | (essentially, ports) can be listed   |
|                                      | in the ``<affected>`` section. This  |
|                                      | can be used if several software      |
|                                      | products (say FooBar, FreeBar and    |
|                                      | OpenBar) grow from the same code     |
|                                      | base and still share its bugs and    |
|                                      | vulnerabilities. Note the difference |
|                                      | from listing multiple names within a |
|                                      | single <package> section.            |
+--------------------------------------+--------------------------------------+
| `|6| <#co-vx-epo>`__                 | The version ranges have to allow for |
|                                      | ``PORTEPOCH`` and ``PORTREVISION``   |
|                                      | if applicable. Please remember that  |
|                                      | according to the collation rules, a  |
|                                      | version with a non-zero              |
|                                      | ``PORTEPOCH`` is greater than any    |
|                                      | version without ``PORTEPOCH``, for   |
|                                      | example, ``3.0,1`` is greater than   |
|                                      | ``3.1`` or even than ``8.9``.        |
+--------------------------------------+--------------------------------------+
| `|7| <#co-vx-bdy>`__                 | This is a summary of the issue.      |
|                                      | XHTML is used in this field. At      |
|                                      | least enclosing ``<p>`` and ``</p>`` |
|                                      | has to appear. More complex mark-up  |
|                                      | may be used, but only for the sake   |
|                                      | of accuracy and clarity: No eye      |
|                                      | candy please.                        |
+--------------------------------------+--------------------------------------+
| `|8| <#co-vx-ref>`__                 | This section contains references to  |
|                                      | relevant documents. As many          |
|                                      | references as apply are encouraged.  |
+--------------------------------------+--------------------------------------+
| `|9| <#co-vx-fsa>`__                 | This is a `FreeBSD security          |
|                                      | advisory <http://www.freebsd.org/sec |
|                                      | urity/#adv>`__.                      |
+--------------------------------------+--------------------------------------+
| `|10| <#co-vx-fpr>`__                | This is a `FreeBSD problem           |
|                                      | report <http://www.freebsd.org/suppo |
|                                      | rt.html>`__.                         |
+--------------------------------------+--------------------------------------+
| `|11| <#co-vx-cve>`__                | This is a `MITRE                     |
|                                      | CVE <http://www.cve.mitre.org/>`__   |
|                                      | identifier.                          |
+--------------------------------------+--------------------------------------+
| `|12| <#co-vx-bid>`__                | This is a `SecurityFocus Bug         |
|                                      | ID <http://www.securityfocus.com/bid |
|                                      | >`__.                                |
+--------------------------------------+--------------------------------------+
| `|13| <#co-vx-cts>`__                | This is a                            |
|                                      | `US-CERT <http://www.cert.org/>`__   |
|                                      | security advisory.                   |
+--------------------------------------+--------------------------------------+
| `|14| <#co-vx-ctv>`__                | This is a                            |
|                                      | `US-CERT <http://www.cert.org/>`__   |
|                                      | vulnerability note.                  |
+--------------------------------------+--------------------------------------+
| `|15| <#co-vx-ucs>`__                | This is a                            |
|                                      | `US-CERT <http://www.cert.org/>`__   |
|                                      | Cyber Security Alert.                |
+--------------------------------------+--------------------------------------+
| `|16| <#co-vx-uct>`__                | This is a                            |
|                                      | `US-CERT <http://www.cert.org/>`__   |
|                                      | Technical Cyber Security Alert.      |
+--------------------------------------+--------------------------------------+
| `|17| <#co-vx-mls>`__                | This is a URL to an archived posting |
|                                      | in a mailing list. The attribute     |
|                                      | ``msgid`` is optional and may        |
|                                      | specify the message ID of the        |
|                                      | posting.                             |
+--------------------------------------+--------------------------------------+
| `|18| <#co-vx-url>`__                | This is a generic URL. Only it if    |
|                                      | none of the other reference          |
|                                      | categories apply.                    |
+--------------------------------------+--------------------------------------+
| `|19| <#co-vx-dsc>`__                | This is the date when the issue was  |
|                                      | disclosed (*``YYYY-MM-DD``*).        |
+--------------------------------------+--------------------------------------+
| `|20| <#co-vx-ent>`__                | This is the date when the entry was  |
|                                      | added (*``YYYY-MM-DD``*).            |
+--------------------------------------+--------------------------------------+
| `|21| <#co-vx-mod>`__                | This is the date when any            |
|                                      | information in the entry was last    |
|                                      | modified (*``YYYY-MM-DD``*). New     |
|                                      | entries must not include this field. |
|                                      | Add it when editing an existing      |
|                                      | entry.                               |
+--------------------------------------+--------------------------------------+

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

11.3.3.?Testing Changes to the VuXML Database
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This example describes a new entry for a vulnerability in the package
``dropbear`` that has been fixed in version ``dropbear-2013.59``.

As a prerequisite, install a fresh version of
`security/vuxml <http://www.freebsd.org/cgi/url.cgi?ports/security/vuxml/pkg-descr>`__
port.

First, check whether there already is an entry for this vulnerability.
If there were such an entry, it would match the previous version of the
package, ``2013.58``:

.. code:: screen

    % pkg audit dropbear-2013.58

If there is none found, add a new entry for this vulnerability.

.. code:: screen

    % cd ${PORTSDIR}/security/vuxml
    % make newentry

Verify its syntax and formatting:

.. code:: screen

    % make validate

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

At least one of these packages needs to be installed:
`textproc/libxml2 <http://www.freebsd.org/cgi/url.cgi?ports/textproc/libxml2/pkg-descr>`__,
`textproc/jade <http://www.freebsd.org/cgi/url.cgi?ports/textproc/jade/pkg-descr>`__.

.. raw:: html

   </div>

Verify that the ``<affected>`` section of the entry will match the
correct packages:

.. code:: screen

    % pkg audit -f ${PORTSDIR}/security/vuxml/vuln.xml dropbear-2013.58

Make sure that the entry produces no spurious matches in the output.

Now check whether the right package versions are matched by the entry:

.. code:: screen

    % pkg audit -f ${PORTSDIR}/security/vuxml/vuln.xml dropbear-2013.58 dropbear-2013.59
    dropbear-2012.58 is vulnerable:
    dropbear -- exposure of sensitive information, DoS
    CVE: CVE-2013-4434
    CVE: CVE-2013-4421
    WWW: http://portaudit.FreeBSD.org/8c9b48d1-3715-11e3-a624-00262d8b701d.html

    1 problem(s) in the installed packages found.

The former version matches while the latter one does not.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+--------------------------+-----------------------------------+
| `Prev <security-fix.html>`__?            | `Up <security.html>`__   | ?\ `Next <porting-dads.html>`__   |
+------------------------------------------+--------------------------+-----------------------------------+
| 11.2.?Fixing Security Vulnerabilities?   | `Home <index.html>`__    | ?Chapter?12.?Dos and Don'ts       |
+------------------------------------------+--------------------------+-----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.

.. |1| image:: ./imagelib/callouts/1.png
.. |2| image:: ./imagelib/callouts/2.png
.. |3| image:: ./imagelib/callouts/3.png
.. |4| image:: ./imagelib/callouts/4.png
.. |5| image:: ./imagelib/callouts/5.png
.. |6| image:: ./imagelib/callouts/6.png
.. |7| image:: ./imagelib/callouts/7.png
.. |8| image:: ./imagelib/callouts/8.png
.. |9| image:: ./imagelib/callouts/9.png
.. |10| image:: ./imagelib/callouts/10.png
.. |11| image:: ./imagelib/callouts/11.png
.. |12| image:: ./imagelib/callouts/12.png
.. |13| image:: ./imagelib/callouts/13.png
.. |14| image:: ./imagelib/callouts/14.png
.. |15| image:: ./imagelib/callouts/15.png
.. |16| image:: ./imagelib/callouts/16.png
.. |17| image:: ./imagelib/callouts/17.png
.. |18| image:: ./imagelib/callouts/18.png
.. |19| image:: ./imagelib/callouts/19.png
.. |20| image:: ./imagelib/callouts/20.png
.. |21| image:: ./imagelib/callouts/21.png
