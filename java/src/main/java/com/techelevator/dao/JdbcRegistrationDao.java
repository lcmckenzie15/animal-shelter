package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Registration;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JdbcRegistrationDao implements RegistrationDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcRegistrationDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
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
            throw new DaoException("Data integrity violation", e);
        }
        return createdRegistration;
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
