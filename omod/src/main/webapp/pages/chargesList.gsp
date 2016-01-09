<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient])}

<div>
    <p>
        <a href="${ ui.pageLink("bkkh", "charges", [ patientId: patient.uuid ]) }">Add Charges</a>
    </p>
</div>

<table>
    <thead>
        <th>Date</th>
        <th>Total</th>
        <th>Balance</th>
        <th>Actions</th>
    </thead>
    <tbody>
        <% chargesList.each { charges -> %>
            <tr>
                <td>KES ${charges.date}</td>
                <td>KES ${charges.total}</td>
                <td>KES ${charges.balance}</td>
                <td>
                    <span><a href="#" class="details" title="View Charges"><i class="icon-arrow-down"></i></a></span>
                    <span><a href="${ui.pageLink("bkkh", "paymentsList", [ chargesId: charges.id, patientId: patient.uuid ]) }" title="View Payments"><i class="icon-list-ol"></i></a></span>
                    <span><a href="${ui.pageLink("bkkh", "payment", [ chargesId: charges.id ]) }" title="Make Payment"><i class="icon-money"></i></a></span>
                </td>
            </tr>
            <tr class="details-view">
                <td colspan="4">
                    <p>Stay: KES ${charges.stay}</p>
                    <p>Procedure: KES ${charges.procedure}</p>
                    <p>Anaesthesia: KES ${charges.anaesthesia}</p>
                    <p>Doctor: KES ${charges.doctor}</p>
                    <p>Medications: KES ${charges.medications}</p>
                    <p>Lab: KES ${charges.lab}</p>
                    <p>X-ray: KES ${charges.xray}</p>
                    <p>Supplies: KES ${charges.supplies}</p>
                    <p>File: KES ${charges.file}</p>
                    <p>Follow-up: KES ${charges.followUp}</p>
                </td>
            </tr>
        <% } %>
    </tbody>
</table>

<script>
jq(function(){
    jq(".details-view").hide();
    jq(".details").on("click", function(event) {
        event.preventDefault();
        var details = jq(this).parents("tr").next();
        jq(details).toggle();
        if (!jq(details).is(":visible")) {
            jq(this).find("i").removeClass("icon-arrow-up").addClass("icon-arrow-down");
        } else {
            jq(this).find("i").removeClass("icon-arrow-down").addClass("icon-arrow-up");
        }
    });
});
</script>