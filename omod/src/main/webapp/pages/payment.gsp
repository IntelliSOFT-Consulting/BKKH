<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient.patient])}

<form>
    <fieldset>
        <input type="hidden" value="${chargesId }" >
        <p>
            <label for="total">Total</label>
            <span id="total">KES ${charges.total}</span>
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
            <label for="paid">Cost Paid</label>
            <input id="paid" type="number" step="any" name="paid" value=""/>
            <span class="error"></span>
        </p>
        <p>
            <label for="balance">Balance</label>
            <span id="balance">KES ${charges.balance}</span>
        </p>
        <p>
            <label for="account">Account Charged</label>
            <input id="account" type="number" step="any" name="accountCharged" />
            <span class="error"></span>
        </p>
        <input type="submit" value="Save"/>
    </fieldset>
</form>

<script>
jq(function(){
    jq("#paid").on("change", function(){
        var total = calculateTotal();
        var paid = getFloatValue(jq("#paid").val());
        jq("#balance").html("KES " + (total - paid));
    });
})
</script>