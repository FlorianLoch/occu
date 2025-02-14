#!/bin/tclsh
proc option {type} {

# die Einheiten werden in der Datei easymodes/EnterFreeValue gesetzt

  upvar #0 unit_hour h
  upvar #0 unit_min m
  upvar #0 unit_sec s
  upvar #0 unit_day d
  upvar #0 unit_perc p
  upvar #0 free_value Wert
  upvar options options
  array_clear options
  
  
  switch $type {

    "TIMEBASE_SHORT" {
        set options(0)    "100mS"
        set options(1)    "$s"
        set options(2)    "$m"
        set options(3)    "$h"

    }

    "TIMEBASE_LONG" {
      set options(0) "100mS"
      set options(1) "1$s"
      set options(2) "5$s"
      set options(3) "10$s"
      set options(4) "1$m"
      set options(5) "5$m"
      set options(6) "10$m"
      set options(7) "1$h"
     }

    "TIMEBASE_LONG_WITH_DAY" {
      set options(0) "1$s"
      set options(1) "5$s"
      set options(2) "10$s"
      set options(3) "1$m"
      set options(4) "5$m"
      set options(5) "10$m"
      set options(6) "1$h"
      set options(7) "1$d"
     }

    "DELAY" {
        set options(0)    "\${none}"
        set options(5)    "5$s"
        set options(10)    "10$s"
        set options(30)    "30$s"
        set options(60)    "1$m"
        set options(120)  "2$m"
        set options(300)  "5$m"
        set options(600)  "10$m"
        set options(1800)  "30$m"
        set options(3600)  "1$h"
        set options(99999999)  "\${enterValue}"
    }
 
    "LENGTH_OF_STAY" {
        set options(1)    "1$s"
        set options(2)    "2$s"
        set options(5)    "5$s"
        set options(10)    "10$s"
        set options(30)    "30$s"
        set options(60)    "1$m"
        set options(120)  "2$m"
        set options(300)  "5$m"
        set options(600)  "10$m"
        set options(1800)  "30$m"
        set options(3600)  "1$h"
        set options(7200)  "2$h"
        set options(10800)  "3$h"
        set options(18000)  "5$h"
        set options(28800)  "8$h"
        set options(43200)  "12$h"
        set options(86400)  "24$h"
        set options(111600)  "\${unlimited}"
        set options(99999999)  "\${enterValue}"
    }
    
    "STAIRCASE"  {
        set options(60)  "1$m"
        set options(120)  "2$m"
        set options(300)  "5$m"
        set options(600)  "10$m"
        set options(1200)  "20$m"
        set options(1800)  "30$m"
        set options(99999999)  "\${enterValue}"
    }

    "BLIND_LEVEL" {
        set options(0.0) "0$p"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"
    }

    "BLIND_LEVEL_2" {
        set options(0.0) "0$p"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"
        set options(1.01) "\${lblIgnore}"
    }

    "DIM_ONLEVEL" {
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"
        set options(1.005) "\${lastValue}"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_LEVELwoLastValue" {
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_OFFLEVEL" {
        set options(0.0) "0$p"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.005) "\${lastValue}"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_OFFLEVELwoLastValue" {
        set options(0.0) "0$p"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_STEP" {
        set options(0.05) "5$p"
        set options(0.10) "10$p"
        set options(0.20) "20$p"
        set options(0.30) "30$p"
        set options(0.40) "40$p"
        set options(0.50) "50$p"
        set options(0.60) "60$p"
        set options(0.70) "70$p"
        set options(0.80) "80$p"
        set options(0.90) "90$p"
        set options(1.005) "\${lastValue}"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_STEPwoLastValue_5-90" {
        set options(0.05) "5$p"
        set options(0.10) "10$p"
        set options(0.20) "20$p"
        set options(0.30) "30$p"
        set options(0.40) "40$p"
        set options(0.50) "50$p"
        set options(0.60) "60$p"
        set options(0.70) "70$p"
        set options(0.80) "80$p"
        set options(0.90) "90$p"
        set options(99999998)  "\${enterValue}"
    }

    "DIM_STEPwoLastValue_5-100" {
        set options(0.05) "5$p"
        set options(0.10) "10$p"
        set options(0.20) "20$p"
        set options(0.30) "30$p"
        set options(0.40) "40$p"
        set options(0.50) "50$p"
        set options(0.60) "60$p"
        set options(0.70) "70$p"
        set options(0.80) "80$p"
        set options(0.90) "90$p"
        set options(1.00) "100$p"
        set options(99999998)  "\${enterValue}"
    }

    "COLOR_TEMPERATURE_STEP" {
        set options(10) "10 K"
        set options(50) "50 K"
        set options(100) "100 K"
        set options(200) "200 K"
        set options(300) "300 K"
        set options(400) "400 K"
        set options(500) "500 K"
        set options(1000) "1000 K"
        set options(2000) "2000 K"
        set options(99999990)  "\${enterValue}"
    }

    "HUE_STEP" {
        set options(5) "5"
        set options(10) "10"
        set options(20) "20"
        set options(30) "30"
        set options(40) "40"
        set options(50) "50"
        set options(60) "60"
        set options(99999990)  "\${enterValue}"
    }

    "RAW_0_100Percent" {
        set options(0) "0$p"
        set options(10) "10$p"
        set options(20) "20$p"
        set options(30) "30$p"
        set options(40) "40$p"
        set options(50) "50$p"
        set options(60) "60$p"
        set options(70) "70$p"
        set options(80) "80$p"
        set options(90) "90$p"
        set options(100) "100$p"
    }

    "RAW_0_100Percent_1" {
        set options(0) "0$p"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"
    }

    "RAW_0_100Percent_2" {
        set options(0) "0$p"
        set options(10) "10$p"
        set options(20) "20$p"
        set options(30) "30$p"
        set options(40) "40$p"
        set options(50) "50$p"
        set options(60) "60$p"
        set options(70) "70$p"
        set options(80) "80$p"
        set options(90) "90$p"
        set options(100) "100$p"
        set options(101) "\${lblIgnore}"
    }

    "ON_MIN_LEVEL_10_25Percent" {
        set options(0) "\${inactive}"
        set options(0.1) "10$p"
        set options(0.11) "11$p"
        set options(0.12) "12$p"
        set options(0.13) "13$p"
        set options(0.14) "14$p"
        set options(0.15) "15$p"
        set options(0.16) "16$p"
        set options(0.17) "17$p"
        set options(0.18) "18$p"
        set options(0.19) "19$p"
        set options(0.20) "20$p"
        set options(0.21) "21$p"
        set options(0.22) "22$p"
        set options(0.23) "23$p"
        set options(0.24) "24$p"
        set options(0.25) "25$p"
    }

    "RAMPTIME" {
        set options(0)    "\${none}"
        set options(0.2)  "0.2$s"
        set options(0.5)  "0.5$s"
        set options(1)    "1$s"
        set options(2)    "2$s"
        set options(5)    "5$s"
        set options(10)    "10$s"
        set options(20)    "20$s"
        set options(30)    "30$s"
        set options(99999999)  "\${enterValue}"
    }
  
    "BLINK" {
        set options(0.1)  "0.1$s"
        set options(0.5)  "0.5$s"
        set options(1)    "1$s"
        set options(2)    "2$s"
        set options(5)    "5$s"
        set options(99999999)  "\${enterValue}"
    }
    
    "WINDOW_OPEN_LEVEL" {
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"    
    }

    "WINDOW_OPEN_LEVEL_FREEVAL" {
        set options(99999998)  "\${enterValue}"
    }
    
    "WINDOW_RUNNING_SPEED" {
        set options(0.0) "\${minimal}"
        set options(0.1) "10$p"
        set options(0.2) "20$p"
        set options(0.3) "30$p"
        set options(0.4) "40$p"
        set options(0.5) "50$p"
        set options(0.6) "60$p"
        set options(0.7) "70$p"
        set options(0.8) "80$p"
        set options(0.9) "90$p"
        set options(1.0) "100$p"    
    }
    
    "WINDOW_OPEN_TIME"  {
        set options(600)  "10$m"
        set options(1200)  "20$m"
        set options(1800)  "30$m"
        set options(3600)  "1$h"
        set options(111600)  "\${unlimited}"
        set options(99999999)  "\${enterValue}"
    }
    
    "DOOR_LOCK_TIME" {
        set options(111600)    "\${inactive}"
        set options(60)      "\${after} 1$m"
        set options(180)    "\${after} 3$m"
        set options(300)    "\${after} 5$m"
        set options(600)    "\${after} 10$m"
        set options(900)    "\${after} 15$m"
        set options(3600)    "\${after} 1$h"
        set options(99999999)  "\${enterValue}"
    }

    "LOGIC_COMBINATION" {
      set options(0) "\${stringTableLogicInactive}"
      set options(1) "\${stringTableLogicOR}"
      set options(2) "\${stringTableLogicAND}"
      set options(3) "\${stringTableLogicXOR}"
      set options(4) "\${stringTableLogicNOR}"
      set options(5) "\${stringTableLogicNAND}"
      set options(6) "\${stringTableLogicORINVERS}"
      set options(7) "\${stringTableLogicANDINVERS}"
      set options(8) "\${stringTableLogicPLUS}"
      set options(9) "\${stringTableLogicMINUS}"
      set options(10) "\${stringTableLogicMUL}"
      set options(11) "\${stringTableLogicPLUSINVERS}"
      set options(12) "\${stringTableLogicMINUSINVERS}"
      set options(13) "\${stringTableLogicMULINVERS}"
      set options(14) "\${stringTableLogicINVERSPLUS}"
      set options(15) "\${stringTableLogicINVERSMINUS}"
      set options(16) "\${stringTableLogicINVERSMUL}"
    }

    "LOGIC_COMBINATION_SWITCH" {
      set options(1) "\${stringTableLogicSwitchOR}"
      set options(2) "\${stringTableLogicSwitchAND}"
      set options(3) "\${stringTableLogicSwitchXOR}"
      set options(4) "\${stringTableLogicSwitchNOR}"
      set options(5) "\${stringTableLogicSwitchNAND}"
      set options(6) "\${stringTableLogicSwitchORINVERS}"
      set options(7) "\${stringTableLogicSwitchANDINVERS}"
    }

    "LOGIC_COMBINATION_NO_AND_OR" {
      set options(0) "\${stringTableLogicInactive}"
      set options(1) "\${stringTableLogicOR}"
      set options(2) "\${stringTableLogicAND}"
    }

    "POWERUP_JUMPTARGET" {
      set options(1) "\${stringTableOnDelay}"
      set options(2) "\${stringTableStateTrue}"
      set options(3) "\${stringTableOffDelay}"
      #set options(0) "\${stringTableStateFalse}"
    }

    "POWERUP_JUMPTARGET_HMIP" {
      set options(0) "\${stringTableStateFalse}"
      set options(1) "\${stringTableOnDelay}"
      set options(2) "\${stringTableStateTrue}"
      #set options(3) "\${stringTableOffDelay}"
    }


    "POWERUP_JUMPTARGET_OnOff" {
      set options(0) "\${stringTableStateFalse}"
      set options(1) "\${stringTableOnDelay}"
      set options(2) "\${stringTableStateTrue}"
      set options(3) "\${stringTableOffDelay}"
    }

    "POWERUP_JUMPTARGET_BLIND_OnOff" {
      set options(0) "\${stringTableBlindLevelOff}"
      set options(1) "\${stringTableBlindLevelOnDelay}"
      set options(2) "\${stringTableBlindLevelOn}"
      set options(3) "\${stringTableBlindLevelOffDelay}"
    }

    "POWERUP_JUMPTARGET_WINDOW_DRIVE_RECEIVER_OnOff" {
      set options(0) "\${optionWindowDriveLevelOff}"
      # set options(1) "\${optionWindowDriveLevelOnDelay}" ; not necessary
      set options(2) "\${optionWindowDriveLevelOn}"
      # set options(3) "\${optionWindowDriveLevelOffDelay}" ; not necessary
    }

    "POWERUP_JUMPTARGET_wo_ONDELAY" {
      set options(0) "\${stringTableStateFalse}"
      set options(2) "\${stringTableStateTrue}"
    }

    "SHORT_LONG" {
      set options(1) "\${short}"
      set options(2) "\${long}"
    }

    "CURRENTDETECTION_BEHAVIOR" {
      set options(0) "\${currentDetectionActive}"; # because not in use not yet translated
      set options(1) "\${currentDetectionInactiveValueOutput1}"; #because not in use not yet translated
      set options(2) "\${currentDetectionInactiveValueOutput1}"; #because not in use not yet translated
    }

    "HEATING_LOAD_TYPE" {
     set options(0) "\${optionLoadBalancing}"
     set options(1) "\${optionLoadCollection}"
    }

    "HEATING_PUMP_CONTROL" {
     set options(0) "\${optionLocalPumpControl}"
     set options(1) "\${optionGlobalPumpControl}"
    }

    "NORMALLY_CLOSE_OPEN" {
     set options(0) "\${optionNormallyClose}"
     set options(1) "\${optionNormallyOpen}"
    }

    "NORMALLY_OPEN_CLOSE" {
     set options(0) "\${optionNormallyOpen}"
     set options(1) "\${optionNormallyClose}"
    }

    "MIOB_DIN_CONFIG" {
      set options(0) "\${channelModeChangeOver}"
      set options(1) "\${channelModeTemperatureLimiter}"
      set options(2) "\${channelModeExternalClock}"
      set options(3) "\${channelModeHumidityLimiter}"
      set options(4) "\${channelModeTactileSwitch}"
    }

    "HEATING_MODE_SELECTION" {
      set options(0) "\${optionStandardRoom}"
      set options(1) "\${optionRoomWithFirePlace}"
      set options(2) "\${optionRoomWithTowelRail}"
    }

    "FLOOR_HEATING_MODE" {
      set options(0) "\${optionFloorHeatingStandard}"
      set options(1) "\${optionFloorHeatingLowEnergy}"
      set options(2) "\${optionRadiator}"
      set options(3) "\${optionConvectorPassiv}"
      set options(4) "\${optionConvectorActive}"
    }

    "OPTION_DISABLE_ENABLE" {
      set options(0) "\${optionDisable}"
      set options(1) "\${optionEnable}"
    }

    "DOOR_LOCK_ANGLE_RANGE" {
      set options(0) "0�..135�"
      set options(1) "45�..180�"
      set options(2) "90�..225�"
      set options(3) "135�..270�"
      set options(4) "180�..315�"
      set options(5) "225�..360�"
      set options(6) "1 + 0�..135�"
      set options(7) "1 + 45�..180�"
      set options(8) "1 + 90�..225�"
      set options(9) "1 + 135�..270�"
      set options(10) "1 + 180�..315�"
      set options(11) "1 + 225�..360�"
      set options(12) "2 + 0�..135�"
      set options(13) "2 + 45�..180�"
      set options(14) "2 + 90�..225�"
      set options(15) "2 + 135�..270�"
    }

  }
}

proc garageDoorExtension {} {
  upvar options options
  upvar #0 unit_sec s
  set options(0.4) "0.4$s"
}