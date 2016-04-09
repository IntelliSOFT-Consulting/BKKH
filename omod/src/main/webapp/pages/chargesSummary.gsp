
<%
    import java.text.DecimalFormat
    def formatter = new DecimalFormat("#0.00")
    ui.includeCss("bkkh", "bkkh.css");
    ui.decorateWith("appui", "standardEmrPage")
%>

<script>
var breadcrumbs = [
    { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
    { label: "${ ui.escapeJs(ui.format(patient)) }", link: "${ ui.pageLink('coreapps', 'clinicianfacing/patient', [ patientId: patient ]) }" },
    { label: "${ ui.message('bkkh.charges.list') }", link: "${ ui.pageLink("bkkh", "chargesList", [patientId: patient]) }" },
    { label: "${ ui.message('bkkh.payments') }", link: "${ ui.pageLink('bkkh', 'chargesSummary') }" }
];
</script>

${ui.includeFragment("coreapps", "patientHeader", [patient: patient])}

<div class="dashboard">
	<div class="info-header">
		<h3>
			Charges 
			<span>
				<small>
					<a href="${ui.pageLink("bkkh", "charges", [patientId: patient, chargesId: charges.id])}">(Edit)</a>
				</small>
			</span>
		</h3>
	</div>
	<div class="info-body">
		<section>
			<fieldset>
				<h3>Stay:</h3>
				<p class="left">
					${formatter.format(charges.stay)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Procedure:</h3>
				<p class="left">
					${formatter.format(charges.procedure)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Anaesthesia:</h3>
				<p class="left">
					${formatter.format(charges.anaesthesia)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Doctor:</h3>
				<p class="left">
					${formatter.format(charges.doctor)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Medication:</h3>
				<p class="left">
					${formatter.format(charges.medications)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Lab:</h3>
				<p class="left">
					${formatter.format(charges.lab)}
				</p>
			</fieldset>
			<fieldset>
				<h3>X-ray:</h3>
				<p class="left">
					${formatter.format(charges.xray)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Supplies:</h3>
				<p class="left">
					${formatter.format(charges.supplies)}
				</p>
			</fieldset>
			<fieldset>
				<h3>File:</h3>
				<p class="left">
					${formatter.format(charges.file)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Follow-up:</h3>
				<p class="left">
					${formatter.format(charges.followUp)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Total:</h3>
				<p class="left">
					${formatter.format(charges.total)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Amount Paid:</h3>
				<p class="left">
					${formatter.format(charges.total - charges.balance)}
				</p>
			</fieldset>
			<fieldset>
				<h3>Balance:</h3>
				<p class="left">
					${formatter.format(charges.balance)}
				</p>
			</fieldset>
		</section>
	</div>
</div>

<div>
	<p>
		<a
			href="${ ui.pageLink("bkkh", "payment", [ chargesId: charges.id, patientId: patient.uuid ]) }">Add
			Payment</a>
	</p>
</div>

<table>
	<thead>
		<tr>
			<th>Payment Date</th>
			<th>Amount</th>
			<th>Method</th>
			<th>Account Charged</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<% charges.payments.each { payment -> %>
        <tr>
            <td>${payment.paymentDate != null ? ui.formatDatetimePretty(payment.paymentDate) : '--' }</td>
            <td class="align-right">${formatter.format(payment.paid)}</td>
            <td>${ui.message(payment.modeOfPayment.messageKey)}</td>
            <td>${ui.format(payment.chargeAccount?.accountName)}</td>
            <td><a href="${ui.pageLink("bkkh", "payment", [ chargesId: charges.id, patientId: patient.uuid, paymentId: payment.id ]) }" title="Edit Payment"><i class="icon-edit"></i></a></td>
        </tr>
    <% } %>
	</tbody>
</table>
