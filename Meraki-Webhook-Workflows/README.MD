# Please Import The following workflows into Rewst
1. Meraki_Webhook_ORGs
2. Meraki_Webhook_Networks
3. Meraki_Webhook_Alerts
4. Meraki_Alerts

The first 3 workflows will setup the Meraki Networks to send webhooks to a Webhook URL. The fourth workflow will accept those Webhooks and process the Meraki Notifications.
By Default, the Up and Down Alerts will go to a Slack Channel, the Config Change Notifications will be sent to a ConnectWise Manage Ticket.  
A note will be added to the ticket with the changes. 

It is **Mandatory** to change the webhook_url in the Child Update Meraki Networks Webhook (Child) workflow to the Webhook of the Meraki Alerts workflow or your own workflow. 
**Otherwise the workflow will fail!**

You may also customize the webhook_name as this will show up in the Meraki Dashboard. 
