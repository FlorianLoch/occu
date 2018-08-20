##
# User.getReGaVersion
# Ermittelt die gew�hlte ReGaVersion
#
# Parameter: kein
#
# R�ckgabewert: Gew�hlte ReGaVersion
##

 set defaultVersion "COMMUNITY"

 if {[catch {set fp [open "/etc/config/ReGaHssVersion" r]}] == 0} {
   set data [read $fp]
   set version [split $data "\n"]
   close $fp
 } else {
   set version $defaultVersion
 }

 set version [lindex $version 0]

 if {[string equal $version LEGACY]} {
   set version $defaultVersion
 }

 jsonrpc_response [json_toString $version]
