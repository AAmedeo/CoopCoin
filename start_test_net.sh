#start test_net
echo "starting test net..."
tmux new-session -d -s test_net  'geth --datadir /home/vagrant/test_net/chaindata/ --networkid 1234 --rpc --rpcport 8545 --rpcaddr "0.0.0.0" --rpccorsdomain "*"  --rpcapi "db,eth,net,web3,personal"  --unlock 0x140Dd02a2A89401D6aE231E60AFf7BBE895D2106 --password /home/vagrant/test_net/miner_password --mine console'