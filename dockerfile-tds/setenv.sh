#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/default-java
export JAVA_OPTS="-Xmx4096m -Xms512m -server -Djava.awt.headless=true -Djava.util.prefs.systemRoot=$CATALINA_BASE/content/thredds/javaUtilPrefs"
export CATALINE_BASE="/usr/local/$TCSRC"
