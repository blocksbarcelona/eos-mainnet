#!/bin/sh

echo "**** Running genesis ****"
/opt/eosio/bin/nodeosd.sh --genesis-json /opt/eosio/bin/genesis.json --data-dir /opt/eosio/bin/data-dir -e
echo "**** Exit genesis ****"
