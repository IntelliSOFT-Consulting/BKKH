package org.openmrs.module.bkkh;

import org.openmrs.Patient;
import org.openmrs.Visit;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by gitahi on 30/11/15.
 */
public class Charges {
	private Integer id;
	private Patient patient;
	private Date date;
	private Double stay = new Double(0);
	private Double procedure = new Double(0);
	private Double anaesthesia = new Double(0);
	private Double doctor = new Double(0);
	private Double medications = new Double(0);
	private Double lab = new Double(0);
	private Double xray = new Double(0);
	private Double supplies = new Double(0);
	private Double file = new Double(0);
	private Double followUp = new Double(0);
	private ModeOfPayment modeOfPayment;
	private Set<Payment> payments = new HashSet<Payment>();
	private Visit visit;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Double getStay() {
		return stay == null ? 0 : stay;
	}

	public void setStay(Double stay) {
		this.stay = stay;
	}

	public Double getProcedure() {
		return procedure == null ? 0 : procedure;
	}

	public void setProcedure(Double procedure) {
		this.procedure = procedure;
	}

	public Double getAnaesthesia() {
		return anaesthesia == null ? 0 : anaesthesia;
	}

	public void setAnaesthesia(Double anaesthesia) {
		this.anaesthesia = anaesthesia;
	}

	public Double getDoctor() {
		return doctor == null ? 0 : doctor;
	}

	public void setDoctor(Double doctor) {
		this.doctor = doctor;
	}

	public Double getMedications() {
		return medications == null ? 0 : medications;
	}

	public void setMedications(Double medications) {
		this.medications = medications;
	}

	public Double getLab() {
		return lab == null ? 0 : lab;
	}

	public void setLab(Double lab) {
		this.lab = lab;
	}

	public Double getXray() {
		return xray == null ? 0 : xray;
	}

	public void setXray(Double xray) {
		this.xray = xray;
	}

	public Double getSupplies() {
		return supplies == null ? 0 : supplies;
	}

	public void setSupplies(Double supplies) {
		this.supplies = supplies;
	}

	public Double getFile() {
		return file == null ? 0 : file;
	}

	public void setFile(Double file) {
		this.file = file;
	}

	public Double getFollowUp() {
		return followUp == null ? 0 : followUp;
	}

	public void setFollowUp(Double followUp) {
		this.followUp = followUp;
	}

	public ModeOfPayment getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(ModeOfPayment modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public Double getTotal() {
		return this.getStay() + this.getProcedure() + this.getAnaesthesia() + this.getDoctor() + this.getMedications() + this.getLab() + this.getXray() + this.getSupplies() + this.getFile() + this.getFollowUp();
	}

	public Set<Payment> getPayments() {
		return payments;
	}

	public void setPayments(Set<Payment> payments) {
		this.payments = payments;
	}

	public void addPayment(Payment payment) {
		this.payments.add(payment);
	}

	public Double getBalance() {
		Double totalPayment = 0D;
		for (Payment payment : payments) {
			totalPayment += payment.getPaid();
		}
		Double total = getTotal();
		return total - totalPayment;
	}

	public Visit getVisit() {
		return visit;
	}

	public void setVisit(Visit visit) {
		this.visit = visit;
	}

}
