
<%
    import java.text.DecimalFormat
    def formatter = new DecimalFormat("#0.00")

    ui.decorateWith("appui", "standardEmrPage")
    ui.includeCss("bkkh", "bkkh.css");
%>

<script>
var breadcrumbs = [
    { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
    { label: "${ ui.escapeJs(ui.format(patient)) }", link: "${ ui.pageLink('coreapps', 'clinicianfacing/patient', [ patientId: patient.uuid ]) }" },
    { label: "${ ui.message("bkkh.charges.list") }", link: "${ ui.pageLink('bkkh', 'chargesList') }" }
];
</script>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient])}

<div>
	<p>
		<a
			href="${ ui.pageLink("bkkh", "charges", [ patientId: patient.uuid ]) }">Add
			Charges</a>
	</p>
</div>

<table>
	<thead>
		<tr>
			<th>Date</th>
			<th>Total</th>
			<th>Balance</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<% chargesList.each { charges -> %>
			<tr>
				<td>${charges.date != null ? ui.formatDatetimePretty(charges.date) : '--'}</td>
				<td class="align-right">${formatter.format(charges.total)}</td>
				<td class="align-right">${formatter.format(charges.balance)}</td>
				<td>
					<span><a href="#" class="details" title="View Charges"><i class="icon-arrow-down"></i></a></span>
					<span><a href="${ui.pageLink("bkkh", "chargesSummary", [ chargesId: charges.id, patientId: patient.uuid ]) }" title="View Charges Details"><i class="icon-external-link"></i></a></span>
					<span><a href="${ui.pageLink("bkkh", "payment", [ chargesId: charges.id, patientId: patient.uuid ]) }" title="Record Payment"><i class="icon-pencil"></i></a></span>
				</td>
			</tr>
			<tr class="details-view">
				<td colspan="4">
					<div class="dashboard">
						<div class="info-body">
							<section>
								<fieldset>
									<h3>Stay:</h3>
									<p class="left">${formatter.format(charges.stay)}</p>
								</fieldset>
								<fieldset>
									<h3>Procedure:</h3>
									<p class="left">${formatter.format(charges.procedure)}</p>
								</fieldset>
								<fieldset>
									<h3>Anaesthesia: </h3>
									<p class="left">${formatter.format(charges.anaesthesia)}</p>
								</fieldset>
								<fieldset>
									<h3>Doctor: </h3>
									<p class="left">${formatter.format(charges.doctor)}</p>
								</fieldset>
								<fieldset>
									<h3>Medication: </h3>
									<p class="left">${formatter.format(charges.medications)}</p>
								</fieldset>
								<fieldset>
									<h3>Lab: </h3>
									<p class="left">${formatter.format(charges.lab)}</p>
								</fieldset>
								<fieldset>
									<h3>X-ray: </h3>
									<p class="left">${formatter.format(charges.xray)}</p>
								</fieldset>
								<fieldset>
									<h3>Supplies: </h3>
									<p class="left">${formatter.format(charges.supplies)}</p>
								</fieldset>
								<fieldset>
									<h3>File: </h3>
									<p class="left">${formatter.format(charges.file)}</p>
								</fieldset>
								<fieldset>
									<h3>Follow-up: </h3>
									<p class="left">${formatter.format(charges.followUp)}</p>
								</fieldset>
							</section>
						</div>
					</div>
				</td>
			</tr>
		<% } %>
	</tbody>
</table>

<script>
	jq(function() {
		jq(".details-view").hide();
		jq(".details").on(
				"click",
				function(event) {
					event.preventDefault();
					var details = jq(this).parents("tr").next();
					jq(details).toggle();
					if (!jq(details).is(":visible")) {
						jq(this).find("i").removeClass("icon-arrow-up")
								.addClass("icon-arrow-down")
								.parent()
								.attr('title', 'View Charges');
					} else {
						jq(this).find("i").removeClass("icon-arrow-down")
								.addClass("icon-arrow-up")
								.parent()
								.attr('title', 'Hide Charges');
					}
				});
	});
</script>
