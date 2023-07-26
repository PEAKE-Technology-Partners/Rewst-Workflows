*Meraki Licensing Workflow*

You will need to change the following when you import it into Rewst.
1. Add a Trigger on the Meraki Licenses (Parent) Workflow. I did a Cron Job of 0 9 * * *, which means Everyday at 9 am
*Note:* This workflow is designed to trigger on exactly 30 and 60 days before the licenses are due for expiration. I highly recommend you setup
a Daily Cron Job, so that it executes everyday. Otherwise, you may miss licensing renewals!

2. Make sure that the Parent Workflow Points to the child workflow, you should see an Parameter for organizationId, that is being passed through
3. Make sure that you have the Meraki API Setup to work with Rewst. You will need org read-only access for this workflow for each of your orgs.
To Learn how to connect to the Meraki API/Generate an Meraki API Key, read the Meraki Docs Listed [here](https://developer.cisco.com/meraki/api-latest/introduction/#whats-new-in-v1).

<img width="1085" alt="Screenshot 2023-07-25 at 9 00 39 PM" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/ac99d0d9-886b-4cf7-b909-16cac5dabe47">



4. Once you have the Meraki API Setup in Rewst, use the Integration Override Feature of Rewst in both the Parent/Child Workflows with the Custom API Actions. 
Image:
<img width="418" alt="Screenshot 2023-07-25 at 8 59 02 PM" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/f22b1913-3a70-4e11-8150-9dedcd7f2ac1">