========================
13.4. Cuentas de sistema
========================

.. raw:: html

   <div class="navheader">

13.4. Cuentas de sistema
`Anterior <users-superuser.html>`__?
Cap?tulo 13. Usuarios y administraci?n b?sica de cuentas
?\ `Siguiente <users-user.html>`__

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

13.4. Cuentas de sistema
------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

Los usuarios de sistema son aqu?llos que corren servicios como DNS,
correo, servidores web, etc. Esto es as? por seguridad; si todos los
servicios corrieran como superusuario podr?an actuar sin ninguna
restricci?n.

Algunos ejemplos de usuarios de sistema son ``daemon``, ``operator``,
``bind`` (para el DNS), y ``news``. Con frecuencia, los administradores
de sistemas crean el usuario ``httpd`` para que ejecute los servidores
web que instalan.

``nobody`` es el usuario de sistema sin privelegios gen?rico. No
obstante, es importante tener en cuenta que cuantos m?s servicios use
``nobody``, m?s ficheros y procesos estar?n asociados con dicho usuario,
y en consecuencia m?s privilegiado ser?.

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+----------------------------------------+---------------------------+--------------------------------------+
| `Anterior <users-superuser.html>`__?   | `Subir <users.html>`__    | ?\ `Siguiente <users-user.html>`__   |
+----------------------------------------+---------------------------+--------------------------------------+
| 13.3. La cuenta superusuario?          | `Inicio <index.html>`__   | ?13.5. Cuentas de usuario            |
+----------------------------------------+---------------------------+--------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
