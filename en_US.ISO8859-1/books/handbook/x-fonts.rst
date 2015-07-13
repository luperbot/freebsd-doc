========================
6.6.?Using Fonts in Xorg
========================

.. raw:: html

   <div class="navheader">

6.6.?Using Fonts in Xorg
`Prev <x-config.html>`__?
Chapter?6.?The X Window System
?\ `Next <x-xdm.html>`__

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

6.6.?Using Fonts in Xorg
------------------------

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

6.6.1.?Type1 Fonts
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

The default fonts that ship with Xorg are less than ideal for typical
desktop publishing applications. Large presentation fonts show up jagged
and unprofessional looking, and small fonts are almost completely
unintelligible. However, there are several free, high quality Type1
(PostScript?) fonts available which can be readily used with Xorg. For
instance, the URW font collection
(`x11-fonts/urwfonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/urwfonts/pkg-descr>`__)
includes high quality versions of standard type1 fonts (Times Roman?,
Helvetica?, Palatino? and others). The Freefonts collection
(`x11-fonts/freefonts <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/freefonts/pkg-descr>`__)
includes many more fonts, but most of them are intended for use in
graphics software such as the Gimp, and are not complete enough to serve
as screen fonts. In addition, Xorg can be configured to use TrueType?
fonts with a minimum of effort. For more details on this, see the
`X(7) <http://www.FreeBSD.org/cgi/man.cgi?query=X&sektion=7>`__ manual
page or `Section?6.6.2, “TrueType? Fonts” <x-fonts.html#truetype>`__.

To install the above Type1 font collections from the Ports Collection,
run the following commands:

.. code:: screen

    # cd /usr/ports/x11-fonts/urwfonts
    # make install clean

And likewise with the freefont or other collections. To have the X
server detect these fonts, add an appropriate line to the X server
configuration file (``/etc/X11/xorg.conf``), which reads:

.. code:: programlisting

    FontPath "/usr/local/share/fonts/urwfonts/"

Alternatively, at the command line in the X session run:

.. code:: screen

    % xset fp+ /usr/local/share/fonts/urwfonts
    % xset fp rehash

This will work but will be lost when the X session is closed, unless it
is added to the startup file (``~/.xinitrc`` for a normal ``startx``
session, or ``~/.xsession`` when logging in through a graphical login
manager like XDM). A third way is to use the new
``/usr/local/etc/fonts/local.conf`` as demonstrated in `Section?6.6.3,
“Anti-Aliased Fonts” <x-fonts.html#antialias>`__.

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

6.6.2.?TrueType? Fonts
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Xorg has built in support for rendering TrueType? fonts. There are two
different modules that can enable this functionality. The freetype
module is used in this example because it is more consistent with the
other font rendering back-ends. To enable the freetype module just add
the following line to the ``"Module"`` section of
``/etc/X11/xorg.conf``.

.. code:: programlisting

    Load  "freetype"

Now make a directory for the TrueType? fonts (for example,
``/usr/local/share/fonts/TrueType``) and copy all of the TrueType? fonts
into this directory. Keep in mind that TrueType? fonts cannot be
directly taken from an Apple? Mac?; they must be in
UNIX?/MS-DOS?/Windows? format for use by Xorg. Once the files have been
copied into this directory, use ttmkfdir to create a ``fonts.dir``, so
that the X font renderer knows that these new files have been installed.
``ttmkfdir`` is available from the FreeBSD Ports Collection as
`x11-fonts/ttmkfdir <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/ttmkfdir/pkg-descr>`__.

.. code:: screen

    # cd /usr/local/share/fonts/TrueType
    # ttmkfdir -o fonts.dir

Now add the TrueType? directory to the font path. This is just the same
as described in `Section?6.6.1, “Type1 Fonts” <x-fonts.html#type1>`__:

.. code:: screen

    % xset fp+ /usr/local/share/fonts/TrueType
    % xset fp rehash

or add a ``FontPath`` line to ``xorg.conf``.

Now Gimp, OpenOffice, and all of the other X applications should now
recognize the installed TrueType? fonts. Extremely small fonts (as with
text in a high resolution display on a web page) and extremely large
fonts (within StarOffice™) will look much better now.

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

6.6.3.?Anti-Aliased Fonts
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

All fonts in Xorg that are found in ``/usr/local/share/fonts/`` and
``~/.fonts/`` are automatically made available for anti-aliasing to
Xft-aware applications. Most recent applications are Xft-aware,
including KDE, GNOME, and Firefox.

In order to control which fonts are anti-aliased, or to configure
anti-aliasing properties, create (or edit, if it already exists) the
file ``/usr/local/etc/fonts/local.conf``. Several advanced features of
the Xft font system can be tuned using this file; this section describes
only some simple possibilities. For more details, please see
`fonts-conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fonts-conf&sektion=5>`__.

This file must be in XML format. Pay careful attention to case, and make
sure all tags are properly closed. The file begins with the usual XML
header followed by a DOCTYPE definition, and then the ``<fontconfig>``
tag:

.. code:: programlisting

    <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
          <fontconfig>

As previously stated, all fonts in ``/usr/local/share/fonts/`` as well
as ``~/.fonts/`` are already made available to Xft-aware applications.
If you wish to add another directory outside of these two directory
trees, add a line similar to the following to
``/usr/local/etc/fonts/local.conf``:

.. code:: programlisting

    <dir>/path/to/my/fonts</dir>

After adding new fonts, and especially new font directories, you should
run the following command to rebuild the font caches:

.. code:: screen

    # fc-cache -f

Anti-aliasing makes borders slightly fuzzy, which makes very small text
more readable and removes “staircases” from large text, but can cause
eyestrain if applied to normal text. To exclude font sizes smaller than
14 point from anti-aliasing, include these lines:

.. code:: programlisting

            <match target="font">
            <test name="size" compare="less">
            <double>14</double>
            </test>
            <edit name="antialias" mode="assign">
            <bool>false</bool>
            </edit>
        </match>
        <match target="font">
            <test name="pixelsize" compare="less" qual="any">
            <double>14</double>
            </test>
            <edit mode="assign" name="antialias">
            <bool>false</bool>
            </edit>
        </match>

Spacing for some monospaced fonts may also be inappropriate with
anti-aliasing. This seems to be an issue with KDE, in particular. One
possible fix for this is to force the spacing for such fonts to be 100.
Add the following lines:

.. code:: programlisting

           <match target="pattern" name="family">
           <test qual="any" name="family">
               <string>fixed</string>
           </test>
           <edit name="family" mode="assign">
               <string>mono</string>
           </edit>
        </match>
        <match target="pattern" name="family">
            <test qual="any" name="family">
            <string>console</string>
            </test>
            <edit name="family" mode="assign">
            <string>mono</string>
            </edit>
        </match>

(this aliases the other common names for fixed fonts as ``"mono"``), and
then add:

.. code:: programlisting

             <match target="pattern" name="family">
             <test qual="any" name="family">
             <string>mono</string>
             </test>
             <edit name="spacing" mode="assign">
             <int>100</int>
             </edit>
         </match>      

Certain fonts, such as Helvetica, may have a problem when anti-aliased.
Usually this manifests itself as a font that seems cut in half
vertically. At worst, it may cause applications to crash. To avoid this,
consider adding the following to ``local.conf``:

.. code:: programlisting

             <match target="pattern" name="family">
             <test qual="any" name="family">
             <string>Helvetica</string>
             </test>
             <edit name="family" mode="assign">
             <string>sans-serif</string>
             </edit>
         </match>        

Once you have finished editing ``local.conf`` make sure you end the file
with the ``</fontconfig>`` tag. Not doing this will cause your changes
to be ignored.

Finally, users can add their own settings via their personal
``.fonts.conf`` files. To do this, each user should simply create a
``~/.fonts.conf``. This file must also be in XML format.

One last point: with an LCD screen, sub-pixel sampling may be desired.
This basically treats the (horizontally separated) red, green and blue
components separately to improve the horizontal resolution; the results
can be dramatic. To enable this, add the line somewhere in
``local.conf``:

.. code:: programlisting

    <match target="font">
             <test qual="all" name="rgba">
             <const>unknown</const>
             </test>
             <edit name="rgba" mode="assign">
             <const>rgb</const>
             </edit>
         </match>

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

Depending on the sort of display, ``rgb`` may need to be changed to
``bgr``, ``vrgb`` or ``vbgr``: experiment and see which works best.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------+-------------------------+-------------------------------+
| `Prev <x-config.html>`__?   | `Up <x11.html>`__       | ?\ `Next <x-xdm.html>`__      |
+-----------------------------+-------------------------+-------------------------------+
| 6.5.?Xorg Configuration?    | `Home <index.html>`__   | ?6.7.?The X Display Manager   |
+-----------------------------+-------------------------+-------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
