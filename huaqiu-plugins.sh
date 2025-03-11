#!/bin/bash

HQPCB_ZIP_FILENAME="KiCAD-HQPCB-2.0.7"
HQPCB_DOWNLOAD_URL="https://gitee.com/HQNEXTPCB/hq-kicad-plugin-release/raw/master/$HQPCB_ZIP_FILENAME.zip"
HQPCB_HASH="fa28b30524de4413a26e19bc76aaa6fac32d9e04b42a8e58f5d074e4b2b49182"

HQDFM_ZIP_FILENAME="KICAD-HQDFM-2.0.1"
HQDFM_DOWNLOAD_URL="https://gitee.com/HQNEXTPCB/kicad-hqdfm-plugin-release/raw/master/$HQDFM_ZIP_FILENAME.zip"
HQDFM_HASH="85e0e95819a3a321362f6232766a4a44ddebd752c237b6ba984f49e96435fa3e"

DEST_DIR="./build-dir/files/share/kicad/resources/hqplugins"

rm -rf "$DEST_DIR"
mkdir -p "$DEST_DIR"

curl -L -o "$DEST_DIR/$HQPCB_ZIP_FILENAME.zip" "$HQPCB_DOWNLOAD_URL"

curl -L -o "$DEST_DIR/$HQDFM_ZIP_FILENAME.zip" "$HQDFM_DOWNLOAD_URL"


FILE_PATH_EXPORT="./build-dir/export/share/applications/org.kicad.KiCad.desktop"
FILE_PATH_SHARE="./build-dir/files/share/applications/org.kicad.KiCad.desktop"


sed -i 's/Name\[zh_CN\]=KiCad/Name[zh_CN]=KiCad 华秋/' "$FILE_PATH_EXPORT"
sed -i 's/Name\[zh_TW\]=KiCad/Name[zh_TW]=KiCad 华秋/' "$FILE_PATH_EXPORT"
sed -i 's/Name\[en\]=KiCad/Name[en]=KiCad Huaqiu/' "$FILE_PATH_EXPORT"

sed -i 's/Name\[zh_CN\]=KiCad/Name[zh_CN]=KiCad 华秋/' "$FILE_PATH_SHARE"
sed -i 's/Name\[zh_TW\]=KiCad/Name[zh_TW]=KiCad 华秋/' "$FILE_PATH_SHARE"
sed -i 's/Name\[en\]=KiCad/Name[en]=KiCad Huaqiu/' "$FILE_PATH_SHARE"


echo "Name[zh_CN]=KiCad 华秋"
echo "Name[zh_TW]=KiCad 华秋"
echo "Name[en]=KiCad Huaqiu"


# # 验证 ZIP 文件哈希值
# echo "$HQPCB_HASH  $DEST_DIR/$ZIP_FILENAME" | sha256sum -c -

# # 检查哈希值是否匹配
# if [ $? -eq 0 ]; then
#     echo "File downloaded and verified successfully."
# else
#     echo "Hash mismatch! The file may be corrupted."
#     exit 1
# fi
