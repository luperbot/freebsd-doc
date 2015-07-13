======================
27.13. Uso de procmail
======================

.. raw:: html

   <div class="navheader">

27.13. Uso de procmail
`Anterior <mail-fetchmail.html>`__?
Cap?tulo 27. Correo Electr?nico
?\ `Siguiente <network-servers.html>`__

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

27.13. Uso de procmail
----------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Escrito por Marc Silver.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

procmail es una aplicaci?n incre?blemente potente que se utiliza para
filtrar el correo de entrada. Permite a los usuarios definir “reglas”
que se asocian con correos entrantes y que realizan funciones concretas,
como reencaminar el correo a carpetas o direciones alternativas.
procmail se puede instalar utilizando el port
`mail/procmail <http://www.freebsd.org/cgi/url.cgi?ports/mail/procmail/pkg-descr>`__.
Una vez instalado, se puede integrar directamente en la mayor?a de los
MTAs; por favor, consulte la documentaci?n del MTA que utilice para
saber m?s sobre la integraci?n entre ambos. Por otro lado procmail se
puede integrar con el MTA que prefiera de una forma sencilla a?adiendo
la siguiente l?nea al fichero ``.forward`` dentro del directorio home
del usuario que des?e usar procmail:

.. code:: programlisting

    "|exec /usr/local/bin/procmail || exit 75"

La siguiente secci?n muestra algunas reglas b?sicas de procmail, junto
con una breve descripci?n de las acciones que realizan. Estas reglas, y
muchas otras se deben insertar dentro del fichero ``.procmailrc``
ubicado en el directorio home del usuario.

En la p?gina man de “procmailex” se explica la mayor?a de estas reglas.

Reenv?o de todo el correo proveniente de ``usuario@ejemplo.com`` hacia
la direcci?n externa ``correodefiar@ejemplo.com``:

.. code:: programlisting

    :0
    * ^From.*usuario@ejemplo.com
    ! correodefiar@ejemplo.com

Reenv?o de todos los correos que ocupen menos de 1000 bytes a la
direcci?n ``corredefiar@ejemplo2.com``:

.. code:: programlisting

    :0
    * < 1000
    ! correodefiar@ejemplo2.com

Env?o de todos los correos dirigidos a ``opcional@ejemplo.com`` hacia
una carpeta de correo llamada ``opcional``:

.. code:: programlisting

    :0
    * ^TOopcional@ejemplo.com
    opcional

Env?o de todos los correos con un asunto que contenga la palabra “Spam”
al dispositivo ``/dev/null``:

.. code:: programlisting

    :0
    ^Subject:.*Spam
    /dev/null

Una ?til receta para examinar mensajes de correo provenientes de listas
de distribuci?n de ``FreeBSD.org`` y poner cada mensaje en el directorio
apropiado en funci?n del origen del mensaje:

.. code:: programlisting

    :0
    * ^Sender:.owner-freebsd-\/[^@]+@FreeBSD.ORG
    {
        LISTNAME=${MATCH}
        :0
        * LISTNAME??^\/[^@]+
        FreeBSD-${MATCH}
    }

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+---------------------------------------+---------------------------+-------------------------------------------+
| `Anterior <mail-fetchmail.html>`__?   | `Subir <mail.html>`__     | ?\ `Siguiente <network-servers.html>`__   |
+---------------------------------------+---------------------------+-------------------------------------------+
| 27.12. Manejo de fetchmail?           | `Inicio <index.html>`__   | ?Cap?tulo 28. Servidores de red           |
+---------------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
