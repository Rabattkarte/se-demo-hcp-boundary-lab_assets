#!/bin/bash
set -euxo pipefail

source ~/.${INSTRUQT_PARTICIPANT_ID}-env.sh >/dev/null 2>&1

if [ "$TF_VAR_use_ldap" == "true" ]; then
    cd ${TF_BASE}/boundary-demo-ad-secrets
    terraform destroy -auto-approve
fi

if [ "$TF_VAR_use_okta" == "true" ]; then
    cd ${TF_BASE}/boundary-demo-okta
    terraform destroy -auto-approve
fi

cd ${TF_BASE}/boundary-demo-init
terraform destroy -auto-approve