#!/bin/bash

# my Directory
BASENAME=$(cd `dirname $0`; pwd)


mkdir /root/.ssh
chmod 700 /root/.ssh
touch /root/.ssh/authorized_keys
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5B5KemVRd8hPfxzbOv89FAgx66cViL2Fc+EZLQnVXK2AT7bNvxQ9wHsYmYMWFo1+pn2j/Nm9u4Coyf2snygywJ8B8RvEDZVOZzjLRIHBjHWW9iCIkgrGfnHWYYXWWauCzd/iyv6W91b9M0bG6cuh3fDGQkZB45cZTHvMzURLU1MtXYUjts+sLlzUQ2urNU7pabgUt6mjt0/YVplemDRVUHh6a+QdAE9TdM+NQU66bqvuixQ8q21tP2wqgsdJmbJKacQ1Xh5Wjite0xqJiQv6JyM8adybhrwIhQ+ICBes2rtfAKoV7ApqClkmEbg/PcRe9v34mtPVSFxBgK21jrCl/ for ansible-playbook' > /root/.ssh/authorized_keys
