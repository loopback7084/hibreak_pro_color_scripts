#!/bin/bash

list="system/system/app/OfflineTTs
system/system/app/XRZCalendar
system/system/app/ClockProd
system/system/app/CompanionDeviceManager
system/system/app/XRZ_OuLuDict
system/system/app/AppStroe
system/system/app/FileManager
system/system/app/XDict
system/system/app/XRZWebExport
system/system/app/XRZImageExplorer
system/system/app/BookSelf
system/system/app/ScanDOC
system/system/app/GooglePrintRecommendationService
system/system/app/PrintSpooler
system/system/app/BookMall
system/system/app/xReader
system/system/app/BasicDreams
system/system/app/xCloud
system/system/app/LOGCollect
system/system/app/xReaderPro
system/system/app/ColorDict
system/system/app/WifiTransferBook
system/system/app/CaptivePortalLoginGoogle
system/system/app/xMusicNew
system/system/app/Googletts
system/system/app/BK_Input
system/system/app/XRZSoundReocrd
system/system/app/TranSlator
system/system/app/ChatGPT
system/system/priv-app/MusicFX
system/system/priv-app/BuiltInPrintService
system/system/priv-app/Tag
system/system/priv-app/LiveWallpapersPicker
system/system/priv-app/CellBroadcastLegacyApp
system/system/preinstall
system_ext/app/Nfc_st
system_ext/priv-app/EmergencyInfoGms
system_ext/priv-app/VoiceCommand
system_ext/priv-app/GeofenceService
system_ext/priv-app/VoiceUnlock
product/app/Photos
product/app/LatinImeGoogle
product/app/YTMusic
product/app/YouTube
product/app/Keep
product/app/Gmail2
product/app/Videos
product/app/GoogleContacts
product/app/Drive
product/app/talkback
product/app/CalculatorGoogle
product/app/SpeechServicesByGoogle
product/app/SwitchAccess
product/app/CalendarGoogle
product/app/Chrome64
product/app/Meet
product/app/Maps
product/priv-app/SearchSelector
product/priv-app/AndroidSystemIntelligence
product/priv-app/Velvet
product/priv-app/PersonalSafety
product/priv-app/Messages
product/priv-app/PrivateComputeServices
product/priv-app/AssistantShell
product/priv-app/Wellbeing
product/priv-app/Turbo
system_ext/priv-app/MtkDialer
system_ext/priv-app/CallRecorderService
product/priv-app/GoogleDialer
system/system/priv-app/MtkMmsService
system/system/app/xLauncher3
system/system/app/Launcher
system_ext/app/AOVTestsApp"

ignore="
./system/system/app/XrzSettings
"
### For each element in the list... remove the package or folder.
for f in $list
do
    rm -rf ./$f
done

### Copies a pre-prepared hosts file ( adblock / telemetry nerf etc ) into the system structure.
cp ./hosts.txt ./system/system/etc/hosts

### Fixup a bunch of localistation nonsense ( some of these are in binary packages ).
sed -i 's#ro.build.locale.area=http://ereader.xrztech.com:8090#ro.build.locale.area=http://localhost:8090#g' ./system/system/build.prop
sed -i 's#ro.product.locale=zh-CN#ro.product.locale=en-GB#g' ./system/system/build.prop
sed -i 's#persist.sys.timezone=Asia/Shanghai#persist.sys.timezone=Europe/London#g' ./system/system/build.prop
sed -i 's#persist.sys.country=CN#persist.sys.country=GB#g' ./system/system/build.prop
sed -i 's#persist.sys.language=zh#persist.sys.language=gb#g' ./system/system/build.prop
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/GoogleNetworkStackResOverlay/GoogleNetworkStackResOverlay.apk
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/NetworkStackInProcessResOverlay/NetworkStackInProcessResOverlay.apk
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/NetworkStackResOverlay/NetworkStackResOverlay.apk


