<%
    ui.decorateWith("appui", "standardEmrPage")
    ui.includeJavascript("uicommons", "handlebars/handlebars.min.js", Integer.MAX_VALUE - 1);
    ui.includeJavascript("uicommons", "navigator/validators.js", Integer.MAX_VALUE - 19)
    ui.includeJavascript("uicommons", "navigator/navigator.js", Integer.MAX_VALUE - 20)
    ui.includeJavascript("uicommons", "navigator/navigatorHandlers.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorModels.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorTemplates.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/exitHandlers.js", Integer.MAX_VALUE - 22);
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient.patient])}

<script>
    var NavigatorController;
    function getFloatValue(source) {
        return isNaN(parseFloat(source)) ? 0 : parseFloat(source);
    }

    var emrMessages = {};

    emrMessages["numericRangeHigh"] = "value should be less than {0}";
    emrMessages["numericRangeLow"] = "value should be more than {0}";

    jq(function(){
        NavigatorController = new KeyboardController();
        jq(".costs").on("change", function(){
            console.log("change called");
            if (isValidNumber(this) && isNumberWithinRange(this)) {
                var total = calculateTotal();
                console.log("Total: " + total);
                jq("#total").html("KES " + total);
                jq("#total").change();
            }
            else {
                jq(this).focus();
                jq(this).siblings(".error").html("Please enter a value between " + jq(this).attr("min") + " and " + jq(this).attr("max") + ".");
            }
        });

        jq("#total,#paid-field").on("change", function(){
            var total = calculateTotal();
            var paid = getFloatValue(jq("#paid-field").val());
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
            return false;
        }
        return true;
    }
    
    function calculateTotal() {
        var stay = getFloatValue(jq("#stay-field").val());
        var procedure = getFloatValue(jq("#procedure-field").val());
        var anaesthesia = getFloatValue(jq("#anaesthesia-field").val());
        var doctor = getFloatValue(jq("#doctor-field").val());
        var meds = getFloatValue(jq("#medications-field").val());
        var lab = getFloatValue(jq("#lab-field").val());
        var xray = getFloatValue(jq("#xray-field").val());
        var supplies = getFloatValue(jq("#supplies-field").val());
        var file = getFloatValue(jq("#file-field").val());
        var followUp = getFloatValue(jq("#followUp-field").val());

        var total = stay + procedure + anaesthesia + doctor + meds 
            + lab + xray + supplies + file + followUp;
        return total;
    }
</script>

<div id="validation-errors" class="note-container" style="display: none" >
    <div class="note error">
        <div id="validation-errors-content" class="text">

        </div>
    </div>
</div>

<div id="content" class="container">
    <h1>${ui.message("bkkh.costs")}</h1>
        <form class="simple-form-ui" id="charges" method="post">
            <section id="charges-info">
                <span class="title">Charges</span>
                <input type="hidden" id="patientId" value="${patient.patient.patientId}"/>
                <fieldset>
                    <legend>Stay</legend>
                    <p>
                         ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Stay",
                            id:"stay",
                            formFieldName: "charges.stay",
							initialValue: charges.stay,
                            maxLength: 7,
                            min: 0,
                            max: 1000000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Procedure</legend>
                    <p>
                         ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Procedure",
                            id:"procedure",
                            formFieldName: "charges.procedure",
							initialValue: charges.procedure,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Anaesthesia</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Anaesthesia",
                            id:"anaesthesia",
                            formFieldName: "charges.anaesthesia",
                            initialValue: charges.anaesthesia,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Doctor</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Doctor",
                            id:"doctor",
                            formFieldName: "charges.doctor",
                            initialValue: charges.doctor,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Medication</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Meds",
                            id:"medications",
                            formFieldName: "charges.medications",
                            initialValue: charges.medications,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Lab</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Lab",
                            id:"lab",
                            formFieldName: "charges.lab",
							initialValue: charges.lab,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>X-ray</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "X-ray",
                            id:"xray",
                            formFieldName: "charges.xray",
							initialValue: charges.xray,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Supplies</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Supplies",
                            id:"supplies",
                            formFieldName: "charges.supplies",
							initialValue: charges.supplies,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>File</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "File",
                            id:"file",
                            formFieldName: "charges.file",
							initialValue: charges.file,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Follow-up</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Follow-up",
                            id:"followUp",
                            formFieldName: "charges.followUp",
							initialValue: charges.followUp,
                            maxLength: 7,
                            min: 0,
                            max: 300000,
                            classes: ["costs", "numeric-range"],
                            left: true
                        ])}
                    </p>
                </fieldset>
            </section>
            <section>
                <span class="title">Payment Info</span>
                <fieldset>
                    <legend>Mode of Payment</legend>
                    <p>
                        <label for="modeOfPayment">Mode of Payment</label>
                        <select id="modeOfPayment" name="payment.modeOfPayment">
                        <% modeOfPayment.each { mode -> %>
                            <option value="${mode.toString()}" <% if (charges.modeOfPayment == mode) { %> selected <% } %> >${ui.message(mode.messageKey)}</option>
                        <% } %>
                        </select>
                        <span class="error"></span>
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Paid</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Cost Paid",
                            id:"paid",
                            formFieldName: "payment.paid",
                            maxLength: 7,
                            min: 0,
                            max: 10000000,
                            classes: ["costs", "numeric-range"],
                            left: false
                        ])}
                    </p>
                    <p>
                        <label for="total">Total</label>
                        <span id="total">KES ${charges.total}</span>
                        <span class="error"></span>
                    </p>
                    <p>
                        <label for="balance">Balance</label>
                        <span id="balance">KES ${charges.balance}</span>
                    </p>
                </fieldset>
                <fieldset>
                    <legend>Account Charged</legend>
                    <p>
                        ${ ui.includeFragment("uicommons", "field/text", [
                            label: "Account Charged",
                            id:"account",
                            formFieldName: "payment.accountCharged",
                            classes: ["costs"],
                            left: true
                        ])}
                    </p>
                </fieldset>
            </section>
            <div id="confirmation">
                <span id="confirmation_label" class="title">Charges Summary</span>
                <div class="before-dataCanvas"></div>
                <div id="dataCanvas"></div>
                <div class="after-data-canvas"></div>
                <div id="confirmationQuestion">
                    Are the details correct?
                    <p style="display: inline">
                        <input id="submit" type="submit" class="submitButton confirm right" value="YES" />
                    </p>
                    <p style="display: inline">
                        <input id="cancelSubmission" class="cancel" type="button" value="NO" />
                    </p>
                </div>
            </div>
        </form>
</div>
