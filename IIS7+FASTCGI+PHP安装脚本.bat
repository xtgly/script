@echo off

start /w pkgmgr /iu:IIS-WebServerRole;IIS-WebServer;IIS-CommonHttpFeatures;IIS-StaticContent;IIS-DefaultDocument;IIS-DirectoryBrowsing;IIS-HttpErrors;IIS-HttpRedirect;IIS-ApplicationDevelopment;IIS-ASPNET;IIS-NetFxExtensibility;IIS-ASP;IIS-CGI;IIS-ISAPIExtensions;IIS-ISAPIFilter;IIS-ServerSideIncludes;IIS-HealthAndDiagnostics;IIS-HttpLogging;IIS-LoggingLibraries;IIS-RequestMonitor;IIS-HttpTracing;IIS-CustomLogging;IIS-ODBCLogging;IIS-Security;IIS-BasicAuthentication;IIS-WindowsAuthentication;IIS-DigestAuthentication;IIS-ClientCertificateMappingAuthentication;IIS-IISCertificateMappingAuthentication;IIS-URLAuthorization;IIS-RequestFiltering;IIS-IPSecurity;IIS-Performance;IIS-HttpCompressionStatic;IIS-HttpCompressionDynamic;IIS-WebServerManagementTools;IIS-ManagementConsole;IIS-ManagementScriptingTools;IIS-ManagementService;IIS-IIS6ManagementCompatibility;IIS-Metabase;IIS-WMICompatibility;IIS-LegacyScripts;IIS-LegacySnapIn;IIS-FTPPublishingService;IIS-FTPServer;IIS-FTPManagement;WAS-WindowsActivationService;WAS-ProcessModel;WAS-NetFxEnvironment;WAS-ConfigurationAPI

REG DELETE "HKLM\Software\PHP" /f
reg delete "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment" /v PHPRC /f

echo y|cacls "D:\local\php"  /E /T /G USERS:R
echo y|cacls "D:\local\php\temp"  /E /T /G everyone:F

cd /d %windir%\system32\inetsrv  

appcmd set config /section:handlers /+[name='PHP',path='*.php',verb='GET,POST',scriptProcessor='D:\local\php\php-cgi.exe',modules='FastCgiModule']

appcmd set config /section:isapiCgiRestriction /+"[path='D:\local\php\php-cgi.exe',description='PHP',allowed='True']"

appcmd set config -section:asp -enableParentPaths:true

appcmd add site /name:phpMyAdmin /id:99 /physicalPath:D:\local\php\phpMyAdmin /bindings:http/*:8081: 


appcmd list apppool /xml | appcmd set apppool /in /enable32BitAppOnWin64:true 