<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient.patient])}

<div id="content" class="container">
    <h1>${ui.message("bkkh.costs")}</h1>
    <fieldset>
        <form class="simple-form-ui" id="uploadFile" method="post">
            <input type="hidden" id="patientId" value="${patient.patient.patientId}"/>
            <label for="stay">Stay</label>
            <input id="stay" type="number" step="any" name="stay"/>
            <label for="procedure">Procedure</label>
            <input id="procedure" type="number" step="any" name="procedure"/>
            <label for="anaesthesia">Anaesthesia</label>
            <input id="anaesthesia" type="number" step="any" name="anaesthesia"/>
            <label for="doctor">Doctor</label>
            <input id="doctor" type="number" step="any" name="doctor"/>
            <label for="meds">Meds</label>
            <input id="meds" type="number" step="any" name="meds"/>
            <label for="lab">Lab</label>
            <input id="lab" type="number" step="any" name="lab"/>
            <label for="xray">X-Ray</label>
            <input id="xray" type="number" step="any" name="xray"/>
            <label for="supplies">Supplies</label>
            <input id="supplies" type="number" step="any" name="supplies"/>
            <label for="file">File</label>
            <input id="file" type="number" step="any" name="file"/>
            <label for="followUp">Follow-up</label>
            <input id="followUp" type="number" step="any" name="followUp"/>
            <label for="nhif">NHIF</label>
            <input id="nhif" type="number" step="any" name="nhif"/>
            <label for="total">Total</label>
            <input id="total" type="number" step="any" name="total" readonly="true"/>
            <label for="paid">Cost Paid</label>
            <input id="paid" type="number" step="any" name="paid"/>
            <label for="balance">Balance</label>
            <input id="balance" type="number" step="any" name="balance" readonly="true"/>
            <label for="account">Account Charged</label>
            <input id="account" type="number" step="any" name="account"/>
            <input type="submit" value="Save"/>
        </form>
    </fieldset>
</div>