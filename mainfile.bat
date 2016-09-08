REM Created by Dietbrand
REM 30/08/2014
REM dumps list of databases into file
REM This will only dump if the Windows user performing this file is known as a DBA in MS SQL (mixed auth)
bcp "SELECT name FROM master..sysdatabases WHERE name NOT IN ('master','tempdb', 'model', 'msdb')" queryout databases.list -T -c -t,

REM Use winscp.com to connect to external Linux server
REM This command uses a private key without a passphrase.
REM This is obviously insecure so do NOT use this except combined with a lowlevel jailed user
winscp.com /command ^
 "option batch abort" ^
 "option reconnecttime off" ^
 "option confirm off" ^
 "open scp://someuser@hostname:22 -privatekey=<drive>/path/to/privatekey.ppk -rawsettings SendBuf=0 Compression=0 -timeout=10" ^
 "cd /home/someuser"^
 "put databases.list"^
 "exit"
