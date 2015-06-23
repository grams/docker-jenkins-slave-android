FROM grams/jenkins-slave

## Android SDK
# http://stackoverflow.com/questions/18928164/android-studio-cannot-find-aapt/18930424#18930424
RUN apt-get update && apt-get install -y lib32stdc++6 lib32z1 && apt-get clean
RUN curl "http://dl.google.com/android/android-sdk_r23.0.2-linux.tgz" | tar xz  && cp -R android-sdk-linux /usr/lib/android-sdk && rm -rf android-sdk-linux && chown -R jenkins:jenkins /usr/lib/android-sdk
# Update Android SDK
# Answering yes trick found here http://stackoverflow.com/a/21910110/1472121
RUN  sudo -u jenkins -i /bin/bash -c "( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) | /usr/lib/android-sdk/tools/android update sdk --no-ui --filter platform,1,2,3"

