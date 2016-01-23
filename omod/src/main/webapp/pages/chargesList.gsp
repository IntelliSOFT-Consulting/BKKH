
<%
ui.decorateWith("appui", "standardEmrPage")
%>

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
				<td>KES ${charges.date}</td>
				<td>KES ${charges.total}</td>
				<td>KES ${charges.balance}</td>
				<td>
					<span><a href="#" class="details" title="View Charges"><i class="icon-arrow-down"></i></a></span>
					<span><a href="${ui.pageLink("bkkh", "paymentsList", [ chargesId: charges.id, patientId: patient.uuid ]) }" title="View Payments"><i class="icon-list-ol"></i></a></span>
					<span><a href="${ui.pageLink("bkkh", "payment", [ chargesId: charges.id, patientId: patient.uuid ]) }" title="Make Payment"><i class="icon-money"></i></a></span>
				</td>
			</tr>
			<tr class="details-view">
				<td colspan="4">
					<div class="dashboard">
						<div class="info-body">
							<section>
								<fieldset>
									<h3>Stay:</h3>
									<p class="left">KES ${charges.stay}</p>
								</fieldset>
								<fieldset>
									<h3>Procedure:</h3>
									<p class="left">KES ${charges.procedure}</p>
								</fieldset>
								<fieldset>
									<h3>Anaesthesia: </h3>
									<p class="left">KES ${charges.anaesthesia}</p>
								</fieldset>
								<fieldset>
									<h3>Doctor: </h3>
									<p class="left">KES ${charges.doctor}</p>
								</fieldset>
								<fieldset>
									<h3>Medication: </h3>
									<p class="left">KES ${charges.medications}</p>
								</fieldset>
								<fieldset>
									<h3>Lab: </h3>
									<p class="left">KES ${charges.lab}</p>
								</fieldset>
								<fieldset>
									<h3>X-ray: </h3>
									<p class="left">KES ${charges.xray}</p>
								</fieldset>
								<fieldset>
									<h3>Supplies: </h3>
									<p class="left">KES ${charges.supplies}</p>
								</fieldset>
								<fieldset>
									<h3>File: </h3>
									<p class="left">KES ${charges.file}</p>
								</fieldset>
								<fieldset>
									<h3>Follow-up: </h3>
									<p class="left">KES ${charges.followUp}</p>
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
								.addClass("icon-arrow-down");
					} else {
						jq(this).find("i").removeClass("icon-arrow-down")
								.addClass("icon-arrow-up");
					}
				});
	});
</script>