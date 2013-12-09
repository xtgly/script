@echo off

start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-HttpRedirect;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ASP;IIS-CGI;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-ServerSideIncludes;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-HttpTracing;IIS-CustomLogging;IIS-ODBCLogging;IIS-Security;IIS-BasicAuthentication;IIS-WindowsAuthentication;IIS-DigestAuthentication;IIS-ClientCertificateMappingAuthentication;IIS-IISCertificateMappingAuthentication;IIS-URLAuthorization;IIS-RequestFiltering;IIS-IPSecurity;IIS-Performance;IIS-HttpCompressionStatic;IIS-HttpCompressionDynamic;IIS-WebServerManagementTools;IIS-ManagementConsole;IIS-ManagementScriptingTools;IIS-ManagementService;IIS-IIS6ManagementCompatibility;IIS-Metabase;IIS-WMICompatibility;IIS-LegacyScripts;IIS-LegacySnapIn;IIS-FTPPublishingService;IIS-FTPServer;IIS-FTPManagement;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI

REG DELETE "HKLM\Software\PHP" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v PHPRC /f

copy /y D:\local\php\php.ini %windir%\php.ini
copy /y D:\local\php\zlib.dll %windir%\system32\zlib.dll
copy /y D:\local\php\php5ts.dll %windir%\system32\php5ts.dll
copy /y D:\local\php\libmysql.dll %windir%\system32\libmysql.dll
copy /y D:\local\php\libmcrypt.dll %windir%\system32\libmcrypt.dll
copy /y D:\local\php\libeay32.dll %windir%\system32\libeay32.dll
copy /y D:\local\php\libmhash.dll %windir%\system32\libmhash.dll
copy /y D:\local\php\libpq.dll %windir%\system32\libpq.dll
copy /y D:\local\php\ssleay32.dll %windir%\system32\ssleay32.dll
copy /y D:\local\php\ntwdblib.dll %windir%\system32\ntwdblib.dll
copy /y D:\local\php\ext\php_pdo.dll %windir%\system32\php_pdo.dll

echo y|cacls "D:\local\php"  /E /T /G USERS:R
echo y|cacls "D:\local\php\temp"  /E /T /G everyone:F
echo y|cacls "%windir%\php.ini"  /E /G USERS:R
echo y|cacls "%windir%\system32\zlib.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\php5ts.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmysql.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmcrypt.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libeay32.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libmhash.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\libpq.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\ssleay32.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\ntwdblib.dll"  /E /G USERS:R
echo y|cacls "%windir%\system32\php_pdo.dll"  /E /G USERS:R

cd /d %windir%\system32\inetsrv  

appcmd set config /section:handlers /+[name='PHP',path='*.php',verb='GET,POST',scriptProcessor='D:\local\php\php5isapi.dll',modules='IsapiModule']

appcmd set config /section:isapiCgiRestriction /+"[path='D:\local\php\php5isapi.dll',description='PHP',allowed='True']"

appcmd set config -section:asp -enableParentPaths:true

appcmd add site /name:phpMyAdmin /id:99 /physicalPath:D:\local\php\phpMyAdmin /bindings:http/*:8081: 