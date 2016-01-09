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
                var total = calculateTotal();
                jq("#total").html("KES " + total);
                jq("#total").change();
            }
            else {
                jq(this).focus();
                jq(this).siblings(".error").html("Please enter a value between " + jq(this).attr("min") + " and " + jq(this).attr("max") + ".");
            }
        });

        jq("#total,#paid").on("change", function(){
            var total = calculateTotal();
            var paid = getFloatValue(jq("#paid").val());
            jq("#balance").html("KES " + (total - paid));
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
        return total;
    }
</script>

<div id="content" class="container">
    <h1>${ui.message("bkkh.costs")}</h1>
    <fieldset>
        <form class="simple-form-ui" id="uploadFile" method="post">
            <input type="hidden" id="patientId" value="${patient.patient.patientId}"/>
            <p>
                <label for="stay">Stay</label>
                <input id="stay" type="number" step="any" name="charges.stay" value="${charges.stay}" min="0" max="1000000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="procedure">Procedure</label>
                <input id="procedure" type="number" step="any" name="charges.procedure" value="${charges.procedure}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="anaesthesia">Anaesthesia</label>
                <input id="anaesthesia" type="number" step="any" name="charges.anaesthesia" value="${charges.anaesthesia}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="doctor">Doctor</label>
                <input id="doctor" type="number" step="any" name="charges.doctor" value="${charges.doctor}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="meds">Meds</label>
                <input id="meds" type="number" step="any" name="charges.medications" value="${charges.medications}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="lab">Lab</label>
                <input id="lab" type="number" step="any" name="charges.lab" value="${charges.lab}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="xray">X-Ray</label>
                <input id="xray" type="number" step="any" name="charges.xray" value="${charges.xray}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="supplies">Supplies</label>
                <input id="supplies" type="number" step="any" name="charges.supplies" value="${charges.supplies}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="file">File</label>
                <input id="file" type="number" step="any" name="charges.file" value="${charges.file}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="followUp">Follow-up</label>
                <input id="followUp" type="number" step="any" name="charges.followUp" value="${charges.followUp}" min="0" max="300000" class="cost"/>
                <span class="error"></span>
            </p>
            <p>
                <label for="modeOfPayment">Mode of Payment</label>
                <select id="modeOfPayment" name="payment.modeOfPayment">
                    <% modeOfPayment.each { mode -> %>
                        <option value="${mode.toString()}" <% if (charges.modeOfPayment == mode) { %> selected <% } %> >${ui.message(mode.messageKey)}</option>
                    <% } %>
                </select>
                <span class="error"></span>
            <p>
                <label for="total">Total</label>
                <span id="total">KES ${charges.total}</span>
                <span class="error"></span>
            </p>
            <p>
                <label for="paid">Cost Paid</label>
                <input id="paid" type="number" step="any" name="payment.paid" value=""/>
                <span class="error"></span>
            </p>
            <p>
                <label for="balance">Balance</label>
                <span id="balance">KES ${charges.balance}</span>
            </p>
            <p>
                <label for="account">Account Charged</label>
                <input id="account" type="number" step="any" name="payment.accountCharged" />
                <span class="error"></span>
            </p>
            <input type="submit" value="Save"/>
        </form>
    </fieldset>
</div>
