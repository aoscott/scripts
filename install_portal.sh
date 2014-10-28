#! /bin/bash
# Shell script to upgrade PORTAL on various box types

HOST_NAME=`/bin/hostname -s | sed 's/\([^0-9]*\)[0-9]*/\1/'`
PKGS_TO_INSTALL=""

case $HOST_NAME in
        grcweb|pfo|pps )
                echo "I'm a Portal FO/PPS box"
                HOST_TYPE='PORTAL-FRONT'
                echo -n "Do you want to install PORTAL-HELP? (y/n) "
                read INSTALL_HELP
                if [ "$INSTALL_HELP" == "y" ]; then
                        echo -n "What version of PORTAL-HELP to install (1.4.19-1)? "
                        read HELP_PACKAGE_VER
                        PKGS_TO_INSTALL="$PKGS_TO_INSTALL PORTAL-HELP-${HELP_PACKAGE_VER}"
                else
                        echo "Not installing PORTAL-HELP, moving on..."
                fi
                ;;

        pbo )
                echo "I'm a Portal BO box"
                HOST_TYPE='PORTAL-BACKOFFICE';;
        papi )
                echo "I'm a Portal API box"
                HOST_TYPE='PORTAL-API';;
        prep )
                echo "I'm a Portal Reporting box"
                HOST_TYPE='REPORTING-SERVICE';;
        * )
                echo "I don't know what box type this is, exiting."
                exit 2;;
esac

service tomcat stop
sleep 15

RUNNING=`ps -efwwH | egrep '^tomcat' | grep catalina | grep -v grep | wc -l`
if [ $RUNNING -ne 0 ]; then
        echo "Something is wrong, Tomcat didn't shut down properly, exiting..."
        exit 1
fi

LOWER_HOST_TYPE=`echo $HOST_TYPE | sed 's/\(.*\)/\L\1/'`
if [ $HOST_TYPE == PORTAL-API ] ;

then
        rm -rf /usr/local/tomcat/webapps/qps*

else
        rm -rf /usr/local/tomcat/webapps/${LOWER_HOST_TYPE}*

fi

echo -n "What version of ${HOST_TYPE} to install (1.4.19-1)? "
read PACKAGE_VER
PKGS_TO_INSTALL="$PKGS_TO_INSTALL ${HOST_TYPE}-$PACKAGE_VER"
yum clean all
yum install $PKGS_TO_INSTALL

service tomcat start
sleep 5
tail -f /var/log/tomcat/catalina.`date -u +%Y-%m-%d`.log
done
