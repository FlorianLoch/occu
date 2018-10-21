##
# Firwall.setConfiguration
# Setzt die Konfiguration der Firewall. Diese wird sofort �bernommen.
#
# Parameter:
#  services: [array] Enth�lt die ge�nderten Zugriffsrechte der einzelnen Services.
#                    Jedes Element ist ein Object mit den folgenden Feldern:
#                    id    : [string] Id des Services
#                    access: [string] Zugriffsberechtigung
#                                     ("full", "restricted", "none")
#  ips: [array] Liste der IP-Adressen und IP-Adressgruppen f�r eingeschr�nkte 
#               Berechtigung. Jedes Element ist eine Zeichenkette.
#  userports:   [array] Enth�lt benutzerdefinierte Ports zwecks Firewall Freigabe
#  mode:		[string] Firewall Modus ("MOST_OPEN", "RESTRICTIVE") 
#
# R�ckgabewert: [bool]
#  true
##

source /lib/libfirewall.tcl

set services $args(services)
set ips      $args(ips)
set userports $args(userports)
set mode $args(mode)

Firewall_loadConfiguration

set Firewall_IPS $ips
set Firewall_USER_PORTS $userports

Firewall_setMode $mode

foreach _service $services {
  array set service $_service
  
  set name   $service(name)
  set access $service(access)
  
  if { [info exists Firewall_SERVICES($name)] } then {
    array set knownService  $Firewall_SERVICES($name)
    set knownService(ACCESS) $access
    set Firewall_SERVICES($name) [array get knownService]
    array_clear knownService
  }
  
  array_clear service
}

Firewall_saveConfiguration
Firewall_configureFirewall 

jsonrpc_response true
