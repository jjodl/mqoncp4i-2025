#!/bin/bash
set -x
#mq00 reserved for instructor
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
export MQCCDTURL="${DIR}/ccdt_generated.json"
export MQSSLKEYR="${DIR}/key"
export MQCHLLIB="${DIR}"
export MQCHLTAB="${DIR}/ccdt_generated.json"
export TARGET_NAMESPACE=cp4i-mq
export QMpre=mq01
export QMname=mq01a
export CHLCAPS=MQ01CHLA
export APPQ=APPQ 

export HOST="$(oc get route $QMname-ibm-mq-qm -n $TARGET_NAMESPACE -o jsonpath='{.spec.host}')"
( echo "cat <<EOF" ; cat ccdt_template.json ; echo EOF ) | sh > ccdt_generated.json

echo "Starting amqsghac" $QMname
/opt/mqm/samp/bin/amqsghac $APPQ $QMname
