## Editar
    nano /etc/lilo.conf
    nano /etc/fstab
    nano /etc/inittab
    nano /etc/profile.d/lang.sh
    nano /etc/profile.d/lang.csh
    nano /etc/acpi/acpi_handler.sh

## Remove autostart
    /etc/xdg/autostart

    /usr/share/autostart/

    nano /home/j/.config/akonadi/akonadiserverrc
    StartServer=true > StartServer=false

## Desabilitar hibernação e dormir no kdesu (Hibernation)
    kdesu kwrite /usr/share/polkit-1/actions/org.freedesktop.upower.policy
    <allow_active>yes</allow_active> yes >> no

## rc.local
echo "/usr/bin/boot_rcLocal_JBs.sh" >> /etc/rc.d/rc.local

    ####################### boot_rcLocal_JBs.sh #######################
    ## Set brightness in 1%
        #echo 0 > /sys/class/backlight/acpi_video0/brightness
        ## or
        #echo 50 > /sys/class/backlight/intel_backlight/brightness
        ## or
        usual_JBs.sh brigh-1

    ## Set unicode
        unicode_start

    ## Set CPU performance. See the actual governor #cpufreq-info
    ## http://docs.slackware.com/howtos:hardware:cpu_frequency_scaling
        # See the count of CPU you have #cpufreq-info | grep "analyzing CPU"
        cpufreq-set --cpu 0 --governor performance
        cpufreq-set --cpu 1 --governor performance
        cpufreq-set --cpu 2 --governor performance
        cpufreq-set --cpu 3 --governor performance

    ## Set brightness >= %1
        /usr/bin/brightness_min_set_JBs.sh &

    ## Print message by time
        echo -e "\n\n"
        echo -e "\t------------------"
        echo -e "\t| Happy Day :-)! |"
        echo -e "\t------------------"

        hm=`date +%H%M`
        hm=900
        if [ $hm -lt 0601 ]; then
            echo -e "\t| Boa Madrugada! |"
        elif [ $hm -lt 1201 ]; then
            echo -e "\t| Bom dia!       |"
        elif [ $hm -lt 18001 ]; then
            echo -e "\t| Boa tarde!     |"
        else
            echo -e "\t| Boa noite!     |"
        fi
        echo -e "\t------------------\n"
        echo -e "\t `date`\n\n"
    ####################### boot_rcLocal_JBs.sh #######################

## Kernel Generic
    link: https://www.vivaolinux.com.br/artigo/Guia-pos-instalacao-do-Slackware/?pagina=2
        #/usr/share/mkinitrd/mkinitrd_command_generator.sh

    /usr/share/mkinitrd/mkinitrd_command_generator.sh | grep mkinitrd | grep -v command | /bin/bash

    /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic-* >> /etc/lilo.conf

    nano /etc/lilo.conf
    lilo

## Touchpad de apenas uma parte/peça
    nano /etc/X11/xorg.conf

Section "InputClass"
Identifier "Clickpad buttons"
MatchDriver "synaptics"
Option "SoftButtonAreas" "50% 0 82% 0 0 0 0 0"
EndSection

## Dolphin disable executable shellscript, perl, ruby, pyton
    kdesu kwrite /usr/share/mime/packages/freedesktop.org.xml

    ## Look for the lines and comment
        <sub-class-of type="application/x-executable"/> to <!-- <sub-class-of type="application/x-executable"/> --> # "
        <sub-class-of type='application/x-executable'/> to <!-- <sub-class-of type='application/x-executable'/> --> # '

        update-mime-database /usr/share/mime

    ## If unknown (Unknown media type in type ...)
    rm /usr/share/mime/packages/kde.xml
    update-mime-database /usr/share/mime

## Remove keyboard shortcut "Plasma Desktop Shell: Stop Current Activity"
    Is assigned meta (windows) + S
    System Settings > Shortcuts and Gestures > Global Keyboard Shortcuts
    Select "Plasma Desktop Shell" in KDE component,
    and in Action Remove the shortcut to "Stop Current Activity"

## Instalar
    slackpkg install flash-player-plugin p7zip unrar chrome

    slackpkg install icedtea-web libreoffice-5.* libreoffice-dict-en libreoffice-dict-pt-BR libreoffice-l10n-pt_BR libreoffice-kde-integration

    ## Instalar cogroo e alterar idioma

## Local
    bleachbit dropbox virtualbox comix qpdf R redshift smplayer vlc openjdk
    # convmv pdftk pv

## Upgrade
  mozilla-firefox

## Latex
    ## Remove tetex and tetex-doc
        slackpkg remove tetex

    ## If will install the txz texlive
        ## Install libsigsegv texi2html
        ## Install texlive local

    ## Remove the last texlive (latex) version (if has one)
        tlmgr uninstall

        ## Delete de older folder
            cd /usr/local
            rm -r texlive

    ## Download and install by the ISO file
        https://www.tug.org/texlive/acquire-iso.html

    ## Mount dvd to install
        mount texlive*.iso /media/dvd/
        /media/dvd/install-tl
            ## Set A4 paper and symlinks on directory

    ## If the command latex is "not found"
        ## Added in .bashrc (look the year/version)
        export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux

    ## Update packets
        tlmgr update --self
        tlmgr update --all

    ## Change mirror and correct some errors
        tlmgr update --self --all

    ## To install one package
        tlmgr install package

## Remover games
    slackpkg remove kdetoys palapeli bomber granatier kblocks ksnakeduel kbounce kbreakout kgoldrunner kspaceduel kapman kolf kollision kpat lskat blinken khangman pairs ktuberling kdiamond ksudoku kubrick picmi bovo kblackbox kfourinline kmahjongg kreversi ksquares kigo kiriki kshisen gnuchess katomic kjumpingcube kmines knetwalk killbots klickety klines konquest ksirk knavalbattle kanagram amor kajongg

## Remover servidor x
    ## Remove all another X (leave KDE and XFCE)
        slackpkg remove twm blackbox fluxbox windowmaker fvwm

    ## Leave fluxbox # Safe propose
        slackpkg remove twm blackbox windowmaker fvwm

    ## Set one by be the default
        xwmconfig

## Remover kopote
    slackpkg remove kdenetwork kdenetwork-filesharing kdenetwork-strigi-analyzers kopete

## Remove nepomuk
    slackpkg remove nepomuk nepomuk-core nepomuk-widgets

## Remove akonadi
    slackpkg remove akonadi

## Remove gnome "packages"
    slackpkg remove gcr polkit-gnome gnome-themes gnome-keyring libgnome-keyring

## Outros
    slackpkg remove seamonkey pidgin xchat dragon thunderbird kplayer calligra bluedevil blueman bluez bluez-firmware bluez-hcidump phonon-xine xine-lib xine-ui vim-gvim vim sendmail sendmail-cf xpdf tetex tetex-doc kget

    ## Dolphin need baloo baloo-widgets

## Swap em arquivo
    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=8192 # 8 GiB = 8192

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=6144 # 6 GiB = 6144

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=4096 # 4 GiB = 4096

    dd if=/dev/zero of=/home/j/swapfile.img bs=1M count=2048 # 2 GiB = 2048

    mkswap /home/j/swapfile.img
    nano /etc/fstab

/home/j/swapfile.img swap         swap        defaults         0   0

    swapon -a

    ## warnings
    chmod 0600 /home/j/swapfile.img
    chown root /home/j/swapfile.img

## Ver valor de swappiness atual
    cat /proc/sys/vm/swappiness

    ## To temporarily set the swappiness value
    sysctl -w vm.swappiness=10

    ## To set the swappiness value permanently, edit a sysctl configuration file
    nano /etc/sysctl.conf
    ## Adicionar no arquivo -> vm.swappiness=10
    carregar o configuração padrão/permanente
    sysctl –p

## Move windows between Desktop
    # Add 4 Desktop

    System Settings > Shortcuts and Gestures >  Global Keyboard Shortcuts
    Selecting "KWin"
    Search for "one"

    Switch One Desktop Down         ## Ctrl + Alt + Down
    Switch One Desktop to the Left  ## Ctrl + Alt + Left
    Switch One Desktop to the Right ## Ctrl + Alt + Right
    Switch One Desktop Up           ## Ctrl + Alt + Up

    Window One Desktop Down         ## Ctrl + Alt + Shift + Down
    Window One Desktop to the Left  ## Ctrl + Alt + Shift + Left
    Window One Desktop to the Right ## Ctrl + Alt + Shift + Right
    Window One Desktop Up           ## Ctrl + Alt + Shift + Up

## Blacklist (slackpkg)
    nano /etc/slackpkg/blacklist
#
ffmpeg
kdenlive
ladspa_sdk
libquicktime
libwebp
mkvtoolnix
orc
schroedinger
smplayer
swfdec
wxPython
x264
xerces-c
bleachbit
#glib2
#xf86-video-intel
#glib
#

## slackpkgplus.config
nano /etc/slackpkg/slackpkgplus.conf

# Slackware 14.1 - x86_64
#MIRRORPLUS['multilib']=http://taper.alienbase.nl/mirrors/people/alien/multilib/14.1/
#MIRRORPLUS['alienbob']=http://taper.alienbase.nl/mirrors/people/alien/sbrepos/14.1/x86_64/
MIRRORPLUS['alienbob']=http://slackware.uk/people/alien/sbrepos/14.1/x86_64/
#MIRRORPLUS['restricted']=http://taper.alienbase.nl/mirrors/people/alien/restricted_sbrepos/14.1/x86_64/
MIRRORPLUS['restricted']=http://slackware.uk/people/alien/restricted_sbrepos/14.1/x86_64/
#MIRRORPLUS['slacky']=http://repository.slacky.eu/slackware64-14.1/
MIRRORPLUS['rlworkman']=http://rlworkman.net/pkgs/14.1/x86_64/
#
