=================
Manual de FreeBSD
=================

.. raw:: html

   <div class="navheader">

Manual de FreeBSD
?
?
?\ `Siguiente <book-preface.html>`__

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="book" lang="es" lang="es">

.. raw:: html

   <div class="titlepage" xmlns="">

.. raw:: html

   <div>

.. raw:: html

   <div>

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="author" xmlns="http://www.w3.org/1999/xhtml">

Proyecto de Documentaci?n de FreeBSD
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div>

Revisi?n: ` <https://svnweb.freebsd.org/changeset/doc/>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Copyright ? 1995-2010 The FreeBSD Documentation Project

.. raw:: html

   </div>

.. raw:: html

   <div>

`Aviso Legal <legalnotice.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

`Aviso Legal <trademarks.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div>

Febrero 1999 por .

.. raw:: html

   </div>

.. raw:: html

   <div>

.. raw:: html

   <div class="abstract" xmlns="http://www.w3.org/1999/xhtml">

.. raw:: html

   <div class="abstract-title">

Resumen

.. raw:: html

   </div>

?Bienvenido a FreeBSD! Este manual cubre la instalaci?n y uso diario de
*FreeBSD 10.1-RELEASE* y *FreeBSD 9.3-RELEASE*. Este manual est? en
*constante evoluci?n* y es el resultado del trabajo de muchas personas.
Algunas secciones no est?n completas y otras necesitan ser actualizadas.
Si est? interesado en colaborar en este proyecto env?e un mensaje de
correo electr?nico a `lista de correo del proyecto de documentaci?n de
FreeBSD <http://lists.FreeBSD.org/mailman/listinfo/freebsd-doc>`__. La
?ltima versi?n de este documento est? siempre disponible en el `sitio
web de FreeBSD <http://www.FreeBSD.org>`__. Tambi?n puede encontrarla en
diferentes formatos y opciones de compresi?n en el `servidor FTP de
FreeBSD <ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/>`__ o en las numerosas
`r?plicas <mirrors.html#mirrors-ftp>`__. Si prefiere una copia en papel
de este manual puede comprarla en `FreeBSD
Mall <http://www.freebsdmall.com/>`__. Tambi?n es posible `hacer
b?squedas <../../../../search/index.html>`__ en este manual.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

--------------

.. raw:: html

   </div>

.. raw:: html

   <div class="toc">

.. raw:: html

   <div class="toc-title">

Tabla de contenidos

.. raw:: html

   </div>

`Prefacio <book-preface.html>`__
`I. Primeros pasos <getting-started.html>`__
`1. Introducci?n <introduction.html>`__
`1.1. Sinopsis <introduction.html#introcution-synopsis>`__
`1.2. Bienvenido a FreeBSD <nutshell.html>`__
`1.3. Acerca del Proyecto FreeBSD <history.html>`__
`2. Instalaci?n de FreeBSD <install.html>`__
`2.1. Sinopsis <install.html#install-synopsis>`__
`2.2. Requisitos de hardware <install-hardware.html>`__
`2.3. Tareas anteriores a la instalaci?n <install-pre.html>`__
`2.4. Inicio de la instalaci?n <install-start.html>`__
`2.5. ?Qu? es sysinstall? <using-sysinstall.html>`__
`2.6. Asignaci?n de espacio en disco <install-steps.html>`__
`2.7. Elecci?n de qu? instalar <install-choosing.html>`__
`2.8. Elecci?n del medio de instalaci?n <install-media.html>`__
`2.9. El punto sin retorno <install-final-warning.html>`__
`2.10. Despu?s de la instalaci?n <install-post.html>`__
`2.11. Soluci?n de problemas <install-trouble.html>`__
`2.12. Gu?a avanzada de instalaci?n <install-advanced.html>`__
`2.13. C?mo preparar su propio medio de
instalaci?n <install-diff-media.html>`__
`3. Conceptos b?sicos de Unix <basics.html>`__
`3.1. Sinopsis <basics.html#basics-synopsis>`__
`3.2. Consolas virtuales y terminales <consoles.html>`__
`3.3. Permisos <permissions.html>`__
`3.4. Estructura de directorios <dirstructure.html>`__
`3.5. Organizaci?n de disco <disk-organization.html>`__
`3.6. Montaje y desmontaje de sistemas de
ficheros <mount-unmount.html>`__
`3.7. Procesos <basics-processes.html>`__
`3.8. D?mons, se?ales y c?mo matar procesos <basics-daemons.html>`__
`3.9. Shells <shells.html>`__
`3.10. Editores de texto <editors.html>`__
`3.11. Dispositivos y nodos de dispositivos <basics-devices.html>`__
`3.12. Formatos binarios <binary-formats.html>`__
`3.13. M?s informaci?n <basics-more-information.html>`__
`4. Instalaci?n de aplicaciones: ?packages? y ports <ports.html>`__
`4.1. Sinopsis <ports.html#ports-synopsis>`__
`4.2. Aproximaci?n a la instalaci?n de software <ports-overview.html>`__
`4.3. C?mo encontrar aplicaciones <ports-finding-applications.html>`__
`4.4. Uso del sistema de packages <packages-using.html>`__
`4.5. Uso de la colecci?n de ports <ports-using.html>`__
`4.6. Despu?s de instalar un port <ports-nextsteps.html>`__
`4.7. Ports que no funcionan <ports-broken.html>`__
`5. El sistema X Window <x11.html>`__
`5.1. Sinopsis <x11.html#x11-synopsis>`__
`5.2. Entender X <x-understanding.html>`__
`5.3. Instalar X11 <x-install.html>`__
`5.4. Configuraci?n de X11 <x-config.html>`__
`5.5. Uso de tipos en X11 <x-fonts.html>`__
`5.6. El gestor de pantalla X <x-xdm.html>`__
`5.7. Entornos de escritorio <x11-wm.html>`__
`II. Tareas comunes <common-tasks.html>`__
`6. Aplicaciones de escritorio <desktop.html>`__
`6.1. Sinopsis <desktop.html#desktop-synopsis>`__
`6.2. Navegadores <desktop-browsers.html>`__
`6.3. Productividad <desktop-productivity.html>`__
`6.4. Visores de documentos <desktop-viewers.html>`__
`6.5. Finanzas <desktop-finance.html>`__
`6.6. Resumen <desktop-summary.html>`__
`7. Multimedia <multimedia.html>`__
`7.1. Sinopsis <multimedia.html#idp71524304>`__
`7.2. Configuraci?n de la tarjeta de sonido <sound-setup.html>`__
`7.3. Sonido MP3 <sound-mp3.html>`__
`7.4. Reproducci?n de v?deo <video-playback.html>`__
`7.5. Configuraci?n de tarjetas de TV <tvcard.html>`__
`7.6. Esc?neres de im?genes <scanners.html>`__
`8. Configuraci?n del kernel de FreeBSD <kernelconfig.html>`__
`8.1. Sinopsis <kernelconfig.html#idp72252752>`__
`8.2. ?Qu? razones hay para compilar un kernel
personalizado? <ch08s02.html>`__
`8.3. Inventario de hardware del sistema <kernelconfig-devices.html>`__
`8.4. Controladores del kernel, subsistemas y
m?dulos <kernelconfig-modules.html>`__
`8.5. Compilaci?n e instalaci?n de un kernel
personalizado <kernelconfig-building.html>`__
`8.6. El fichero de configuraci?n <kernelconfig-config.html>`__
`8.7. Qu? hacer si algo va mal <kernelconfig-trouble.html>`__
`9. Imprimir <printing.html>`__
`9.1. Sinopsis <printing.html#idp72842832>`__
`9.2. Introducci?n <printing-intro-spooler.html>`__
`9.3. Configuraci?n b?sica <printing-intro-setup.html>`__
`9.4. Configuraci?n avanzada de impresoras <printing-advanced.html>`__
`9.5. C?mo utilizar impresoras <printing-using.html>`__
`9.6. Alternativas a LPD <printing-lpd-alternatives.html>`__
`9.7. Soluci?n de problemas <printing-troubleshooting.html>`__
`10. Compatibilidad binaria con Linux <linuxemu.html>`__
`10.1. Sinopsis <linuxemu.html#linuxemu-synopsis>`__
`10.2. Instalaci?n <linuxemu-lbc-install.html>`__
`10.3. Instalaci?n de Mathematica? <linuxemu-mathematica.html>`__
`10.4. Instalaci?n de Maple™ <linuxemu-maple.html>`__
`10.5. Instalaci?n de MATLAB? <linuxemu-matlab.html>`__
`10.6. Instalaci?n de Oracle? <linuxemu-oracle.html>`__
`10.7. Instalaci?n de SAP??R/3? <sapr3.html>`__
`10.8. Temas avanzados <linuxemu-advanced.html>`__
`III. Administraci?n del sistema. <system-administration.html>`__
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
`IV. Comunicaciones en red <network-communication.html>`__
`24. Comunicaciones serie <serialcomms.html>`__
`24.1. Sinopsis <serialcomms.html#serial-synopsis>`__
`24.2. Introducci?n <serial.html>`__
`24.3. Terminales <term.html>`__
`24.4. Servicio dial-in <dialup.html>`__
`24.5. Servicio dial-out <dialout.html>`__
`24.6. Configurando la consola serie <serialconsole-setup.html>`__
`25. PPP y SLIP <ppp-and-slip.html>`__
`25.1. Sinopsis <ppp-and-slip.html#idp80093520>`__
`25.2. Uso de User PPP <userppp.html>`__
`25.3. Uso de Kernel PPP <ppp.html>`__
`25.4. Uso de PPP sobre Ethernet (PPPoE) <pppoe.html>`__
`25.5. Uso de PPP sobre ATM (PPPoA) <pppoa.html>`__
`25.6. Uso de SLIP <slip.html>`__
`26. Cortafuegos <firewalls.html>`__
`26.1. \* <firewalls.html#firewalls-intro>`__
`27. Correo Electr?nico <mail.html>`__
`27.1. Sinopsis <mail.html#mail-synopsis>`__
`27.2. Utilizaci?n del correo electr?nico <mail-using.html>`__
`27.3. Configuraci?n de sendmail <sendmail.html>`__
`27.4. Sustituci?n del Agente de Transferencia de
Correo <mail-changingmta.html>`__
`27.5. Depuraci?n de Problemas <mail-trouble.html>`__
`27.6. Conceptos Avanzados <mail-advanced.html>`__
`27.7. SMTP con UUCP <SMTP-UUCP.html>`__
`27.8. Configuraci?n para s?lamente enviar
correo <outgoing-only.html>`__
`27.9. Utilizaci?n del correo con una conexi?n mediante m?dem anal?gico
(dial-up) <SMTP-dialup.html>`__
`27.10. Autentificaci?n utilizando SMTP <SMTP-Auth.html>`__
`27.11. Agente de Correo de Usuario <mail-agents.html>`__
`27.12. Manejo de fetchmail <mail-fetchmail.html>`__
`27.13. Uso de procmail <mail-procmail.html>`__
`28. Servidores de red <network-servers.html>`__
`28.1. \* <network-servers.html#network-servers-synopsis>`__
`29. Networking avanzado <advanced-networking.html>`__
`29.1.
Resumen <advanced-networking.html#advanced-networking-synopsis>`__
`29.2. Pasarelas y “routers” <network-routing.html>`__
`29.3. Redes sin cables (“wireless”) <network-wireless.html>`__
`29.4. Bluetooth <network-bluetooth.html>`__
`29.5. Puenteado <network-bridging.html>`__
`29.6. NFS <network-nfs.html>`__
`29.7. Ejecuci?n sin disco duro <network-diskless.html>`__
`29.8. RDSI <network-isdn.html>`__
`29.9. NIS/YP <network-nis.html>`__
`29.10. DHCP <network-dhcp.html>`__
`29.11. DNS <network-dns.html>`__
`29.12. NTP <network-ntp.html>`__
`29.13. Traducci?n de direcciones de red <network-natd.html>`__
`29.14. El “Superservidor” inetd <network-inetd.html>`__
`29.15. L?nea IP paralela (PLIP) <network-plip.html>`__
`29.16. IPv6 <network-ipv6.html>`__
`29.17. ATM en FreeBSD?5.X <network-atm.html>`__
`V. Ap?ndices <appendices.html>`__
`30. C?mo obtener FreeBSD <mirrors.html>`__
`30.1. Servidores FTP <mirrors.html#mirrors-ftp>`__
`30.2. Uso de CVSup <cvsup.html>`__
`31. Bibliograf?a <bibliography.html>`__
`31.1. Libros y revistas espec?ficas sobre
FreeBSD <bibliography.html#idp84626000>`__
`31.2. Gu?as de usuario <ch31s02.html>`__
`31.3. Gu?as de administrador <ch31s03.html>`__
`31.4. Gu?as de programadores <ch31s04.html>`__
`31.5. El sistema operativo por dentro <ch31s05.html>`__
`31.6. Referencia de seguridad <ch31s06.html>`__
`31.7. Referencia de hardware <ch31s07.html>`__
`31.8. Historia de UNIX <ch31s08.html>`__
`31.9. Diarios y revistas <ch31s09.html>`__
`A. Recursos en Internet <eresources.html>`__
`A.1. Listas de correo <eresources.html#eresources-mail>`__
`A.2. Grupos de noticias de Usenet <eresources-news.html>`__
`A.3. Servidores WWW <eresources-web.html>`__
`A.4. Direcciones de correo electr?nico <eresources-email.html>`__
`A.5. Cuentas shell <eresources-shell.html>`__
`32. PGP keys <pgpkeys.html>`__
`32.1. Responsables <pgpkeys.html#idp85235280>`__
`32.2. Miembros del Core Team <ch32s02.html>`__
`?ndice <ix01.html>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-figures">

.. raw:: html

   <div class="toc-title">

Lista de figuras

.. raw:: html

   </div>

2.1. `Ejemplo de resultado de prueba de
dispositivos <install-start.html#install-dev-probe>`__
2.2. `Men? de selecci?n de pa?s <install-start.html#config-country>`__
2.3. `Salir de Sysinstall <install-start.html#sysinstall-exit>`__
2.4. `Selecci?n de ?Usage? en el men? principal de
sysinstall <using-sysinstall.html#sysinstall-main3>`__
2.5. `Selecci?n del men? de
documentaci?n <using-sysinstall.html#main-doc>`__
2.6. `El men? de documentaci?n de
sysinstall <using-sysinstall.html#docmenu1>`__
2.7. `Men? principal de
sysinstall <using-sysinstall.html#sysinstall-keymap>`__
2.8. `Men? de esquemas de teclado de
sysinstall <using-sysinstall.html#sysinstall-keymap-menu>`__
2.9. `Men? principal de
sysinstall <using-sysinstall.html#sysinstall-options>`__
2.10. `Opciones de sysinstall <using-sysinstall.html#options>`__
2.11. `Comenzar una instalaci?n
est?ndar <using-sysinstall.html#sysinstall-standard>`__
2.12. `Elija en qu? unidad usar
FDisk <install-steps.html#sysinstall-fdisk-drive1>`__
2.13. `Un ejemplo de particionamiento t?pico con
FDisk <install-steps.html#sysinstall-fdisk1>`__
2.14. `Partici?n con FDisk usando el disco
completo <install-steps.html#sysinstall-fdisk2>`__
2.15. `Men? de gestores de arranque de
sysinstall <install-steps.html#sysinstall-bootmgr>`__
2.16. `Salir de la selecci?n de
unidad <install-steps.html#sysinstall-fdisk-drive2>`__
2.17. `El editor Disklabel <install-steps.html#sysinstall-label>`__
2.18. `Editor Disklabel con valores por
omisi?n <install-steps.html#sysinstall-label2>`__
2.19. `Liberar espacio para la partici?n
ra?z <install-steps.html#sysinstall-label-add>`__
2.20. `Edici?n del tama?o de la partici?n
ra?z <install-steps.html#sysinstall-label-add2>`__
2.21. `Elegir el tipo de partici?n
ra?z <install-steps.html#sysinstall-label-type>`__
2.22. `Elegir el punto de montaje del sistema de ficheros
ra?z <install-steps.html#sysinstall-label-mount>`__
2.23. `Editor Disklabel <install-steps.html#sysinstall-label4>`__
2.24. `Elecci?n de
distribuciones <install-choosing.html#distribution-set1>`__
2.25. `Confirmar la elecci?n de
distribuciones <install-choosing.html#distribution-set2>`__
2.26. `Choose Installation Media <install-media.html#choose-media>`__
2.27. `Selecci?n de un dispositivo
Ethernet <install-post.html#ed-config1>`__
2.28. `Configuraci?n de ed0 <install-post.html#ed-config2>`__
2.29. `Edici?n de ``inetd.conf`` <install-post.html#inetd-edit>`__
2.30. `Edici?n del mensaje de bienvenida de
FTP <install-post.html#anon-ftp4>`__
2.31. `Edici?n de ``exports`` <install-post.html#nfs-server-edit>`__
2.32. `Opciones de configuraci?n de la consola del
sistema <install-post.html#saver-options>`__
2.33. `Opciones del salvapantallas <install-post.html#saver-select>`__
2.34. `Retardo del salvapantallas <install-post.html#saver-timeout>`__
2.35. `Salida del men? de configuraci?n de la consola del
sistema <install-post.html#saver-exit>`__
2.36. `Elecci?n de regi?n <install-post.html#set-timezone-region>`__
2.37. `Elecci?n de pa?s <install-post.html#set-timezone-country>`__
2.38. `Elecci?n de zona
horaria <install-post.html#set-timezone-locality>`__
2.39. `Elija el protocolo que usa el
rat?n <install-post.html#mouse-protocol>`__
2.40. `Ajuste del protocolo del
rat?n <install-post.html#set-mouse-protocol>`__
2.41. `Configuraci?n del puerto del
rat?n <install-post.html#config-mouse-port>`__
2.42. `Configuraci?n del puerto del
rat?n <install-post.html#set-mouse-port>`__
2.43. `Arranque del d?mon del rat?n <install-post.html#test-daemon>`__
2.44. `Prueba del d?mon del
rat?n <install-post.html#test-mouse-daemon>`__
2.45. `Categor?as de ?packages? <install-post.html#package-category>`__
2.46. `Selecci?n de ?packages? <install-post.html#package-select>`__
2.47. `Instalaci?n de ?packages? <install-post.html#package-install>`__
2.48. `Confirmaci?n previa a la instalaci?n de
?packages? <install-post.html#package-install-confirm>`__
2.49. `Selecci?n de ?A?adir un usuario? <install-post.html#add-user2>`__
2.50. `A?adir la informaci?n del
usuario <install-post.html#add-user3>`__
2.51. `Salir de la gesti?n de usuarios y
grupos <install-post.html#add-user4>`__
2.52. `Salir de la instalaci?n <install-post.html#final-main>`__
2.53. `Primer nivel de servicios de
red <install-post.html#network-configuration>`__
2.54. `Elegir el MTA del sistema <install-post.html#mta-selection>`__
2.55. `Configuraci?n de Ntpdate <install-post.html#Ntpdate-config>`__
2.56. `Segundo nivel de configuraci?n de
red <install-post.html#Network-configuration-cont>`__
20.1. `Organizaci?n
Concatenada <vinum-access-bottlenecks.html#vinum-concat>`__
20.2. `Organizaci?n con
“Striping” <vinum-access-bottlenecks.html#vinum-striped>`__
20.3. `Organizaci?n en
RAID-5 <vinum-data-integrity.html#vinum-raid5-org>`__
20.4. `Un Volumen Vinum
Sencillo <vinum-examples.html#vinum-simple-vol>`__
20.5. `Un Volumen Vinum
Replicado <vinum-examples.html#vinum-mirrored-vol>`__
20.6. `Un Volumen Vinum en
“Striping” <vinum-examples.html#vinum-striped-vol>`__
20.7. `Un Volumen Vinum Replicado y en
“Striping” <vinum-examples.html#vinum-raid10-vol>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-tables">

.. raw:: html

   <div class="toc-title">

Lista de tablas

.. raw:: html

   </div>

2.1. `Ejemplo de inventario de
dispositivos <install-pre.html#idp67336656>`__
2.2. `Estructura de particiones del primer
disco <install-steps.html#idp68044752>`__
2.3. `Esquema de particiones para varios
discos <install-steps.html#idp68066512>`__
2.4. `Nombres y funciones de las im?genes de FreeBSD?6.\ *``X``* and
7.\ *``X``* <install-diff-media.html#idp68917328>`__
3.1. `C?digos de dispositivos de
disco <disk-organization.html#basics-dev-codes>`__
18.1. `Convenciones para nombrar discos
f?sicos <disks-naming.html#disk-naming-physical-table>`__
29.1. `Cableado de una conexi?n de cable paralelo para
redes <network-plip.html#idp84358480>`__
29.2. `Direcciones IPv6 reservadas <network-ipv6.html#idp84473040>`__

.. raw:: html

   </div>

.. raw:: html

   <div class="list-of-examples">

.. raw:: html

   <div class="toc-title">

Lista de ejemplos

.. raw:: html

   </div>

2.1. `Uso de una partici?n sin cambiar
nada <install-pre.html#idp67398736>`__
2.2. `Reducir una partici?n existente <install-pre.html#idp67403344>`__
3.1. `Ejemplo de nombres de disco, ?slice? y
partici?n <disk-organization.html#basics-disk-slice-part>`__
3.2. `Modelo conceptual de un
disco <disk-organization.html#basics-concept-disk-model>`__
4.1. `Descarga de un paquete manualmente e instalaci?n en nuestro
sistema <packages-using.html#idp70147280>`__
12.1. `Pantalla ``boot0`` <boot-blocks.html#boot-boot0-example>`__
12.2. `Pantalla de ``boot2`` <boot-blocks.html#boot-boot2-example>`__
12.3. `Una consola insegura en
/etc/ttys <boot-init.html#boot-insecure-console>`__
13.1. `Configuraci?n de adduser <users-modifying.html#idp74734544>`__
13.2. `Eliminaci?n interactiva de cuenta con
rmuser <users-modifying.html#idp74778448>`__
13.3. `chpass interactivo ejecutado por el
superusuario <users-modifying.html#idp74785104>`__
13.4. `chpass interactivo ejecutado por un usuario
normal <users-modifying.html#idp74794960>`__
13.5. `Cambio de tu contrase?a <users-modifying.html#idp74808144>`__
13.6. `Cambio de la contrase?a de otro usuario como
superusuario <users-modifying.html#idp74809936>`__
13.7. `A?adir un grupo usando pw(8) <users-groups.html#idp74907728>`__
13.8. `A?adir a alguien a un grupo usando
pw(8) <users-groups.html#idp74917968>`__
13.9. `Determinar pertenencia a grupos con
id(1) <users-groups.html#idp74929744>`__
14.1. `Uso de SSH para crear un t?nel seguro para
SMTP <openssh.html#idp76497488>`__
18.1. `Utilizando ``dump`` a trav?s de
ssh <backup-basics.html#idp78026704>`__
18.2. `Uso de ``dump`` a trav?s de ssh con ``RSH``
configurada <backup-basics.html#idp78030160>`__
18.3. `Un “script” para la creaci?n de discos flexibles de
arranque <backup-basics.html#idp78122960>`__
18.4. `Uso de vnconfig para montar una imagen de un sistema de ficheros
bajo FreeBSD?4.X <disks-virtual.html#idp78218192>`__
18.5. `Creaci?n de una imagen nueva de un sistema de ficheros respaldado
en un archivo con ``vnconfig`` <disks-virtual.html#idp78221776>`__
18.6. `Uso de ``mdconfig`` para montar una imagen de un sistema de
ficheros en FreeBSD?5.X <disks-virtual.html#idp78236112>`__
18.7. `Creaci?n de un disco respaldado en fichero con
``mdconfig`` <disks-virtual.html#idp78240080>`__
18.8. `Configurar y montar un disco basado en un fichero con
``mdmfs`` <disks-virtual.html#idp78271440>`__
18.9. `Disco de memoria md en
FreeBSD?4.X <disks-virtual.html#idp78291536>`__
18.10. `Creaci?n de un nuevo disco basado en memoria con
``mdconfig`` <disks-virtual.html#idp78309456>`__
18.11. `Creaci?n de un nuevo disco basado en memoria con
``mdmfs`` <disks-virtual.html#idp78318032>`__
24.1. `Agregando entradas de terminal a
``/etc/ttys`` <term.html#ex-etc-ttys>`__
27.1. `Configuraci?n de la base de datos de acceso de
sendmail <sendmail.html#idp81158224>`__
27.2. `Mail Aliases <sendmail.html#idp81169872>`__
27.3. `Ejemplo de asociaci?n de correo de dominio
virtual <sendmail.html#idp81195472>`__
29.1. `Anclaje de una exportaci?n utilizando
amd <network-nfs.html#idp82622928>`__
29.2. `Sucursal o red dom?stica <network-isdn.html#idp83012816>`__
29.3. `Oficina central u otra LAN <network-isdn.html#idp83019344>`__
29.4. `Env?o de una se?al HANGUP a
inetd <network-inetd.html#network-inetd-hangup>`__

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----+-----+----------------------------------------+
| ?   | ?   | ?\ `Siguiente <book-preface.html>`__   |
+-----+-----+----------------------------------------+
| ?   | ?   | ?Prefacio                              |
+-----+-----+----------------------------------------+

.. raw:: html

   </div>

Puede descargar ?ste y muchos otros documentos desde
ftp://ftp.FreeBSD.org/pub/FreeBSD/doc/

| Si tiene dudas sobre FreeBSD consulte la
  `documentaci?n <http://www.FreeBSD.org/docs.html>`__ antes de escribir
  a la lista <questions@FreeBSD.org\ >.
|  Env?e sus preguntas sobre la documentaci?n a <doc@FreeBSD.org\ >.
