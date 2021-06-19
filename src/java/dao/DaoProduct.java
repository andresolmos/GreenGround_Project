/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dbconect.dbconect;
import model.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;

/**
 *
 * @author santi
 */
public class DaoProduct {

    JdbcTemplate jdbctemplate;
    dbconect connection = new dbconect();

    /**
     * AddProduct method allows add a new product to the seller.
     *
     * @param newProduct contains the information to create a new product.
     * @return a integer value to validate it in the test section.
     *
     */
    public void addProduct(String name, String Description, double price, int stock, String expiacion, String batch, int id) {
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "insert into tbproducto (Pro_Nombre,Pro_Foto, Pro_Descripcion,pro_fecha_lote, pro_fecha_vencimiento,Pro_Precio, Pro_Stock, usu_id ) values ('" + name + "','0','" + Description + "','" + batch + "','" + expiacion + "','" + price + "','" + stock + "'," + id + ")";
        this.jdbctemplate.update(sql);
    }

    /**
     * viewProductByName allows view a specify product finded for their name
     *
     * @param pro_name contains the name to find the specify product
     * @return a list that contains the product information.
     *
     */
    public List viewdshops(int id) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "SELECT * FROM tbcompras INNER join tbproducto ON tbcompras.idVendedor = tbproducto.usu_id "
                + "and tbcompras.IdProducto = tbproducto.IdProducto  INNER join tbusuario "
                + "ON tbcompras.IdCliente = tbusuario.usu_id_usuario  where tbcompras.idVendedor = " + id;
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    /**
     * viewProductBySerial allows view a specify product finded for their serial
     *
     * @param pro_serial contains the name to find the specify product
     * @return a list that contains the product information.
     *
     */
    public List viewProductById(int pro_id) {
        String sql = "select * from tbproduct where IdProducto  like " + pro_id;
        List product = this.jdbctemplate.queryForList(sql);
        return product;
    }

    public List viewAllProducts(String correo, String contrasena) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "SELECT * FROM tbproducto INNER JOIN tbusuario ON tbproducto.usu_id  = tbusuario.usu_id_usuario where usu_correo ='" + correo + "' and usu_contrasena = '" + contrasena + "'";
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    public List viewAllProductsid(int id) {
        List Product = new ArrayList();
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "SELECT * FROM tbproducto where usu_id  =" + id;
        Product = this.jdbctemplate.queryForList(sql);
        return Product;
    }

    /**
     * udpateProductGET allows show the information about the product to update
     * and verify what you need to modify.
     *
     * @param pro_serial helps to find the specify object.
     * @return a Product object that contains the information of the object to
     * modify.
     *
     */
    public void updateProductPOST(int idipro, int idusu, String name, String desc, double price, int stock, String batch, String expiration) {
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "update tbproducto set Pro_Nombre = '" + name + "'"
                + ", Pro_Descripcion = '" + desc + "', pro_fecha_vencimiento = '" + expiration + "', pro_fecha_lote = '" + batch + "'" + ", Pro_Precio = '" + price + "',Pro_Stock = " + stock + ""
                + " where IdProducto=" + idipro + " and usu_id=" + idusu;
        this.jdbctemplate.update(sql);
    }

    /**
     * this method allows delete a product by their serial number.
     *
     * @param pro_id contains the product's serial number
     * @return a integer value to validate it in the test section.
     *
     */
    public void deleteProductById(int pro_id, int idusu) {
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "delete from tbproducto where IdProducto= " + pro_id + " and usu_id= " + idusu;
        this.jdbctemplate.update(sql);
    }
    
    public void updatestock(int idipro, int idusu, int stock) {
        this.jdbctemplate = new JdbcTemplate(connection.conectar());
        String sql = "update tbproducto set Pro_Stock = '" + stock + "'"
                + "where IdProducto=" + idipro + " and usu_id=" + idusu;
        this.jdbctemplate.update(sql);
    }
}
