
# DB Completed Listener Workflow 

## This workflow will show you how to capture workflow executions using an MySQL database, which can be queried for specific workflow executions

### Prerequisites: 
1. Have a MySQL Database Setup
2. Expose your MySQL Database so that is it accessible to Rewst
3. Have a dedicated Service Account for Rewst
4. Verified that Rewst can connect to the database
5. Create a dedicated database for Rewst (I used rewst as the name of mine)

Once those are setup come back and follow the remaining instructions.



### How to setup this workflow:

1. Create the Rewst_Executions table inside of your database by importing or running the SQL file MySQL_Table_Dump.sql. This will provide the table necessary for Rewst to insert data into.
2. Import the Rewst Workflow file, db_completed_listener_rewst_workflow.bundle.json.
3. Modify the Workflow to utilize your database. Change the name of the database you are inserting into in the workflow.
4. Setup workflow completed handlers on a test workflow. Run the workflow and verify that the DB Completed Listener workflow is executing and that data is being sent to the database. You can use the SQL command **select from rewst_executions** to check if your data is inserted.
<img width="1178" alt="Select*_Results" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/25cc16bf-5c2f-4e3b-a914-e5b251fd9ed6">



Once data is confirmed to be inside of the MySQL Database: you can run some test queries from Rewst_Queries.sql. You will need to modify these to fit your needs. For Example, you likely do not have an Org inside of Rewst called 'PEAKE Technology Dev'. You can either remove it or change it to the name of another org. 



### Finally, Connect your database to other tools
Use something like BrightGauge, Tableau, PowerBI, or another Data Visualization tool to show your workflow off to your Management! This will allow them to stay current on your progress with Rewst!


