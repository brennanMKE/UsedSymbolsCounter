#!/bin/sh

ROOT_DIR="${PROJECT_DIR:-.}"

echo "TARGET_BUILD_DIR: ${TARGET_BUILD_DIR}"
echo "PROJECT: ${PROJECT}"

SYMBOLS_DEMANGLED="${ROOT_DIR}/symbols.txt"
RAW_FILE="${ROOT_DIR}/raw.txt"
SDK_FILE="${ROOT_DIR}/sdk.txt"
LOGFILE="${ROOT_DIR}/log.txt"
BINARY="${TARGET_BUILD_DIR}/${PROJECT}.app/Contents/MacOS/${PROJECT}"

if [ ! -f "${BINARY}" ]; then
    echo "Binary not found: ${BINARY}" && exit 1
fi

nm "${BINARY}" | awk '{ print $3 }' | xargs xcrun swift-demangle {} > "${RAW_FILE}"

cat "${RAW_FILE}" | awk '{ print $3 }' | xargs xcrun swift-demangle {} \; | less  > "${SYMBOLS_DEMANGLED}"

cat "${SYMBOLS_DEMANGLED}" | grep "MyClientSDK" > "${SDK_FILE}"

log()
{
    MESSAGE=$1
    echo "${MESSAGE}" >> "${LOGFILE}"
}

count_symbol()
{
    SYMBOL=$1
    COUNT=$(cat ${SDK_FILE} | grep "${SYMBOL}" | wc -l | awk '{print $1}')
    log "${SYMBOL} :\t\t${COUNT}"
}

if [ -f "${LOGFILE}" ]; then
    rm "${LOGFILE}"
fi

touch "${LOGFILE}"

count_symbol "MyClientSDK.StorageClient.uploadFile()"
count_symbol "MyClientSDK.StorageClient.downloadFile()"
count_symbol "MyClientSDK.StorageClient.fetchList()"
count_symbol "MyClientSDK.StorageClient.removeFile()"

count_symbol "MyClientSDK.DataStoreClient.syncData()"
count_symbol "MyClientSDK.DataStoreClient.addObject()"
count_symbol "MyClientSDK.DataStoreClient.removeObject()"

cat "${LOGFILE}"
