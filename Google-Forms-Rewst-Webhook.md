# Rewst - Google Forms Integration Docs

This will show you how to integrate Rewst with Google Forms, so that you can take Google Forms Submissions and process them in Rewst. This will only take the form submission data,
not the other information about who filled out the form, etc.

## Prerequisites: 
Have a Google Form Created
Have an Link Generated for it
Have a Rewst Workflow Created with an Webhook Trigger (Please setup the Webhook Trigger to accept POST Requests)
Have an Basic Understanding of How Rewst Workflows Work

### 1. Create the Google Apps Script
Inside of your Google Form, select the 3 Dots Hamburger Menu, then select Script Editor.

<img width="400" alt="Google_Forms_Options" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/a4994221-0578-4314-8333-cda4fe4bfab5">



If you have existing scripts, select the + icon to create a new Script. Give this a descriptive name, such as Submit_Results_To_Rewst.gs
Copy/Paste the Code Provided below and edit the POST_URL to your Webhook URL.
Click on Save to save the Google Script
<img width="1201" alt="Google_Script_Editor" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/755aa7ed-c815-4fe6-8bdc-6d32666ab570">





### 2. Add a Google Apps Trigger
On the Scripts page, select Triggers
Click on the Plus Button the Create a New Trigger.
Note: Make sure that your settings are configured on Event type is setup as On Form Submit, otherwise you will not get the completed results. 
<img width="736" alt="Google_Trigger" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/9b6205fc-14fb-4419-af82-c33ae09748f2">


```

var POST_URL = "Your Rewst Trigger URL (Ensure that this is setup for POST Methods)";
function onSubmit(e) {
    var form = FormApp.getActiveForm();
    var allResponses = form.getResponses();
    var latestResponse = allResponses[allResponses.length - 1];
    var response = latestResponse.getItemResponses();
    var payload = {};
    for (var i = 0; i < response.length; i++) {
        var question = response[i].getItem().getTitle();
        var answer = response[i].getResponse();
        payload[question] = answer;
    }
  
    var options = {
        "method": "post",
        "contentType": "application/json",
        "payload": JSON.stringify(payload)
    };
UrlFetchApp.fetch(POST_URL, options);
};

```


### 3. Now save your changes, and submit the form, verify that the Webhook is showing the fields and the values.

<img width="556" alt="Rewst_Webhook" src="https://github.com/PEAKE-Technology-Partners/Rewst-Workflows/assets/59022873/e622e233-b60b-4e4c-81d2-e86e6d8aa50f">






