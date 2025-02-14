#!/bin/tclsh

source [file join $env(DOCUMENT_ROOT) config/easymodes/em_common.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/EnterFreeValue.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/etc/options.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/etc/hmip_helper.tcl]
source [file join $env(DOCUMENT_ROOT) config/easymodes/etc/uiElements.tcl]

set NOP 0
set RAMP_ON 1
set RAMP_OFF 2
set OPEN 3

set PROFILES_MAP(0)  "\${expert}"
set PROFILES_MAP(1)  "\${toggle}"
set PROFILES_MAP(2)  "\${switch_unlocked}"
set PROFILES_MAP(3)  "\${switch_locked}"
set PROFILES_MAP(4)  "\${switch_open}"
set PROFILES_MAP(5)  "\${weeklyProgram}"

set PROFILE_0(UI_HINT)  0
set PROFILE_0(UI_DESCRIPTION)    "Expertenprofil"
set PROFILE_0(UI_TEMPLATE)      "Expertenprofil"

set PROFILE_1(LONG_PROFILE_ACTION_TYPE) {0 1}
set PROFILE_1(SHORT_COND_VALUE_HI) 150
set PROFILE_1(SHORT_COND_VALUE_LO) 50
set PROFILE_1(SHORT_CT_OFF) 0
set PROFILE_1(SHORT_CT_ON) 0
set PROFILE_1(SHORT_JT_OFF) $RAMP_ON
set PROFILE_1(SHORT_JT_ON)  $RAMP_OFF
set PROFILE_1(SHORT_PROFILE_ACTION_TYPE) 1
set PROFILE_1(SHORT_WP_OPTIONS) 0
set PROFILE_1(UI_DESCRIPTION)  ""
set PROFILE_1(UI_TEMPLATE)    $PROFILE_1(UI_DESCRIPTION)
set PROFILE_1(UI_HINT)  1

set PROFILE_2(LONG_PROFILE_ACTION_TYPE) 0
set PROFILE_2(SHORT_COND_VALUE_HI) 150
set PROFILE_2(SHORT_COND_VALUE_LO) 50
set PROFILE_2(SHORT_CT_OFF) 0
set PROFILE_2(SHORT_CT_ON) 0
set PROFILE_2(SHORT_JT_OFF) $RAMP_ON
set PROFILE_2(SHORT_JT_ON)  $RAMP_ON
set PROFILE_2(SHORT_PROFILE_ACTION_TYPE) 1
set PROFILE_2(SHORT_WP_OPTIONS) 0
set PROFILE_2(UI_DESCRIPTION)  ""
set PROFILE_2(UI_TEMPLATE)    $PROFILE_2(UI_DESCRIPTION)
set PROFILE_2(UI_HINT)  2

set PROFILE_3(LONG_PROFILE_ACTION_TYPE) 0
set PROFILE_3(SHORT_COND_VALUE_HI) 150
set PROFILE_3(SHORT_COND_VALUE_LO) 50
set PROFILE_3(SHORT_CT_OFF) 0
set PROFILE_3(SHORT_CT_ON) 0
set PROFILE_3(SHORT_JT_OFF) $RAMP_OFF
set PROFILE_3(SHORT_JT_ON)  $RAMP_OFF
set PROFILE_3(SHORT_PROFILE_ACTION_TYPE) 1
set PROFILE_3(SHORT_WP_OPTIONS) 0
set PROFILE_3(UI_DESCRIPTION)  ""
set PROFILE_3(UI_TEMPLATE)    $PROFILE_3(UI_DESCRIPTION)
set PROFILE_3(UI_HINT) 3

set PROFILE_4(LONG_PROFILE_ACTION_TYPE) 0
set PROFILE_4(SHORT_COND_VALUE_HI) 150
set PROFILE_4(SHORT_COND_VALUE_LO) 50
set PROFILE_4(SHORT_CT_OFF) 0
set PROFILE_4(SHORT_CT_ON) 0
set PROFILE_4(SHORT_JT_OFF) $OPEN
set PROFILE_4(SHORT_JT_ON)  $OPEN
set PROFILE_4(SHORT_PROFILE_ACTION_TYPE) 1
set PROFILE_4(SHORT_WP_OPTIONS) 0
set PROFILE_4(UI_DESCRIPTION)  ""
set PROFILE_4(UI_TEMPLATE)    $PROFILE_4(UI_DESCRIPTION)
set PROFILE_4(UI_HINT) 4

set PROFILE_5(LONG_PROFILE_ACTION_TYPE) 0
set PROFILE_5(SHORT_COND_VALUE_HI) 150
set PROFILE_5(SHORT_COND_VALUE_LO) 50
set PROFILE_5(SHORT_CT_OFF) 0
set PROFILE_5(SHORT_CT_ON) 0
set PROFILE_5(SHORT_JT_OFF) 0
set PROFILE_5(SHORT_JT_ON)  0
set PROFILE_5(SHORT_PROFILE_ACTION_TYPE) 1
set PROFILE_5(SHORT_WP_OPTIONS) {0 1 2}
set PROFILE_5(UI_DESCRIPTION)  ""
set PROFILE_5(UI_TEMPLATE)    $PROFILE_5(UI_DESCRIPTION)
set PROFILE_5(UI_HINT) 5

proc set_htmlParams {iface address pps pps_descr special_input_id peer_type} {
  global iface_url sender_address receiver_address dev_descr_sender dev_descr_receiver
  upvar PROFILES_MAP  PROFILES_MAP
  upvar HTML_PARAMS   HTML_PARAMS
  upvar PROFILE_PNAME PROFILE_PNAME
  upvar $pps          ps      
  upvar $pps_descr    ps_descr

  set url $iface_url($iface)

  foreach pro [array names PROFILES_MAP] {
    upvar PROFILE_$pro PROFILE_$pro
  }

  set parentType [string tolower $dev_descr_receiver(PARENT_TYPE)]
  set cur_profile [get_cur_profile2 ps PROFILES_MAP PROFILE_TMP $peer_type]
  
#  die Texte der Platzhalter einlesen
  puts "<script type=\"text/javascript\">getLangInfo('$dev_descr_sender(TYPE)', '$dev_descr_receiver(TYPE)');</script>"
  puts "<script type=\"text/javascript\">getLangInfo_Special('HmIP_DEVICES.txt');</script>"

  set prn 0
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) [cmd_link_paramset2 $iface $address ps_descr ps "LINK" ${special_input_id}_$prn]
  append HTML_PARAMS(separate_$prn) "</textarea></div>"

  set pref 1;
  incr prn
  if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) "\${description_$prn}"

  append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"
  append HTML_PARAMS(separate_$prn) "</table></textarea></div>"
  
#2
  incr prn
  if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) "\${description_$prn}"

  append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"
  append HTML_PARAMS(separate_$prn) "</table></textarea></div>"

#3
  incr prn
  if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) "\${description_$prn}"

  append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"
  append HTML_PARAMS(separate_$prn) "</table></textarea></div>"

#4
  incr prn
  if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) "\${description_$prn}"

  append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"
  append HTML_PARAMS(separate_$prn) "</table></textarea></div>"

#5
  incr prn
  if {$cur_profile == $prn} then {array set PROFILE_$prn [array get ps]}
  append HTML_PARAMS(separate_$prn) "<div id=\"param_$prn\"><textarea id=\"profile_$prn\" style=\"display:none\">"
  append HTML_PARAMS(separate_$prn) "\${description_$prn}"

  append HTML_PARAMS(separate_$prn) "<table class=\"ProfileTbl\">"
  array_clear options
  set options(0) "\${optionIgnore}"
  set options(1) "\${optionOn}"
  set options(2) "\${optionOff}"
  append HTML_PARAMS(separate_$prn) [get_ComboBox options SHORT_WP_OPTIONS|LONG_WP_OPTIONS separate_${special_input_id}_$prn\_$pref PROFILE_$prn SHORT_WP_OPTIONS]
  append HTML_PARAMS(separate_$prn) "</td></tr>"
  append HTML_PARAMS(separate_$prn) "</table></textarea></div>"

}

constructor
