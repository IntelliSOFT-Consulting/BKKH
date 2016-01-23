
<%
    ui.decorateWith("appui", "standardEmrPage")
%>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient])}

<div class="dashboard">
	<div class="info-header">
		<h3>Charges</h3>
	</div>
	<div class="info-body">
		<section>
			<fieldset>
				<h3>Stay:</h3>
				<p class="left">
					KES
					${charges.stay}
				</p>
			</fieldset>
			<fieldset>
				<h3>Procedure:</h3>
				<p class="left">
					KES
					${charges.procedure}
				</p>
			</fieldset>
			<fieldset>
				<h3>Anaesthesia:</h3>
				<p class="left">
					KES
					${charges.anaesthesia}
				</p>
			</fieldset>
			<fieldset>
				<h3>Doctor:</h3>
				<p class="left">
					KES
					${charges.doctor}
				</p>
			</fieldset>
			<fieldset>
				<h3>Medication:</h3>
				<p class="left">
					KES
					${charges.medications}
				</p>
			</fieldset>
			<fieldset>
				<h3>Lab:</h3>
				<p class="left">
					KES
					${charges.lab}
				</p>
			</fieldset>
			<fieldset>
				<h3>X-ray:</h3>
				<p class="left">
					KES
					${charges.xray}
				</p>
			</fieldset>
			<fieldset>
				<h3>Supplies:</h3>
				<p class="left">
					KES
					${charges.supplies}
				</p>
			</fieldset>
			<fieldset>
				<h3>File:</h3>
				<p class="left">
					KES
					${charges.file}
				</p>
			</fieldset>
			<fieldset>
				<h3>Follow-up:</h3>
				<p class="left">
					KES
					${charges.followUp}
				</p>
			</fieldset>
		</section>
	</div>
</div>

<div>
	<p>
		<a
			href="${ ui.pageLink("bkkh", "payment", [ chargesId: charges.id, patientId: patient.uuid ]) }">Add
			Charges</a>
	</p>
</div>

<table>
	<thead>
		<tr>
			<th>Payment Date</th>
			<th>Amount</th>
			<th>Method</th>
			<th>Account Charged</th>
		</tr>
	</thead>
	<tbody>
		<% charges.payments.each { payment -> %>
        <tr>
            <td>${payment.paymentDate}</td>
            <td>KES ${payment.paid}</td>
            <td>${payment.modeOfPayment}</td>
            <td>${payment.accountCharged}</td>
        </tr>
    <% } %>
	</tbody>
</table>