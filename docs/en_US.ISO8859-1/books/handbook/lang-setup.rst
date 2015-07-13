=================================================
23.4.?Locale Configuration for Specific Languages
=================================================

.. raw:: html

   <div class="navheader">

23.4.?Locale Configuration for Specific Languages
`Prev <l10n-compiling.html>`__?
Chapter?23.?Localization - i18n/L10n Usage and Setup
?\ `Next <updating-upgrading.html>`__

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

23.4.?Locale Configuration for Specific Languages
-------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section provides configuration examples for localizing a FreeBSD
system for the Russian language. It then provides some additional
resources for localizing other languages.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.4.1.?Russian Language (KOI8-R Encoding)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Originally contributed by Andrey Chernov.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section shows the specific settings needed to localize a FreeBSD
system for the Russian language. Refer to `Using
Localization <using-localization.html>`__ for a more complete
description of each type of setting.

To set this locale for the login shell, add the following lines to each
user's ``~/.login_conf``:

.. code:: programlisting

    me:My Account:\
        :charset=KOI8-R:\
        :lang=ru_RU.KOI8-R:

To configure the console, add the following lines to ``/etc/rc.conf``:

.. code:: programlisting

    keymap="ru.koi8-r"
    scrnmap="koi8-r2cp866"
    font8x16="cp866b-8x16"
    font8x14="cp866-8x14"
    font8x8="cp866-8x8"
    mousechar_start=3

For each ``ttyv`` entry in ``/etc/ttys``, use ``cons25r`` as the
terminal type.

To configure printing, a special output filter is needed to convert from
KOI8-R to CP866 since most printers with Russian characters come with
hardware code page CP866. FreeBSD includes a default filter for this
purpose, ``/usr/libexec/lpr/ru/koi2alt``. To use this filter, add this
entry to ``/etc/printcap``:

.. code:: programlisting

    lp|Russian local line printer:\
        :sh:of=/usr/libexec/lpr/ru/koi2alt:\
        :lp=/dev/lpt0:sd=/var/spool/output/lpd:lf=/var/log/lpd-errs:

Refer to
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5>`__
for a more detailed explanation.

To configure support for Russian filenames in mounted MS-DOS? file
systems, include ``-L`` and the locale name when adding an entry to
``/etc/fstab``:

.. code:: programlisting

    /dev/ad0s2      /dos/c  msdos   rw,-Lru_RU.KOI8-R 0 0

Refer to
`mount\_msdosfs(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdosfs&sektion=8>`__
for more details.

To configure Russian fonts for Xorg, install the
`x11-fonts/xorg-fonts-cyrillic <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/xorg-fonts-cyrillic/pkg-descr>`__
package. Then, check the ``"Files"`` section in ``/etc/X11/xorg.conf``.
The following line must be added *before* any other ``FontPath``
entries:

.. code:: programlisting

    FontPath   "/usr/local/lib/X11/fonts/cyrillic"

Additional Cyrillic fonts are available in the Ports Collection.

To activate a Russian keyboard, add the following to the ``"Keyboard"``
section of ``/etc/xorg.conf``:

.. code:: programlisting

    Option "XkbLayout"   "us,ru"
    Option "XkbOptions"  "grp:toggle"

Make sure that ``XkbDisable`` is commented out in that file.

For ``grp:toggle`` use **Right Alt**, for ``grp:ctrl_shift_toggle`` use
**Ctrl**+**Shift**. For ``grp:caps_toggle`` use **CapsLock**. The old
**CapsLock** function is still available in LAT mode only using
**Shift**+**CapsLock**. ``grp:caps_toggle`` does not work in Xorg for
some unknown reason.

If the keyboard has “Windows?” keys, and some non-alphabetical keys are
mapped incorrectly, add the following line to ``/etc/xorg.conf``:

.. code:: programlisting

    Option "XkbVariant" ",winkeys"

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

The Russian XKB keyboard may not work with non-localized applications.
Minimally localized applications should call a
``XtSetLanguageProc         (NULL, NULL, NULL);`` function early in the
program.

.. raw:: html

   </div>

See ``http://koi8.pp.ru/xwin.html`` for more instructions on localizing
Xorg applications. For more general information about KOI8-R encoding,
refer to ``http://koi8.pp.ru/``.

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

23.4.2.?Additional Language-Specific Resources
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section lists some additional resources for configuring other
locales.

.. raw:: html

   <div class="variablelist">

Traditional Chinese for Taiwan
    The FreeBSD-Taiwan Project has a Chinese HOWTO for FreeBSD at
    ``http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/``.

German Language Localization for All ISO 8859-1 Languages
    A tutorial on using umlauts on FreeBSD is available in German at
    ``http://user.cs.tu-berlin.de/~eserte/FreeBSD/doc/umlaute/umlaute.html``.

Greek Language Localization
    A complete article on Greek support in FreeBSD is available
    `here <../../../../doc/el_GR.ISO8859-7/articles/greek-language-support/index.html>`__,
    in Greek only, as part of the official FreeBSD Greek documentation.

Japanese and Korean Language Localization
    For Japanese, refer to ``http://www.jp.FreeBSD.org/``, and for
    Korean, refer to ``http://www.kr.FreeBSD.org/``.

Non-English FreeBSD Documentation
    Some FreeBSD contributors have translated parts of the FreeBSD
    documentation to other languages. They are available through links
    on the `FreeBSD web site <../../../../index.html>`__ or in
    ``/usr/share/doc``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------+-------------------------+-----------------------------------------------+
| `Prev <l10n-compiling.html>`__?    | `Up <l10n.html>`__      | ?\ `Next <updating-upgrading.html>`__         |
+------------------------------------+-------------------------+-----------------------------------------------+
| 23.3.?Finding i18n Applications?   | `Home <index.html>`__   | ?Chapter?24.?Updating and Upgrading FreeBSD   |
+------------------------------------+-------------------------+-----------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
