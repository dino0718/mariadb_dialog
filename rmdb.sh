#!/bin/bash

# 確認是否要移除 MariaDB 及其相關設定資料
dialog --title "移除 MariaDB" --yesno "是否要完全移除 MariaDB 及其相關設定資料？" 10 40
response=$?
if [ $response -ne 0 ]; then
    echo "移除操作已取消"
    exit 1
fi

# 顯示警告對話框，告知使用者移除 /mysql 資料夾中的所有檔案
dialog --title "警告" --yesno "注意：此操作將會刪除 /mysql 資料夾（或相關目錄）中的所有檔案，且此動作無法復原。\n\n確定要移除嗎？請按 Enter 以確認，或按 ESC 取消。" 10 50
if [ $? -ne 0 ]; then
    echo "使用者取消了 /mysql 資料夾的刪除操作。"
    exit 1
fi

# 顯示卸載進度條
(
    sudo systemctl stop mariadb
    echo "20"
    sudo apt-get remove --purge -y mariadb-server mariadb-client mariadb-common &> /dev/null
    echo "50"
    sudo apt-get autoremove -y &> /dev/null
    sudo apt-get autoclean &> /dev/null
    echo "70"
    sudo rm -rf /etc/mysql /var/lib/mysql &> /dev/null
    sudo rm -rf /var/log/mysql /var/log/mysql.* &> /dev/null
    echo "90"
    sudo deluser mysql &> /dev/null
    sudo delgroup mysql &> /dev/null
    echo "100"
) | dialog --gauge "正在移除 MariaDB 及其相關設定資料..." 10 70 0

# 清理
clear
dialog --title "移除完成" --msgbox "MariaDB 及其相關設定資料已成功移除。" 10 40
clear
echo "MariaDB 及其相關設定資料已成功移除。"
