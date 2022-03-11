#!/bin/bash

# First argument: Client identifier
# Second argument: Mikrotik config flag

OPENVPN_DIR=/etc/openvpn
EASYRSA_DIR=/etc/openvpn/easy-rsa
CLIENTS_DIR=/etc/openvpn/clients
BASE_CLIENT_CONFIG=/etc/openvpn/clients/_client.conf
BASE_MIKROTIK_CLIENT_CONFIG=/etc/openvpn/clients/_mikrotik.conf

# Check client name
if ! [[ -n ${1} ]]
then
  printf "Usage: ${0} <client_name> [mikrotik]\n"
  exit 1
fi

# Create client folder
mkdir -p ${CLIENTS_DIR}/${1}

# Go to easy-rsa folder
cd ${EASYRSA_DIR}

# Create client certificate and key without password
./easyrsa build-client-full ${1} nopass

# Copy client certificate and key to client folder
cp ${EASYRSA_DIR}/pki/issued/${1}.crt ${CLIENTS_DIR}/${1}/${1}.crt
cp ${EASYRSA_DIR}/pki/private/${1}.key ${CLIENTS_DIR}/${1}/${1}.key

# Remove genarated key and certificate from easyRSA folder
rm -rf ${EASYRSA_DIR}/pki/reqs/${1}.req
rm -rf ${EASYRSA_DIR}/pki/issued/${1}.crt
rm -rf ${EASYRSA_DIR}/pki/private/${1}.key

# Copy CA certificate to client folder
cp ${OPENVPN_DIR}/ca.crt ${CLIENTS_DIR}/${1}/ca.crt

# Return to openvpn folder
cd ${OPENVPN_DIR}

# Select base config file
if [[ ${2} = 'mikrotik' ]]
then
  BASE_CONFIG=${BASE_MIKROTIK_CLIENT_CONFIG}
else
  BASE_CONFIG=${BASE_CLIENT_CONFIG}
fi

# Write configuration to .ovpn file
cat ${BASE_CONFIG=${BASE_CLIENT_CONFIG}} \
    <(echo -e '\n<ca>') \
    ${OPENVPN_DIR}/ca.crt \
    <(echo -e '</ca>\n\n<cert>') \
    ${CLIENTS_DIR}/${1}/${1}.crt \
    <(echo -e '</cert>\n\n<key>') \
    ${CLIENTS_DIR}/${1}/${1}.key \
    <(echo -e '</key>\n\n<tls-auth>') \
    ${OPENVPN_DIR}/ta.key \
    <(echo -e '</tls-auth>') \
    > ${CLIENTS_DIR}/${1}/${1}.ovpn

if ! [[ -f ${CLIENTS_DIR}/${1}/${1}.ovpn ]]
then
    printf "Error while creating OpenVPN client config\n"
    exit 1
fi

printf '\nOpenVPN client config:\n\n'

cat ${CLIENTS_DIR}/${1}/${1}.ovpn

printf "\nOpenVPN client config file: ${CLIENTS_DIR}/${1}/${1}.ovpn\n"

exit 0
