=============
7.2.?Browsers
=============

.. raw:: html

   <div class="navheader">

7.2.?Browsers
`Prev <desktop.html>`__?
Chapter?7.?Desktop Applications
?\ `Next <desktop-productivity.html>`__

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

7.2.?Browsers
-------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

FreeBSD does not come with a pre-installed web browser. Instead, the
`www <http://www.FreeBSD.org/ports/www.html>`__ category of the Ports
Collection contains many browsers which can be installed as a package or
compiled from the Ports Collection.

The KDE and GNOME desktop environments include their own HTML browser.
Refer to `Section?6.8, “Desktop Environments” <x11-wm.html>`__ for more
information on how to set up these complete desktops.

Some light-weight browsers include
`www/dillo2 <http://www.freebsd.org/cgi/url.cgi?ports/www/dillo2/pkg-descr>`__,
`www/links <http://www.freebsd.org/cgi/url.cgi?ports/www/links/pkg-descr>`__,
and
`www/w3m <http://www.freebsd.org/cgi/url.cgi?ports/www/w3m/pkg-descr>`__.

This section demonstrates how to install the following popular web
browsers and indicates if the application is resource-heavy, takes time
to compile from ports, or has any major dependencies.

.. raw:: html

   <div class="informaltable">

+--------------------+--------------------+---------------------------+---------------------------------------------------------+
| Application Name   | Resources Needed   | Installation from Ports   | Notes                                                   |
+====================+====================+===========================+=========================================================+
| Firefox            | medium             | heavy                     | FreeBSD, Linux?, and localized versions are available   |
+--------------------+--------------------+---------------------------+---------------------------------------------------------+
| Opera              | light              | light                     | FreeBSD and Linux? versions are available               |
+--------------------+--------------------+---------------------------+---------------------------------------------------------+
| Konqueror          | medium             | heavy                     | Requires KDE libraries                                  |
+--------------------+--------------------+---------------------------+---------------------------------------------------------+
| Chromium           | medium             | heavy                     | Requires Gtk+                                           |
+--------------------+--------------------+---------------------------+---------------------------------------------------------+

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

7.2.1.?Firefox
~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Firefox is an open source browser that is fully ported to FreeBSD. It
features a standards-compliant HTML display engine, tabbed browsing,
popup blocking, extensions, improved security, and more. Firefox is
based on the Mozilla codebase.

To install the package of the latest release version of Firefox, type:

.. code:: screen

    # pkg install firefox

To instead install Firefox Extended Support Release (ESR) version, use:

.. code:: screen

    # pkg install firefox-esr

Localized versions are available in
`www/firefox-i18n <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox-i18n/pkg-descr>`__
and
`www/firefox-esr-i18n <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox-esr-i18n/pkg-descr>`__.

The Ports Collection can instead be used to compile the desired version
of Firefox from source code. This example builds
`www/firefox <http://www.freebsd.org/cgi/url.cgi?ports/www/firefox/pkg-descr>`__,
where ``firefox`` can be replaced with the ESR or localized version to
install.

.. code:: screen

    # cd /usr/ports/www/firefox
    # make install clean

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

7.2.1.1.?Firefox and Java™ Plugin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The installation of Firefox does not include Java™ support. However,
`java/icedtea-web <http://www.freebsd.org/cgi/url.cgi?ports/java/icedtea-web/pkg-descr>`__
provides a free software web browser plugin for running Java applets. It
can be installed as a package. To alternately compile the port:

.. code:: screen

    # cd /usr/ports/java/icedtea-web
    # make install clean

Keep the default configuration options when compiling the port.

Once installed, start firefox, enter ``about:plugins`` in the location
bar and press **Enter**. A page listing the installed plugins will be
displayed. The Java™ plugin should be listed.

If the browser is unable to find the plugin, each user will have to run
the following command and relaunch the browser:

.. code:: screen

    % ln -s /usr/local/lib/IcedTeaPlugin.so \
      $HOME/.mozilla/plugins/

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

7.2.1.2.?Firefox and Adobe? Flash? Plugin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A native Adobe? Flash? plugin is not available for FreeBSD. However, a
software wrapper for running the Linux? version of the plugin is
available. This wrapper also provides support for other browser plugins
such as RealPlayer?.

To install and enable this plugin, perform these steps:

.. raw:: html

   <div class="procedure">

#. Install
   `www/nspluginwrapper <http://www.freebsd.org/cgi/url.cgi?ports/www/nspluginwrapper/pkg-descr>`__
   from the port. Due to licensing restrictions, a package is not
   available. This port requires
   `emulators/linux\_base-c6 <http://www.freebsd.org/cgi/url.cgi?ports/emulators/linux_base-c6/pkg-descr>`__.

#. Install
   `www/linux-c6-flashplugin11 <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-c6-flashplugin11/pkg-descr>`__
   from the port. Due to licensing restrictions, a package is not
   available.

#. Before the plugin is first used, each user must run:

   .. code:: screen

       % nspluginwrapper -v -a -i

   When the plugin port has been updated and reinstalled, each user must
   run:

   .. code:: screen

       % nspluginwrapper -v -a -u

   Start the browser, enter ``about:plugins`` in the location bar and
   press **Enter**. A list of all the currently available plugins will
   be shown.

.. raw:: html

   </div>

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

7.2.1.3.?Firefox and Swfdec Flash? Plugin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Swfdec is a decoder and renderer for Flash? animations. Swfdec-Mozilla
is a plugin for Firefox browsers that uses the Swfdec library for
playing SWF files.

To install the package:

.. code:: screen

    # pkg install swfdec-plugin

If the package is not available, compile and install it from the Ports
Collection:

.. code:: screen

    # cd /usr/ports/www/swfdec-plugin
    # make install clean

Restart the browser to activate this plugin.

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

7.2.2.?Opera
~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Opera is a full-featured and standards-compliant browser which is still
lightweight and fast. It comes with a built-in mail and news reader, an
IRC client, an RSS/Atom feeds reader, and more. It is available as a
native FreeBSD version and as a version that runs under Linux?
emulation.

This command installs the package of the FreeBSD version of Opera.
Replace ``opera`` with ``linux-opera`` to instead install the Linux?
version.

.. code:: screen

    # pkg install opera

Alternately, install either version through the Ports Collection. This
example compiles the native version:

.. code:: screen

    # cd /usr/ports/www/opera
    # make install clean

To install the Linux? version, substitute ``linux-opera`` in place of
``opera``.

To install Adobe? Flash? plugin support, first compile the
`www/linux-c6-flashplugin11 <http://www.freebsd.org/cgi/url.cgi?ports/www/linux-c6-flashplugin11/pkg-descr>`__
port. Licensing restrictions prevent making a package available. Then
install
`www/opera-linuxplugins <http://www.freebsd.org/cgi/url.cgi?ports/www/opera-linuxplugins/pkg-descr>`__.
This example compiles both applications from ports:

.. code:: screen

    # cd /usr/ports/www/linux-c6-flashplugin11
    # make install clean
    # cd /usr/ports/www/opera-linuxplugins
    # make install clean

Once installed, check the presence of the plugin by starting the
browser, entering ``opera:plugins`` in the location bar and pressing
**Enter**. A list should appear with all the currently available
plugins.

To add the Java™ plugin, follow the instructions in `Section?7.2.1.1,
“Firefox and Java™ Plugin” <desktop-browsers.html#moz-java-plugin>`__.

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

7.2.3.?Konqueror
~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Konqueror is more than a web browser as it is also a file manager and a
multimedia viewer. It is included in the
`x11/kde4-baseapps <http://www.freebsd.org/cgi/url.cgi?ports/x11/kde4-baseapps/pkg-descr>`__
package or port.

Konqueror supports WebKit as well as its own KHTML. WebKit is a
rendering engine used by many modern browsers including Chromium. To use
WebKit with Konqueror on FreeBSD, install the
`www/kwebkitpart <http://www.freebsd.org/cgi/url.cgi?ports/www/kwebkitpart/pkg-descr>`__
package or port. This example compiles the port:

.. code:: screen

    # cd /usr/ports/www/kwebkitpart
    # make install clean

To enable WebKit within Konqueror, click “Settings”, “Configure
Konqueror”. In the “General” settings page, click the drop-down menu
next to “Default web browser engine” and change “KHTML” to “WebKit”.

Konqueror also supports Flash?. A “How To” guide for getting Flash?
support on Konqueror is available at
``http://freebsd.kde.org/howtos/konqueror-flash.php``.

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

7.2.4.?Chromium
~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Chromium is an open source browser project that aims to build a safer,
faster, and more stable web browsing experience. Chromium features
tabbed browsing, popup blocking, extensions, and much more. Chromium is
the open source project upon which the Google Chrome web browser is
based.

Chromium can be installed as a package by typing:

.. code:: screen

    # pkg install chromium

Alternatively, Chromium can be compiled from source using the Ports
Collection:

.. code:: screen

    # cd /usr/ports/www/chromium
    # make install clean

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The executable for Chromium is ``/usr/local/bin/chrome``, not
``/usr/local/bin/chromium``.

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

7.2.4.1.?Chromium and Java™ Plugin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The installation of Chromium does not include Java™ support. To install
Java™ plugin support, follow the instructions in `Section?7.2.1.1,
“Firefox and Java™ Plugin” <desktop-browsers.html#moz-java-plugin>`__.

Once Java™ support is installed, start Chromium and enter
``about:plugins`` in the address bar. IcedTea-Web should be listed as
one of the installed plugins.

If Chromium does not display the IcedTea-Web plugin, run the following
commands and restart the web browser:

.. code:: screen

    # mkdir -p /usr/local/share/chromium/plugins
    # ln -s /usr/local/lib/IcedTeaPlugin.so \
      /usr/local/share/chromium/plugins/

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

7.2.4.2.?Chromium and Adobe??Flash? Plugin
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Configuring Chromium and Adobe??Flash? is similar to the instructions in
`Section?7.2.1.2, “Firefox and Adobe? Flash?
Plugin” <desktop-browsers.html#moz-flash-plugin>`__. No additional
configuration should be necessary, since Chromium is able to use some
plugins from other browsers.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-------------------------------------------+
| `Prev <desktop.html>`__?           | `Up <desktop.html>`__   | ?\ `Next <desktop-productivity.html>`__   |
+------------------------------------+-------------------------+-------------------------------------------+
| Chapter?7.?Desktop Applications?   | `Home <index.html>`__   | ?7.3.?Productivity                        |
+------------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
