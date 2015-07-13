======================
Cap?tulo 14. Seguridad
======================

.. raw:: html

   <div class="navheader">

Cap?tulo 14. Seguridad
`Anterior <users-groups.html>`__?
Parte?III.?Administraci?n del sistema.
?\ `Siguiente <security-intro.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="chapter">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

Cap?tulo 14. Seguridad
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Gran parte del contenido de este cap?tulo procede de la p?gina de manual
de security(7), de Matthew Dillon.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`14.1. Sinopsis <security.html#security-synopsis>`__
`14.2. Introducci?n <security-intro.html>`__
`14.3. Asegurar FreeBSD <securing-freebsd.html>`__
`14.4. DES, MD5 y Crypt <crypt.html>`__
`14.5. Contrase?as de un solo uso <one-time-passwords.html>`__
`14.6. TCP Wrappers <tcpwrappers.html>`__
`14.7. KerberosIV <kerberosIV.html>`__
`14.8. Kerberos5 <kerberos5.html>`__
`14.9. OpenSSL <openssl.html>`__
`14.10. VPN sobre IPsec <ipsec.html>`__
`14.11. OpenSSH <openssh.html>`__
`14.12. Listas de control de acceso a sistemas de
ficheros <fs-acl.html>`__
`14.13. Monitorizaci?n de fallos de seguridad de
aplicaciones <security-portaudit.html>`__
`14.14. FreeBSD Security Advisories <security-advisories.html>`__
`14.15. Contabilidad de procesos <security-accounting.html>`__

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

14.1. Sinopsis
--------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Este cap?tulo contiene una introducci?n b?sica a los conceptos de
seguridad del sistema, unas cuantas normas b?sicas de uso y algunos
avanzados del tema en FreeBSD. Muchos de los temas expuestos se aplican
a la seguridad del sistema y de Internet en general. Internet ya no es
aqu?l lugar “amistoso” en el que todo el mundo se comportaba como un
buen ciudadano. Si quiere proteger sus datos, su propiedad intelectual,
su tiempo y muchas m?s cosas de manos malintencionadas debe hacer que su
sistema sea seguro.

FreeBSD proporciona un variado arsenal de utilidades y mecanismos para
asegurar la integridad y la seguridad de su sistema y red.

Despu?s de leer este cap?tulo:

.. raw:: html

   <div class="itemizedlist">

-  conocer? conceptos b?sicos de la seguridad relacionados con FreeBSD.

-  Tendr? informaci?n sobre los diversos mecanismos de cifrado
   disponibles en FreeBSD, entre los cuales est?n DES y MD5.

-  Sabr? c?mo configurar la autentificaci?n de contrase?as de un solo
   uso.

-  Sabr? c?mo configurar TCP Wrappers y usarlos con ``inetd``.

-  Sabr? c?mo instalar KerberosIV en versiones de FreeBSD anteriores a
   5.0.

-  Sabr? c?mo instalar Kerberos5 en versiones de FreeBSD posteriores a
   5.0.

-  Podr? configurar IPsec y crear una VPN entre m?quinas
   FreeBSD/Windows?.

-  Sabr? c?mo configurar y utilizar OpenSSH, la implementaci?n de SSH en
   FreeBSD.

-  Sabr? en qu? consisten las ACL del sistema de ficheros y c?mo
   utilizarlas.

-  Sabr? c?mo usar Portaudit, con la que podr? auditar el software que
   instale desde la desde la colecci?n de ports.

-  Sabr? c?mo sacar partido de los avisos de seguridad que publica
   FreeBSD.

-  Podr? hacerse una idea clara de en qu? consiste la contabilidad de
   procesos y de c?mo activarla en FreeBSD.

.. raw:: html

   </div>

Antes de leer este cap?tulo:

.. raw:: html

   <div class="itemizedlist">

-  Comprender conceptos b?sicos de FreeBSD e Internet.

.. raw:: html

   </div>

En otras secciones de este manual se cubren aspectos adicionales sobre
seguridad. Por ejemplo, MAC (controles de acceso obligatorio) se explica
en el `Cap?tulo?16, *Mandatory Access Control* <mac.html>`__ y los
cortafuegos en el `Cap?tulo?26, *Cortafuegos* <firewalls.html>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+------------------------------------------+------------------------------------------+
| `Anterior <users-groups.html>`__?   | `Subir <system-administration.html>`__   | ?\ `Siguiente <security-intro.html>`__   |
+-------------------------------------+------------------------------------------+------------------------------------------+
| 13.9. Grupos?                       | `Inicio <index.html>`__                  | ?14.2. Introducci?n                      |
+-------------------------------------+------------------------------------------+------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
