#!/bin/bash
if [ "${PAM_TYPE}" = "open_session" ]; then
	curl \
	-H prio:high \
	-H tags:warning \
	-u ssh:AXxccvd9um \
	-d "SSH Login ($(cat /etc/hostname)): ${PAM_USER} from ${PAM_RHOST}" \
	https://ntfy.clortox.com/ssh
fi
