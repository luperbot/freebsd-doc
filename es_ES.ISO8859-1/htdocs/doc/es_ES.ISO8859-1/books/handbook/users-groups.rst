============
13.9. Grupos
============

.. raw:: html

   <div class="navheader">

13.9. Grupos
`Anterior <users-personalizing.html>`__?
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
?\ `Siguiente <security.html>`__

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

13.9. Grupos
------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Un grupo es simplemente una lista de usuarios. Los grupos se identifican
por su nombre de grupo y gid (ID de grupo). En FreeBSD (y en la mayor?a
de sistemas Unix), los dos factores que tiene en cuenta el n?cleo para
decidir si un proceso puede hacer algo es su ID de usuario y la lista de
grupos a los que pertenece. A diferencia del ID de usuario, un proceso
tiene una lista de grupos asociados. En ocasiones encontrar?s menciones
al "ID de grupo" de un usuario o de un proceso; la mayor?a de las veces
referir?n simplemente al primero de los grupos de la lista.

La correspondencia entre nombres e IDs de grupo est? en ``/etc/group``.
Se trata de un fichero de texto plano con cuatro campos separados por el
signo dos puntos. El primer campo es el nombre de grupo, el segundo la
contrase?a encriptada, el tercero el ID de grupo, y el cuarto la lista
de miembros separados por comas. Puede ser editado a mano sin peligro
(?suponiendo, por supuesto, que no se cometan errores de sintaxis!).
Para una descripci?n m?s completa de la sintaxis, ver la p?gina de
manual
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5>`__.

Si no quieres editar ``/etc/group`` manualmente, puedes usar el comando
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ para
a?adir y modificar grupos. Por ejemplo, para a?adir un grupo llamado
``teamtwo`` y luego confirmar que existe puedes usar:

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.7. A?adir un grupo usando
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupadd teamtwo
    # pw groupshow teamtwo
    teamtwo:*:1100:

.. raw:: html

   </div>

.. raw:: html

   </div>

El n?mero ``1100`` en el ejemplo anterior es el ID de grupo del grupo
``teamtwo``. Ahora mismo ``teamtwo`` no tiene miembros, y es por tanto
bastante in?til. Cambiemos eso invitando a ``jru`` a formar parte del
grupo ``teamtwo``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.8. A?adir a alguien a un grupo usando
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    # pw groupmod teamtwo -M jru
    # pw groupshow teamtwo
    teamtwo:*:1100:jru

.. raw:: html

   </div>

.. raw:: html

   </div>

El argumento de la opci?n ``-M`` es una lista con los usuarios que son
miembros del grupo separados por comas. Sabemos de secciones anteriores
que el fichero de contrase?as tambi?n contiene un grupo para cada
usuario. El usuario es autom?ticamente a?adido a la lista de grupos por
el sistema; no constar? como miembro cuando usemos el comando
``groupshow`` con
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__, pero
s? cuando la informaci?n se consulte con
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1>`__ u otra
herramienta similar. En otras palabras,
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__ s?lo
manipula el fichero ``/etc/group``; nunca tratar? de leer datos
adicionales de ``/etc/passwd``.

.. raw:: html

   <div class="example">

.. raw:: html

   <div class="example-title">

Ejemplo 13.9. Determinar pertenencia a grupos con
`id(1) <http://www.FreeBSD.org/cgi/man.cgi?query=id&sektion=1>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="example-contents">

.. code:: screen

    % id jru
    uid=1001(jru) gid=1001(jru) groups=1001(jru), 1100(teamtwo)

.. raw:: html

   </div>

.. raw:: html

   </div>

Como puedes ver, ``jru`` es miembro de los grupos ``jru`` y ``teamtwo``.

Para m?s informaci?n acerca de
`pw(8) <http://www.FreeBSD.org/cgi/man.cgi?query=pw&sektion=8>`__,
consulta su p?gina de manual, y para m?s informaci?n acerca del formato
de ``/etc/group``, consulta la p?gina de manual de
`group(5) <http://www.FreeBSD.org/cgi/man.cgi?query=group&sektion=5>`__.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+--------------------------------------------+---------------------------+------------------------------------+
| `Anterior <users-personalizing.html>`__?   | `Subir <users.html>`__    | ?\ `Siguiente <security.html>`__   |
+--------------------------------------------+---------------------------+------------------------------------+
| 13.8. Personalizar a los usuarios?         | `Inicio <index.html>`__   | ?Cap?tulo 14. Seguridad            |
+--------------------------------------------+---------------------------+------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
