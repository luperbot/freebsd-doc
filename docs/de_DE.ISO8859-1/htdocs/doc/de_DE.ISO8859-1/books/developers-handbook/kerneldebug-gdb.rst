============================================================================
10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit kgdb
============================================================================

.. raw:: html

   <div class="navheader">

10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit
``kgdb``
`Zur?ck <kerneldebug.html>`__?
Kapitel 10. Kernel-Fehlersuche
?\ `Weiter <kerneldebug-ddd.html>`__

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

10.2. Fehlersuche in einem Speicherauszug nach einem Kernel-Absturz mit ``kgdb``
--------------------------------------------------------------------------------

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="note" xmlns="">

Anmerkung:
~~~~~~~~~~

Dieser Abschnitt deckt
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__
ab, wie es in FreeBSD 5.3 und sp?ter zu finden ist. In fr?heren
Versionen muss ``gdb -k`` benutzt werden, um einen Kernspeicherauszug
auszulesen.

.. raw:: html

   </div>

Sobald ein Speicherauszug zur Verf?gung steht, ist es recht einfach
n?tzliche Informationen f?r einfache Probleme daraus zu bekommen. Bevor
Sie sich auf die Interna von
`kgdb(1) <http://www.FreeBSD.org/cgi/man.cgi?query=kgdb&sektion=1>`__
st?rzen, um die Fehler im Kernspeicherauszug zu suchen und zu beheben,
machen Sie die Debug-Version Ihres Kernels (normalerweise
``kernel.debug`` genannt) und den Pfad der Quelldateien, die zum Bau
Ihres Kernels verwendet wurden (normalerweise
``/usr/obj/usr/src/sys/KERNCONF``, wobei ``KERNCONF`` das in einer
Kernel-\ `config(5) <http://www.FreeBSD.org/cgi/man.cgi?query=config&sektion=5>`__
festgelegte ``ident`` ist), ausfindig. Mit diesen beiden Informationen
kann die Fehlersuche beginnen.

Um in den Debugger zu gelangen und mit dem Informationserhalt aus dem
Speicherauszug zu beginnen, sind zumindest folgende Schritte n?tig:

.. code:: screen

    # cd /usr/obj/usr/src/sys/KERNCONF
    # kgdb kernel.debug /var/crash/vmcore.0

Sie k?nnen Fehler im Speicherauszug nach dem Absturz suchen, indem Sie
die Kernel-Quellen benutzen, genauso wie Sie es bei jedem anderen
Programm k?nnen.

Dieser erste Speicherauszug ist aus einem 5.2-BETA-Kernel und der
Absturz ist tief im Kernel begr?ndet. Die Ausgabe unten wurde
dahingehend bearbeitet, dass sie nun Zeilennummern auf der linken Seite
einschlie?t. Diese erste Ablaufverfolgung (Trace) untersucht den
Befehlszeiger (Instruction-Pointer) und beschafft eine Zur?ckverfolgung
(Back-Trace). Die Adresse, die in Zeile 41 f?r den ``list``-Befehl
benutzt wird, ist der Befehlszeiger und kann in Zeile 17 gefunden
werden. Die meisten Entwickler wollen zumindest dies zugesendet
bekommen, falls Sie das Problem nicht selber untersuchen und beheben
k?nnen. Falls Sie jedoch das Problem l?sen, stellen Sie sicher, dass Ihr
Patch seinen Weg in den Quellbaum mittels eines Fehlerberichts, den
Mailinglisten oder ihres Privilegs, zu committen, findet!

.. code:: screen

     1:# cd /usr/obj/usr/src/sys/KERNCONF
     2:# kgdb kernel.debug /var/crash/vmcore.0
     3:GNU gdb 5.2.1 (FreeBSD)
     4:Copyright 2002 Free Software Foundation, Inc.
     5:GDB is free software, covered by the GNU General Public License, and you are
     6:welcome to change it and/or distribute copies of it under certain conditions.
     7:Type "show copying" to see the conditions.
     8:There is absolutely no warranty for GDB.  Type "show warranty" for details.
     9:This GDB was configured as "i386-undermydesk-freebsd"...
    10:panic: page fault
    11:panic messages:
    12:---
    13:Fatal trap 12: page fault while in kernel mode
    14:cpuid = 0; apic id = 00
    15:fault virtual address   = 0x300
    16:fault code:             = supervisor read, page not present
    17:instruction pointer     = 0x8:0xc0713860
    18:stack pointer           = 0x10:0xdc1d0b70
    19:frame pointer           = 0x10:0xdc1d0b7c
    20:code segment            = base 0x0, limit 0xfffff, type 0x1b
    21:                        = DPL 0, pres 1, def32 1, gran 1
    22:processor eflags        = resume, IOPL = 0
    23:current process         = 14394 (uname)
    24:trap number             = 12
    25:panic: page fault
    26      cpuid = 0;
    27:Stack backtrace:
    28
    29:syncing disks, buffers remaining... 2199 2199 panic: mi_switch: switch in a critical section
    30:cpuid = 0;
    31:Uptime: 2h43m19s
    32:Dumping 255 MB
    33: 16 32 48 64 80 96 112 128 144 160 176 192 208 224 240
    34:---
    35:Reading symbols from /boot/kernel/snd_maestro3.ko...done.
    36:Loaded symbols for /boot/kernel/snd_maestro3.ko
    37:Reading symbols from /boot/kernel/snd_pcm.ko...done.
    38:Loaded symbols for /boot/kernel/snd_pcm.ko
    39:#0  doadump () at /usr/src/sys/kern/kern_shutdown.c:240
    40:240             dumping++;
    41:(kgdb) list *0xc0713860
    42:0xc0713860 is in lapic_ipi_wait (/usr/src/sys/i386/i386/local_apic.c:663).
    43:658                     incr = 0;
    44:659                     delay = 1;
    45:660             } else
    46:661                     incr = 1;
    47:662             for (x = 0; x < delay; x += incr) {
    48:663                     if ((lapic->icr_lo & APIC_DELSTAT_MASK) == APIC_DELSTAT_IDLE)
    49:664                             return (1);
    50:665                     ia32_pause();
    51:666             }
    52:667             return (0);
    53:(kgdb) backtrace
    54:#0  doadump () at /usr/src/sys/kern/kern_shutdown.c:240
    55:#1  0xc055fd9b in boot (howto=260) at /usr/src/sys/kern/kern_shutdown.c:372
    56:#2  0xc056019d in panic () at /usr/src/sys/kern/kern_shutdown.c:550
    57:#3  0xc0567ef5 in mi_switch () at /usr/src/sys/kern/kern_synch.c:470
    58:#4  0xc055fa87 in boot (howto=256) at /usr/src/sys/kern/kern_shutdown.c:312
    59:#5  0xc056019d in panic () at /usr/src/sys/kern/kern_shutdown.c:550
    60:#6  0xc0720c66 in trap_fatal (frame=0xdc1d0b30, eva=0)
    61:    at /usr/src/sys/i386/i386/trap.c:821
    62:#7  0xc07202b3 in trap (frame=
    63:      {tf_fs = -1065484264, tf_es = -1065484272, tf_ds = -1065484272, tf_edi = 1, tf_esi = 0, tf_ebp = -602076292, tf_isp = -602076324, tf_ebx = 0, tf_edx = 0, tf_ecx = 1000000, tf_eax = 243, tf_trapno = 12, tf_err = 0, tf_eip = -1066321824, tf_cs = 8, tf_eflags = 65671, tf_esp = 243, tf_ss = 0})
    64:    at /usr/src/sys/i386/i386/trap.c:250
    65:#8  0xc070c9f8 in calltrap () at {standard input}:94
    66:#9  0xc07139f3 in lapic_ipi_vectored (vector=0, dest=0)
    67:    at /usr/src/sys/i386/i386/local_apic.c:733
    68:#10 0xc0718b23 in ipi_selected (cpus=1, ipi=1)
    69:    at /usr/src/sys/i386/i386/mp_machdep.c:1115
    70:#11 0xc057473e in kseq_notify (ke=0xcc05e360, cpu=0)
    71:    at /usr/src/sys/kern/sched_ule.c:520
    72:#12 0xc0575cad in sched_add (td=0xcbcf5c80)
    73:    at /usr/src/sys/kern/sched_ule.c:1366
    74:#13 0xc05666c6 in setrunqueue (td=0xcc05e360)
    75:    at /usr/src/sys/kern/kern_switch.c:422
    76:#14 0xc05752f4 in sched_wakeup (td=0xcbcf5c80)
    77:    at /usr/src/sys/kern/sched_ule.c:999
    78:#15 0xc056816c in setrunnable (td=0xcbcf5c80)
    79:    at /usr/src/sys/kern/kern_synch.c:570
    80:#16 0xc0567d53 in wakeup (ident=0xcbcf5c80)
    81:    at /usr/src/sys/kern/kern_synch.c:411
    82:#17 0xc05490a8 in exit1 (td=0xcbcf5b40, rv=0)
    83:    at /usr/src/sys/kern/kern_exit.c:509
    84:#18 0xc0548011 in sys_exit () at /usr/src/sys/kern/kern_exit.c:102
    85:#19 0xc0720fd0 in syscall (frame=
    86:      {tf_fs = 47, tf_es = 47, tf_ds = 47, tf_edi = 0, tf_esi = -1, tf_ebp = -1077940712, tf_isp = -602075788, tf_ebx = 672411944, tf_edx = 10, tf_ecx = 672411600, tf_eax = 1, tf_trapno = 12, tf_err = 2, tf_eip = 671899563, tf_cs = 31, tf_eflags = 642, tf_esp = -1077940740, tf_ss = 47})
    87:    at /usr/src/sys/i386/i386/trap.c:1010
    88:#20 0xc070ca4d in Xint0x80_syscall () at {standard input}:136
    89:---Can't read userspace from dump, or kernel process---
    90:(kgdb) quit

Diese n?chste Ablaufverfolgung ist ein ?lterer Speicherauszug aus
FreeBSD 2-Zeiten, aber ist komplizierter und zeigt mehr der
``gdb``-Funktionen. Lange Zeilen wurden gefaltet, um die Lesbarkeit zu
verbessern, und die Zeilen wurden zur Verweisung nummeriert. Trotzdem
ist es eine reale Fehlerverfolgung (Error-Trace), die w?hrend der
Entwicklung des pcvt-Konsolentreibers entstanden ist.

.. code:: screen

     1:Script started on Fri Dec 30 23:15:22 1994
     2:# cd /sys/compile/URIAH
     3:# gdb -k kernel /var/crash/vmcore.1
     4:Reading symbol data from /usr/src/sys/compile/URIAH/kernel
    ...done.
     5:IdlePTD 1f3000
     6:panic: because you said to!
     7:current pcb at 1e3f70
     8:Reading in symbols for ../../i386/i386/machdep.c...done.
     9:(kgdb) backtrace
    10:#0  boot (arghowto=256) (../../i386/i386/machdep.c line 767)
    11:#1  0xf0115159 in panic ()
    12:#2  0xf01955bd in diediedie () (../../i386/i386/machdep.c line 698)
    13:#3  0xf010185e in db_fncall ()
    14:#4  0xf0101586 in db_command (-266509132, -266509516, -267381073)
    15:#5  0xf0101711 in db_command_loop ()
    16:#6  0xf01040a0 in db_trap ()
    17:#7  0xf0192976 in kdb_trap (12, 0, -272630436, -266743723)
    18:#8  0xf019d2eb in trap_fatal (...)
    19:#9  0xf019ce60 in trap_pfault (...)
    20:#10 0xf019cb2f in trap (...)
    21:#11 0xf01932a1 in exception:calltrap ()
    22:#12 0xf0191503 in cnopen (...)
    23:#13 0xf0132c34 in spec_open ()
    24:#14 0xf012d014 in vn_open ()
    25:#15 0xf012a183 in open ()
    26:#16 0xf019d4eb in syscall (...)
    27:(kgdb) up 10
    28:Reading in symbols for ../../i386/i386/trap.c...done.
    29:#10 0xf019cb2f in trap (frame={tf_es = -260440048, tf_ds = 16, tf_\
    30:edi = 3072, tf_esi = -266445372, tf_ebp = -272630356, tf_isp = -27\
    31:2630396, tf_ebx = -266427884, tf_edx = 12, tf_ecx = -266427884, tf\
    32:_eax = 64772224, tf_trapno = 12, tf_err = -272695296, tf_eip = -26\
    33:6672343, tf_cs = -266469368, tf_eflags = 66066, tf_esp = 3072, tf_\
    34:ss = -266427884}) (../../i386/i386/trap.c line 283)
    35:283                             (void) trap_pfault(&frame, FALSE);
    36:(kgdb) frame frame->tf_ebp frame->tf_eip
    37:Reading in symbols for ../../i386/isa/pcvt/pcvt_drv.c...done.
    38:#0  0xf01ae729 in pcopen (dev=3072, flag=3, mode=8192, p=(struct p\
    39:roc *) 0xf07c0c00) (../../i386/isa/pcvt/pcvt_drv.c line 403)
    40:403             return ((*linesw[tp->t_line].l_open)(dev, tp));
    41:(kgdb) list
    42:398
    43:399             tp->t_state |= TS_CARR_ON;
    44:400             tp->t_cflag |= CLOCAL;  /* cannot be a modem (:-) */
    45:401
    46:402     #if PCVT_NETBSD || (PCVT_FREEBSD >= 200)
    47:403             return ((*linesw[tp->t_line].l_open)(dev, tp));
    48:404     #else
    49:405             return ((*linesw[tp->t_line].l_open)(dev, tp, flag));
    50:406     #endif /* PCVT_NETBSD || (PCVT_FREEBSD >= 200) */
    51:407     }
    52:(kgdb) print tp
    53:Reading in symbols for ../../i386/i386/cons.c...done.
    54:$1 = (struct tty *) 0x1bae
    55:(kgdb) print tp->t_line
    56:$2 = 1767990816
    57:(kgdb) up
    58:#1  0xf0191503 in cnopen (dev=0x00000000, flag=3, mode=8192, p=(st\
    59:ruct proc *) 0xf07c0c00) (../../i386/i386/cons.c line 126)
    60:       return ((*cdevsw[major(dev)].d_open)(dev, flag, mode, p));
    61:(kgdb) up
    62:#2  0xf0132c34 in spec_open ()
    63:(kgdb) up
    64:#3  0xf012d014 in vn_open ()
    65:(kgdb) up
    66:#4  0xf012a183 in open ()
    67:(kgdb) up
    68:#5  0xf019d4eb in syscall (frame={tf_es = 39, tf_ds = 39, tf_edi =\
    69: 2158592, tf_esi = 0, tf_ebp = -272638436, tf_isp = -272629788, tf\
    70:_ebx = 7086, tf_edx = 1, tf_ecx = 0, tf_eax = 5, tf_trapno = 582, \
    71:tf_err = 582, tf_eip = 75749, tf_cs = 31, tf_eflags = 582, tf_esp \
    72:= -272638456, tf_ss = 39}) (../../i386/i386/trap.c line 673)
    73:673             error = (*callp->sy_call)(p, args, rval);
    74:(kgdb) up
    75:Initial frame selected; you cannot go up.
    76:(kgdb) quit

Kommentare zum Skript oben:

.. raw:: html

   <div class="variablelist">

Zeile 6:
    Dies ist ein Speicherauszug, der innerhalb von DDB genommen wurde
    (siehe unten), deswegen der Kommentar zur Panic „because you said
    to!“ und die eher lange Stack-Ablaufverfolgung (Stack-Trace); der
    anf?ngliche Grund f?r das Starten von DDB war jedoch ein
    Seitenfehler-Trap (Page-Fault-Trap).

Zeile 20:
    Dies ist die Position der Funktion ``trap()`` in der
    Stack-Ablaufverfolgung.

Zeile 36:
    Erzwingt die Benutzung eines neuen Stack-Frames; dies ist nicht mehr
    notwendig. Die Stack-Frames sollen jetzt an die richtige Stelle im
    Speicher zeigen, selbst im Falle eines Traps. Nach einem Blick auf
    den Code in Zeile 403 ergibt sich mit hoher Wahrscheinlichkeit, dass
    entweder der Zeigerzugriff auf „tp“ fehlerbehaftet oder der
    Array-Zugriff unerlaubt war.

Zeile 52:
    Der Zeiger scheint verd?chtig, aber besitzt zuf?llig eine g?ltige
    Adresse.

Zeile 56:
    Jedoch zeigt er offensichtlich auf nichts und so haben wir unseren
    Fehler gefunden! (F?r diejenigen, die nichts mit diesem speziellen
    St?ck Code anfangen k?nnen: ``tp->t_line`` verweist hier auf das
    Zeilenverhalten (Line-Discipline) des Konsolen-Ger?ts, was eine
    ziemlich kleine Ganzzahl (Integer) sein muss.)

.. raw:: html

   </div>

.. raw:: html

   <div class="tip" xmlns="">

Tipp:
~~~~~

Falls Ihr System regelm??ig abst?rzt und und Sie bald keinen freien
Speicherplatz mehr zur Verf?gung haben, k?nnte das L?schen alter
``vmcore``-Dateien in ``/var/core`` einen betr?chtlichen Betrag an
Speicherplatz einsparen.

.. raw:: html

   </div>

.. raw:: html

   </div>

.. raw:: html

   <div class="navfooter">

--------------

+-----------------------------------+------------------------------------+-------------------------------------------------------------------------+
| `Zur?ck <kerneldebug.html>`__?    | `Nach oben <kerneldebug.html>`__   | ?\ `Weiter <kerneldebug-ddd.html>`__                                    |
+-----------------------------------+------------------------------------+-------------------------------------------------------------------------+
| Kapitel 10. Kernel-Fehlersuche?   | `Zum Anfang <index.html>`__        | ?10.3. Fehlersuche in einem Speicherauszug nach einem Absturz mit DDD   |
+-----------------------------------+------------------------------------+-------------------------------------------------------------------------+

.. raw:: html

   </div>

| Wenn Sie Fragen zu FreeBSD haben, schicken Sie eine E-Mail an
  <de-bsd-questions@de.FreeBSD.org\ >.
|  Wenn Sie Fragen zu dieser Dokumentation haben, schicken Sie eine
  E-Mail an <de-bsd-translators@de.FreeBSD.org\ >.
