#!/bin/bash


DOHELP()
{
    echo "Usage: $0 [base image name] [Dockerfile suffix]"
    echo ""
    echo "Example:"
    echo -e "\t $0 ubuntu:trusty trusty.x64"
    echo ""
}

if [ $# -lt 2 ]; then
    DOHELP
    exit 1
fi

BASENAME="${1}"
SUFF="${2}"
INFILE="Dockerfile.ubuntu.generic"
OUTFILE="Dockerfile.${SUFF}"

cp "${INFILE}" "${OUTFILE}"
sed -i .bak "s/GENERIC-CONTAINER/${BASENAME}/g" ${OUTFILE}
rm -f "${OUTFILE}".bak

echo ""
echo "Created ${OUTFILE}"
echo ""
