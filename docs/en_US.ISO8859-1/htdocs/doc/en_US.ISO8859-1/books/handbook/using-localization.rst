========================
23.2.?Using Localization
========================

.. raw:: html

   <div class="navheader">

23.2.?Using Localization
`Prev <l10n.html>`__?
Chapter?23.?Localization - i18n/L10n Usage and Setup
?\ `Next <l10n-compiling.html>`__

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

23.2.?Using Localization
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Localization settings are based on three components: the language code,
country code, and encoding. Locale names are constructed from these
parts as follows:

.. code:: programlisting

    LanguageCode_CountryCode.Encoding

The *``LanguageCode``* and *``CountryCode``* are used to determine the
country and the specific language variation. `Table?23.1, “Common
Language and Country
Codes” <using-localization.html#locale-lang-country>`__ provides some
examples of *``LanguageCode``*\ \_\ *``CountryCode``*:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?23.1.?Common Language and Country Codes

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------+-------------------------------+
| LanguageCode\_Country Code   | Description                   |
+==============================+===============================+
| en\_US                       | English, United States        |
+------------------------------+-------------------------------+
| ru\_RU                       | Russian, Russia               |
+------------------------------+-------------------------------+
| zh\_TW                       | Traditional Chinese, Taiwan   |
+------------------------------+-------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

A complete listing of available locales can be found by typing:

.. code:: screen

    % locale -a | more

To determine the current locale setting:

.. code:: screen

    % locale

Language specific character sets, such as ISO8859-1, ISO8859-15, KOI8-R,
and CP437, are described in
`multibyte(3) <http://www.FreeBSD.org/cgi/man.cgi?query=multibyte&sektion=3>`__.
The active list of character sets can be found at the `IANA
Registry <http://www.iana.org/assignments/character-sets>`__.

Some languages, such as Chinese or Japanese, cannot be represented using
ASCII characters and require an extended language encoding using either
wide or multibyte characters. Examples of wide or multibyte encodings
include EUC and Big5. Older applications may mistake these encodings for
control characters while newer applications usually recognize these
characters. Depending on the implementation, users may be required to
compile an application with wide or multibyte character support, or to
configure it correctly.

.. raw:: html

   <div class="note" xmlns="">

Note:
~~~~~

FreeBSD uses Xorg-compatible locale encodings.

.. raw:: html

   </div>

The rest of this section describes the various methods for configuring
the locale on a FreeBSD system. The next section will discuss the
considerations for finding and compiling applications with i18n support.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.2.1.?Setting Locale for Login Shell
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Locale settings are configured either in a user's ``~/.login_conf`` or
in the startup file of the user's shell: ``~/.profile``, ``~/.bashrc``,
or ``~/.cshrc``.

Two environment variables should be set:

.. raw:: html

   <div class="itemizedlist">

-  ``LANG``, which sets the locale

-  

   ``MM_CHARSET``, which sets the MIME character set used by
   applications

.. raw:: html

   </div>

In addition to the user's shell configuration, these variables should
also be set for specific application configuration and Xorg
configuration.

Two methods are available for making the needed variable assignments:
the `login class <using-localization.html#login-class>`__ method, which
is the recommended method, and the `startup
file <using-localization.html#startup-file>`__ method. The next two
sections demonstrate how to use both methods.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.2.1.1.?Login Classes Method
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This first method is the recommended method as it assigns the required
environment variables for locale name and MIME character sets for every
possible shell. This setup can either be performed by each user or it
can be configured for all users by the superuser.

This minimal example sets both variables for Latin-1 encoding in the
``.login_conf`` of an individual user's home directory:

.. code:: programlisting

    me:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:

Here is an example of a user's ``~/.login_conf`` that sets the variables
for Traditional Chinese in BIG-5 encoding. More variables are needed
because some applications do not correctly respect locale variables for
Chinese, Japanese, and Korean:

.. code:: programlisting

    #Users who do not wish to use monetary units or time formats
    #of Taiwan can manually change each variable
    me:\
        :lang=zh_TW.Big5:\
        :setenv=LC_ALL=zh_TW.Big5:\
        :setenv=LC_COLLATE=zh_TW.Big5:\
        :setenv=LC_CTYPE=zh_TW.Big5:\
        :setenv=LC_MESSAGES=zh_TW.Big5:\
        :setenv=LC_MONETARY=zh_TW.Big5:\
        :setenv=LC_NUMERIC=zh_TW.Big5:\
        :setenv=LC_TIME=zh_TW.Big5:\
        :charset=big5:\
        :xmodifiers="@im=gcin": #Set gcin as the XIM Input Server

Alternately, the superuser can configure all users of the system for
localization. The following variables in ``/etc/login.conf`` are used to
set the locale and MIME character set:

.. code:: programlisting

    language_name|Account Type Description:\
        :charset=MIME_charset:\
        :lang=locale_name:\
        :tc=default:

So, the previous Latin-1 example would look like this:

.. code:: programlisting

    german|German Users Accounts:\
        :charset=ISO-8859-1:\
        :lang=de_DE.ISO8859-1:\
        :tc=default:

See
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
for more details about these variables.

Whenever ``/etc/login.conf`` is edited, remember to execute the
following command to update the capability database:

.. code:: screen

    # cap_mkdb /etc/login.conf

.. raw:: html

   <div class="sect4">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

23.2.1.1.1.?Utilities Which Change Login Classes
''''''''''''''''''''''''''''''''''''''''''''''''

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

In addition to manually editing ``/etc/login.conf``, several utilities
are available for setting the locale for newly created users.

When using ``vipw`` to add new users, specify the *``language``* to set
the locale:

.. code:: programlisting

    user:password:1111:11:language:0:0:User Name:/home/user:/bin/sh

When using ``adduser`` to add new users, the default language can be
pre-configured for all new users or specified for an individual user.

If all new users use the same language, set
``defaultclass =           language`` in ``/etc/adduser.conf``.

To override this setting when creating a user, either input the required
locale at this prompt:

.. code:: screen

    Enter login class: default []:

or specify the locale to set when invoking ``adduser``:

.. code:: screen

    # adduser -class language

If ``pw`` is used to add new users, specify the locale as follows:

.. code:: screen

    # pw useradd user_name -L language

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

23.2.1.2.?Shell Startup File Method
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This second method is not recommended as each shell that is used
requires manual configuration, where each shell has a different
configuration file and differing syntax. As an example, to set the
German language for the ``sh`` shell, these lines could be added to
``~/.profile`` to set the shell for that user only. These lines could
also be added to ``/etc/profile`` or ``/usr/share/skel/dot.profile`` to
set that shell for all users:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG
    MM_CHARSET=ISO-8859-1; export MM_CHARSET

However, the name of the configuration file and the syntax used differs
for the ``csh`` shell. These are the equivalent settings for
``~/.csh.login``, ``/etc/csh.login``, or ``/usr/share/skel/dot.login``:

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1
    setenv MM_CHARSET ISO-8859-1

To complicate matters, the syntax needed to configure Xorg in
``~/.xinitrc`` also depends upon the shell. The first example is for the
``sh`` shell and the second is for the ``csh`` shell:

.. code:: programlisting

    LANG=de_DE.ISO8859-1; export LANG

.. code:: programlisting

    setenv LANG de_DE.ISO8859-1

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

23.2.2.?Console Setup
~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Several localized fonts are available for the console. To see a listing
of available fonts, type ``ls /usr/share/syscons/fonts``. To configure
the console font, specify the *``font_name``*, without the ``.fnt``
suffix, in ``/etc/rc.conf``:

.. code:: programlisting

    font8x16=font_name
    font8x14=font_name
    font8x8=font_name

The keymap and screenmap can be set by adding the following to
``/etc/rc.conf``:

.. code:: programlisting

    scrnmap=screenmap_name
    keymap=keymap_name
    keychange="fkey_number sequence"

To see the list of available screenmaps, type
``ls /usr/share/syscons/scrnmaps``. Do not include the ``.scm`` suffix
when specifying *``screenmap_name``*. A screenmap with a corresponding
mapped font is usually needed as a workaround for expanding bit 8 to bit
9 on a VGA adapter's font character matrix so that letters are moved out
of the pseudographics area if the screen font uses a bit 8 column.

To see the list of available keymaps, type
``ls /usr/share/syscons/keymaps``. When specifying the
*``keymap_name``*, do not include the ``.kbd`` suffix. To test keymaps
without rebooting, use
`kbdmap(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kbdmap&sektion=1>`__.

The ``keychange`` entry is usually needed to program function keys to
match the selected terminal type because function key sequences cannot
be defined in the keymap.

Next, set the correct console terminal type in ``/etc/ttys`` for all
virtual terminal entries. `Table?23.2, “Defined Terminal Types for
Character Sets” <using-localization.html#locale-charset>`__ summarizes
the available terminal types.:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?23.2.?Defined Terminal Types for Character Sets

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+---------------------------+-----------------+
| Character Set             | Terminal Type   |
+===========================+=================+
| ISO8859-1 or ISO8859-15   | ``cons25l1``    |
+---------------------------+-----------------+
| ISO8859-2                 | ``cons25l2``    |
+---------------------------+-----------------+
| ISO8859-7                 | ``cons25l7``    |
+---------------------------+-----------------+
| KOI8-R                    | ``cons25r``     |
+---------------------------+-----------------+
| KOI8-U                    | ``cons25u``     |
+---------------------------+-----------------+
| CP437 (VGA default)       | ``cons25``      |
+---------------------------+-----------------+
| US-ASCII                  | ``cons25w``     |
+---------------------------+-----------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

For languages with wide or multibyte characters, install a console for
that language from the FreeBSD Ports Collection. The available ports are
summarized in `Table?23.3, “Available Console from Ports
Collection” <using-localization.html#locale-console>`__. Once installed,
refer to the port's ``pkg-message`` or man pages for configuration and
usage instructions.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?23.3.?Available Console from Ports Collection

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------------+----------------------------------------------------------------------------------------------------+
| Language                      | Port Location                                                                                      |
+===============================+====================================================================================================+
| Traditional Chinese (BIG-5)   | `chinese/big5con <http://www.freebsd.org/cgi/url.cgi?ports/chinese/big5con/pkg-descr>`__           |
+-------------------------------+----------------------------------------------------------------------------------------------------+
| Chinese/Japanese/Korean       | `chinese/cce <http://www.freebsd.org/cgi/url.cgi?ports/chinese/cce/pkg-descr>`__                   |
+-------------------------------+----------------------------------------------------------------------------------------------------+
| Chinese/Japanese/Korean       | `chinese/zhcon <http://www.freebsd.org/cgi/url.cgi?ports/chinese/zhcon/pkg-descr>`__               |
+-------------------------------+----------------------------------------------------------------------------------------------------+
| Japanese                      | `chinese/kon2 <http://www.freebsd.org/cgi/url.cgi?ports/chinese/kon2/pkg-descr>`__                 |
+-------------------------------+----------------------------------------------------------------------------------------------------+
| Japanese                      | `japanese/kon2-14dot <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kon2-14dot/pkg-descr>`__   |
+-------------------------------+----------------------------------------------------------------------------------------------------+
| Japanese                      | `japanese/kon2-16dot <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kon2-16dot/pkg-descr>`__   |
+-------------------------------+----------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

If moused is enabled in ``/etc/rc.conf``, additional configuration may
be required. By default, the mouse cursor of the
`syscons(4) <http://www.FreeBSD.org/cgi/man.cgi?query=syscons&sektion=4>`__
driver occupies the ``0xd0``-``0xd3`` range in the character set. If the
language uses this range, move the cursor's range by adding the
following line to ``/etc/rc.conf``:

.. code:: programlisting

    mousechar_start=3

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

23.2.3.?Xorg Setup
~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

`Chapter?6, *The X Window System* <x11.html>`__ describes how to install
and configure Xorg. When configuring Xorg for localization, additional
fonts and input methods are available from the FreeBSD Ports Collection.
Application specific i18n settings such as fonts and menus can be tuned
in ``~/.Xresources`` and should allow users to view their selected
language in graphical application menus.

The X Input Method (XIM) protocol is an Xorg standard for inputting
non-English characters. `Table?23.4, “Available Input
Methods” <using-localization.html#locale-xim>`__ summarizes the input
method applications which are available in the FreeBSD Ports Collection.
Additional Fcitx and Uim applications are also available.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?23.4.?Available Input Methods

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Language     | Input Method                                                                                                                     |
+==============+==================================================================================================================================+
| Chinese      | `chinese/gcin <http://www.freebsd.org/cgi/url.cgi?ports/chinese/gcin/pkg-descr>`__                                               |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/ibus-chewing <http://www.freebsd.org/cgi/url.cgi?ports/chinese/ibus-chewing/pkg-descr>`__                               |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/ibus-pinyin <http://www.freebsd.org/cgi/url.cgi?ports/chinese/ibus-pinyin/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/oxim <http://www.freebsd.org/cgi/url.cgi?ports/chinese/oxim/pkg-descr>`__                                               |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/scim-fcitx <http://www.freebsd.org/cgi/url.cgi?ports/chinese/scim-fcitx/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/scim-pinyin <http://www.freebsd.org/cgi/url.cgi?ports/chinese/scim-pinyin/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Chinese      | `chinese/scim-tables <http://www.freebsd.org/cgi/url.cgi?ports/chinese/scim-tables/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/ibus-anthy <http://www.freebsd.org/cgi/url.cgi?ports/japanese/ibus-anthy/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/ibus-mozc <http://www.freebsd.org/cgi/url.cgi?ports/japanese/ibus-mozc/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/ibus-skk <http://www.freebsd.org/cgi/url.cgi?ports/japanese/ibus-skk/pkg-descr>`__                                     |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/im-ja <http://www.freebsd.org/cgi/url.cgi?ports/japanese/im-ja/pkg-descr>`__                                           |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/kinput2 <http://www.freebsd.org/cgi/url.cgi?ports/japanese/kinput2/pkg-descr>`__                                       |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-anthy <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-anthy/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-canna <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-canna/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-honoka <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-honoka/pkg-descr>`__                               |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-honoka-plugin-romkan <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-honoka-plugin-romkan/pkg-descr>`__   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-honoka-plugin-wnn <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-honoka-plugin-wnn/pkg-descr>`__         |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-prime <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-prime/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-skk <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-skk/pkg-descr>`__                                     |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-tables <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-tables/pkg-descr>`__                               |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-tomoe <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-tomoe/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/scim-uim <http://www.freebsd.org/cgi/url.cgi?ports/japanese/scim-uim/pkg-descr>`__                                     |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/skkinput <http://www.freebsd.org/cgi/url.cgi?ports/japanese/skkinput/pkg-descr>`__                                     |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/skkinput3 <http://www.freebsd.org/cgi/url.cgi?ports/japanese/skkinput3/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Japanese     | `japanese/uim-anthy <http://www.freebsd.org/cgi/url.cgi?ports/japanese/uim-anthy/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Korean       | `korean/ibus-hangul <http://www.freebsd.org/cgi/url.cgi?ports/korean/ibus-hangul/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Korean       | `korean/imhangul <http://www.freebsd.org/cgi/url.cgi?ports/korean/imhangul/pkg-descr>`__                                         |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Korean       | `korean/nabi <http://www.freebsd.org/cgi/url.cgi?ports/korean/nabi/pkg-descr>`__                                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Korean       | `korean/scim-hangul <http://www.freebsd.org/cgi/url.cgi?ports/korean/scim-hangul/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Korean       | `korean/scim-tables <http://www.freebsd.org/cgi/url.cgi?ports/korean/scim-tables/pkg-descr>`__                                   |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Vietnamese   | `vietnamese/xvnkb <http://www.freebsd.org/cgi/url.cgi?ports/vietnamese/xvnkb/pkg-descr>`__                                       |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+
| Vietnamese   | `vietnamese/x-unikey <http://www.freebsd.org/cgi/url.cgi?ports/vietnamese/x-unikey/pkg-descr>`__                                 |
+--------------+----------------------------------------------------------------------------------------------------------------------------------+

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

+---------------------------------------------------------+-------------------------+-------------------------------------+
| `Prev <l10n.html>`__?                                   | `Up <l10n.html>`__      | ?\ `Next <l10n-compiling.html>`__   |
+---------------------------------------------------------+-------------------------+-------------------------------------+
| Chapter?23.?Localization - i18n/L10n Usage and Setup?   | `Home <index.html>`__   | ?23.3.?Finding i18n Applications    |
+---------------------------------------------------------+-------------------------+-------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
