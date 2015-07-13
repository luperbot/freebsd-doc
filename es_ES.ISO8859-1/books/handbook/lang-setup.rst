===================================================
22.5. Localizaci?n de FreeBSD a idiomas espec?ficos
===================================================

.. raw:: html

   <div class="navheader">

22.5. Localizaci?n de FreeBSD a idiomas espec?ficos
`Anterior <l10n-compiling.html>`__?
Cap?tulo 22. Localizaci?n - Uso y configuraci?n de I18N/L10N
?\ `Siguiente <cutting-edge.html>`__

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

22.5. Localizaci?n de FreeBSD a idiomas espec?ficos
---------------------------------------------------

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

22.5.1. Idioma ruso (codificaci?n KOI8-R)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   <div>

Contribuido originalmente por Andrey Chernov.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para m?s informaci?n sobre la codificaci?n KOI8-R, vea las `Referencias
KOI8-R (Juego de caracteres rusos para la red) <http://koi8.pp.ru/>`__.

.. raw:: html

   <div class="sect3">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

22.5.1.1. Configuraci?n de la “locale”
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Ponga las siguientes l?neas en su fichero ``~/.login_conf``:

.. code:: programlisting

    me:My account:\
        :charset=KOI8-R:\
        :lang=ru_RU.KOI8-R:

Vea anteriormente en este mismo cap?tulo ejemplos de configuraci?n de
las `locales <using-localization.html#setting-locale>`__.

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

22.5.1.2. Configuraci?n de la consola
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="itemizedlist">

-  En versiones de FreeBSD anteriores a la 5.0, a?ada la liguiente l?nea
   en el fichero de configuraci?n del n?cleo:

   .. code:: programlisting

       options      SC_MOUSE_CHAR=0x03

   En FreeBSD 4.4 y posteriores introduzca la siguiente l?nea en
   ``/etc/rc.conf``:

   .. code:: programlisting

       mousechar_start=3

-  Utilice las siguientes opciones en ``/etc/rc.conf``:

   .. code:: programlisting

       keymap="ru.koi8-r"
       scrnmap="koi8-r2cp866"
       font8x16="cp866b-8x16"
       font8x14="cp866-8x14"
       font8x8="cp866-8x8"

-  Para cada entrada ``ttyv*`` en ``/etc/ttys``, utilice
   ``           cons25r`` como el tipo de terminal.

.. raw:: html

   </div>

Vea anteriormente en este mismo cap?tulo ejemplos de configuraci?n de la
`consola <using-localization.html#setting-console>`__.

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

22.5.1.3. Configuraci?n de la impresora
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Dado que la mayor?a de las impresoras con caracteres rusos tienen un
c?digo de p?gina CP866 en hardware, es necesario un filtro de salida
especial para convertir de KOI8-R a CP866. Tal filtro es instalado por
omisi?n como ``       /usr/libexec/lpr/ru/koi2alt``. Una entrada de
impresora rusa ``/etc/printcap`` deber?a tener este aspecto:

.. code:: programlisting

    lp|Russian local line printer:\
        :sh:of=/usr/libexec/lpr/ru/koi2alt:\
        :lp=/dev/lpt0:sd=/var/spool/output/lpd:lf=/var/log/lpd-errs:

Consulte
`printcap(5) <http://www.FreeBSD.org/cgi/man.cgi?query=printcap&sektion=5>`__
para una explicaci?n detallada.

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

22.5.1.4. Sistema de ficheros MS-DOS? y nombres de ficheros en ruso
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La siguiente entrada
`fstab(5) <http://www.FreeBSD.org/cgi/man.cgi?query=fstab&sektion=5>`__
de ejemplo habilita el soporte para nombres de fichero en ruso en los
sistemas de ficheros MS-DOS? montados:

.. code:: programlisting

    /dev/ad0s2      /dos/c  msdos   rw,-Wkoi2dos,-Lru_RU.KOI8-R 0 0

La opci?n ``-L`` selecciona el nombre de la “locale” usada, y
``-W       `` establece la tabla de conversi?n de caracteres. Para usar
la opci?n ``-W`` , aseg?rese de montar ``/usr`` antes que la partici?n
MS-DOS?, porque las tablas de conversi?n se ubican en
``       /usr/libdata/msdosfs``. Para m?s informaci?n, vea la p?gina de
manual
`mount\_msdos(8) <http://www.FreeBSD.org/cgi/man.cgi?query=mount_msdos&sektion=8>`__.

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

22.5.1.5. Configuraci?n de X11
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="orderedlist">

#. Antes haga la `configuraci?n de las “locales” para la
   consola <using-localization.html#setting-locale>`__ como se ha
   explicado.

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   La “locale ” rusa KOI8-R puede no funcionar con versiones antiguas
   (anteriores a la 3.3) de XFree86™. Xorg es ahora la versi?n
   predefinida del sistema de ventanas X en FreeBSD. Esto no deber?a ser
   un problema salvo que est? usando una versi?n antigua de FreeBSD.

   .. raw:: html

      </div>

#. Si utiliza Xorg, instale el paquete
   `x11-fonts/xorg-fonts-cyrillic <http://www.freebsd.org/cgi/url.cgi?ports/x11-fonts/xorg-fonts-cyrillic/pkg-descr>`__.

   Compruebe la secci?n ``"Files"`` de su fichero
   ``/etc/X11/xorg.conf``. Se deben a?adir las siguientes l?neas *antes*
   de ninguna otra entrada ``FontPath           ``:

   .. code:: programlisting

       FontPath   "/usr/X11R6/lib/X11/fonts/cyrillic/misc"
       FontPath   "/usr/X11R6/lib/X11/fonts/cyrillic/75dpi"
       FontPath   "/usr/X11R6/lib/X11/fonts/cyrillic/100dpi"

   Si utiliza un modo de v?deo de alta resoluci?n, intercambie las
   l?neas 75 dpi y 100 dpi.

#. Para activar un teclado ruso, a?ada lo siguiente a la secci?n
   ``"Keyboard"`` de su fichero ``XF86Config``.

   Para XFree86™ 3.X:

   .. code:: programlisting

       XkbLayout  "ru"
       XkbOptions "grp:caps_toggle"

   Para Xorg (o XFree86™ 4.X):

   .. code:: programlisting

       Option "XkbLayout"   "us,ru"
       Option "XkbOptions"  "grp:toggle"

   Aseg?rese tambi?n de que ``XkbDisable           `` est? desactivado
   (comentado) all?.

   Para ``grp:caps_toggle`` la tecla para pasar entre la codificaci?n
   rusa y la latina ser? **BloqMay?s** . La antigua funci?n de
   **BloqMay?s** todav?a est? disponible a trav?s de
   **May**+**BloqMay?s** (s?lamente en modo latino). Para ``grp:toggle``
   la tecla para pasar entre la codificaci?n rusa y la latina ser? **Alt
   derecha**. ``grp:caps_toggle`` no funciona en Xorg por alguna raz?n
   desconocida.

   Si en su teclado dispone de teclas “Windows? ”, y observa que algunas
   teclas no alfanum?ricas est?n mapeadas incorrectamente en el modo
   ruso, a?ada la siguiente l?nea en su fichero
   ``           XF86Config``.

   Para XFree86™ 3.X:

   .. code:: programlisting

       XkbVariant "winkeys"

   Para Xorg (o XFree86™ 4.X):

   .. code:: programlisting

       Option "XkbVariant" ",winkeys"

   .. raw:: html

      <div class="note" xmlns="">

   Nota:
   ~~~~~

   El teclado XKB ruso puede no funcionar con versiones antiguas de
   XFree86™ , vea la `nota anterior <lang-setup.html#russian-note>`__
   para m?s informaci?n. El teclado XKB ruso puede no funcionar tampoco
   con aplicaciones no localizadas.

   .. raw:: html

      </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Nota:
~~~~~

Las aplicaciaones m?nimamente localizadas deber?an llamar una funci?n
``XtSetLanguageProc (NULL, NULL, NULL);`` al principio del programa.

Vea `KOI8-R para X Window <http://koi8.pp.ru/xwin.html>`__ para m?s
instrucciones sobre la localizaci?n de aplicaciones X11.

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

22.5.2. Localizaci?n al chino tradicional para Taiw?n
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

El proyecto FreeBSD-Taiw?n tiene una Gu?a de chino para FreeBSD en
``http://netlab.cse.yzu.edu.tw/~statue/freebsd/zh-tut/`` que utiliza
muchos ports chinos. El editor actual del ``FreeBSD Chinese HOWTO`` es
Shen Chuan-Hsing ``<statue@freebsd.sinica.edu.tw>``.

Chuan-Hsing Shen ``<statue@freebsd.sinica.edu.tw         >`` ha creado
la `Colecci?n de FreeBSD en chino
(CFC) <http://netlab.cse.yzu.edu.tw/~statue/cfc/>`__ usando
``zh-L10N-tut`` de FreeBSD-Taiw?n. Los paquetes y los guiones est?n
disponibles en ``ftp://freebsd.csie.nctu.edu.tw/pub/taiwan/CFC/``.

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

22.5.3. Localizaci?n al idioma alem?n (para todos los idiomas ISO 8859-1)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Slaven Rezic ``<eserte@cs.tu-berlin.de>`` ha escrito un tutorial de como
usar las di?resis en una m?quina FreeBSD. El tutorial est? disponible en
``http://www.de.FreeBSD.org/de/umlaute/``.

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

22.5.4. Localizaci?n a los idiomas japon?s y coreano
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Para el japon?s, dir?jase a ``http://www.jp.FreeBSD.org/``, y para el
coreano, acuda a ``http://www.kr.FreeBSD.org/``.

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

22.5.5. Documentaci?n sobre FreeBSD en otros idiomas aparte del ingl?s
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Algunos contribuidores de FreeBSD han traducido partes de FreeBSD a
otros idiomas. Est?n disponibles a trav?s de enlaces en el `sitio
principal <http://www.freebsd.org/index.html>`__ o en
``/usr/share/doc     ``.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------------------------+---------------------------+----------------------------------------+
| `Anterior <l10n-compiling.html>`__?                     | `Subir <l10n.html>`__     | ?\ `Siguiente <cutting-edge.html>`__   |
+---------------------------------------------------------+---------------------------+----------------------------------------+
| 22.4. Compilaci?n de programas con soporte para I18N?   | `Inicio <index.html>`__   | ?Cap?tulo 23. Lo ?ltimo de lo ?ltimo   |
+---------------------------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
