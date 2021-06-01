/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author andre
 */
public class cardao {

    JdbcTemplate jdbctemplate;
    dbconect con = new dbconect();

    public List testprod() {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select * from tbproducto";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public void addcar(int id, int idpro, String nonbre, int stock, String Descripcion, double Precio) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbcarrito (usu_id_usuario,IdProducto,Nombre,Descripcion,Precio,stock,Foto,Cantidad) values (" + id + "," + idpro + ",'" + nonbre + "','" + Descripcion + "'," + Precio + "," + stock + ",'0',1)";
        this.jdbctemplate.update(sql);
    }

    public void addupcar(int Cantidad, double Precio, int idpro, int id) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "update tbcarrito set Cantidad = " + Cantidad + ",Precio = " + Precio + "  where 	IdProducto  = " + idpro + " and usu_id_usuario = " + id;
        this.jdbctemplate.update(sql);
    }

    public List searchitem(int id) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select * from tbcarrito where usu_id_usuario = '" + id + "'";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public List searchid(int id, String table, String type) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select * from " + table + " where " + type + " = '" + id + "'";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public List searchidconcrect(int id, String table, String type, int idusu) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select * from " + table + " where " + type + " = '" + id + "' and usu_id_usuario = " + idusu + "";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public List sum(int idusu) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select sum(Precio) as Precio ,usu_id_usuario from tbcarrito where usu_id_usuario ="+idusu;
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public void evvent(int id) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "CREATE EVENT bor_datos_"+id+" ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 60 MINUTE "
                + "DO DELETE FROM tbcarrito WHERE usu_id_usuario = " + id + "";
        this.jdbctemplate.update(sql);
    }
    
    public void deleitemcar(int id, int idpro) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "DELETE FROM tbcarrito WHERE usu_id_usuario = " + id + " and IdProducto = "+idpro;
        this.jdbctemplate.update(sql);
    }
    
    public void deletecar(int id) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "DELETE FROM tbcarrito WHERE usu_id_usuario = " + id + "";
        this.jdbctemplate.update(sql);
    }
    
    public List show(int id) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "SHOW events where Name = 'bor_datos_"+id+"'";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }
    
    public void drop(int id) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "DROP EVENT bor_datos_"+id;
        this.jdbctemplate.update(sql);
    }
}
