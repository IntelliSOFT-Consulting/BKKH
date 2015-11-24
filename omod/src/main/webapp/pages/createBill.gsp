<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient.patient])}

<div id="content" class="container">
    <h1>${ui.message("bkkh.createBill")}</h1>
    <fieldset>
        <legend>${ui.message("bkkh.createBill")}</legend>

        <form class="simple-form-ui" id="uploadFile" method="post">
            <input type="hidden" id="patientId" value="${patient.patient.patientId}"/>
            <label for="name">Name</label>
            <input id="name" type="text" name="name"/>
            <label for="description">Description</label>
            <input id="description" type="text" name="description"/>
            <label for="cost">Cost</label>
            <input id="cost" type="number" name="cost"/>
            <input type="submit" value="Save"/>
        </form>
    </fieldset>
</div>