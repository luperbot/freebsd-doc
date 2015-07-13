===============
6.21.?Using Lua
===============

.. raw:: html

   <div class="navheader">

6.21.?Using Lua
`Prev <using-wx.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-iconv.html>`__

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

6.21.?Using Lua
---------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

This section describes the status of the Lua libraries in the ports tree
and its integration with the ports system.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

6.21.1.?Introduction
~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

There are many versions of the Lua libraries and corresponding
interpreters, which conflict between them (install files under the same
name). In the ports tree this problem has been solved by installing each
version under a different name using version number suffixes.

The obvious disadvantage of this is that each application has to be
modified to find the expected version. But it can be solved by adding
some additional flags to the compiler and linker.

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

6.21.2.?Version Selection
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

A port using Lua only needs to have this line:

.. code:: programlisting

    USES=    lua

If a specific version of Lua is needed, instructions on how to select it
are given in the ```USES=lua`` <uses.html#uses-lua>`__ part of
`Chapter?15, *Values of ``USES``* <uses.html#uses-values>`__.

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

6.21.3.?Defined Variables
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

These variables are available in the port.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.33.?Variables Defined for Ports That Use Lua

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+-------------------------+-----------------------------------------------------------------------------------------------------------+
| Name                    | Description                                                                                               |
+=========================+===========================================================================================================+
| ``LUA_VER``             | The Lua version that is going to be used (for example, ``5.1``)                                           |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_VER_STR``         | The Lua version without the dots (for example, ``51``)                                                    |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_PREFIX``          | The prefix where Lua (and components) is installed                                                        |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_SUBDIR``          | The directory under ``${PREFIX}/bin``, ``${PREFIX}/share`` and ``${PREFIX}/lib`` where Lua is installed   |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_INCDIR``          | The directory where Lua and tolua header files are installed                                              |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_LIBDIR``          | The directory where Lua and tolua libraries are installed                                                 |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_MODLIBDIR``       | The directory where Lua module libraries (``.so``) are installed                                          |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_MODSHAREDIR``     | The directory where Lua modules (``.lua``) are installed                                                  |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_PKGNAMEPREFIX``   | The package name prefix used by Lua modules                                                               |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUA_CMD``             | The path to the Lua interpreter                                                                           |
+-------------------------+-----------------------------------------------------------------------------------------------------------+
| ``LUAC_CMD``            | The path to the Lua compiler                                                                              |
+-------------------------+-----------------------------------------------------------------------------------------------------------+

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

+-----------------------------+-------------------------+----------------------------------+
| `Prev <using-wx.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-iconv.html>`__   |
+-----------------------------+-------------------------+----------------------------------+
| 6.20.?Using wxWidgets?      | `Home <index.html>`__   | ?6.22.?Using ``iconv``           |
+-----------------------------+-------------------------+----------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
