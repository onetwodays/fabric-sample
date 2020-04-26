./network.sh up
./network.sh createChannel
./network.sh deployCC
peer chaincode query -C mychannel -n fabcar -c '{"Args":["queryAllCars"]}'
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls true --cafile ${FABRIC_PATH}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem -C mychannel -n fabcar --peerAddresses localhost:7051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt --peerAddresses localhost:9051 --tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt -c '{"function":"changeCarOwner","Args":["CAR9","Dave"]}'
peer chaincode query -C mychannel -n fabcar -c '{"Args":["queryAllCars"]}'
peer chaincode query -C mychannel -o localhost:7050  -n fabcar -c '{"Args":["queryAllCars"]}'
