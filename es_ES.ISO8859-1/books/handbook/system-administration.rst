======================================
Parte?III.?Administraci?n del sistema.
======================================

.. raw:: html

   <div class="navheader">

Parte?III.?Administraci?n del sistema.
`Anterior <linuxemu-advanced.html>`__?
?
?\ `Siguiente <config-tuning.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="part">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="partintro">

.. raw:: html

   <div xmlns="">

.. raw:: html

   </div>

Los restantes cap?tulos de este libro cubren todos los aspectos de
administraci?n de un sistema FreeBSD. Cada cap?tulo comienza
describiendo lo que ser? aprendido una vez finalizada la lectura,
explicando tambi?n los conocimientos m?nimos necesarios para una
comprensi?n satisfactoria del texto.

Estos cap?tulos est?n dise?ados para leerse cuando se necesita la
informaci?n. No es necesario leerlos en un determinado orden ni es
necesario leerlos todos antes de comenzar a usar FreeBSD.

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`11. Configuraci?n y Adaptaci?n del Sistema <config-tuning.html>`__
`11.1. Configuraci?n de Tarjetas de
Red <config-tuning.html#config-network-setup>`__
`11.2. “Arrancar servicios” <configtuning-starting-services.html>`__
`11.3. “Soft Updates” <soft-updates.html>`__
`11.4. A?adir espacio swap <adding-swap-space.html>`__
`12. El proceso de arranque en FreeBSD <boot.html>`__
`12.1. Sinopsis <boot.html#boot-synopsis>`__
`12.2. El problema que representa arrancar el
sistema <boot-introduction.html>`__
`12.3. El RMA y las etapas de arranque uno, dos y
tres <boot-blocks.html>`__
`12.4. Interacci?n con el kernel durante el
arranque <boot-kernel.html>`__
`12.5. Device Hints <device-hints.html>`__
`12.6. Init: inicializaci?n del proceso de control <boot-init.html>`__
`12.7. Secuencia de apagado <boot-shutdown.html>`__
`13. Usuarios y administraci?n b?sica de cuentas <users.html>`__
`13.1. Sinopsis <users.html#users-synopsis>`__
`13.2. Introducci?n <users-introduction.html>`__
`13.3. La cuenta superusuario <users-superuser.html>`__
`13.4. Cuentas de sistema <users-system.html>`__
`13.5. Cuentas de usuario <users-user.html>`__
`13.6. Modificaci?n de cuentas <users-modifying.html>`__
`13.7. Limitar a los usuarios <users-limiting.html>`__
`13.8. Personalizar a los usuarios <users-personalizing.html>`__
`13.9. Grupos <users-groups.html>`__
`14. Seguridad <security.html>`__
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
`15. Jaulas <jails.html>`__
`15.1. Sinopsis <jails.html#jails-synopsis>`__
`15.2. T?rminos relacionados con las jaulas <jails-terms.html>`__
`15.3. Introducci?n <jails-intro.html>`__
`15.4. Creaci?n y gesti?n de jaulas <jails-build.html>`__
`15.5. Administraci?n y personalizaci?n a fondo <jails-tuning.html>`__
`15.6. Uso de las jaulas <jails-application.html>`__
`16. Mandatory Access Control <mac.html>`__
`16.1. Sinopsis <mac.html#mac-synopsis>`__
`16.2. T?rminos clave en este cap?tulo <mac-inline-glossary.html>`__
`16.3. Explicaci?n de MAC <mac-initial.html>`__
`16.4. Las etiquetas MAC <mac-understandlabel.html>`__
`16.5. Configuraci?n de m?dulos <mac-modules.html>`__
`16.6. El m?dulo MAC ifoff <mac-ifoff.html>`__
`16.7. El m?dulo MAC portacl <mac-portacl.html>`__
`16.8. Pol?ticas de etiquetas MAC <mac-labelingpolicies.html>`__
`16.9. El m?dulo MAC partition <mac-partition.html>`__
`16.10. El m?dulo de seguridad multinivel MAC <mac-mls.html>`__
`16.11. El m?dulo MAC Biba <mac-biba.html>`__
`16.12. El m?dulo MAC LOMAC <mac-lomac.html>`__
`16.13. Implementaci?n de un entorno seguro con
MAC <mac-implementing.html>`__
`16.14. Otro ejemplo: Uso de MAC para restringir un servidor
web <MAC-examplehttpd.html>`__
`16.15. Depuraci?n de errores en MAC <mac-troubleshoot.html>`__
`17. Auditor?a de eventos de seguridad <audit.html>`__
`17.1. \* <audit.html#audit-synopsis>`__
`18. Almacenamiento <disks.html>`__
`18.1. Sinopsis <disks.html#disks-synopsis>`__
`18.2. Nombres de dispositivo <disks-naming.html>`__
`18.3. A?adir discos <disks-adding.html>`__
`18.4. RAID <raid.html>`__
`18.5. Dispositivos de almacenamiento USB <usb-disks.html>`__
`18.6. Creaci?n y uso de medios ?pticos (CD) <creating-cds.html>`__
`18.7. Crear y utilizar medios ?pticos (DVDs) <creating-dvds.html>`__
`18.8. Creaci?n y uso de disquetes (floppies) <floppies.html>`__
`18.9. Creaci?n y uso de cintas de datos <backups-tapebackups.html>`__
`18.10. Respaldos en disquetes <backups-floppybackups.html>`__
`18.11. Bases para respaldos <backup-basics.html>`__
`18.12. Sistemas de ficheros en red, memoria y respaldados en
fichero <disks-virtual.html>`__
`18.13. Instant?neas (“snapshots”) de sistemas de
ficheros <snapshots.html>`__
`18.14. Cuotas en sistemas de ficheros <quotas.html>`__
`18.15. Cifrado de particiones de disco <disks-encrypting.html>`__
`19. GEOM: Marco de trabajo modular de transformaci?n de
discos <GEOM.html>`__
`19.1. Sinopsis <GEOM.html#GEOM-synopsis>`__
`19.2. Introducci?n a GEOM <GEOM-intro.html>`__
`19.3. RAID0 - Distribuci?n por bandas <GEOM-striping.html>`__
`19.4. RAID1 - Replicaci?n <GEOM-mirror.html>`__
`20. El Gestor de Vol?menes Vinum <vinum-vinum.html>`__
`20.1. Sinopsis <vinum-vinum.html#vinum-synopsis>`__
`20.2. Los Discos son Demasiado Peque?os <vinum-intro.html>`__
`20.3. Cuellos de Botella en el
Acceso <vinum-access-bottlenecks.html>`__
`20.4. Integridad de Datos <vinum-data-integrity.html>`__
`20.5. Objetos Vinum <vinum-objects.html>`__
`20.6. Ejemplos <vinum-examples.html>`__
`20.7. Esquema de Nombres de los Objetos <vinum-object-naming.html>`__
`20.8. Configuraci?n de Vinum <vinum-config.html>`__
`20.9. Uso de Vinum en el Sistema de Ficheros Ra?z <vinum-root.html>`__
`21. Virtualizaci?n <virtualization.html>`__
`21.1. \* <virtualization.html#virtualization-synopsis>`__
`22. Localizaci?n - Uso y configuraci?n de I18N/L10N <l10n.html>`__
`22.1. Sinopsis <l10n.html#l10n-synopsis>`__
`22.2. Lo b?sico <l10n-basics.html>`__
`22.3. Uso de la localizaci?n <using-localization.html>`__
`22.4. Compilaci?n de programas con soporte para
I18N <l10n-compiling.html>`__
`22.5. Localizaci?n de FreeBSD a idiomas
espec?ficos <lang-setup.html>`__
`23. Lo ?ltimo de lo ?ltimo <cutting-edge.html>`__
`23.1. Sinopsis <cutting-edge.html#idp79223760>`__
`23.2. FreeBSD-CURRENT vs. FreeBSD-STABLE <current-stable.html>`__
`23.3. Sincronizaci?n de su c?digo fuente <synching.html>`__
`23.4. Uso de ``make world`` <makeworld.html>`__
`23.5. Redes peque?as <small-lans.html>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+------------------------------------------+---------------------------+--------------------------------------------------------+
| `Anterior <linuxemu-advanced.html>`__?   | ?                         | ?\ `Siguiente <config-tuning.html>`__                  |
+------------------------------------------+---------------------------+--------------------------------------------------------+
| 10.8. Temas avanzados?                   | `Inicio <index.html>`__   | ?Cap?tulo 11. Configuraci?n y Adaptaci?n del Sistema   |
+------------------------------------------+---------------------------+--------------------------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
