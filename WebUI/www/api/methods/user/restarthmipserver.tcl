##
# User.restartHmIPServer
# Restartet den Lighttpd Webserver
#
# Parameter:
#   keine
#
# R�ckgabewert: true

exec /etc/init.d/S62HMServer start

jsonrpc_response true