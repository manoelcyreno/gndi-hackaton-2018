const express = require('express');
const app = express();
const WeDeploy = require('wedeploy');

app.get('/company-summary', (req, res) => {
    getCompanySummary().then(result => {
        res.send(JSON.stringify(result));
    });
});

app.get('/appointments-cost', (req, res) => {
    getAppointmentsCost().then(result => {
        res.send(JSON.stringify(result));
    });
});
   
app.listen(3000);

function getCompanySummary() {
    return WeDeploy
        .data('https://data-gndihackaton.wedeploy.io/')
        .get('user')
        .then(usersList => {
            let dependentCount = usersList.filter(user => user['isDependent']).length;
            let ownerCount = usersList.filter(user => !user['isDependent']).length;
            let totalCount = usersList.length;

            return {
                "dependentCount": dependentCount,
                "ownerCount": ownerCount,
                "totalCount": totalCount
            }
        });
}

function getAppointmentsCost() {
    return WeDeploy
        .data('https://data-gndihackaton.wedeploy.io/')
        .get('appointment')
        .then(appointmentsList => {
            let totalCost = appointmentsList
                .map(appointment => appointment['cost'])
                .reduce((prev, cur) => {
                    return prev + cur;
                });

            return {
                "totalCost": totalCost
            }
        });
}
