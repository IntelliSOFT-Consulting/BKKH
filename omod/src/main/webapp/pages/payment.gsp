<%
    import java.text.DecimalFormat
    def formatter = new DecimalFormat("#0.00")
    ui.decorateWith("appui", "standardEmrPage")

    ui.includeJavascript("bkkh", "utils.js")
%>

<script>
var breadcrumbs = [
    { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
    { label: "${ ui.escapeJs(ui.format(patient)) }", link: "${ ui.pageLink('coreapps', 'clinicianfacing/patient', [ patientId: patient.uuid ]) }" },
    { label: "${ ui.message('bkkh.charges.list') }", link: "${ ui.pageLink('bkkh', 'chargesList', [patient: patient]) }" },
    { label: "${ ui.message('bkkh.payments') }", link: "${ ui.pageLink('bkkh', 'paymentsList', [patientId: patient, chargesId: charges.id]) }" },
    { label: "${ ui.message('bkkh.payment') }", link: "${ ui.pageLink('bkkh', 'payment') }" }
];
</script>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient])}

<form method="post">
    <fieldset>
        <input type="hidden" name="chargesId" value="${ charges.id }" >
        <input type="hidden" name="patientId" value="${ patient.uuid }" >
        <p>
            <label for="total">Total</label>
            <span id="total">${formatter.format(charges.total)}</span>
            <span class="error"></span>
        </p>
        <p>
            <label for="mode-of-payment">Mode of Payment</label>
            <select id="mode-of-payment" name="modeOfPayment">
                <% modeOfPayment.each { mode -> %>
                    <option value="${mode.toString()}" <% if (charges.modeOfPayment == mode) { %> selected <% } %> >${ui.message(mode.messageKey)}</option>
                <% } %>
            </select>
            <span class="error"></span>
        </p>
        <p>
            ${ ui.includeFragment("uicommons", "field/text", [
                label: "Cost Paid",
                id: "paid",
                formFieldName: "paid",
                initialValue: formatter.format(payment.paid),
                maxLength: 7,
                min: 0,
                max: 300000,
                classes: ["costs", "numeric-range", "number"]
            ])}
        </p>
        <p>
            <label for="balance">Balance</label>
            <span id="balance">${formatter.format(charges.balance)}</span>
        </p>
        <p>
            <label for="accountCharged">Account Charged</label>
            <select id="accountCharged" name="accountCharged">
                <option></option>
                <% chargeAccounts.each { account -> %>
                    <option value="${account.id}" >${account.accountName}</option>
                <% } %>
            </select>
            <span class="error"></span>
        </p>
        <input type="submit" value="Save"/>
    </fieldset>
</form>

<script>
jq(function(){
    var balance = getFloatValue(jq("#balance").text().trim());
    var initialPayment = getFloatValue(jq("#paid-field").val());
    jq("#paid-field").on("change", function(){
        console.log("Balance: " + balance);
        var currentPayment = getFloatValue(jq("#paid-field").val());
        jq("#balance").html((balance + (initialPayment - currentPayment)).toFixed(2));
    });
})
</script>