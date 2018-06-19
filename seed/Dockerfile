FROM isamuelson/eos:mainnet-1.0.5
VOLUME /opt/eosio/bin/data-dir

COPY genesis.json /opt/eosio/bin

COPY genesis.sh /opt/eosio/bin/genesis.sh
COPY seed.sh /opt/eosio/bin/seed.sh

RUN chmod +x /opt/eosio/bin/genesis.sh
RUN chmod +x /opt/eosio/bin/seed.sh

COPY config.ini /

ENTRYPOINT /opt/eosio/bin/seed.sh
