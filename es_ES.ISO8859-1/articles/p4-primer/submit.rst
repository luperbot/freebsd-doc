==========================================
7. Aplicaci?n de cambios en el repositorio
==========================================

.. raw:: html

   <div class="navheader">

7. Aplicaci?n de cambios en el repositorio
`Anterior <Integrations.html>`__?
?
?\ `Siguiente <editing.html>`__

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

7. Aplicaci?n de cambios en el repositorio
------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los cambios que se han realizado en local se deben aplicar en el
contenido del servidor Perforce para mayor seguridad frente a p?rdidas y
para que otras personas puedan acceder a dichos cambios; esto se hace
con la orden ``p4 submit``. Cuando se ejecuta esta orden se abre una
plantilla (“submit template”) en el editor. FreeBSD dispone de una
platilla personalizada, de la que a continuaci?n se explican los campos
m?s importantes:

.. code:: programlisting

    Description:
            <enter description here>
            PR:
            Submitted by:
            Reviewed by:
            Approved by:
            Obtained from:
            MFP4 after:

es decir

.. code:: programlisting

    Descripci?n:
           <Introduzca una descripci?n>
           PR:
           Enviado por:
           Revisado por:
           Aprobado por:
           Obtenido de:
           MFP4 tras:

Se considera una buena pr?ctica proporcionar al menos dos o tres frases
que describan los cambios entregados. Deber?a declarar aqu? qu? hacen
dichos cambios, por qu? se han hecho de esa forma o qu? problemas
intenta resolver con ellos. Tambi?n conviene explicar qu? APIs cambian y
qu? otros efectos secundarios pueden tener. Este texto debe sustituir a
la l?nea ``<enter     description here>`` que aparece en la plantilla.
Debe recubrir las l?neas y comenzar cada l?nea con una tabulaci?n. Las
etiquetas de m?s abajo son espec?ficas de FreeBSD y puede eliminarlas si
no resultan ?tiles o apropiadas en su contexto.

.. code:: programlisting

    Files:

Este campo se rellena autom?ticamente con todos los ficheros que el
cliente etiquet? en el servidor con estados de adici?n, borrado,
integraci?n o edici?n. Le aconsejamos que revise esta lista y elimine de
ella los ficheros que todav?a no esten listos.

Una vez guardada la sesi?n de su editor tiene lugar la entrega de los
datos al servidor. Esto significa que las copias locales de los ficheros
entregados se enviar?n al servidor. Si algo va mal durante este proceso
se cancelar? la entrega y se avisar? al usuario de que la entrega se ha
convertido en una lista de cambios que deben corregirse y reenviarse.
Las entregas son at?micas, es decir, si un fichero falla la entrega se
cancela en su totalidad.

Los cambios efectuados en el servidor no pueden cancelarse una vez
hechos, pero s? que pueden cancelarse si, dentro a?n del editor, se sale
de ?l sin cambiar el texto del campo ``Description``. Perforce se
quejar? la primera vez que intente salir y le devolver? al editor. Si
sale por segunda vez el editor cancelar? la operaci?n. Devolver el
repositorio al estado anterior a un cambio ya efectuado es un proceso
muy complicado y no hay un procedimiento est?ndar, por lo que depende
del caso concreto.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------+---------------------------+-----------------------------------+
| `Anterior <Integrations.html>`__?   | ?                         | ?\ `Siguiente <editing.html>`__   |
+-------------------------------------+---------------------------+-----------------------------------+
| 6. Integraciones?                   | `Inicio <index.html>`__   | ?8. Edici?n                       |
+-------------------------------------+---------------------------+-----------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
