#!/bin/bash
#===============================================================================
#          FILE: no_passwd_login.sh
#         USAGE: . ${YOUR_PATH}/no_passwd_login.sh 
#   DESCRIPTION: 
#        AUTHOR: IVAN DU
#        E-MAIL: mrivandu@hotmail.com
#        WECHAT: ecsboy
#      TECHBLOG: https://ivandu.blog.csdn.net
#        GITHUB: https://github.com/mrivandu
#       CREATED: 2019-06-28 15:50:47
#       LICENSE: GNU General Public License.
#     COPYRIGHT: © IVAN DU 2019
#      REVISION: v1.0
#===============================================================================

. kube_config.sh

# Configure SSH Password-Free Login.
[ -f ~/.ssh/id_rsa ] && rm -f ~/.ssh/id_rsa && ssh-keygen -b 1024 -t rsa -C 'Kubernetes'
[ ! -f ~/.ssh/id_rsa ] && ssh-keygen -b 1024 -t rsa -C 'Kubernetes'
for node_ip in ${hosts[@]}
  do  
    if [ "${node_ip}" == "${hosts[gysl-master]}" ] ; then
      continue
    else
      ssh-copy-id -i root@${node_ip}
    fi
  done

