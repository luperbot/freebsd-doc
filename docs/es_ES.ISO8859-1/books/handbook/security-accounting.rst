===============================
14.15. Contabilidad de procesos
===============================

.. raw:: html

   <div class="navheader">

14.15. Contabilidad de procesos
`Anterior <security-advisories.html>`__?
Cap?tulo 14. Seguridad
?\ `Siguiente <jails.html>`__

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

14.15. Contabilidad de procesos
-------------------------------

.. raw:: html

   </div>

.. raw:: html

   <div>

Texto de Tom Rhodes.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

La contabilidad de procesos es un m?todo de seguridad en el cual un
administrador puede mantener un seguimiento de los recursos del sistema
utilizados, su distribuci?n entre los usuarios, ofrecer monitorizaci?n
del sistema y seguir la pista m?nimamente a las ?rdenes de usuario.

Esto en realidad tiene sus puntos positivos y negativos. Uno de los
positivos es que una intrusi?n puede minimizarse en el momento de
producirse. Uno negativo es la cantidad de logs generados por la
contabilidad de procesos y el espacio de disco que requieren. Esta
secci?n guiar? al administrador a trav?s de los fundamentos de la
contabilidad de procesos.

.. raw:: html

   <div class="sect2">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

14.15.1. C?mo habilitar y utilizar la contabilidad de procesos
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Antes de poder usar la contabilidad de procesos tendr? que habilitarla.
Ejecute la siguiente orden:

.. code:: screen

    # touch /var/account/acct

    # accton /var/account/acct

    # echo 'accounting_enable="YES"' >> /etc/rc.conf

Una vez habilitada, la contabilidad de procesos empezar? a seguir el
rastro de estad?sticas de la CPU, ?rdenes, etc. Todos los logs de
contabilidad est?n en un formato ilegible para humanos, pero accesibles
para `sa(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=8>`__.
Si se ejecuta sin opciones, ``sa`` imprimir? informaci?n sobre el n?mero
de llamadas por usuario, el tiempo total transcurrido expresado en
minutos, el tiempo total de CPU y de usuario en minutos, el n?mero medio
de operaciones de E/S, etc.

Para ver informaci?n acerca de las ?rdenes que se est?n ejecutados puede
usar la
`lastcomm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lastcomm&sektion=1>`__.
``lastcomm`` imprime ?rdenes ejecutadas por los usuarios en
`ttys(5) <http://www.FreeBSD.org/cgi/man.cgi?query=ttys&sektion=5>`__
espec?ficas. Veamos un ejemplo:

.. code:: screen

    # lastcomm ls
        trhodes ttyp1

Imprimir?a todas las veces (conocidas) que el usuario ``trhodes`` ha
usado ``ls`` en la terminal ttyp1.

Hay muchas m?s opciones que pueden serle muy ?tiles. Si quiere
conocerlas consulte las p?ginas de manual
`lastcomm(1) <http://www.FreeBSD.org/cgi/man.cgi?query=lastcomm&sektion=1>`__,
`acct(5) <http://www.FreeBSD.org/cgi/man.cgi?query=acct&sektion=5>`__ y
`sa(8) <http://www.FreeBSD.org/cgi/man.cgi?query=sa&sektion=8>`__.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+-----------------------------+---------------------------------+
| `Anterior <security-advisories.html>`__?   | `Subir <security.html>`__   | ?\ `Siguiente <jails.html>`__   |
+--------------------------------------------+-----------------------------+---------------------------------+
| 14.14. FreeBSD Security Advisories?        | `Inicio <index.html>`__     | ?Cap?tulo 15. Jaulas            |
+--------------------------------------------+-----------------------------+---------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
