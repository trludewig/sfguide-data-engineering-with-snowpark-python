/*-----------------------------------------------------------------------------
Hands-On Lab: Data Engineering with Snowpark
Script:       01_setup_snowflake.sql
Author:       Jeremiah Hansen
Last Updated: 1/1/2023
-----------------------------------------------------------------------------*/


-- ----------------------------------------------------------------------------
-- Step #1: Accept Anaconda Terms & Conditions
-- ----------------------------------------------------------------------------

-- See Getting Started section in Third-Party Packages (https://docs.snowflake.com/en/developer-guide/udf/python/udf-python-packages.html#getting-started)


-- ----------------------------------------------------------------------------
-- Step #2: Create the account level objects
-- ----------------------------------------------------------------------------
--GRANT EXECUTE TASK ON ACCOUNT TO ROLE HOL_ROLE;
--GRANT MONITOR EXECUTION ON ACCOUNT TO ROLE HOL_ROLE;
--GRANT IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE TO ROLE HOL_ROLE;
--GRANT OWNERSHIP ON DATABASE HOL_DB TO ROLE HOL_ROLE;


-- ----------------------------------------------------------------------------
-- Step #3: Create the database level objects
-- ----------------------------------------------------------------------------
USE ROLE MOHCD_MODEL_ROLE;
USE WAREHOUSE MOHCD_WH;
USE DATABASE MOHCD_DB;

USE SCHEMA TEST;
-- Schemas

SELECT * FROM mohcd_db.test.customer LIMIT 100;



# For local debugging
if __name__ == "__main__":
    # Add the utils package to our path and import the snowpark_utils function
    import os, sys
    current_dir = os.getcwd()
    parent_dir = os.path.dirname(current_dir)
    sys.path.append(parent_dir)

    from utils import snowpark_utils
    session = snowpark_utils.get_snowpark_session()

    print(session)

    session.close()
