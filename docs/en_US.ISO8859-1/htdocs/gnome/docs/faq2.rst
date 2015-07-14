=====================================
FreeBSD GNOME Project: GNOME 2.32 FAQ
=====================================

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

FreeBSD GNOME Project: GNOME 2.32 FAQ
=====================================

Contents
--------

#. `How do I get GNOME 2.32 for FreeBSD? <#q1>`__
#. `How do I get the most out of GNOME? <#full-gnome>`__
#. `GNOME 2.32 is failing to build from ports. What do I do? <#q2>`__
#. `I installed GNOME 2.32, but I am missing application foo. What
   gives? <#q3>`__
#. `What is the best way to upgrade from GNOME 2.30 to GNOME
   2.32? <#q5>`__
#. `How do I keep my GNOME 2.32 components and applications
   up-to-date? <#q6>`__
#. `How do I uninstall GNOME? <#uninstall>`__
#. `Where can I get more themes for GNOME 2.32? <#q8>`__
#. `What window managers work well with GNOME 2.32? <#q9>`__
#. `Does GNOME 2.32 support anti-aliased fonts? <#q10>`__
#. `How can I control what fonts are anti-aliased? <#q11>`__
#. `How do I edit my GNOME menus? <#q12>`__
#. `How do I use GTK+ 2 resource settings for GTK+ 2 applications when
   not in a GNOME environment? <#q13>`__
#. `How do I configure settings for GNOME 1.4 applications under GNOME
   2.32? <#q14>`__
#. `Brasero does not let me burn CDs, or Totem/Rhythmbox/Sound-juicer
   cannot find my CD/DVD drive. How can I fix this? <#q15>`__
#. `How do I add new GDM sessions? <#q16>`__
#. `How do I disable spatial Nautilus? <#q17>`__
#. `How do I disable desktop icons for "Computer," "Home," and
   "Trash?" <#q18>`__
#. `How do I mount my removable media in Nautilus? <#q19>`__
#. `Why is GNOME so slow to start up? <#q20>`__
#. `How do I install GNOME packages from the GNOME Tinderbox? <#q21>`__
#. `How do I add new MIME types to GNOME? <#q22>`__
#. `How do I configure GDM for automatic logins? <#q23>`__
#. `How do I upgrade from gnome2-lite to the full GNOME 2.32
   desktop? <#q24>`__
#. `How do I enable Emacs-style keybindings in GTK+
   applications? <#q25>`__
#. `Why do I only see generic icons in Nautilus? <#q26>`__
#. `Why do I need confirm access to my keyring every time Nautilus tries
   to open an external share? <#q27>`__
#. `How do I enable window compositing in GNOME? <#q28>`__
#. `How can I get GDM to respect my locale settings? <#q29>`__
#. `Why do I not see any users in GDM? <#procfs>`__

Full Text
---------

#. 

   **How do I get GNOME 2.32 for FreeBSD?**

   There are two ways to install GNOME 2.32 on FreeBSD. One way is to
   use
   `packages <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/packages-using.html>`__,
   and the other way is to use
   `ports <http://www.FreeBSD.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html>`__.
   Before doing either installation, you should first familiarize
   yourself with the GNOME 2.32 `release
   notes <http://www.gnome.org/start/2.32/notes/en/>`__.

   Install GNOME 2.32 from packages.

   To install GNOME 2.32 from packages, use the command:

   ``# pkg_add -r gnome2``

   This will download the latest GNOME 2.32 packages from the FreeBSD
   FTP site, and proceed to install them on your system.

   Up-to-date GNOME packages for i386 and amd64 for all supported
   versions of FreeBSD are also available from the `GNOME
   Tinderbox <#q21>`__.

   To build GNOME 2.32, you must first obtain the latest ports tree
   skeleton. This is most easily accomplished with ``portsnap(8)`` Then:

   ::

       # cd /usr/ports/x11/gnome2
       # make clean
       # make install clean
               

   You still need to `enable the GNOME services <#full-gnome>`__ to run
   e.g. the graphical login automatically on system startup.

#. 

   **How do I get the most out of GNOME?**

   In order to make the most of your new GNOME Desktop, you will want to
   start all of the GNOME-related services at boot-time. If you wish to
   take full advantage of GNOME, add the following to ``/etc/rc.conf``:

   ::

       gnome_enable="YES"
               

   This will enable services such as GDM, HAL, D-BUS, and Avahi on
   system startup. If you do not want to run all of these services, you
   should forget the *gnome\_enable* property, and manually enable the
   services you want.

   If you do not want to reboot immediately after the installation, you
   can invoke the following commands:

   ::

       # /usr/local/etc/rc.d/dbus start
       # /usr/local/etc/rc.d/avahi-daemon start
       # /usr/local/etc/rc.d/avahi-dnsconfd start
       # /usr/local/etc/rc.d/hald start
       # /usr/local/etc/rc.d/gdm start
               

   To start GNOME 2.32 under X without using GDM, add the following line
   to ``~/.xsession`` or ``~/.xinitrc``, as appropriate (see
   ``startx(1)``):

   ::

       exec ck-launch-session gnome-session
               

#. 

   **GNOME 2.32 is failing to build from ports. What do I do?**

   The majority of GNOME 2.32 compilation problems can be solved by
   making sure all the necessary GNOME 2.32 components are
   `up-to-date <#q6>`__.

   Updating solves most problems

   If you have not yet followed `FAQ #6 <#q6>`__, do so, as it will most
   likely fix the problem you are reading this document to solve.

   Please follow `FAQ #6 <#q6>`__. If you have not done so, and you ask
   for help, you will be told to follow FAQ #6.

   In general, when a GNOME 2.32 component is not up-to-date, you will
   see an error similar to the following:

   ::

       checking for libgnomeui-2.0 libbonoboui-2.0 libbonobo-2.0 >= 2.2.1
       gnome-vfs-2.0 libgnomeprint-2.2 >= 2.3.0 libgnomeprintui-2.2 libglade-2.0...
       configure: error: Library requirements (libgnomeui-2.0 libbonoboui-2.0
       libbonobo-2.0 >= 2.2.1 gnome-vfs-2.0 libgnomeprint-2.2 >= 2.3.0 libgnomeprintui-2.2
       libglade-2.0) not met; consider adjusting the PKG_CONFIG_PATH environment variable
       if your libraries are in a nonstandard prefix so pkg-config can find them.
                 

   Simply keeping your ports tree `up-to-date <#q6>`__ will prevent
   these errors.

   If the ``pkg-config`` program is out-of-date, you may see a configure
   error similar to the following:

   ::

       configure: error: *** pkg-config too old; version 0.14 or better required.
                 

   While this may be buried in some other text, the error is very
   straight-forward: you need to upgrade pkg-config. The pkg-config
   application is found in the ``devel/pkg-config`` port. By updating
   this port to the latest version, this error will go away.

   You may see compiler errors relating to pthreads (POSIX? threads),
   such as:

   ::

       undefined reference to 'strerror_r'
                   

   To fix thread related errors, make sure you have the following
   compiled into your kernel:

   ::

       options     _KPOSIX_PRIORITY_SCHEDULING
                   

   If you are tracking -STABLE or -CURRENT, make sure that you do
   **not** have ``NO_LIBPTHREAD`` set in ``/etc/make.conf``. If you do,
   remove it, then rebuild world. If you still have trouble, please send
   email to freebsd-gnome@FreeBSD.org with the output of the failed
   compilation. It is also helpful to include the config.log from the
   port's work directory.

   Prevent two versions of the same library.

   A common source of build failures is the existence of multiple
   versions of the same library. This can happen if you have two
   different versions of a port installed, or can even happen through
   normal ``portupgrade`` use. You can back up the libraries in
   ``/usr/local/lib/compat/pkg`` and remove them, and then run
   ``portupgrade -u -rf pkg-config``. This will force a rebuild of all
   GNOME-related apps (and a fair number of other apps) without
   retaining old versions of libraries in ``/usr/local/lib/compat/pkg``.

   Fix PREFIX move-related errors.

   Starting with 2.16, GNOME now lives in ``LOCALBASE`` instead of
   ``X11BASE``. This move can cause strange build problems if `the
   proper upgrade steps <../../gnome/docs/faq226.html>`__ are not
   followed. However, if after following all the steps, you may still
   see errors like the following:

   ::

       grep: /usr/X11R6/lib/libglade-2.0.la: No such file or directory
       sed: /usr/X11R6/lib/libglade-2.0.la: No such file or directory
       libtool: link: `/usr/X11R6/lib/libglade-2.0.la' is not a valid libtool archive
               

   This error indicates that an old libtool archive (a file that ends
   with ``.la``) is still lingering about on your system. To find such
   files, search through the system for libtool archive files that
   contain the bad string (``/usr/X11R6/lib/libglade-2.0.la`` in the
   example above). To do that, use the following command:

   ::

       # find / -type f -name "*.la" | xargs grep -l /usr/X11R6/lib/libglade-2.0.la
               

   For each file that is found, use ``pkg_info`` to determine which port
   or package installed it. For example, if you find that
   ``/usr/X11R6/lib/libgnomeui-2.0.la`` contains the problem libtool
   reference, do the following:

   ::

       # pkg_info -W /usr/X11R6/lib/libgnomeui-2.0.la
               

   If you get back a package name, then force an upgrade of that package
   using ``portupgrade``. If you do not get back anything, then you can
   safely delete the libtool archive file. Once the file is gone, check
   the directory from which you deleted it for other files with similar
   names. In the example above, check for
   ``/usr/X11R6/lib/libgnomeui-2.0.*``. If you find any matching files,
   delete those, too. Once all of the files are gone, you can resume
   building your original port. Repeat these steps if you encounter
   further such problems.

#. 

   **I installed GNOME 2.32, but I am missing application foo. What
   gives?**

   Only the core Desktop is included in the ``gnome2`` package. Here are
   some other GNOME meta-ports that offer convenient groupings of
   popular GNOME software.

   -  The **GNOME Fifth Toe** (``x11/gnome2-fifth-toe``) consists of
      stable GNOME applications that many users expect to find in a
      functional desktop environment. This includes image manipulation
      applications, chat and instant messenger applications, and music
      and multimedia players
   -  The **GNOME Hacker Tools** (``devel/gnome2-hacker-tools``)
      consists of applications developers would need to create and
      maintain GNOME software projects. This includes IDEs, interface
      builders, "hacker" editors, and code generation tools.
   -  The **GNOME Office** (``editors/gnome2-office``) consists of
      applications that are commonly found in office or productivity
      suites. This includes a spreadsheet application, word processor,
      project management application, database access application,
      groupware suite, and diagramming application.
   -  The **GNOME Power Tools** (``x11/gnome2-power-tools``) consists of
      utilities and applets for the technically-minded GNOME user. It
      also contains many useful add-on utilities for some of the
      applications found in the Desktop and Fifth Toe.

   To install any of these from packages:

   ::

       # pkg_add -r meta-port
                   

   For example, to install the GNOME Fifth Toe from packages:

   ::

       # pkg_add -r gnome2-fifth-toe
               

   To install any of these from ports:

   ::

       # cd /usr/ports/category/meta-port
       # make clean
       # make install clean
               

   For example, to install the GNOME Fifth Toe from ports:

   ::

       # cd /usr/ports/x11/gnome2-fifth-toe
       # make clean
       # make install clean
               

#. 

   **What is the best way to upgrade from GNOME 2.30 to GNOME 2.32?**

   The 2.30 to 2.32 may have a few caveats. You are strongly advised to
   read the `upgrade FAQ <faq226.html>`__ for detailed instructions.

#. 

   **How do I keep my GNOME 2.32 components and applications
   up-to-date?**

   You are emphatically encouraged to use ``portupgrade`` or
   ``portmaster`` to keep your GNOME 2.32 components and applications
   up-to-date.

   Update your ports with ``portupgrade`` or ``portmaster``.

   Once you have updated your ports tree (presumably with ``portsnap``),
   the following two simple commands will update what needs to be
   updated, and will prevent inconsistencies:

   ::

       # pkgdb -F
       # portupgrade -a
               

   OR

   ::

       # portmaster -a
               

   Start from scratch.

   Despite consistent utilization of ``portupgrade`` or ``portmaster``,
   if it seems like everything is refusing to build with everything
   else, you might save yourself a headache or three by removing all
   your GNOME apps and reinstalling them (your data files will remain
   untouched). To do this, follow these commands:

   ::

       # pkg_delete -rf pkg-config\*
       # cd /usr/ports/x11/gnome2
       # make clean
       # make install clean
               

   After running the above commands, you will have to reinstall all the
   GNOME applications you desire. This process sounds painful, but it is
   actually a great way to clear cruft off of your system. Just install
   applications as you need them, and you will be surprised how much
   disk space you have reclaimed. A full rebuild does take a significant
   amount of time; fortunately, this measure is only rarely needed.

#. 

   **How do I uninstall GNOME?**

   We would prefer that you did not uninstall GNOME ;-), but if you
   must, you have to decide how much you want to uninstall. If you have
   installed ``x11/gnome2`` and you want to remove all Desktop
   components that do not have other dependent packages, do the
   following:

   ::

       # pkg_deinstall -R x11/gnome2
               

   **Note:** the ``pkg_deinstall`` command requires you have
   ``ports-mgmt/portupgrade`` installed.

   If you want to force a removal of all Desktop components (this is
   generally not recommended), do the following:

   ::

       # pkg_deinstall -Rf x11/gnome2
               

#. 

   **Where can I get more themes for GNOME 2.32?**

   On the following websites, you can find themes for GTK+, metacity,
   nautilus, GDM, icons, backgrounds, and more:

   -  `art.gnome.org <http://art.gnome.org>`__
   -  `GNOME-look.org <http://www.gnome-look.org>`__
   -  `The Theme Depot <http://www.themedepot.org>`__
   -  `themes.freshmeat.net <http://themes.freshmeat.net>`__
   -  `Jimmac's Icons site <http://jimmac.musichall.cz/icons.php>`__

   Some of these themes have already been ported to FreeBSD. Check out
   the ``x11-themes/gnome-icons`` and ``x11-themes/metacity-themes``
   meta-ports for a nice sample.

#. 

   **What window managers work well with GNOME 2.32?**

   The ``gnome2`` meta-port installs the Metacity window manager by
   default. Another popular window manager that works well with GNOME
   2.32 is `Sawfish <http://sawmill.sourceforge.net/>`__. Sawfish can be
   found in ``x11-wm/sawfish``.

   To switch between Metacity and Sawfish in GNOME, you will need to do
   the following:

   ::

       # killall metacity; sawfish &
       # gnome-session-save --gui

   The ``gnome-session-save`` is important. Without it, the window
   manager will revert back to the one previously configured upon next
   login. To switch back, simply reverse ``sawfish`` and ``metacity``.

   If you have gotten the GNOME 2.32 desktop working under an
   alternative window manager, please take a screenshot and `send it to
   us <mailto:freebsd-gnome@FreeBSD.org>`__!

#. 

   **Does GNOME 2.32 support anti-aliased fonts?**

   Yes! Anti-aliasing requires X.Org with freetype2 support. To add
   freetype2 support to X, make sure you have the following modules
   loaded in your xorg.conf file under the Modules section:

   ::

       Load    "freetype"
       Load    "type1"
               

   Then, simply check out the Fonts capplet under Applications->Desktop
   Preferences. If you want a good set of TrueType starter fonts,
   install the ``x11-fonts/webfonts`` port.

   Sometimes, after adding new fonts to the system, it is necessary to
   teach fontconfig about them. If you find that newly added fonts are
   not made available even after restarting GNOME, run the following
   command as root:

   ::

       # fc-cache -f -v
               

   If you have any questions, please send them to
   freebsd-gnome@FreeBSD.org.

#. 

   **How can I control what fonts are anti-aliased?**

   GNOME 2.32 makes use of libXft and fontconfig to handle
   anti-aliasing. Fontconfig is a very powerful XML-based font
   configuration package. You can create a ``~/.fonts.conf`` file that
   controls virtually every aspect of fontconfig. For example, if you do
   not want to anti-alias fonts smaller than 16 point, create a
   ``~/.fonts.conf`` with the following contents:

   ::

       <?xml version="1.0"?>
       <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
       <fontconfig>

       <match target="font">
               <test name="size" compare="less_eq">
                       <double>16</double>
               </test>
               <edit name="antialias" mode="assign">
                       <bool>false</bool>
               </edit>
       </match>
       <match target="font">
               <test name="pixelsize" compare="less_eq">
                       <double>16</double>
               </test>
               <edit name="antialias" mode="assign">
                       <bool>false</bool>
               </edit>
       </match>
       </fontconfig>
                       

   Refer to fonts-conf(5) for more information.

#. 

   **How do I edit my GNOME menus?**

   Right-click on the Applications menu, and select **Edit Menus**. This
   will invoke the **alacarte** menu editing tool.

#. 

   **How do I use GTK+ resource settings for GTK+ applications when not
   in a GNOME environment?**

   GNOME applications get their GTK+ resources from themes and the
   corresponding theme engine. If you would rather run your GTK+
   applications in a non-GNOME environment then you will need to create
   a file named ``~/.gtkrc-2.0``.

   To use the widgets from a GTK+ theme when in a non-GNOME environment,
   simply ``include`` the theme's ``gtk-2.0/gtkrc`` in your
   ``~/.gtkrc-2.0``. For example:

   ::

       include "/usr/local/share/themes/Crux/gtk-2.0/gtkrc"

   If you prefer, you can use the same GTK+ 1.2 theme for both GTK+ 1.2
   and GTK+ 2 applications, which will give your GTK+ programs a
   consistent look. For the most part, you can transfer your settings
   from your ``~/.gtkrc`` file (used for GTK+ 1.2) with a couple of
   caveats.

   #. If you have any theme engine references, you will have to make
      sure there is a corresponding GTK+ theme engine. Otherwise, remove
      the engine entries.
   #. The default font specification should be outside of any ``style``
      blocks and should be specified with the ``gtk-font-name`` keyword.
      For example:

      ::

          gtk-font-name = "Verdana 11"

   Note that while a GTK+ 1.2 ``gtkrc`` file will work in a GTK+ 2
   ``gtkrc-2.0`` file, the opposite is *not* true: the contents of a
   GTK+ 2 ``gtkrc-2.0`` file will *not* work inside a GTK+ 1.2 ``gtkrc``
   file.

   For simply switching GTK+ themes without needing to edit your
   ``~/.gtkrc`` files, you can use the ``x11/gtk-theme-switch`` and
   ``x11/gtk2-theme-switch`` ports.

#. 

   **How do I configure settings for GNOME 1.4 applications under GNOME
   2.32?**

   Install ``sysutils/gnome-control-center1``, then invoke ``gnomecc``
   from the command line to bring up the GNOME 1.4 control center.

#. 

   **Brasero does not let me burn CDs or Totem/Rhythmbox/Sound-juicer
   cannot find my CD/DVD drive. How can I fix this?**

   Brasero, totem, rhythmbox, and sound-juicer cannot use CD/DVD drives
   unless support for those devices is enabled in the kernel, and the
   permissions on the device nodes allow write access. Brasero, totem,
   rhythmbox, and sound-juicer talk to CD/DVD drives through the SCSI
   CAM subsystem. Therefore, you must make sure you have the following
   configured in your kernel:

   ::

       device          scbus
       device          cd
       device          pass
               

   You must also make sure you have the following configured in your
   kernel if you are using an ATAPI CD/DVD drive:

   ::

       device      atapicam
               

   Finally, if you are running GNOME 2.16 or later, you must have `HAL
   running <../../gnome/docs/halfaq.html>`__, or you will only be able
   to burn to an ISO image file.

   To figure out which CD/DVD drive you will be using, run the following
   command as root:

   ::

       # camcontrol devlist
               

   Your output will look similar to the following:

   ::

       <QSI CDRW/DVD SBW-242 UD22>       at scbus1 target 0 lun 0 (cd0,pass0)
               

   The devices in parentheses at the end are important. You must make
   sure the ``/dev`` entries for those devices are writable by the users
   that will be using brasero, totem, rhythmbox, or sound-juicer. In
   addition to those devices, ``/dev/xpt*`` must also be writable to
   your brasero, totem, rhythmbox, and sound-juicer users. The following
   ``/etc/devfs.conf`` configuration will achieve the desired results
   given the above devlist:

   ::

       perm    cd0     0666
       perm    xpt0    0666
       perm    pass0   0666
                 

#. 

   **How do I add new GDM sessions?**

   The process for adding new GDM sessions has changed substantially
   between GNOME 2.2 and 2.32. In order to add new sessions now, you
   must create a ``.desktop`` file containing the session configuration
   information. Session files live in ``/usr/local/etc/dm/Sessions``.
   For example, to add a KDE session, create a file in
   ``/usr/local/etc/dm/Sessions`` called ``kde.desktop``. That file
   should contain the following:

   ::

       [Desktop Entry]
       Encoding="UTF"-8
       Name="KDE"
       Comment="This" session logs you into KDE
       Exec=/usr/local/bin/startkde
       TryExec=/usr/local/bin/startkde
       Icon=
       Type="Application"
               

   This file must have execute permissions. For example:

   ::

       # chmod 0555 kde.desktop
               

   After creating this file, restart GDM, and there will be a **KDE**
   link under the *Sessions* menu.

#. 

   **How do I disable spatial Nautilus?**

   As of GNOME 2.8, Nautilus operates in what is known as a "spatial"
   mode. This means that each item is opened in a new window. This may
   not be desirable to all users. If you wish to revert back to the old
   Nautilus file system browser, go to Desktop->Preferences->File
   Management, click on the Behavior tab, and check the "Always open in
   browser windows" checkbox.

#. 

   **How do I disable desktop icons for "Computer," "Home," and
   "Trash?"**

   If you do not want your desktop cluttered with the default icons for
   "Computer," "Home," and "Trash," you can disable any or all of them.
   To do this, launch **Applications > System Tools > Configuration
   Editor** (``gconf-editor`` from the command line), and go to the
   ``/apps/nautilus/desktop`` key. From here, you can enable or disable
   the icons, and even rename "Home" and "Trash."

#. 

   **How do I mount my removable media in Nautilus?**

   As of GNOME 2.22, the way auto-mounting works has changed
   substantially. The full details are spelled out in our `HAL
   FAQ <../../gnome/docs/halfaq.html>`__.

#. 

   **Why is GNOME so slow to start up?**

   Under normal circumstances, GNOME should only take a few seconds to
   start up (fifteen at most). However, certain configurations may cause
   it to hang for up to an hour at login time.

   First, make sure your machine's hostname properly resolves. To test
   this, run the following command:

   ::

       ping `hostname`
               

   If the command fails, you will either have to add your
   fully-qualified hostname to DNS or to ``/etc/hosts``. If you do not
   have a static IP address, you can append your hostname to the
   ``localhost`` line in ``/etc/hosts``. For example, if your machine's
   hostname is ``gnome-rocks.mydomain.com``, edit ``/etc/hosts``, and
   change the line:

   ::

       127.0.0.1               localhost localhost.my.domain
               

   To:

   ::

       127.0.0.1              localhost localhost.my.domain gnome-rocks gnome-rocks.mydomain.com
               

   Finally, if you have either the TCP or UDP blackhole sysctl enabled,
   this may cause GNOME to stall on login. If, after fixing hostname
   resolution, GNOME still takes a long time to startup, verify the
   following sysctls are set to 0:

   ::

       net.inet.tcp.blackhole
       net.inet.udp.blackhole
               

#. 

   **How do I install GNOME packages from the GNOME Tinderbox?**

   The GNOME Tinderbox is a service that continually builds
   `i386 <http://www.marcuscom.com/tinderbox/>`__ and
   `amd64 <http://cobbler.marcuscom.com/tinderbox/>`__ packages of the
   GNOME desktop for all supported versions of FreeBSD. As hardware gets
   better, more meta-ports may be added in the future. This service can
   be a great way of getting the latest GNOME desktop without having to
   wait for everything to build from ports.

   To install packages from the GNOME Tinderbox, you must set the
   ``PACKAGESITE`` environment variable to the correct package
   directory. The package directory can be found by clicking on the
   *Package Directory* link on the main Tinderbox page for your
   architecture. Once you have the correct package directory, you should
   append ``/Latest/`` to it so you can ``pkg_add gnome2`` without
   knowing any additional version numbers. For example, if you are
   installing on i386 FreeBSD 6.3, set ``PACKAGESITE`` to the following:

   ::

       http://www.marcuscom.com/tb/packages/6.3-FreeBSD/Latest/
               

   If you are installing on amd64 FreeBSD 6.3, set ``PACKAGESITE`` to
   the following:

   ::

       http://cobbler.marcuscom.com/space/packages/6.3-FreeBSD/Latest/
               

#. 

   **How do I add new MIME types to GNOME?**

   Since GNOME 2.8, MIME types are stored in the new FreeDesktop
   shared-mime-info database. However, gnome-control-center has not been
   updated to allow one to easily add MIME types to this database.
   Therefore, if applications such as Nautilus complain that there is no
   MIME type associated with a particular file, using the *Open With*
   tab under Properties not work.

   New MIME types can be added in one of two places. They can either be
   added system-wide for all users, or added locally on a per-user
   basis. System-wide MIME types must be added to
   ``LOCALBASE/share/mime`` , where as local MIME types must be added to
   ``~/.local/share/mime``. In both cases, the procedure is the same.

   To define a new MIME type, you must create an *application* and a
   *packages* file to describe it. The application file will be named
   for the MIME type, and contain its name and a brief comment
   describing it. The packages file will list all the extensions
   associated with this MIME type as well as any special file magic that
   can be used to identify files without an extension.

   For example, if we wanted to add a new local MIME type for Windows
   HTML Help files (i.e. .chm files) called **application/x-chm**, we
   would do the following. First, we would create the directories
   ``~/.local/share/mime/application`` and
   ``~/.local/share/mime/packages`` if they did not already exist. Then,
   we create an application file called ``x-chm.xml`` that we will place
   in ``~/.local/share/mime/application``. The file looks like:

   ::

       <?xml version="1.0" encoding="utf-8"?>
       <mime-type
       xmlns="http://www.freedesktop.org/standards/shared-mime-info"
       type="application/x-chm">
         <comment>Windows HTML Help file</comment>
       </mime-type>
               

   Next, we create a packages file called ``chm.xml`` that we will place
   in ``~/.local/share/mime/packages``. The file looks like:

   ::

       <?xml version="1.0" encoding="utf-8"?>
       <mime-info
       xmlns="http://www.freedesktop.org/standards/shared-mime-info">
         <mime-type type="application/x-chm">
           <comment>Windows HTML Help file</comment>
           <glob pattern="*.chm" />
         </mime-type>
       </mime-info>
               

   Once the files have been created, the MIME database must be updated.
   To do that, run the command:

   ::

       % update-mime-database ~/.local/share/mime
               

   Finally (and unfortunately), you must logout and log back in to GNOME
   for the changes to fully take effect. Nautilus' *Properties->Open
   With* interface can now be used to associate an application to this
   MIME type. Hopefully all of this will be made much easier in a future
   GNOME release.

#. 

   **How do I configure GDM for automatic logins?**

   The GNOME Display Manager (GDM) can be configured to automatically
   log a user in when it starts up. To do that, you must first configure
   Pluggable Authentication Module (PAM) support for *gdm-autologin*.
   Create a ``/etc/pam.d/gdm-autologin`` file with the following
   contents:

   ::

       auth       required     pam_permit.so
       account    required     pam_nologin.so
       account    required     pam_unix.so
       session    required     pam_permit.so
               

   Once PAM is configured to allow GDM automatic logins, edit
   ``/usr/local/etc/gdm/custom.conf``, and set
   ``AutomaticLoginEnable="true"``, and ``AutomaticLogin`` equal to the
   username for which you wish to enable automatic logins. Both of these
   properties should be placed under the ``[daemon]`` heading. For
   example:

   ::

       [daemon]
       AutomaticLoginEnable="true"
       AutomaticLogin="marcus"
               

   That will automatically login the user *marcus* as soon as GDM
   launches.

#. 

   **How do I upgrade from gnome2-lite to the full GNOME 2.32 desktop?**

   The *Lite* edition does not include all of the components of the
   standard GNOME 2.32 desktop. If you wish to install the full desktop,
   first remove the ``gnome2-lite`` package, then `install <#q1>`__ the
   ``gnome2`` port or package. For example:

   ::

       # pkg_delete gnome2-lite
               

   Then one of the following:

   ::

       # cd /usr/ports/x11/gnome2
       # make install clean
               

   or:

   ::

       # pkg_add -r gnome2
               

   Alternatively, you can install additional GNOME components
   individually using either their ports or packages.

#. 

   **How do I enable Emacs-style keybindings in GTK+ applications?**

   By default, GTK+ uses Windows-like keyboard shortcuts for command
   line editing. Many UNIX users are more familiar or more comfortable
   with Emacs-style shortcuts. For example, GTK+ uses Control+A to mean,
   "select all," where as Emacs uses Control+A to mean, "put cursor at
   the beginning of line."

   In order to use Emacs-style keybindings in GTK+ applications, edit
   ``~/.gtkrc-2.0``, and add the following:

   ::

       gtk-key-theme-name = "Emacs"
               

   If you are using the GNOME Desktop, however, this is not sufficient.
   You must also change the GConf key
   ``/desktop/gnome/interface/gtk_key_theme`` to "Emacs" using
   **Applications > System Tools > Configuration Editor**
   (``gconf-editor`` from the command line).

#. 

   **Why do I only see generic icons in Nautilus?**

   This typically occurs for users that are not running the full GNOME
   Desktop. By default, ``gnome-session`` will start
   ``gnome-settings-daemon`` automatically. This daemon is responsible
   for setting many GTK+ and GNOME preferences including the icon theme.
   If you are not running the GNOME Desktop, make sure the following has
   been added to your X11 session startup preferences:

   ::

       /usr/local/libexec/gnome-settings-daemon &
               

   If you are running the full GNOME Desktop, there may be a problem
   executing ``gnome-settings-daemon``. Try running
   ``/usr/local/libexec/gnome-settings-daemon`` from the command line,
   and check for any errors. Most problems can be solved by reinstalling
   ``sysutils/gnome-settings-daemon``.

#. 

   **Why do I need confirm access to my keyring every time Nautilus
   tries to open an external share?**

   You did not mount the ``procfs`` file system. Procfs is not mounted
   by default in recent releases of FreeBSD. Consider adding the
   following line to your ``/etc/fstab`` file:

   ::

       proc            /proc       procfs  rw  0   0
               

#. 

   **How do I enable window compositing in GNOME?**

   Starting with GNOME 2.22, the Metacity window manager includes a
   compositing manager. When compositing is enabled, widgets will get a
   drop shadow, and the Alt+Tab application switcher will show previews
   of the application windows.

   Compositing is not enabled by default as not all graphics cards and
   drivers will do well with it. If your graphics card and driver
   support accelerated 3D rendering and you want to use compositing you
   can enable it using the following command:

   ::

       % gconftool-2 -s --type bool /apps/metacity/general/compositing_manager true
               

   If you want to disable it again, change "true" to "false", and re-run
   the command. You can also use ``gconf-editor`` to edit it.

   If your card is supported by the "nvidia," "intel", "openchrome", or
   "radeon" (see the radeon(4) man page to make sure your card is
   supported for 3D acceleration) drivers, then compositing should work
   for you.

#. 

   **How do I get GDM to respect my locale settings?**

   Up until GNOME 2.20, GDM would read the locale settings from
   ``/etc/login.conf`` or ``~/.login.conf``. This was broken in 2.20,
   and finally restored in GDM 2.26.1\_3.

   However, GDM also offers a pull-down Language menu from which you can
   choose your current locale. If you would rather not use this menu or
   ``/etc/login.conf``, you can set the locale by adding the following
   to ``~/.profile``:

   ::

       export LANG=<locale>
       export LC_ALL=<locale>
               

   Here, ``<locale>`` is the desired locale (e.g. en\_US.UTF-8,
   es\_ES.ISO8859-15, fr\_FR.ISO8859-1, etc.).

   To set the default locale for the GDM greeter, add the same
   environment variables to ``/etc/profile`` or define ``gdm_lang`` to
   the desired locale in ``/etc/rc.conf``.

#. 

   **Why do I not see any users in GDM?**

   You did not mount the ``procfs`` file system. Procfs is not mounted
   by default in recent releases of FreeBSD. You must add the following
   line to your ``/etc/fstab`` file:

   ::

       proc            /proc       procfs  rw  0   0
               

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
