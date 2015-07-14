===============================================
FreeBSD GNOME Project: GNOME 2.32 Upgrading FAQ
===============================================

.. raw:: html

   <div id="containerwrap">

.. raw:: html

   <div id="container">

.. raw:: html

   <div id="content">

.. raw:: html

   <div id="sidewrap">

.. raw:: html

   <div id="sidenav">

Section Navigation
------------------

-  `FreeBSD/GNOME <../../gnome/index.html>`__

   -  `Installation Instructions <../../gnome/docs/faq2.html#q1>`__
   -  `Upgrade Instructions <../../gnome/docs/faq232.html#q2>`__
   -  `Available Applications <../../gnome/../ports/gnome.html>`__
   -  `How to Help <../../gnome/docs/volunteer.html>`__
   -  `Reporting a Bug <../../gnome/docs/bugging.html>`__
   -  `Screenshots <../../gnome/screenshots.html>`__
   -  `Contact Us <../../gnome/contact.html>`__

-  `Documentation <../../gnome/index.html>`__

   -  `FAQ <../../gnome/docs/faq2.html>`__
   -  `HAL FAQ <../../gnome/docs/halfaq.html>`__
   -  `2.30 to 2.32 Upgrade FAQ <../../gnome/docs/faq232.html>`__
   -  `Development Branch FAQ <../../gnome/docs/develfaq.html>`__
   -  `Creating Ports <../../gnome/docs/porting.html>`__
   -  `Known Issues <../../gnome/docs/faq232.html#q4>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="contentwrap">

FreeBSD GNOME Project: GNOME 2.32 Upgrading FAQ
===============================================

Contents
--------

#. `What is new in GNOME 2.32? <#q1>`__
#. `How do I upgrade to GNOME 2.32? <#q2>`__
#. `Oops! I ran ``portupgrade(1)``! What do I do? <#q3>`__
#. `The upgrade failed; what do I do? <#q4>`__
#. `List of known GNOME 2.32 problems and their solutions <#q5>`__
#. `I have found a bug; whom should I alert? <#q6>`__
#. `I want the fame and glory of the FreeBSD GNOME team! What can I do
   to participate? <#q7>`__

Full Text
---------

#. 

   **What is new in GNOME 2.32?**

   Although the canonical summary of new features can be found at
   http://www.gnome.org/start/2.8/notes/rnwhatsnew.html, some of the
   most exciting new features of GNOME 2.32 are:

   -  Spatial Nautilus interface, designed to better reflect the logical
      organization of folders
   -  Open/Save dialog box now has the features one would expect in an
      open/save dialog box
   -  Intuitive application to change keyboard layouts
   -  Sleek desktop background selector
   -  Many new applications, applets, and UI enhancements
   -  Extensive list of stability and speed increases

#. 

   **How do I upgrade to GNOME 2.32?**

   ***NOTE: Do not run ``portupgrade(1)`` to upgrade to GNOME 2.32!***

   The simple answer is this:

   #. `CVSup your ports
      tree <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/cvsup.html>`__.
   #. Download the FreeBSD GNOME Project's `upgrade
      script <http://www.FreeBSD.org/gnome/gnome_upgrade.sh>`__.
   #. Run the script as ``root``. Read a good-sized book.

   More detailed instructions are as follows:

   #. CVSup your ports tree.

      To build GNOME 2.32, you need to obtain the 2.32 ports tree
      skeleton. This is most easily accomplished with CVSup. Simply
      obtain the latest ports tree, and you are ready to go. After you
      have obtained the latest ports tree, *do not* run a typical
      ``portupgrade(1)``.

   #. Obtain the upgrade script.

      It is not possible to upgrade from GNOME 2.30 to GNOME 2.32 by
      simply running ``portupgrade(1)``. There are new dependencies, and
      ports will build out-of-order, eventually causing the build to
      fail. Additionally, GTK+-2 cannot install when there are input
      methods installed which were linked against older GTK+-2 versions.

      To work around these problems, and to provide an update mechanism
      as simple as ``portupgrade(1)``, the FreeBSD GNOME team has
      produced a comprehensive upgrade script. The script can be
      downloaded from:

          http://www.FreeBSD.org/gnome/gnome_upgrade.sh

      Simply download that script, and save it to disk.

   #. Run the script.

      Once you have the script downloaded, run, as ``root``:

      ::

          # sh ./gnome_upgrade.sh
              

      Hit ``ENTER`` to begin, answer any questions that pop up, and go
      watch an *entire* Monty Python anthology. Right after hitting
      ``ENTER`` at the beginning, you will be given the path to a
      logfile. By running:

      ::

          $ tail -f /path/to/logfile
                

      you can watch the entire upgrade process as it unfolds. It is
      hypnotic!

#. 

   **Oops! I ran ``portupgrade(1)``! What do I do?**

   Do not worry; hope is not lost. Running ``portupgrade(1)`` will cause
   the build to fail, but it will not cause any lasting damage to your
   ports tree, unless you have done something exceptionally creative.
   Simply download the ``gnome_upgrade.sh`` script and run it, and
   pretend that you ran it in the first place. Nobody needs to know that
   you did not read the directions first!

#. 

   **The upgrade failed; what do I do?**

   Unfortunately, this is not only possible, it is highly probable.
   There are many possible valid GNOME configurations, and even more
   invalid starting points. If the script fails, follow the instructions
   in the error message to let the FreeBSD GNOME team know about the
   failure.

   The majority of build failures will be dependency-related issues. One
   simple way to resolve the problem is to remove the offending port,
   re-run ``gnome_upgrade.sh``, and then reinstall the port when the
   upgrade process is complete. In order to avoid having to build
   everything again, you can pass the ``-restart`` flag to
   ``gnome_upgrade.sh`` to resume a failed build.

#. 

   **List of GNOME 2.32 problems and their solutions**

   Although GNOME 2.32 is certainly the best release to date (of
   course), there are a couple regressions that slipped in, both in the
   GNOME code and in its implementation within FreeBSD. Some of the more
   visible issues are:

   -  `#137388 <http://bugzilla.gnome.org/show_bug.cgi?id=137388>`__:
      [gnome-terminal] gnome-terminal has a problem with the dynamic
      title and vim (**UPDATE:** See this
      `email <http://lists.freebsd.org/pipermail/freebsd-gnome/2004-May/006689.html>`__
      for a workaround to this problem)
   -  GnomeVFS-2 now has native support for sftp methods. Fully
      non-interactive publickey authentication works on all versions of
      FreeBSD, but FreeBSD 5.X is required for password or passphrase
      authentication.

#. 

   **I have found a bug; whom should I alert?**

   Please read the FreeBSD GNOME Project's `documentation on reporting
   bugs <http://www.FreeBSD.org/gnome/docs/bugging.html>`__.

#. 

   **I want the fame and glory of the FreeBSD GNOME team! What can I do
   to participate?**

   Please read our list of `ways to get
   involved <http://www.FreeBSD.org/gnome/docs/volunteer.html>`__!

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div id="footer">

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>
