#!/bin/bash

device="${!1}"

adb -s ${device} root
wait ${!}
adb -s ${device} shell pm enable org.lineageos.setupwizard/org.lineageos.setupwizard.SetupWizardExitActivity || true
wait ${!}
adb -s ${device} shell pm enable com.google.android.setupwizard/com.google.android.setupwizard.SetupWizardExitActivity || true
wait ${!}
sleep 1
adb -s ${device} shell am start org.lineageos.setupwizard/org.lineageos.setupwizard.SetupWizardExitActivity || true
wait ${!}
sleep 1
adb -s ${device} shell am start com.google.android.setupwizard/com.google.android.setupwizard.SetupWizardExitActivity
