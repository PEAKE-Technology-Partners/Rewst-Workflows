# Please Import The following workflows into Rewst
1. Meraki_Webhook_ORGs
2. Meraki_Webhook_Networks
3. Meraki_Webhook_Alerts
4. Meraki_Alerts

## Notice: Any Existing Notification settings under the Network-Wide Alerts will be removed after running the workflow! 

The first 3 workflows will setup the Meraki Networks to send webhooks to a Webhook URL. The fourth workflow will accept those Webhooks and process the Meraki Notifications.
By Default, the Up and Down Alerts will go to a Slack Channel, the Config Change Notifications will be sent to a ConnectWise Manage Ticket.  
A note will be added to the ticket with the changes. 

It is **Mandatory** to change the webhook_url in the Meraki_Webhook_Alerts workflow to the Webhook of the Meraki Alerts workflow or your own workflow. 
**Otherwise the workflow will fail!**

You may also customize the webhook_name as this will show up in the Meraki Dashboard. 

If you need access to the Meraki Dashboard, try the DevNet Sandbox! It's free and you can use it for up to 2 weeks at a time, then just try it out an unlimited number of times.
https://developer.cisco.com/site/sandbox/

Meraki API Docs:
https://developer.cisco.com/meraki/api/

Meraki Webhook JSON Responses:
https://documenter.getpostman.com/view/897512/SVfRtnU7?version=latest

You will also need to configure the Rewst Integration. You will need to setup Integration overrides as well for your specific Meraki Custom Integration.

The Meraki API URL is api.meraki.com/api/v1
You will need to select API Key as the Authentication, and use the Header **X-Cisco-Meraki-API-Key**


The API key is easy to retrieve from Meraki. Go yo "Your Profile" in the Dashboard, then scroll down until you see "Generate a New API Key". Copy that key into the Rewst Custom Integration page. 
