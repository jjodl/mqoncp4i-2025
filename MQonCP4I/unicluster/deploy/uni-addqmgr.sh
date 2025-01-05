#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=student1

export QMpre=mq01

export CONNAMEa=student1-mq01a-ibm-mq
export TOCLUSa=TO_UNICLUS_mq01a
export CONNAMEb=student1-mq01b-ibm-mq
export TOCLUSb=TO_UNICLUS_mq01b
export CONNAMEc=student1-mq01c-ibm-mq
export TOCLUSc=TO_UNICLUS_mq01c
export QMInstanced=student1-mq01d
export QMnamed=mq01d
export CONNAMEd=mq01d-ibm-mq
export SERVICEd=mq01d-ibm-mq
export CHANNELd=mq01chld
export TOCLUSd=TO_UNICLUS_mq01d
export UNICLUS=UNICLUS01
export SC=ocs-storagecluster-ceph-rbd
#export SC=ibmc-file-gold-gid
export VERSION=9.4.1.0-r2
export LICENSE=L-QYVA-B365MB

( echo "cat <<EOF" ; cat uniaddqmgr.yaml_template ; echo EOF ) | sh > uniaddqmgr.yaml

oc apply -f uniaddqmgr.yaml  -n student1
