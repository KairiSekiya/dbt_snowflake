-- dbtで使用するためのユーザー、ロール、ウェアハウスを準備する

-- ロールを切り替える
USE ROLE SECURITYADMIN;

-- ロールを作成
CREATE OR REPLACE ROLE dbt_DEV_ROLE COMMENT='dbt_DEV_ROLE';
-- sysadminロールにdbt_DEV_ROLEを付与する
GRANT ROLE dbt_DEV_ROLE TO ROLE SYSADMIN;

CREATE OR REPLACE USER dbt_USER PASSWORD='password'
	DEFAULT_ROLE=dbt_DEV_ROLE
	DEFAULT_WAREHOUSE=dbt_WH
	COMMENT='dbt User';
    
-- dbt_USERにdbt_DEV_ROLEを付与する
GRANT ROLE dbt_DEV_ROLE TO USER dbt_USER;

-- ロールを切り替える
USE ROLE ACCOUNTADMIN;

-- dbt_DEV_ROLEにデータベースを作成する権限を付与する
GRANT CREATE DATABASE ON ACCOUNT TO ROLE dbt_DEV_ROLE;

/*---------------------------------------------------------------------------
Next we will create a virtual warehouse that will be used
---------------------------------------------------------------------------*/
USE ROLE SYSADMIN;

-- ウェアハウスを作成
-- AUTO_SUSPEND=120:120秒クエリが実行されない場合、ウェアハウスを停止する
-- AUTO_RESUME = true:クエリが発行された時にウェアハウスを自動で再開する
-- INITIALLY_SUSPENDED = TRUE: 初期状態ではウェアハウスは停止状態
CREATE OR REPLACE WAREHOUSE dbt_DEV_WH
  WITH WAREHOUSE_SIZE = 'XSMALL'
  AUTO_SUSPEND = 120
  AUTO_RESUME = true
  INITIALLY_SUSPENDED = TRUE;

GRANT ALL ON WAREHOUSE dbt_DEV_WH TO ROLE dbt_DEV_ROLE;