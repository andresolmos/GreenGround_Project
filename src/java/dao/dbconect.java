/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import org.springframework.jdbc.datasource.DriverManagerDataSource;

/**
 *
 * @author andre
 */
public class dbconect {

    public DriverManagerDataSource conectar() {
        DriverManagerDataSource datasource = new DriverManagerDataSource();
        datasource.setDriverClassName("com.mysql.jdbc.Driver");
        datasource.setUrl("jdbc:mysql://localhost/greenground");
        datasource.setUsername("root");
        datasource.setPassword("");

        return datasource;
    }
}
