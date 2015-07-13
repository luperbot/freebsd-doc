=========================
12.3.?Configuring cron(8)
=========================

.. raw:: html

   <div class="navheader">

12.3.?Configuring cron(8)
`Prev <configtuning-starting-services.html>`__?
Chapter?12.?Configuration and Tuning
?\ `Next <configtuning-rcd.html>`__

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

12.3.?Configuring `cron(8) <http://www.FreeBSD.org/cgi/man.cgi?query=cron&sektion=8>`__
---------------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Contributed by Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

One of the most useful utilities in FreeBSD is cron. This utility runs
in the background and regularly checks ``/etc/crontab`` for tasks to
execute and searches ``/var/cron/tabs`` for custom crontab files. These
files are used to schedule tasks which cron runs at the specified times.
Each entry in a crontab defines a task to run and is known as a *cron
job*.

Two different types of configuration files are used: the system crontab,
which should not be modified, and user crontabs, which can be created
and edited as needed. The format used by these files is documented in
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5>`__.
The format of the system crontab, ``/etc/crontab`` includes a ``who``
column which does not exist in user crontabs. In the system crontab,
cron runs the command as the user specified in this column. In a user
crontab, all commands run as the user who created the crontab.

User crontabs allow individual users to schedule their own tasks. The
``root`` user can also have a user ``crontab`` which can be used to
schedule tasks that do not exist in the system ``crontab``.

Here is a sample entry from the system crontab, ``/etc/crontab``:

.. code:: programlisting

    # /etc/crontab - root's crontab for FreeBSD
    #
    # $FreeBSD$
    # 
    SHELL=/bin/sh
    PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin 
    #
    #minute hour    mday    month   wday    who command 
    #
    */5 *   *   *   *   root    /usr/libexec/atrun 

.. raw:: html

   <div class="calloutlist">

+--------------------------------------+--------------------------------------+
| `|1| <#co-comments>`__               | Lines that begin with the ``#``      |
|                                      | character are comments. A comment    |
|                                      | can be placed in the file as a       |
|                                      | reminder of what and why a desired   |
|                                      | action is performed. Comments cannot |
|                                      | be on the same line as a command or  |
|                                      | else they will be interpreted as     |
|                                      | part of the command; they must be on |
|                                      | a new line. Blank lines are ignored. |
+--------------------------------------+--------------------------------------+
| `|2| <#co-env>`__                    | The equals (``=``) character is used |
|                                      | to define any environment settings.  |
|                                      | In this example, it is used to       |
|                                      | define the ``SHELL`` and ``PATH``.   |
|                                      | If the ``SHELL`` is omitted, cron    |
|                                      | will use the default Bourne shell.   |
|                                      | If the ``PATH`` is omitted, the full |
|                                      | path must be given to the command or |
|                                      | script to run.                       |
+--------------------------------------+--------------------------------------+
| `|3| <#co-field-descr>`__            | This line defines the seven fields   |
|                                      | used in a system crontab:            |
|                                      | ``minute``, ``hour``, ``mday``,      |
|                                      | ``month``, ``wday``, ``who``, and    |
|                                      | ``command``. The ``minute`` field is |
|                                      | the time in minutes when the         |
|                                      | specified command will be run, the   |
|                                      | ``hour`` is the hour when the        |
|                                      | specified command will be run, the   |
|                                      | ``mday`` is the day of the month,    |
|                                      | ``month`` is the month, and ``wday`` |
|                                      | is the day of the week. These fields |
|                                      | must be numeric values, representing |
|                                      | the twenty-four hour clock, or a     |
|                                      | ``*``, representing all values for   |
|                                      | that field. The ``who`` field only   |
|                                      | exists in the system crontab and     |
|                                      | specifies which user the command     |
|                                      | should be run as. The last field is  |
|                                      | the command to be executed.          |
+--------------------------------------+--------------------------------------+
| `|4| <#co-main>`__                   | This entry defines the values for    |
|                                      | this cron job. The ``*/5``, followed |
|                                      | by several more ``*`` characters,    |
|                                      | specifies that                       |
|                                      | ``/usr/libexec/atrun`` is invoked by |
|                                      | ``root`` every five minutes of every |
|                                      | hour, of every day and day of the    |
|                                      | week, of every month.                |
|                                      |                                      |
|                                      | Commands can include any number of   |
|                                      | switches. However, commands which    |
|                                      | extend to multiple lines need to be  |
|                                      | broken with the backslash “\\”       |
|                                      | continuation character.              |
+--------------------------------------+--------------------------------------+

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

12.3.1.?Creating a User Crontab
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

To create a user crontab, invoke ``crontab`` in editor mode:

.. code:: screen

    % crontab -e

This will open the user's crontab using the default text editor. The
first time a user runs this command, it will open an empty file. Once a
user creates a crontab, this command will open that file for editing.

It is useful to add these lines to the top of the crontab file in order
to set the environment variables and to remember the meanings of the
fields in the crontab:

.. code:: programlisting

    SHELL=/bin/sh
    PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin
    # Order of crontab fields
    # minute    hour    mday    month   wday    command

Then add a line for each command or script to run, specifying the time
to run the command. This example runs the specified custom Bourne shell
script every day at two in the afternoon. Since the path to the script
is not specified in ``PATH``, the full path to the script is given:

.. code:: programlisting

    0 14  *   *   *   /usr/home/dru/bin/mycustomscript.sh

.. raw:: html

   <div class="tip" xmlns="">

Tip:
~~~~

Before using a custom script, make sure it is executable and test it
with the limited set of environment variables set by cron. To replicate
the environment that would be used to run the above cron entry, use:

.. code:: programlisting

    env -i SHELL=/bin/sh PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin HOME=/home/dru LOGNAME=dru /usr/home/dru/bin/mycustomscript.sh

The environment set by cron is discussed in
`crontab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=crontab&sektion=5>`__.
Checking that scripts operate correctly in a cron environment is
especially important if they include any commands that delete files
using wildcards.

.. raw:: html

   </div>

When finished editing the crontab, save the file. It will automatically
be installed and cron will read the crontab and run its cron jobs at
their specified times. To list the cron jobs in a crontab, use this
command:

.. code:: screen

    % crontab -l
    0   14  *   *   *   /usr/home/dru/bin/mycustomscript.sh

To remove all of the cron jobs in a user crontab:

.. code:: screen

    % crontab -r
    remove crontab for dru? y

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------+-------------------------------+---------------------------------------+
| `Prev <configtuning-starting-services.html>`__?   | `Up <config-tuning.html>`__   | ?\ `Next <configtuning-rcd.html>`__   |
+---------------------------------------------------+-------------------------------+---------------------------------------+
| 12.2.?Starting Services?                          | `Home <index.html>`__         | ?12.4.?Managing Services in FreeBSD   |
+---------------------------------------------------+-------------------------------+---------------------------------------+

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
