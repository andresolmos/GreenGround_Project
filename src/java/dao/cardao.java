/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Statement;
import dbconect.dbconect;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

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


    public void addcar(int id, int idpro, double Precio) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbcarrito (usu_id_usuario,IdProducto,Car_Precio,Car_cantidad) values (" + id + "," + idpro + "," + Precio + ",1)";
        this.jdbctemplate.update(sql);
    }

    public void addshops(int Cantidad, double Precio,int idven, int idpro, int idcliente) {
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbcompras (IdCliente,Shop_fecha,Shop_monto,shop_Estado,idVendedor,IdProducto,shop_cantidad) values ("+idcliente+",'"+ano+"-"+(mes+1)+"-"+dia+"',"+Precio+",'cancelado en envio',"+idven+","+idpro+","+Cantidad+")";
        this.jdbctemplate.update(sql);
    }
    
    public void addsends(int idpro, int idven , int idcliente) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbenvios (IdProducto,Id_Ven,send_state,IdCliente) values ("+idpro+", "+idven+", 'cancelado en envio',"+idcliente+")";
        this.jdbctemplate.update(sql);
    }
    
     public void addpay( double Precio,int idpro,int idven) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "INSERT INTO tbpago (Pay_Monto,Pay_State,IdProducto,idVendedor ) VALUES ("+Precio+", 'sin pagar', "+idpro+","+idven+")";
        this.jdbctemplate.update(sql);
    }
    
    public void addupcar(int Cantidad, double Precio, int idpro, int id) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "update tbcarrito set Car_cantidad = " + Cantidad + ",Car_Precio = " + Precio + "  where 	IdProducto  = " + idpro + " and usu_id_usuario = " + id;
        this.jdbctemplate.update(sql);
    }

    public List searchitem(int id) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "select * from tbcarrito inner join tbproducto on tbproducto.IdProducto = tbcarrito.IdProducto  where usu_id_usuario = '" + id + "'";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
        }
        
    public void addcar(int id, int idpro, String nonbre, int stock, String Descripcion, double Precio) {
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbcarrito (usu_id_usuario,IdProducto,Car_Nombre,Car_Descripcion,Car_Precio,Car_stock,Car_Foto,Car_cantidad) values (" + id + "," + idpro + ",'" + nonbre + "','" + Descripcion + "'," + Precio + "," + stock + ",'0',1)";
        this.jdbctemplate.update(sql);
    }

    public void upshop(int Cantidad, double Precio,int idven, int idpro, int idcliente) {
        Calendar fecha = new GregorianCalendar();
        int ano = fecha.get(Calendar.YEAR);
        int mes = fecha.get(Calendar.MONTH);
        int dia = fecha.get(Calendar.DAY_OF_MONTH);
        this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbcompras (IdCliente,Shop_fecha,Shop_monto,shop_Estado,idVendedor,IdProducto,shop_cantidad) values ("+idcliente+",'"+ano+"-"+(mes+1)+"-"+dia+"',"+Precio+",'cancelado en envio',"+idven+","+idpro+","+Cantidad+")";
        this.jdbctemplate.update(sql);
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
        String sql = "select sum(Car_Precio) as Precio ,usu_id_usuario,count(usu_id_usuario) as size from tbcarrito where usu_id_usuario ="+idusu;
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
