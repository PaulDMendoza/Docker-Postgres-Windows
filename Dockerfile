FROM microsoft/windowsservercore
MAINTAINER Paul Mendoza
RUN powershell.exe -Command \
  $ErrorActionPreference = 'Stop'; \
  (New-Object System.Net.WebClient).DownloadFile('https://get.enterprisedb.com/postgresql/postgresql-9.6.4-1-windows-x64.exe','c:\postgresql-installer.exe') ; \
  Start-Process c:\postgresql-installer.exe -ArgumentList '--mode unattended --superpassword password' -Wait ; \
  Remove-Item c:\postgresql-installer.exe -Force

COPY ["pg_hba.conf", "c:/program files/postgresql/9.6/data/"]

RUN ["cmd"]