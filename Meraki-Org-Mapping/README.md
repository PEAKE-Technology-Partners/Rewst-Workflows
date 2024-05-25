<h1>This Workflow Allows you to map the Rewst Org Variable _Meraki_Org_ID_ to a Specific Meraki Org Name.</h1>

<h2>Assumptions:</h2>
Meraki Org Name is in the Rewst Org Name. They can both be Identical, or the Meraki Org Name can be inside of the Rewst Org Name.
Any Orgs that don't match can be manually assigned. You can choose how to get the list of unmatched orgs, but that can be done through something like an Email or Slack Message, or Ticket Note.

This Meraki Org ID, allows you to skip a Step in Future workflows and go stright to doing whatever you wanted to do with the Org. 

For the Trigger, I recommend running on a Cron Schedule, and running for each org. Setup a Org Overide for the Meraki API Call, so that the call will work for your Sub-Orgs.


<h2>Current Issues:</h2>
Any users of the Sub-Org, who can view the executions in their Org, May Potentially see a list of all your Meraki Customers and Customer IDs. This isn't a bug security issue for us, but if you work in a High Security 
Setup, then you may choose to run this a little different and use Sub-Workflows instead of running at the Per-Org Level.

<h2>Other Information:</h2>

I also have a Random Timer on this workflow. This May not hit the API Requests Per-Org, but it may hit Meraki's IP Rate Limiting, which is 100 Requests per second.
See Source Here: https://developer.cisco.com/meraki/api-v1/rate-limit/#per-source-ip-address


<img width="1383" alt="Screenshot 2024-05-24 at 10 37 07 PM" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/6ae6983e-995a-4d12-ab6d-4081e91b086e">
