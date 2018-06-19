#!/bin/sh

if [ ! -d "/opt/eosio/bin/data-dir/blocks" ]
then
	/opt/eosio/bin/genesis.sh
else
	echo "**** Running seed ****"
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e
fi

if [ $? -eq 2 ]
then
	if [ -d "/opt/eosio/bin/data-dir/blocks/reversible" ]
	then
		echo "*** remove reversible folder"
		rm -rf /opt/eosio/bin/data-dir/blocks/reversible
	fi

	if [ -d "/opt/eosio/bin/data-dir/state" ]
	then
		echo "*** remove state folder"
		rm -rf /opt/eosio/bin/data-dir/blocks/state
	fi
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e
fi

if [ $? -eq 2 ]
then
	echo "**** Running seed + replay-blockchain"
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e --replay-blockchain
fi

if [ $? -eq 2 ]
then
	echo "**** Running seed + hard-replay-blockchain ****"
	/opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e --hard-replay-blockchain
fi

if [ $? -eq 2 ]
then
	echo "**** remove blocks and state folders ****"
	rm -rf /opt/eosio/bin/data-dir/blocks/
	rm -rf /opt/eosio/bin/data-dir/state/

	/opt/eosio/bin/seed.sh
fi
