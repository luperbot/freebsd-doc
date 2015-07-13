================================
4.6. Despu?s de instalar un port
================================

.. raw:: html

   <div class="navheader">

4.6. Despu?s de instalar un port
`Anterior <ports-using.html>`__?
Cap?tulo 4. Instalaci?n de aplicaciones: ?packages? y ports
?\ `Siguiente <ports-broken.html>`__

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

4.6. Despu?s de instalar un port
--------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Una vez que ha instalado una nueva aplicaci?n normalmente deber?a leer
toda la documentaci?n que incluya, editar los ficheros de configuraci?n
necesarios, asegurarse de que la aplicaci?n se ejecute al arrancar el
sistema (si es un d?mon)etc.

Obviamente los pasos exactos para configurar cada aplicaci?n son
distintos de una a otra. De cualquier forma, si acaba de instalar
aplicaci?n y se pregunta ??Y ahora qu??? estos consejos puede que le
ayuden:

.. raw:: html

   <div class="itemizedlist">

-  Use
   `pkg\_info(1) <http://www.FreeBSD.org/cgi/man.cgi?query=pkg_info&sektion=1>`__
   para ver qu? ficheros se instalaron y d?nde. Por ejemplo, si instal?n
   el paquete Un-Package 1.0.0, lo siguiente:

   .. code:: screen

       # pkg_info -L un-package-1.0.0 | less

   mostrar? los ficheros instalados por el paquete. Preste especial
   atenci?n a los ficheros en el directorio ``man/``, que son las
   p?ginas de ayuda y los del directorio ``etc/``, que contiene los
   ficheros de configuraci?n; bajo el directorio ``doc/`` podr?
   encontrar informaci?n m?s detallada.

   Si no est? seguro de qu? versi?n del paquete ha instalado, tecl?e:

   .. code:: screen

       # pkg_info | grep -i un-package

   y ver? todos los paquetes que se llaman *``un-package``*. Reemplace
   *``un-package``* en la l?nea de ?rdenes que tenga que usar en su
   caso.

-  Una vez que ha identificado las p?ginas de manual de la aplicaci?n
   rev?selas mediante
   `man(1) <http://www.FreeBSD.org/cgi/man.cgi?query=man&sektion=1>`__.
   Revise tambi?n los ficheros de configuraci?n, as? como cualquier otro
   tipo de documentaci?n que venga con el software.

-  Si la aplicaci?n tiene sitio web vis?telo. Es muy posible que
   encuentre m?s documentaci?n, listas de preguntas frecuentes (FAQ),
   etc. Si no sabe cu?l puede ser la direcci?n del sitio web examine la
   salida de la orden

   .. code:: screen

       # pkg_info un-package-1.0.0

   a veces incluye una l?nea ``WWW:``, que contiene la direcci?n del
   sitio web de la aplicaci?n.

-  Los ports que deben arrancar con el sistema (como los servidores de
   Internet) normalmente instalaran un ?script? de ejemplo en
   ``/usr/local/etc/rc.d``. Debe revisar este ?script? para comprobar
   que todo sea correcto, editarlo o renombrarlo si fuera necesario.
   Consulte `C?mo arrancar
   servicios <configtuning-starting-services.html>`__ para m?s
   informaci?n.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------+---------------------------+----------------------------------------+
| `Anterior <ports-using.html>`__?     | `Subir <ports.html>`__    | ?\ `Siguiente <ports-broken.html>`__   |
+--------------------------------------+---------------------------+----------------------------------------+
| 4.5. Uso de la colecci?n de ports?   | `Inicio <index.html>`__   | ?4.7. Ports que no funcionan           |
+--------------------------------------+---------------------------+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
