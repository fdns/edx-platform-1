#!/usr/bin/env bash
set -x

cd /openedx/edx-platform

# Install required edx-ora2 for tests
#pip3 install -e git+https://github.com/fdns/edx-ora2.git@810e75fb2028272c10b3b86b645720c3e584a4c6#egg=ora2
pip3 install -e git+https://github.com/edx/edx-ora2.git@2.7.6#egg=ora2==2.7.6

# Test EOL Modifications

# Task Helper modifications for uchileedxlogin package
## Test before installing the package
DJANGO_SETTINGS_MODULE=lms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest lms/djangoapps/instructor_task/tests/test_tasks_helper.py lms/djangoapps/instructor_analytics/tests/test_basic.py lms/djangoapps/certificates/tests/test_webview_views.py

## Test after installing the package
pip3 install -e git+https://github.com/eol-uchile/uchileedxlogin@9b4afee163a26e955a80d06d916981fcfbf2cd33#egg=uchileedxlogin
DJANGO_SETTINGS_MODULE=lms.envs.test EDXAPP_TEST_MONGO_HOST=mongodb pytest lms/djangoapps/instructor_task/tests/test_tasks_helper.py lms/djangoapps/instructor_analytics/tests/test_basic.py lms/djangoapps/certificates/tests/test_webview_views.py
