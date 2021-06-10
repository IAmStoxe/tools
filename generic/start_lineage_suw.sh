#!/bin/bash

device="${!1}"

adb -s ${device} root
wait ${!}
if adb -s ${device} shell pm list packages | grep com.google.android.setupwizard; then
  adb -s ${device} shell pm disable com.google.android.setupwizard || true
  wait ${!}
fi
if adb -s ${device} shell pm list packages | grep com.android.provision; then
  adb -s ${device} shell pm disable com.android.provision || true
  wait ${!}
fi
adb -s ${device} shell am start org.lineageos.setupwizard/org.lineageos.setupwizard.SetupWizardTestActivity
