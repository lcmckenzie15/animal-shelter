package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.exception.DuplicateEmailException;
import com.techelevator.model.Registration;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.SQLErrorCodes;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcRegistrationDao implements RegistrationDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRegistrationDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Registration> getRegistrationForms() {
        List<Registration> registrations = new ArrayList<>();
        String sql = "SELECT registration_id, email, phone_number, date_of_birth, first_name, last_name, status " +
                "FROM registration " +
                "ORDER BY last_name;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
            while (results.next()) {
                Registration registration = mapRowToRegistration(results);
                registrations.add(registration);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }

        return registrations;
    }

    @Override
    public Registration getRegistrationById(int registrationId) {
        Registration registration = null;
        String sql = "SELECT registration_id, email, phone_number, date_of_birth, first_name, last_name, status " +
                "FROM registration " +
                "WHERE registration_id = ? ";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, registrationId);
            if (results.next()) {
                registration = mapRowToRegistration(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return registration;
    }

    @Override
    public Registration createRegistration(Registration registration) {
        Registration createdRegistration = null;
        final String sql = "INSERT INTO registration(email, phone_number, " +
                "date_of_birth, first_name, last_name, status) " +
                "VALUES (?, ?, ?, ?, ?, 'pending') " +
                "RETURNING registration_id ";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, registration.getEmail(),
                    registration.getPhoneNumber(), registration.getDateOfBirth(),
                    registration.getFirstName(), registration.getLastName());
            if (results.next()) {
                int newRegistrationId = results.getInt("registration_id");
                createdRegistration = this.getRegistrationById(newRegistrationId);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DuplicateEmailException("This email is already in use. Please try a different email.", e);
        }
        return createdRegistration;
    }

    @Override
    public Registration updateRegistrationStatus(Registration registration) {
        Registration updatedRegistration = null;
        final String sql = "UPDATE registration SET status = ? WHERE registration_id = ?;";
        try {
            int numberOfRowsAffected = jdbcTemplate.update(sql, registration.getStatus(), registration.getRegistrationId());
            if (numberOfRowsAffected == 0) {
                throw new DaoException("Zero forms affected.");
            } else {
                updatedRegistration = getRegistrationById(registration.getRegistrationId());
            }
        } catch (CannotGetJdbcConnectionException e) {
                throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
                throw new DaoException("Data integrity violation", e);
        }
        return updatedRegistration;
    }

    private Registration mapRowToRegistration(SqlRowSet results) {
        Registration registration = new Registration();
        registration.setRegistrationId(results.getInt("registration_id"));
        registration.setEmail(results.getString("email"));
        registration.setDateOfBirth(results.getDate("date_of_birth").toLocalDate());
        registration.setFirstName(results.getString("first_name"));
        registration.setLastName(results.getString("last_name"));
        registration.setStatus(results.getString("status"));
        return registration;
    }
}
