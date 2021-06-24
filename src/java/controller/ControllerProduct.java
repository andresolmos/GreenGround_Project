/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoProduct;
import dao.cardao;
import dbconect.dbconect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Product;
import validation.ValidationProduct;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author andres Olmos
 */
@Controller
public class ControllerProduct {

    private ValidationProduct ValidationProduct;
    private JdbcTemplate jdbcTemplate;

    /**
     *
     * @author andres Olmos
     */
    public ControllerProduct() {
        dbconect con = new dbconect();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.ValidationProduct = new ValidationProduct();
    }

    @RequestMapping(value = "sub/sellprods.htm", method = RequestMethod.GET)
    public ModelAndView seeshops(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        DaoProduct DaoProduct = new DaoProduct();
        int iduser = Integer.parseInt(request.getParameter("id"));
        mav.addObject("id",iduser);
        mav.addObject("shop",DaoProduct.viewdshops(iduser));
        mav.addObject("product", new Product());
        mav.setViewName("sub/sellprods");
        return mav;
    }

    @RequestMapping(value = "sub/addprod.htm", method = RequestMethod.GET)
    public ModelAndView client(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int iduser = Integer.parseInt(request.getParameter("id"));
        mav.addObject("id", iduser);
        mav.addObject("product", new Product());
        mav.setViewName("sub/addprod");
        return mav;
    }

    /**
     * @param personabean es de donde recupero los datos
     * @param result parametro de validacion
     * @param status parametro de validacion
     * @return retorna una vista
     * @author andres Olmos
     */
    @RequestMapping(value = "sub/addprod.htm", method = RequestMethod.POST)
    public ModelAndView addvlient(@ModelAttribute("Product") Product product,
            BindingResult result,
            SessionStatus status) {
        this.ValidationProduct.validate(product, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            int Id = product.getId_usu();
            mav.addObject("id", Id);
            mav.addObject("product", new Product());
            mav.setViewName("sub/addprod");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView();
            DaoProduct DaoProduct = new DaoProduct();
            String name = product.getNombre();
            String Description = product.getDescripcion();
            double price = product.getPrecio();
            int stock = product.getStock();
            String batch = product.getPro_batch_date();
            String expiration = product.getPro_expiration_date();
            int Id = product.getId_usu();
            String tableud = "tbusuario";
            String typeud = "usu_id_usuario";
            cardao carda = new cardao();
            List astra = carda.searchid(Id, tableud, typeud);
            DaoProduct.addProduct(name, Description, price, stock, expiration, batch, Id);
            mav.addObject("Product", new Product());
            mav.addObject("person", astra);
            mav.addObject("product", DaoProduct.viewAllProductsid(Id));
            mav.setViewName("sub/seller");
            return mav;

        }
    }

    @RequestMapping(value = "sub/modprod.htm", method = RequestMethod.GET)
    public ModelAndView acttclient(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        int idPro = Integer.parseInt(request.getParameter("idPro"));
        Product Product = this.updateProductGET(id, idPro);
        mav.addObject("product", new Product(idPro, Product.getNombre(), Product.getDescripcion(), Product.getPrecio(), Product.getStock(), id, Product.getPro_expiration_date(), Product.getPro_batch_date()));
        mav.addObject("id", id);
        mav.setViewName("sub/modprod");
        return mav;
    }

    @RequestMapping(value = "sub/modprod.htm", method = RequestMethod.POST)
    public ModelAndView modclient(@ModelAttribute("personabean") Product Product,
            BindingResult result,
            SessionStatus status) {
        this.ValidationProduct.validate(Product, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("Product", new Product());
            mav.setViewName("sub/modprod");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView();
            DaoProduct DaoProduct = new DaoProduct();
            int idipro = Product.getIdProducto();
            int idusu = Product.getId_usu();
            String name = Product.getNombre();
            String desc = Product.getDescripcion();
            double price = Product.getPrecio();
            int stock = Product.getStock();
            String batch = Product.getPro_batch_date();
            String expiration = Product.getPro_expiration_date();
            DaoProduct.updateProductPOST(idipro, idusu, name, desc, price, stock, batch, expiration);
            String tableud = "tbusuario";
            String typeud = "usu_id_usuario";
            cardao carda = new cardao();
            List astra = carda.searchid(idusu, tableud, typeud);
            mav.addObject("Product", new Product());
            mav.addObject("person", astra);
            mav.addObject("product", DaoProduct.viewAllProductsid(idusu));
            mav.setViewName("sub/seller");
            return mav;
        }
    }

    /**
     * @param request metodo para obtener parametros
     * @return retorna una vista
     * @author andres Olmos
     */
    @RequestMapping(value = "sub/delprod.htm")
    public ModelAndView borrclient(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int idpro = Integer.parseInt(request.getParameter("idPro"));
        int id = Integer.parseInt(request.getParameter("id"));
        DaoProduct DaoProduct = new DaoProduct();
        DaoProduct.deleteProductById(idpro, id);
        String tableud = "tbusuario";
        String typeud = "usu_id_usuario";
        cardao carda = new cardao();
        List astra = carda.searchid(id, tableud, typeud);
        mav.addObject("Product", new Product());
        mav.addObject("person", astra);
        mav.addObject("product", DaoProduct.viewAllProductsid(id));
        mav.setViewName("sub/seller");
        return mav;
    }

    /**
     * @param id id del cliente
     * @return retorna una vista
     * @author andres Olmos
     */
    public Product updateProductGET(int id, int idpro) {
        Product currentPro = new Product();
        String sql = "select * from tbproducto where usu_id = " + id + " and IdProducto =" + idpro;

        return (Product) this.jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {

            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    currentPro.setNombre(rs.getString("Pro_Nombre"));
                    currentPro.setDescripcion(rs.getString("Pro_Descripcion"));
                    currentPro.setPro_expiration_date(rs.getString("pro_fecha_vencimiento"));
                    currentPro.setPro_batch_date(rs.getString("pro_fecha_lote"));
                    currentPro.setPrecio(rs.getDouble("Pro_Precio"));
                    currentPro.setStock(rs.getInt("Pro_Stock"));
                }

                return currentPro;
            }
        });
    }
}
