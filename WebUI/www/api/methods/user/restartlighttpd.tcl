##
# User.restartLighttpd
# Restartet den Lighttpd Webserver
#
# Parameter:
#   keine
#
# R�ckgabewert: true

exec -- /usr/bin/nohup /etc/init.d/S50lighttpd restart >/dev/null

#exec /etc/init.d/S50lighttpd restart

jsonrpc_response true
