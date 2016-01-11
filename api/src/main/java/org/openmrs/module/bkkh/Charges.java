package org.openmrs.module.bkkh;

import org.openmrs.Patient;

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
	private double stay;
	private double procedure;
	private double anaesthesia;
	private double doctor;
	private double medications;
	private double lab;
	private double xray;
	private double supplies;
	private double file;
	private double followUp;
	private ModeOfPayment modeOfPayment;
	private Set<Payment> payments = new HashSet<Payment>();

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

	public double getStay() {
		return stay;
	}

	public void setStay(double stay) {
		this.stay = stay;
	}

	public double getProcedure() {
		return procedure;
	}

	public void setProcedure(double procedure) {
		this.procedure = procedure;
	}

	public double getAnaesthesia() {
		return anaesthesia;
	}

	public void setAnaesthesia(double anaesthesia) {
		this.anaesthesia = anaesthesia;
	}

	public double getDoctor() {
		return doctor;
	}

	public void setDoctor(double doctor) {
		this.doctor = doctor;
	}

	public double getMedications() {
		return medications;
	}

	public void setMedications(double medications) {
		this.medications = medications;
	}

	public double getLab() {
		return lab;
	}

	public void setLab(double lab) {
		this.lab = lab;
	}

	public double getXray() {
		return xray;
	}

	public void setXray(double xray) {
		this.xray = xray;
	}

	public double getSupplies() {
		return supplies;
	}

	public void setSupplies(double supplies) {
		this.supplies = supplies;
	}

	public double getFile() {
		return file;
	}

	public void setFile(double file) {
		this.file = file;
	}

	public double getFollowUp() {
		return followUp;
	}

	public void setFollowUp(double followUp) {
		this.followUp = followUp;
	}

	public ModeOfPayment getModeOfPayment() {
		return modeOfPayment;
	}

	public void setModeOfPayment(ModeOfPayment modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}

	public double getTotal() {
		return stay + procedure + anaesthesia + doctor + medications + lab + xray + supplies + file + followUp;
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

	public double getBalance() {
		double totalPayment = 0;
		for (Payment payment : payments) {
			totalPayment += payment.getPaid();
		}
		return getTotal() - totalPayment;
	}

}
