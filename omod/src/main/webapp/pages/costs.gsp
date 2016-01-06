<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient.patient])}

<script>
    function getFloatValue(source) {
        return isNaN(parseFloat(source)) ? 0 : parseFloat(source);
    }
    jq(function(){
        jq(".cost").on("blur", function(){
            if (isValidNumber(this) && isNumberWithinRange(this)) {
                calculateTotal();
            }
            else {
                jq(this).focus();
                jq(this).siblings(".error").html("Please enter a value between " + jq(this).attr("min") + " and " + jq(this).attr("max") + ".");
            }
        });

        jq("#total,#paid").on("change", function(){
            var total = getFloatValue(jq("#total").val());
            var paid = getFloatValue(jq("#paid").val());
            jq("#balance").val(total - paid);
        });
    });
    
    function isValidNumber(charge) {
        if (isNaN(parseFloat(jq(charge).val()))) {
            return false;
        }
        return true;
    }
    
    function isNumberWithinRange(charge) {
        var value = getFloatValue(jq(charge).val());
        var min = getFloatValue(jq(charge).attr("min"));
        var max = getFloatValue(jq(charge).attr("max"));
        
        if (value < min || value > max) {
            console.log("value outside range");
            return false;
        }
        console.log("value within range");
        return true;
    }
    
    function calculateTotal() {
        var stay = getFloatValue(jq("#stay").val());
        var procedure = getFloatValue(jq("#procedure").val());
        var anaesthesia = getFloatValue(jq("#anaesthesia").val());
        var doctor = getFloatValue(jq("#doctor").val());
        var meds = getFloatValue(jq("#meds").val());
        var lab = getFloatValue(jq("#lab").val());
        var xray = getFloatValue(jq("#xray").val());
        var supplies = getFloatValue(jq("#supplies").val());
        var file = getFloatValue(jq("#file").val());
        var followUp = getFloatValue(jq("#followUp").val());

        var total = stay + procedure + anaesthesia + doctor + meds 
            + lab + xray + supplies + file + followUp;
        jq("#total").val(total);
    }
</script>

<div id="content" class="container">
    <h1>${ui.message("bkkh.costs")}</h1>
    <fieldset>
        <form class="simple-form-ui" id="uploadFile" method="post">
            <input type="hidden" id="patientId" value="${patient.patient.patientId}"/>
            <p>
                <label for="stay">Stay</label>
                <input id="stay" type="number" step="any" name="stay" value="${costs.stay}" min="0" max="1000000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="procedure">Procedure</label>
                <input id="procedure" type="number" step="any" name="procedure" value="${costs.procedure}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="anaesthesia">Anaesthesia</label>
                <input id="anaesthesia" type="number" step="any" name="anaesthesia" value="${costs.anaesthesia}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="doctor">Doctor</label>
                <input id="doctor" type="number" step="any" name="doctor" value="${costs.doctor}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="meds">Meds</label>
                <input id="meds" type="number" step="any" name="medications" value="${costs.medications}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="lab">Lab</label>
                <input id="lab" type="number" step="any" name="lab" value="${costs.lab}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="xray">X-Ray</label>
                <input id="xray" type="number" step="any" name="xray" value="${costs.xray}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="supplies">Supplies</label>
                <input id="supplies" type="number" step="any" name="supplies" value="${costs.supplies}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="file">File</label>
                <input id="file" type="number" step="any" name="file" value="${costs.file}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="followUp">Follow-up</label>
                <input id="followUp" type="number" step="any" name="followUp" value="${costs.followUp}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="modeOfPayment">Mode of Payment</label>
                <select id="modeOfPayment" name="modeOfPayment">
                    <% modeOfPayment.each { mode -> %>
                        <option value="${mode.toString()}" <% if (costs.modeOfPayment == mode) { %> selected <% } %> >${ui.message(mode.messageKey)}</option>
                    <% } %>
                </select>
                <span class="error"></span>
            <p>
                <label for="total">Total</label>
                <input id="total" type="number" step="any" name="total" readonly="true" value="${costs.total}"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="paid">Cost Paid</label>
                <input id="paid" type="number" step="any" name="paid" value="${costs.paid}"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="balance">Balance</label>
                <input id="balance" type="number" step="any" name="balance" readonly="true" value="${costs.balance}"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="account">Account Charged</label>
                <input id="account" type="number" step="any" name="accountCharged" value="${costs.accountCharged}"/>
                <span class="error"></span>
            </p>
            <input type="submit" value="Save"/>
        </form>
    </fieldset>
</div>
