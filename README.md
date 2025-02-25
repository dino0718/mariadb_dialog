# MariaDB 安裝與移除腳本

這個專案包含兩個腳本：`db.sh` 用於安裝和管理 MariaDB，`remove_mariadb.sh` 用於完全移除 MariaDB 及其相關設定資料。

## 目錄

- [MariaDB 安裝腳本](#mariadb-安裝腳本)
- [MariaDB 移除腳本](#mariadb-移除腳本)
- [使用方法](#使用方法)

## MariaDB 安裝腳本

`install_mariadb.sh` 腳本會執行以下操作：

1. 顯示歡迎信息並詢問是否繼續安裝。
2. 顯示安裝進度條，安裝 MariaDB 和相關套件。
3. 設定 MariaDB root 密碼。
4. 創建資料庫和資料表。
5. 提供 CRUD 操作選單，讓用戶可以新增、讀取、更新和刪除資料。

## MariaDB 移除腳本

`remove_mariadb.sh` 腳本會執行以下操作：

1. 確認是否要完全移除 MariaDB 及其相關設定資料。
2. 顯示警告信息，告知用戶此操作將會刪除所有相關檔案且無法復原。
3. 顯示移除進度條，移除 MariaDB 和相關設定資料。
4. 顯示移除完成信息。

## 使用方法

### 安裝 MariaDB

1. 確保腳本具有執行權限：
    ```bash
    chmod +x db.sh
    ```

2. 執行安裝腳本：
    ```bash
    ./db.sh
    ```

3. 按照提示進行操作，設置 root 密碼，創建資料庫和資料表，並進行 CRUD 操作。

### 移除 MariaDB

1. 確保腳本具有執行權限：
    ```bash
    chmod +x remove_mariadb.sh
    ```

2. 執行移除腳本：
    ```bash
    ./remove_mariadb.sh
    ```

3. 按照提示確認移除操作，等待移除完成。

## 注意事項

- 移除腳本會刪除所有 MariaDB 相關的檔案和設定，且無法復原，請謹慎操作。
- 在執行這些腳本之前，請確保您有足夠的權限來安裝和移除軟體。


