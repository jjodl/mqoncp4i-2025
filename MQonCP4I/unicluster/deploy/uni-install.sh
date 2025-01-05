#! /bin/bash

#Use storage class ibmc-file-gold-gid when running on ROKS clusters
#Use storage class managed-nfs-storage when running on CoC PoT clusters
#mq00 reserved for instructor
export TARGET_NAMESPACE=student1
export QMpre=mq01
export QMInstancea=student1-mq01a
export QMnamea=mq01a
export CONNAMEa=student1-mq01a-ibm-mq
export SERVICEa=mq01a-ibm-mq
export CHANNELa=mq01chla
export TOCLUSa=TO_UNICLUS_mq01a
export QMInstanceb=student1-mq01b
export QMnameb=mq01b
export CONNAMEb=student1-mq01b-ibm-mq
export SERVICEb=mq01b-ibm-mq
export CHANNELb=mq01chlb
export TOCLUSb=TO_UNICLUS_mq01b
export QMInstancec=student1-mq01c
export QMnamec=mq01c
export CONNAMEc=student1-mq01c-ibm-mq
export SERVICEc=mq01c-ibm-mq
export CHANNELc=mq01chlc
export TOCLUSc=TO_UNICLUS_mq01c
export UNICLUS=UNICLUS01
export SC=ocs-storagecluster-ceph-rbd
#export SC=ibmc-file-gold-gid
export VERSION=9.4.1.0-r2
export LICENSE=L-QYVA-B365MB

( echo "cat <<EOF" ; cat unicluster.yaml_template ; echo EOF ) | sh > unicluster.yaml

oc apply -f unicluster.yaml  -n student1
