/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aurora.account.mapper;
import com.aurora.account.model.School;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author Dilshan Navodya
 */
public class SchoolRowMapper implements RowMapper {

    @Override
    public Object mapRow(ResultSet rs, int i) throws SQLException {
        School school = new School();

        school.setSch_id(rs.getString("id"));
        school.setName(rs.getString("name"));
        school.setDivision(rs.getString("division"));
        school.setDistrict(rs.getString("district"));
        school.setProvince(rs.getString("province"));
        school.setEligible_count(rs.getString("eligible_count"));
        return school;
    }
    
    
}
