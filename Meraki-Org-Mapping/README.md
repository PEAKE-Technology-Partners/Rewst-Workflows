This Workflow Allows you to map the Rewst Org Variable _Meraki_Org_ID_ to a Specific Meraki Org Name.

Assumptions:
Meraki Org Name is in the Rewst Org Name. They can both be Identical, or the Meraki Org Name can be inside of the Rewst Org Name.
Any Orgs that don't match can be manually assigned. You can choose how to get the list of unmatched orgs, but that can be done through something like an Email or Slack Message, or Ticket Note.

This Meraki Org ID, allows you to skip a Step in Future workflows and go stright to doing whatever you wanted to do with the Org. 

For the Trigger, I recommend running on a Cron Schedule, and running for each org. Setup a Org Overide for the Meraki API Call, so that the call will work for your Sub-Orgs.


Current Issues:
Any users of the Sub-Org, who can view the executions in their Org, May Potentially see a list of all your Meraki Customers and Customer IDs. This isn't a bug security issue for us, but if you work in a High Security 
Setup, then you may choose to run this a little different and use Sub-Workflows instead of running at the Per-Org Level.

