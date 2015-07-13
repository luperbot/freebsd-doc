================
6.13.?Using Java
================

.. raw:: html

   <div class="navheader">

6.13.?Using Java
`Prev <using-kde.html>`__?
Chapter?6.?Special Considerations
?\ `Next <using-php.html>`__

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

6.13.?Using Java
----------------

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

6.13.1.?Variable Definitions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

If the port needs a Java™ Development Kit (JDK™) to either build, run or
even extract the distfile, then define ``USE_JAVA``.

There are several JDKs in the ports collection, from various vendors,
and in several versions. If the port must use one of these versions,
define which one. The most current version, and FreeBSD default is
`java/openjdk6 <http://www.freebsd.org/cgi/url.cgi?ports/java/openjdk6/pkg-descr>`__.

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.13.?Variables Which May be Set by Ports That Use Java

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable           | Means                                                                                                                                                                |
+====================+======================================================================================================================================================================+
| ``USE_JAVA``       | Define for the remaining variables to have any effect.                                                                                                               |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_VERSION``   | List of space-separated suitable Java versions for the port. An optional ``"+"`` allows specifying a range of versions (allowed values: ``1.5[+] 1.6[+] 1.7[+]``).   |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_OS``        | List of space-separated suitable JDK port operating systems for the port (allowed values: ``native linux``).                                                         |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_VENDOR``    | List of space-separated suitable JDK port vendors for the port (allowed values: ``freebsd bsdjava sun           openjdk``).                                          |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_BUILD``     | When set, add the selected JDK port to the build dependencies.                                                                                                       |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_RUN``       | When set, add the selected JDK port to the run dependencies.                                                                                                         |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_EXTRACT``   | When set, add the selected JDK port to the extract dependencies.                                                                                                     |
+--------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Below is the list of all settings a port will receive after setting
``USE_JAVA``:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.14.?Variables Provided to Ports That Use Java

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Variable                           | Value                                                                                                                                                                                   |
+====================================+=========================================================================================================================================================================================+
| ``JAVA_PORT``                      | The name of the JDK port (for example, ``java/openjdk6``).                                                                                                                              |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VERSION``              | The full version of the JDK port (for example, ``1.6.0``). Only the first two digits of this version number are needed, use ``${JAVA_PORT_VERSION:C/^([0-9])\.([0-9])(.*)$/\1.\2/}``.   |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_OS``                   | The operating system used by the JDK port (for example, ``'native'``).                                                                                                                  |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VENDOR``               | The vendor of the JDK port (for example, ``'openjdk'``).                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_OS_DESCRIPTION``       | Description of the operating system used by the JDK port (for example, ``'Native'``).                                                                                                   |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_PORT_VENDOR_DESCRIPTION``   | Description of the vendor of the JDK port (for example, ``'OpenJDK BSD Porting           Team'``).                                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_HOME``                      | Path to the installation directory of the JDK (for example, ``'/usr/local/openjdk6'``).                                                                                                 |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAC``                          | Path to the Java compiler to use (for example, ``'/usr/local/openjdk6/bin/javac'``).                                                                                                    |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAR``                            | Path to the ``jar`` tool to use (for example, ``'/usr/local/openjdk6/bin/jar'`` or ``'/usr/local/bin/fastjar'``).                                                                       |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``APPLETVIEWER``                   | Path to the ``appletviewer`` utility (for example, ``'/usr/local/openjdk6/bin/appletviewer'``).                                                                                         |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA``                           | Path to the ``java`` executable. Use this for executing Java programs (for example, ``'/usr/local/openjdk6/bin/java'``).                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVADOC``                        | Path to the ``javadoc`` utility program.                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAH``                          | Path to the ``javah`` program.                                                                                                                                                          |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVAP``                          | Path to the ``javap`` program.                                                                                                                                                          |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_KEYTOOL``                   | Path to the ``keytool`` utility program.                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_N2A``                       | Path to the ``native2ascii`` tool.                                                                                                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_POLICYTOOL``                | Path to the ``policytool`` program.                                                                                                                                                     |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_SERIALVER``                 | Path to the ``serialver`` utility program.                                                                                                                                              |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMIC``                           | Path to the RMI stub/skeleton generator, ``rmic``.                                                                                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMIREGISTRY``                    | Path to the RMI registry program, ``rmiregistry``.                                                                                                                                      |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``RMID``                           | Path to the RMI daemon program ``rmid``.                                                                                                                                                |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| ``JAVA_CLASSES``                   | Path to the archive that contains the JDK class files, ``${JAVA_HOME}/jre/lib/rt.jar``.                                                                                                 |
+------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

Use the ``java-debug`` make target to get information for debugging the
port. It will display the value of many of the previously listed
variables.

Additionally, these constants are defined so all Java ports may be
installed in a consistent way:

.. raw:: html

   <div class="table">

.. raw:: html

   <div class="table-title">

Table?6.15.?Constants Defined for Ports That Use Java

.. raw:: html

   </div>

.. raw:: html

   <div class="table-contents">

+--------------------+---------------------------------------------------------------------------------------------------------------------+
| Constant           | Value                                                                                                               |
+====================+=====================================================================================================================+
| ``JAVASHAREDIR``   | The base directory for everything related to Java. Default: ``${PREFIX}/share/java``.                               |
+--------------------+---------------------------------------------------------------------------------------------------------------------+
| ``JAVAJARDIR``     | The directory where JAR files is installed. Default: ``${JAVASHAREDIR}/classes``.                                   |
+--------------------+---------------------------------------------------------------------------------------------------------------------+
| ``JAVALIBDIR``     | The directory where JAR files installed by other ports are located. Default: ``${LOCALBASE}/share/java/classes``.   |
+--------------------+---------------------------------------------------------------------------------------------------------------------+

.. raw:: html

   </div>

.. raw:: html

   </div>

The related entries are defined in both ``PLIST_SUB`` (documented in
`Section?7.1, “Changing ``pkg-plist`` Based on Make
Variables” <plist.html#plist-sub>`__) and ``SUB_LIST``.

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

6.13.2.?Building with Ant
~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When the port is to be built using Apache Ant, it has to define
``USE_ANT``. Ant is thus considered to be the sub-make command. When no
``do-build`` target is defined by the port, a default one will be set
that runs Ant according to ``MAKE_ENV``, ``MAKE_ARGS`` and
``ALL_TARGET``. This is similar to the ``USES= gmake`` mechanism, which
is documented in `Section?6.5, “Building Mechanisms” <building.html>`__.

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

6.13.3.?Best Practices
~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

When porting a Java library, the port has to install the JAR file(s) in
``${JAVAJARDIR}``, and everything else under
``${JAVASHAREDIR}/${PORTNAME}`` (except for the documentation, see
below). To reduce the packing file size, reference the JAR file(s)
directly in the ``Makefile``. Use this statement (where ``myport``.jar
is the name of the JAR file installed as part of the port):

.. code:: programlisting

    PLIST_FILES+= %%JAVAJARDIR%%/myport.jar

When porting a Java application, the port usually installs everything
under a single directory (including its JAR dependencies). The use of
``${JAVASHAREDIR}/${PORTNAME}`` is strongly encouraged in this regard.
It is up the porter to decide whether the port installs the additional
JAR dependencies under this directory or uses the already installed ones
(from ``${JAVAJARDIR}``).

When porting a Java™ application that requires an application server
such as
`www/tomcat7 <http://www.freebsd.org/cgi/url.cgi?ports/www/tomcat7/pkg-descr>`__
to run the service, it is quite common for a vendor to distribute a
``.war``. A ``.war`` is a Web application ARchive and is extracted when
called by the application. Avoid adding a ``.war`` to ``pkg-plist``. It
is not considered best practice. An application server will expand war
archive, but not clean it up properly if the port is removed. A more
desirable way of working with this file is to extract the archive, then
install the files, and lastly add these files to ``pkg-plist``.

.. code:: programlisting

    TOMCATDIR=   ${LOCALBASE}/apache-tomcat-7.0
    WEBAPPDIR=  myapplication

    post-extract:
        @${MKDIR} ${WRKDIR}/${PORTDIRNAME}
        @${TAR} xf ${WRKDIR}/myapplication.war -C ${WRKDIR}/${PORTDIRNAME}

    do-install:
        cd ${WRKDIR} && \
        ${INSTALL} -d -o ${WWWOWN} -g ${WWWGRP} ${TOMCATDIR}/webapps/${PORTDIRNAME}
        @cd ${WRKDIR}/${PORTDIRNAME} && ${COPYTREE_SHARE} \* ${WEBAPPDIR}/${PORTDIRNAME}

Regardless of the type of port (library or application), the additional
documentation is installed in the `same
location <install.html#install-documentation>`__ as for any other port.
The JavaDoc tool is known to produce a different set of files depending
on the version of the JDK that is used. For ports that do not enforce
the use of a particular JDK, it is therefore a complex task to specify
the packing list (``pkg-plist``). This is one reason why porters are
strongly encouraged to use ``PORTDOCS``. Moreover, even if the set of
files that will be generated by ``javadoc`` can be predicted, the size
of the resulting ``pkg-plist`` advocates for the use of ``PORTDOCS``.

The default value for ``DATADIR`` is ``${PREFIX}/share/${PORTNAME}``. It
is a good idea to override ``DATADIR`` to
``${JAVASHAREDIR}/${PORTNAME}`` for Java ports. Indeed, ``DATADIR`` is
automatically added to ``PLIST_SUB`` (documented in `Section?7.1,
“Changing ``pkg-plist`` Based on Make
Variables” <plist.html#plist-sub>`__) so use ``%%DATADIR%%`` directly in
``pkg-plist``.

As for the choice of building Java ports from source or directly
installing them from a binary distribution, there is no defined policy
at the time of writing. However, people from the `FreeBSD Java
Project <http://www.freebsd.org/java/>`__ encourage porters to have
their ports built from source whenever it is a trivial task.

All the features that have been presented in this section are
implemented in ``bsd.java.mk``. If the port needs more sophisticated
Java support, please first have a look at the `bsd.java.mk Subversion
log <http://svnweb.FreeBSD.org/ports/head/Mk/bsd.java.mk?view=log>`__ as
it usually takes some time to document the latest features. Then, if the
needed support that is lacking would be beneficial to many other Java
ports, feel free to discuss it on the `FreeBSD Java Language mailing
list <http://lists.FreeBSD.org/mailman/listinfo/freebsd-java>`__.

Although there is a ``java`` category for PRs, it refers to the JDK
porting effort from the FreeBSD Java project. Therefore, submit the Java
port in the ``ports`` category as for any other port, unless the issue
is related to either a JDK implementation or ``bsd.java.mk``.

Similarly, there is a defined policy regarding the ``CATEGORIES`` of a
Java port, which is detailed in `Section?5.3,
“Categorization” <makefile-categories.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------+-------------------------+-------------------------------------------+
| `Prev <using-kde.html>`__?   | `Up <special.html>`__   | ?\ `Next <using-php.html>`__              |
+------------------------------+-------------------------+-------------------------------------------+
| 6.12.?Using KDE?             | `Home <index.html>`__   | ?6.14.?Web Applications, Apache and PHP   |
+------------------------------+-------------------------+-------------------------------------------+

.. raw:: html

   </div>

All FreeBSD documents are available for download at
http://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Questions that are not answered by the
  `documentation <http://www.FreeBSD.org/docs.html>`__ may be sent to
  <freebsd-questions@FreeBSD.org\ >.
|  Send questions about this document to <freebsd-doc@FreeBSD.org\ >.
