@echo off

rem comdnmr.bat [ script  [ arg ... ] ]
rem 
rem optional environment variables:
rem
rem JAVA_HOME  - directory of JDK/JRE, if not set then 'java' must be found on PATH
rem CLASSPATH  - colon separated list of additional jar files & class directories
rem JAVA_OPTS  - list of JVM options, e.g. "-Xmx256m -Dfoo=bar"
rem


if "%OS%" == "Windows_NT" setlocal

set comdnmrver=${project.version}
set comdnmrmain=org.comdnmr.comdnmr.chart.MainApp


set dir=%~dp0

set javaexe=java
set cp="%dir%\comdnmr-%comdnmrver%.jar;${wclasspath};%CLASSPATH%"

set testjava=%dir%jre\bin\java

if exist %testjava% (
    set javaexe="%testjava%"
    set cp="%dir%\lib\comdnmr-%comdnmrver%.jar;${wclasspath};%CLASSPATH%"
)


if "%1"=="" (
    %javaexe% -Djava.awt.headless=true -mx2048m -cp %cp% %JAVA_OPTS% %comdnmrmain%
) else (
    %javaexe% -Djava.awt.headless=true -mx2048m -cp %cp% %JAVA_OPTS% %comdnmrmain% -c "import comdnmrcalc" %*
)

