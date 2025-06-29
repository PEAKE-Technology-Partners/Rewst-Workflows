## Some Rewst Workflows to Migrate from CW Automate -> Ninja RMM
Workflow List and Order
1. Ninja_Location_Creation.bundle.json -> Created Ninja Orgs/Locations from your CW Automate Companies/Locations
2. Ninja_Agent_Install.bundle.json -> Updated CW Automate EDF with Ninja Agent installer for each individual Site

### Notes
#### Actions Required:
Update the Automate -> Ninja Agent Migration (Child) Workflow with the correct EDF ID Value from CW Automate
This can be completed by running a List Extra Data Fields and find the EDF ID for the value in CW Automate. Please create the EDF in CW Automate as a text value.

#### Post-Migration
Once your Agents are installed in Ninja, please modify your policies as needed for each org, and please be sure to pause CW PSA Config Sync until you have disabled it in CW Automate. 
Otherwise, you will end up with duplicate configs and this will result in 2 configs being created for each device. 

In order to resolve this, create a workflow that pulls in the device id from Ninja and update the CW PSA device identifier field with the Ninja Device ID:

Hints: Ninja doesn't expose the Device ID on the built-in API actions. You will need to use the "Unofficial" API in order to get the data required.
POST https://{{your_Ninja_Instance}}.ninjarmm.com/swb/s1/search/runner

Example Body: Pull this from your Web Browser in Developer Tools
{"searchCriteria":[{"type":"customer","id":-1,"customFields":"{\"selectedValues\":[{{ORG.ninja_org_id}}]}"}],"columns":["customField_7","customField_23"]}


Headers:
Content-Type: application/json

Cookies:
sessionKey: yourNinjaSessionID -> Pull this value from an authenticated Ninja session in your Web Browser

#### Example Ninja Agent Install Script in CW Automate:
<img width="1655" alt="Example_Ninja_Install_Script_CW_Automate" src="https://github.com/user-attachments/assets/c8a52533-c866-4a32-8ad1-2c15000db0e0" />
