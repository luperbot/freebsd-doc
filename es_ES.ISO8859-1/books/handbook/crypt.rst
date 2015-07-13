======================
14.4. DES, MD5 y Crypt
======================

.. raw:: html

   <div class="navheader">

14.4. DES, MD5 y Crypt
`Anterior <securing-freebsd.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <one-time-passwords.html>`__

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

14.4. DES, MD5 y Crypt
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Secciones reescritas y actualizadas por Bill Swingle.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Cada usuario de un sistema UNIX? tiene una contrase?a asociada a su
cuenta. Parece obvio que estas contrase?as s?lo deben ser conocidas por
el usuario y por el sistema operativo. Para que estas contrase?as
permanezcan en secreto se cifran con lo que se conoce como un “hash de
una pasada”, esto es, s?lo pueden ser f?cilmente cifradas pero no
descifradas. En otras palabras, lo que acabamos de decir es tan obvio
que ni siguiera es verdad: el propio sistema operativo no sabe cu?l es
*realmente* la contrase?a. Lo ?nico que conoce es la versi?n *cifrada*
de la contrasen?a. La ?nica manera de obtener la contrase?a en “texto
plano” es por medio de una b?squeda de fuerza bruta en el espacio de
contrase?as posibles.

Por desgracia la ?nica manera segura de cifrar contrase?as cuando UNIX?
empez? a hacerlo estaba basada en DES, (“Data Encryption Standard”,
“est?ndar de cifrado de datos”). Esto no era un gran problema para
usuarios residentes en los EEUU, pero el c?digo fuente de FreeBSD no se
pod?a exportar desde los EEUU, as? que FreeBSD hubo de buscar una forma
de complir las leyes de EEUU y al mismo tiempo mantener la
compatibilidad con otras variantes de UNIX? que que todav?a utilizaban
DES.

La soluci?n fu? dividir las bibliotecas de cifrado para que los usuarios
de EEUU pudieran instalar las bibliotecas DES pero los usuarios del
resto del mundo tuvieran un m?todo de cifrado que pudiera ser exportado.
As? es como FreeBSD comenz? a usar MD5 como su m?todo de cifrado por
defecto. MD5 se considera m?s seguro que DES, as? que se mantiene la
opci?n de poder instalar DES por motivos de compatibilidad.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.4.1. C?mo reconocer su mecanismo de cifrado
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

En versiones anteriores a FreeBSD?4.4 ``libcrypt.a`` era un enlace
simb?lico que apuntaba a la biblioteca que se usaba para el cifrado. En
FreeBSD?4.4 se cambi? ``libcrypt.a`` para ofrecer una biblioteca hash
configurable de validaci?n de contrase?as. Actualmente la biblioteca
permite funciones hash DES, MD5 y Blowfish. FreeBSD utiliza por defecto
MD5 para cifrar contrase?as.

Es muy sencillo identificar qu? m?todo usa FreeBSD para cifrar. Una
forma es examinando las contrase?as cifradas en ``/etc/master.passwd``.
Las contrase?as cifradas con el hash MD5 son m?s largas que las cifradas
con el hash DES, y tambi?n comienzan por los caracteres ``$1$``. Las
contrase?as que comienzan por ``$2a$`` est?n cifradas con la funci?n
hash de Blowfish. Las contrase?as DES no tienen ninguna caracter?stica
particular, pero son m?s cortas que las contrase?as MD5, y est?n
codificadas en un alfabeto de 64 caracteres que no incluye el caracter
``$``; es por esto que una cadena relativamente corta que comience con
un signo de d?lar es muy probablemente una contrase?a DES.

El formato de contrase?a a usar en nuevas contrase?as se define en
``/etc/login.conf`` mediante ``passwd_format``, pudiendo tener los
valores ``des``, ``md5`` o ``blf``. Consulte la p?gina de manual
`login.conf(5) <http://www.FreeBSD.org/cgi/man.cgi?query=login.conf&sektion=5>`__
para m?s informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------------+-----------------------------+----------------------------------------------+
| `Anterior <securing-freebsd.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <one-time-passwords.html>`__   |
+-----------------------------------------+-----------------------------+----------------------------------------------+
| 14.3. Asegurar FreeBSD?                 | `Inicio <index.html>`__     | ?14.5. Contrase?as de un solo uso            |
+-----------------------------------------+-----------------------------+----------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
