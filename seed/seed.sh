#!/bin/sh

if [ ! -d "/opt/eosio/bin/data-dir/state" ]
then
	/opt/eosio/bin/genesis.sh
else
	echo "**** Running seed ****"
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e
fi

if [ $? -eq 2 ]
then
	echo "**** Running seed + replay-blockchain ****"
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e --replay-blockchain --hard-replay-blockchain
fi

if [ $? -eq 2 ]
then
	echo "**** Hard seed blockchain recovery ****"
	rm -rf /opt/eosio/bin/data-dir/blocks/
	rm -rf /opt/eosio/bin/data-dir/state/

	/opt/eosio/bin/seed.sh
fi
