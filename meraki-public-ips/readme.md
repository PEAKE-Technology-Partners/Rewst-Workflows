# Get All Meraki Public IPs
This workflow consists of an Parent and Child Workflows.
The Parent Workflow Gets the List of Meraki ORGs, then the Child workflow get's all the IPs for the Organization in Meraki.
The Child Workflow will return the list as "total_uplinks", which is sent back to the Parent Workflow.
Once the Child workflows and completed (all orgs are completed), then it will clean up the list and remove any empty entries in the list.
{{ CTX.final_list }} will contain the List of IPs (As shown below)
You can use this for anything that requires an full list of IPs. Maybe for firewall rules, IP Whitelisting, IP Management Solutions, Documentation, 
External Scanning, etc.
<img width="1371" alt="Final_IP_List" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/05a586b7-55b0-4f50-b5de-c2c41f830ccc">
