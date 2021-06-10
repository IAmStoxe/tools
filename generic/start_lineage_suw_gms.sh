#!/bin/bash

device="${!1}"

adb -s ${device} root
wait ${!}
adb -s ${device} shell pm enable com.google.android.setupwizard || true
wait ${!}
if adb -s ${device} shell pm list packages | grep com.android.provision; then
  adb -s ${device} shell pm disable com.android.provision || true
  wait ${!}
fi
adb -s ${device} shell am start org.lineageos.setupwizard/org.lineageos.setupwizard.SetupWizardTestActivity
wait ${!}
sleep 1
adb -s ${device} shell am start com.google.android.setupwizard/com.google.android.setupwizard.SetupWizardTestActivity
