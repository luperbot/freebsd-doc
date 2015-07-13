===============================
10.5.?LPD (Line Printer Daemon)
===============================

.. raw:: html

   <div class="navheader">

10.5.?LPD (Line Printer Daemon)
`Prev <printing-direct.html>`__?
Chapter?10.?Printing
?\ `Next <printing-other.html>`__

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

10.5.?LPD (Line Printer Daemon)
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Printing a file in the background is called *spooling*. A spooler allows
the user to continue with other programs on the computer without waiting
for the printer to slowly complete the print job.

FreeBSD includes a spooler called
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8>`__.
Print jobs are submitted with
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.1.?Initial Setup
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A directory for storing print jobs is created, ownership is set, and the
permissions are set to prevent other users from viewing the contents of
those files:

.. code:: screen

    # mkdir -p /var/spool/lpd/lp
    # chown daemon:daemon /var/spool/lpd/lp
    # chmod 770 /var/spool/lpd/lp

Printers are defined in ``/etc/printcap``. An entry for each printer
includes details like a name, the port where it is attached, and various
other settings. Create ``/etc/printcap`` with these contents:

.. code:: programlisting

    lp:\                
        :lp=/dev/unlpt0:\   
        :sh:\           
        :mx#0:\         
        :sd=/var/spool/lpd/lp:\ 
        :lf=/var/log/lpd-errs:  

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#printing-lpd-co-name>`__      | The name of this printer.            |
|                                      | `lpr(1) <http://www.FreeBSD.org/cgi/ |
|                                      | man.cgi?query=lpr&sektion=1>`__      |
|                                      | sends print jobs to the ``lp``       |
|                                      | printer unless another printer is    |
|                                      | specified with ``-P``, so the        |
|                                      | default printer should be named      |
|                                      | ``lp``.                              |
+--------------------------------------+--------------------------------------+
| `|2| <#printing-lpd-co-device>`__    | The device where the printer is      |
|                                      | connected. Replace this line with    |
|                                      | the appropriate one for the          |
|                                      | connection type shown here.          |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    <div class="informaltable">       |
|                                      |                                      |
|                                      | +-------------------+--------------- |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | -------------------+                 |
|                                      | | Connection Type   | Device Entry i |
|                                      | n ``/etc/printcap``                  |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | +===================+=============== |
|                                      | ==================================== |
|                                      | ==================================== |
|                                      | ==================================== |
|                                      | ===================+                 |
|                                      | | USB               | .. code:: prog |
|                                      | ramlisting                           |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |     :lp=/dev/u |
|                                      | nlpt0:\                              |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | This is the *n |
|                                      | on-resetting* USB printer device. If |
|                                      |  problems are experienced, use ``ulp |
|                                      | t0`` instead, which resets the USB p |
|                                      | ort on each use.   |                 |
|                                      | +-------------------+--------------- |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | -------------------+                 |
|                                      | | Parallel          | .. code:: prog |
|                                      | ramlisting                           |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |     :lp=/dev/l |
|                                      | pt0:\                                |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | +-------------------+--------------- |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | -------------------+                 |
|                                      | | Network           | For a printer  |
|                                      | supporting the LPD protocol:         |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | .. code:: prog |
|                                      | ramlisting                           |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |     :lp=:rm=ne |
|                                      | twork-printer-name:rp=raw:\          |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | For printers s |
|                                      | upporting port 9100 printing:        |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | .. code:: prog |
|                                      | ramlisting                           |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |     :lp=9100@n |
|                                      | etwork-printer-name:\                |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | For both types |
|                                      | , replace *``network-printer-name``* |
|                                      |  with the DNS host name of the netwo |
|                                      | rk printer.                          |
|                                      |                    |                 |
|                                      | +-------------------+--------------- |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | -------------------+                 |
|                                      | | Serial            | .. code:: prog |
|                                      | ramlisting                           |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |     :lp=/dev/c |
|                                      | uau0:br=9600:pa=none:\               |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   |                |
|                                      |                                      |
|                                      |                                      |
|                                      |                                      |
|                                      |                    |                 |
|                                      | |                   | These values a |
|                                      | re for a typical serial printer conn |
|                                      | ected to a motherboard serial port.  |
|                                      | The baud rate is 9600, and no parity |
|                                      |  is used.          |                 |
|                                      | +-------------------+--------------- |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | ------------------------------------ |
|                                      | -------------------+                 |
|                                      |                                      |
|                                      | .. raw:: html                        |
|                                      |                                      |
|                                      |    </div>                            |
+--------------------------------------+--------------------------------------+
| `|3| <#printing-lpd-co-header>`__    | Suppress the printing of a header    |
|                                      | page at the start of a print job.    |
+--------------------------------------+--------------------------------------+
| `|4| <#printing-lpd-co-mx>`__        | Do not limit the maximum size of a   |
|                                      | print job.                           |
+--------------------------------------+--------------------------------------+
| `|5| <#printing-lpd-co-sd>`__        | The path to the spooling directory   |
|                                      | for this printer. Each printer uses  |
|                                      | its own spooling directory.          |
+--------------------------------------+--------------------------------------+
| `|6| <#printing-lpd-co-lf>`__        | The log file where errors on this    |
|                                      | printer will be reported.            |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

After creating ``/etc/printcap``, use
`chkprintcap(8) <http://www.FreeBSD.org/cgi/man.cgi?query=chkprintcap&sektion=8>`__
to test it for errors:

.. code:: screen

    # chkprintcap

Fix any reported problems before continuing.

Enable
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8>`__ in
``/etc/rc.conf``:

.. code:: programlisting

    lpd_enable="YES"

Start the service:

.. code:: screen

    # service lpd start

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

10.5.2.?Printing with `lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Documents are sent to the printer with ``lpr``. A file to be printed can
be named on the command line or piped into ``lpr``. These two commands
are equivalent, sending the contents of ``doc.txt`` to the default
printer:

.. code:: screen

    % lpr doc.txt
    % cat doc.txt | lpr

Printers can be selected with ``-P``. To print to a printer called
*``laser``*:

.. code:: screen

    % lpr -Plaser doc.txt

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

10.5.3.?Filters
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The examples shown so far have sent the contents of a text file directly
to the printer. As long as the printer understands the content of those
files, output will be printed correctly.

Some printers are not capable of printing plain text, and the input file
might not even be plain text.

*Filters* allow files to be translated or processed. The typical use is
to translate one type of input, like plain text, into a form that the
printer can understand, like PostScript? or PCL. Filters can also be
used to provide additional features, like adding page numbers or
highlighting source code to make it easier to read.

The filters discussed here are *input filters* or *text filters*. These
filters convert the incoming file into different forms. Use
`su(1) <http://www.FreeBSD.org/cgi/man.cgi?query=su&sektion=1>`__ to
become ``root`` before creating the files.

Filters are specified in ``/etc/printcap`` with the ``if=`` identifier.
To use ``/usr/local/libexec/lf2crlf`` as a filter, modify
``/etc/printcap`` like this:

.. code:: programlisting

    lp:\
        :lp=/dev/unlpt0:\
        :sh:\
        :mx#0:\
        :sd=/var/spool/lpd/lp:\
        :if=/usr/local/libexec/lf2crlf:\   
        :lf=/var/log/lpd-errs:

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#printing-lpd-filters-co-if>`_ | ``if=`` identifies the *input        |
| _                                    | filter* that will be used on         |
|                                      | incoming text.                       |
+--------------------------------------+--------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

The backslash *line continuation* characters at the end of the lines in
``printcap`` entries reveal that an entry for a printer is really just
one long line with entries delimited by colon characters. An earlier
example can be rewritten as a single less-readable line:

.. code:: programlisting

    lp:lp=/dev/unlpt0:sh:mx#0:sd=/var/spool/lpd/lp:if=/usr/local/libexec/lf2crlf:lf=/var/log/lpd-errs:

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.3.1.?Preventing Stairstepping on Plain Text Printers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Typical FreeBSD text files contain only a single line feed character at
the end of each line. These lines will “stairstep” on a standard
printer:

.. code:: programlisting

    A printed file looks
                        like the steps of a staircase
                                                     scattered by the wind

A filter can convert the newline characters into carriage returns and
newlines. The carriage returns make the printer return to the left after
each line. Create ``/usr/local/libexec/lf2crlf`` with these contents:

.. code:: programlisting

    #!/bin/sh
    CR=$'\r'
    /usr/bin/sed -e "s/$/${CR}/g"

Set the permissions and make it executable:

.. code:: screen

    # chmod 555 /usr/local/libexec/lf2crlf

Modify ``/etc/printcap`` to use the new filter:

.. code:: programlisting

    :if=/usr/local/libexec/lf2crlf:\

Test the filter by printing the same plain text file. The carriage
returns will cause each line to start at the left side of the page.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.3.2.?Fancy Plain Text on PostScript? Printers with `print/enscript <http://www.freebsd.org/cgi/url.cgi?ports/print/enscript/pkg-descr>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

GNU Enscript converts plain text files into nicely-formatted PostScript?
for printing on PostScript? printers. It adds page numbers, wraps long
lines, and provides numerous other features to make printed text files
easier to read. Depending on the local paper size, install either
`print/enscript-letter <http://www.freebsd.org/cgi/url.cgi?ports/print/enscript-letter/pkg-descr>`__
or
`print/enscript-a4 <http://www.freebsd.org/cgi/url.cgi?ports/print/enscript-a4/pkg-descr>`__
from the Ports Collection.

Create ``/usr/local/libexec/enscript`` with these contents:

.. code:: programlisting

    #!/bin/sh
    /usr/local/bin/enscript -o -

Set the permissions and make it executable:

.. code:: screen

    # chmod 555 /usr/local/libexec/enscript

Modify ``/etc/printcap`` to use the new filter:

.. code:: programlisting

    :if=/usr/local/libexec/enscript:\

Test the filter by printing a plain text file.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.3.3.?Printing PostScript? to PCL Printers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Many programs produce PostScript? documents. However, inexpensive
printers often only understand plain text or PCL. This filter converts
PostScript? files to PCL before sending them to the printer.

Install the Ghostscript PostScript? interpreter,
`print/ghostscript9 <http://www.freebsd.org/cgi/url.cgi?ports/print/ghostscript9/pkg-descr>`__,
from the Ports Collection.

Create ``/usr/local/libexec/ps2pcl`` with these contents:

.. code:: programlisting

    #!/bin/sh
    /usr/local/bin/gs -dSAFER -dNOPAUSE -dBATCH -q -sDEVICE=ljet4 -sOutputFile=- -

Set the permissions and make it executable:

.. code:: screen

    # chmod 555 /usr/local/libexec/ps2pcl

PostScript? input sent to this script will be rendered and converted to
PCL before being sent on to the printer.

Modify ``/etc/printcap`` to use this new input filter:

.. code:: programlisting

    :if=/usr/local/libexec/ps2pcl:\

Test the filter by sending a small PostScript? program to it:

.. code:: screen

    % printf "%%\!PS \n /Helvetica findfont 18 scalefont setfont \
    72 432 moveto (PostScript printing successful.) show showpage \004" | lpr

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.3.4.?Smart Filters
^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A filter that detects the type of input and automatically converts it to
the correct format for the printer can be very convenient. The first two
characters of a PostScript? file are usually ``%!``. A filter can detect
those two characters. PostScript? files can be sent on to a PostScript?
printer unchanged. Text files can be converted to PostScript? with
Enscript as shown earlier. Create ``/usr/local/libexec/psif`` with these
contents:

.. code:: programlisting

    #!/bin/sh
    #
    #  psif - Print PostScript or plain text on a PostScript printer
    #
    IFS="" read -r first_line
    first_two_chars=`expr "$first_line" : '\(..\)'`

    case "$first_two_chars" in
    %!)
        # %! : PostScript job, print it.
        echo "$first_line" && cat && exit 0
        exit 2
        ;;
    *)
        # otherwise, format with enscript
        ( echo "$first_line"; cat ) | /usr/local/bin/enscript -o - && exit 0
        exit 2
        ;;
    esac

Set the permissions and make it executable:

.. code:: screen

    # chmod 555 /usr/local/libexec/psif

Modify ``/etc/printcap`` to use this new input filter:

.. code:: programlisting

    :if=/usr/local/libexec/psif:\

Test the filter by printing PostScript? and plain text files.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.3.5.?Other Smart Filters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Writing a filter that detects many different types of input and formats
them correctly is challenging.
`print/apsfilter <http://www.freebsd.org/cgi/url.cgi?ports/print/apsfilter/pkg-descr>`__
from the Ports Collection is a smart “magic” filter that detects dozens
of file types and automatically converts them to the PDL understood by
the printer. See http://www.apsfilter.org for more details.

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

10.5.4.?Multiple Queues
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The entries in ``/etc/printcap`` are really definitions of *queues*.
There can be more than one queue for a single printer. When combined
with filters, multiple queues provide users more control over how their
jobs are printed.

As an example, consider a networked PostScript? laser printer in an
office. Most users want to print plain text, but a few advanced users
want to be able to print PostScript? files directly. Two entries can be
created for the same printer in ``/etc/printcap``:

.. code:: programlisting

    textprinter:\
        :lp=9100@officelaser:\
        :sh:\
        :mx#0:\
        :sd=/var/spool/lpd/textprinter:\
        :if=/usr/local/libexec/enscript:\
        :lf=/var/log/lpd-errs:

    psprinter:\
        :lp=9100@officelaser:\
        :sh:\
        :mx#0:\
        :sd=/var/spool/lpd/psprinter:\
        :lf=/var/log/lpd-errs:

Documents sent to ``textprinter`` will be formatted by the
``/usr/local/libexec/enscript`` filter shown in an earlier example.
Advanced users can print PostScript? files on ``psprinter``, where no
filtering is done.

This multiple queue technique can be used to provide direct access to
all kinds of printer features. A printer with a duplexer could use two
queues, one for ordinary single-sided printing, and one with a filter
that sends the command sequence to enable double-sided printing and then
sends the incoming file.

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

10.5.5.?Monitoring and Controlling Printing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several utilities are available to monitor print jobs and check and
control printer operation.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.5.1.?\ `lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__
shows the status of a user's print jobs. Print jobs from other users are
not shown.

Show the current user's pending jobs on a single printer:

.. code:: screen

    % lpq -Plp
    Rank   Owner      Job  Files                                 Total Size
    1st    jsmith     0    (standard input)                      12792 bytes

Show the current user's pending jobs on all printers:

.. code:: screen

    % lpq -a
    lp:
    Rank   Owner      Job  Files                                 Total Size
    1st    jsmith     1    (standard input)                      27320 bytes

    laser:
    Rank   Owner      Job  Files                                 Total Size
    1st    jsmith     287  (standard input)                      22443 bytes

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.5.2.?\ `lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__ is
used to remove print jobs. Normal users are only allowed to remove their
own jobs. ``root`` can remove any or all jobs.

Remove all pending jobs from a printer:

.. code:: screen

    # lprm -Plp -
    dfA002smithy dequeued
    cfA002smithy dequeued
    dfA003smithy dequeued
    cfA003smithy dequeued
    dfA004smithy dequeued
    cfA004smithy dequeued

Remove a single job from a printer.
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__ is
used to find the job number.

.. code:: screen

    % lpq
    Rank   Owner      Job  Files                                 Total Size
    1st    jsmith     5    (standard input)                      12188 bytes
    % lprm -Plp 5
    dfA005smithy dequeued
    cfA005smithy dequeued

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.5.3.?\ `lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__ is
used to check and modify printer status. ``lpc`` is followed by a
command and an optional printer name. ``all`` can be used instead of a
specific printer name, and the command will be applied to all printers.
Normal users can view status with
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__.
Only `` class="username">root`` can use commands which modify printer
status.

Show the status of all printers:

.. code:: screen

    % lpc status all
    lp:
        queuing is enabled
        printing is enabled
        1 entry in spool area
        printer idle
    laser:
        queuing is enabled
        printing is enabled
        1 entry in spool area
        waiting for laser to come up

Prevent a printer from accepting new jobs, then begin accepting new jobs
again:

.. code:: screen

    # lpc disable lp
    lp:
        queuing disabled
    # lpc enable lp
    lp:
        queuing enabled

Stop printing, but continue to accept new jobs. Then begin printing
again:

.. code:: screen

    # lpc stop lp
    lp:
        printing disabled
    # lpc start lp
    lp:
        printing enabled
        daemon started

Restart a printer after some error condition:

.. code:: screen

    # lpc restart lp
    lp:
        no daemon to abort
        printing enabled
        daemon restarted

Turn the print queue off and disable printing, with a message to explain
the problem to users:

.. code:: screen

    # lpc down lp Repair parts will arrive on Monday
    lp:
        printer and queuing disabled
        status message is now: Repair parts will arrive on Monday

Re-enable a printer that is down:

.. code:: screen

    # lpc up lp
    lp:
        printing enabled
        daemon started

See `lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__
for more commands and options.

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

10.5.6.?Shared Printers
~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Printers are often shared by multiple users in businesses and schools.
Additional features are provided to make sharing printers more
convenient.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.6.1.?Aliases
^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The printer name is set in the first line of the entry in
``/etc/printcap``. Additional names, or *aliases*, can be added after
that name. Aliases are separated from the name and each other by
vertical bars:

.. code:: programlisting

    lp|repairsprinter|salesprinter:\

Aliases can be used in place of the printer name. For example, users in
the Sales department print to their printer with

.. code:: screen

    % lpr -Psalesprinter sales-report.txt

Users in the Repairs department print to *their* printer with

.. code:: screen

    % lpr -Prepairsprinter repairs-report.txt

All of the documents print on that single printer. When the Sales
department grows enough to need their own printer, the alias is removed
from the shared printer entry and used as the name of the new printer.
Users in both departments continue to use the same commands, but the
Sales documents are sent to the new printer.

.. raw:: html

   </div>

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

10.5.6.2.?Header Pages
^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Users can have difficulty locating their documents in the stack of pages
produced by a busy shared printer. *Header pages* were created to solve
this problem. A header page with the user name and document name is
printed before each print job. These pages are also sometimes called
*banner* or *separator* pages.

Enabling header pages differs depending on whether the printer is
connected directly to the computer with a USB, parallel, or serial
cable, or is connected remotely by the network.

Header pages on directly-connected printers are enabled by removing the
``:sh:\`` (Suppress Header) line from the entry in ``/etc/printcap``.
These header pages only use line feed characters for new lines. Some
printers will need the ``/usr/share/examples/printing/hpif`` filter to
prevent stairstepped text. The filter configures PCL printers to print
both carriage returns and line feeds when a line feed is received.

Header pages for network printers must be configured on the printer
itself. Header page entries in ``/etc/printcap`` are ignored. Settings
are usually available from the printer front panel or a configuration
web page accessible with a web browser.

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

10.5.7.?References
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Example files: ``/usr/share/examples/printing/``.

The *4.3BSD Line Printer Spooler Manual*,
``/usr/share/doc/smm/07.lpd/paper.ascii.gz``.

Manual pages:
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5>`__,
`lpd(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpd&sektion=8>`__,
`lpr(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpr&sektion=1>`__,
`lpc(8) <http://www.FreeBSD.org/cgi/man.cgi?query=lpc&sektion=8>`__,
`lprm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lprm&sektion=1>`__,
`lpq(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lpq&sektion=1>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+--------------------------+-------------------------------------+
| `Prev <printing-direct.html>`__?   | `Up <printing.html>`__   | ?\ `Next <printing-other.html>`__   |
+------------------------------------+--------------------------+-------------------------------------+
| 10.4.?Direct Printing?             | `Home <index.html>`__    | ?10.6.?Other Printing Systems       |
+------------------------------------+--------------------------+-------------------------------------+

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
