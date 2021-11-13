### Importing the Required Libraries ###

import pandas as pd
from sqlalchemy import create_engine
import os

### Creating a connection between the MSSQL Server and Python ###

### Required Parameters ###

Server = 'SUDEEP\MSSQLSERVER01'
Database = 'InventoryManagementSystem'
Driver = 'ODBC Driver 17 for SQL Server'

### Creating a Connection ###

database_conn = f'mssql://@{Server}/{Database}?driver={Driver}'

engine = create_engine(database_conn)

connection = engine.connect()

### Reading the Data From the SQL Server ###

df = pd.read_sql_query('SELECT * FROM dbo.customer',connection)

### Pushig the Data From the python to the SQL Server ###

source_path = 'D:\\SQL\\SQL Project with Python\\Inventory Management Table\\'

df = pd.read_csv('{}/changeorder_table.csv'.format(source_path))

df.to_sql('change_order',engine,if_exists = 'append',index = False)