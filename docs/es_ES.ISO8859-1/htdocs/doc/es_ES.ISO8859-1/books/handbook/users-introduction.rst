==================
13.2. Introducci?n
==================

.. raw:: html

   <div class="navheader">

13.2. Introducci?n
`Anterior <users.html>`__?
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
?\ `Siguiente <users-superuser.html>`__

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

13.2. Introducci?n
------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Todos los accesos al sistema se consiguen v?a cuentas, y todos los
procesos son ejecutados por usuarios, por ello la administraci?n de
usuarios y cuentas es de una gran importancia en sistemas FreeBSD.

Cada cuenta en un sistema FreeBSD tiene cierta informaci?n asociada que
la identifica.

.. raw:: html

   <div class="variablelist">

Nombre de usuario
    El nombre de usuario como se le entrar?a al prompt ``login:``. Los
    nombres de usuario han de ser ?nicos en la computadora; no puede
    haber dos usuarios con el mismo nombre de usuario. Existen algunas
    reglas para la creaci?n de nombres de usuario v?lidos documentadas
    en
    `passwd(5) <http://www.FreeBSD.org/cgi/man.cgi?query=passwd&sektion=5>`__;
    t?picamente se usar?an nombres de usuario de a lo sumo ocho
    caracteres, todos ellos en min?scula.

Contrase?a
    Cada cuenta tiene una contrase?a asociada. La contrase?a puede ser
    vac?a, en cuyo caso no se requerir? ninguna para acceder al sistema.
    Esto normalmente es una mala idea; cada cuenta deber?a tener una
    constrase?a no vac?a.

Identificador de usuario (UID)
    El UID es un numero entre 0 y 65536 que sirve para identificar
    un?vocamente al usuario en el sistema. Internamente, FreeBSD usa el
    UID para identificar usuarios y cualquier comando de FreeBSD que
    permita especificar un nombre de usuario convertir? ?ste al UID
    antes de trabajar con ?l. Esto significa que puedes tener varias
    cuentas con nombres de usuario distintos pero con el mismo UID. En
    lo que a FreeBSD respecta, tales cuentas son un solo usuario. Es
    improbable que alguna vez tengas que hacer algo as?.

Identificador de grupo (GID)
    El GID es un n?mero entre 0 y 65536 que sirve para identificar
    un?vocamente el grupo principal al cual pertenece un usuario. Los
    grupos son un mecanismo para controlar el acceso a recursos del
    sistema en base al GID, en vez del UID. Esto puede reducir
    significativamente el tama?o de algunos ficheros de configuraci?n.
    Un usuario puede pertencer a m?s de un grupo.

Clase de login
    Las clases de login son una extensi?n al mecanismo de grupos que
    ofrecen una mayor flexibilidad a la hora de adaptar el sistema a
    distintos usuarios.

Tiempo de cambio de contrase?a
    Por defecto FreeBSD no obliga a los usuarios a cambiar su contrase?a
    peri?dicamente. Se puede requerir esto a determinados usuarios,
    haciendo que algunos o todos deban cambiar sus contrase?as al cabo
    de cierto periodo de tiempo.

Tiempo de expiraci?n de cuentas
    Por defecto las cuentas en FreeBSD no expiran. Si est?s creando
    cuentas que sabes que van a tener un tiempo limitado de vida, por
    ejemplo, las cuentas de los estudiantes de una escuela, entonces
    puedes especificar cu?ndo expiran. Una vez vencido su tiempo de
    expiraci?n una cuenta no puede ser usada para entrar en el sistema,
    si bien sus directorios y archivos ser?n conservados.

Nombre completo de usuario
    El nombre de usuario identifica un?vocamente a una cuenta para
    FreeBSD, pero no refleja su verdadero nombre necesariamente. Esta
    informaci?n puede ser asociada a la cuenta.

Directorio home
    El directorio home es el camino completo de un directorio en el
    sistema en el que el usuario se hallar? cuando entre. Una convenci?n
    usual consiste en poner todos los directorios home en
    ``/home/nombre_de_usuario`` o en ``/usr/home/nombre_de_usuario``.
    Los usuarios guardar?an sus archivos personales en sus directorios
    home, y en cualquier directorio que creasen all?.

Shell de usuario
    La shell provee el entorno por defecto mediante el cual los usuarios
    interact?an con el sistema. Existen varios tipos de shell y los
    usuarios experimentados tendr?n sus propias preferencias, que pueden
    expresarse en la configuraci?n de su cuenta.

.. raw:: html

   </div>

Existen principalmente tres tipos de cuentas; la cuenta de
`superusuario <users-superuser.html>`__, las cuentas de `usuarios del
sistema <users-system.html>`__, y las de `usuarios <users-user.html>`__.
La cuenta de superusuario, normalmente llamada ``root``, se usa para
administrar el sistema sin limitaciones en los privilegios. Los usuarios
del sistema utilizan servicios del mismo. Finalmente, las cuentas de
usuarios son usadas por gente real, aquellos que entran, leen correo,
etc?tera.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-------------------------------------------------------------+---------------------------+-------------------------------------------+
| `Anterior <users.html>`__?                                  | `Subir <users.html>`__    | ?\ `Siguiente <users-superuser.html>`__   |
+-------------------------------------------------------------+---------------------------+-------------------------------------------+
| Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas?   | `Inicio <index.html>`__   | ?13.3. La cuenta superusuario             |
+-------------------------------------------------------------+---------------------------+-------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
