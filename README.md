# dnd_301_final

| Branch  |                                                                               Status                                                                               |
| ------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| Master  | [![Build Status](https://travis-ci.org/COS301-OptimizePrime/COS301-DnD.svg?branch=master)](https://travis-ci.org/COS301-OptimizePrime/COS301_DND)  |

Flutter application containing Google Login functionality.

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).

## For compling onto android device:

Pull the latest version from the login branch

Run the following command: keytool -exportcert -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore

Where %USERPROFILE% is your user directory. e.g.: C:\Users\John\

Look for the SHA1 code, it will have a format of: XX:XX:XX....:XX

Go to the group Firebase Console, and add your personal SHA1 key in Settings->SHA certificate fingerprints

After that, you should be able to compile and sign-in with a google account with no issues

## To run integration tests:

execute command "flutter drive --target=test_driver/integration_test.dart" in working directory
