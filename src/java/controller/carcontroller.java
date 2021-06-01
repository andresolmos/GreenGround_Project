/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.cardao;
import dao.clidao;
import dao.dbconect;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Product;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author andre
 */
public class carcontroller {

    private JdbcTemplate jdbcTemplate;

    /**
     *
     * @author andres Olmos
     */
    public carcontroller() {
        dbconect con = new dbconect();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
    }

    @RequestMapping(value = "sub/buyer.htm", method = RequestMethod.GET)
    public ModelAndView carr() {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        mav.addObject("Product", new Product());
        mav.addObject("Product", carda.testprod());
        mav.setViewName("sub/buyer");
        return mav;
    }

    @RequestMapping(value = "sub/car.htm", method = RequestMethod.GET)
    public ModelAndView addCar(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int idproduct = Integer.parseInt(request.getParameter("IdProducto"));
        int iduser = Integer.parseInt(request.getParameter("id_usu"));
        String table = "tbcarrito";
        String tableud = "tbusuario";
        String type = "IdProducto";
        String typeud = "usu_id_usuario";
        cardao carda = new cardao();
        List astra = carda.searchid(iduser, tableud, typeud);
        List astro = carda.searchidconcrect(idproduct, table, type, iduser);
        List astre = carda.show(iduser);
        if (astra == null || astra.isEmpty()) {
            mav.setViewName("redirect:/sub/login.htm");
            return mav;
        } else {
            if (astro == null || astro.isEmpty()) {
                Product Product = this.cargarclientebyid(idproduct);
                carda.addcar(iduser, idproduct, Product.getNombre(), Product.getStock(), Product.getDescripcion(), Product.getPrecio());
                if (astre == null || astre.isEmpty()) {
                carda.evvent(iduser);
                }
                mav.addObject("Product", new Product());
                mav.addObject("person", astra);
                mav.addObject("product", carda.testprod());
                mav.setViewName("sub/buyer");
                return mav;
            } else {
                String tableid = "IdProducto";
                Product Product = this.cargarclientebyidcar(idproduct, tableid, iduser);
                if (Product.getCantidad() > 1) {
                    int Cantidad = Product.getCantidad() + 1;
                    double Precio = Product.getPrecio() + Product.getPrecio() / Product.getCantidad();
                    carda.addupcar(Cantidad, Precio, idproduct, iduser);
                    mav.addObject("Product", new Product());
                    mav.addObject("person", astra);
                    mav.addObject("product", carda.testprod());
                    mav.setViewName("sub/buyer");
                    return mav;
                } else {
                    int Cantidad = Product.getCantidad() + 1;
                    double Precio = Product.getPrecio() + Product.getPrecio();
                    carda.addupcar(Cantidad, Precio, idproduct, iduser);
                    mav.addObject("Product", new Product());
                    mav.addObject("person", astra);
                    mav.addObject("product", carda.testprod());
                    mav.setViewName("sub/buyer");
                    return mav;
                }
            }
        }
    }

    @RequestMapping(value = "sub/shopcar.htm", method = RequestMethod.GET)
    public ModelAndView carshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int iduser = Integer.parseInt(request.getParameter("id_usu"));
        String tableud = "tbcarrito";
        String typeud = "usu_id_usuario";
        List astro = carda.show(iduser);
        List astra = carda.searchid(iduser, tableud, typeud);
        if (astra == null || astra.isEmpty()) {
            String table = "tbusuario";
        String type = "usu_id_usuario";
        List astre = carda.searchid(iduser, table, type);
        mav.addObject("Product", new Product());
        mav.addObject("person", astre);
        mav.addObject("product", carda.testprod());
        mav.setViewName("sub/buyer");
        return mav;
        }else{
        if (astro == null || astro.isEmpty()) {
            mav.addObject("sum", carda.sum(iduser));
            mav.addObject("Product", new Product());
            mav.addObject("product", astra);
            mav.setViewName("sub/shopcar");
            return mav;
        } else {
            carda.drop(iduser);
            mav.addObject("sum", carda.sum(iduser));
            mav.addObject("Product", new Product());
            mav.addObject("product", astra);
            mav.setViewName("sub/shopcar");
            return mav;
        }
        }
    }

    @RequestMapping(value = "sub/decar.htm", method = RequestMethod.GET)
    public ModelAndView decarshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int idusu = Integer.parseInt(request.getParameter("idusu"));
        int idproduct = Integer.parseInt(request.getParameter("IdProducto"));
        carda.deleitemcar(idusu, idproduct);
        mav.setViewName("redirect:/sub/shopcar.htm?id_usu=" + idusu);
        return mav;
    }

    @RequestMapping(value = "sub/elicar.htm", method = RequestMethod.GET)
    public ModelAndView elicarshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int idusu = Integer.parseInt(request.getParameter("idusu"));
        carda.deletecar(idusu);
        mav.setViewName("redirect:/sub/shopcar.htm?id_usu=" + idusu);
        return mav;
    }

    @RequestMapping(value = "sub/segcar.htm", method = RequestMethod.GET)
    public ModelAndView segcarshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int idusu = Integer.parseInt(request.getParameter("idusu"));
        String table = "tbusuario";
        String type = "usu_id_usuario";
        List astra = carda.searchid(idusu, table, type);
        mav.addObject("Product", new Product());
        mav.addObject("person", astra);
        mav.addObject("product", carda.testprod());
        mav.setViewName("sub/buyer");
        return mav;
    }

    @RequestMapping(value = "sub/upcar.htm", method = RequestMethod.GET)
    public ModelAndView upcarshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int idusu = Integer.parseInt(request.getParameter("idusu"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idproduct = Integer.parseInt(request.getParameter("IdProducto"));
        String tableid = "IdProducto";
        Product Product = this.cargarclientebyidcar(idproduct, tableid, idusu);
        if (Product.getCantidad() > cantidad) {
            double Precioresta = Product.getPrecio() / Product.getCantidad();
            int cantidadreal = Product.getCantidad() - cantidad;
            double Precioreal = Product.getPrecio() - (Precioresta * cantidadreal);
            carda.addupcar(cantidad, Precioreal, idproduct, idusu);

            mav.setViewName("redirect:/sub/shopcar.htm?id_usu=" + idusu);
            return mav;
        } else {
            if (Product.getCantidad() < 1) {
                double Precio = Product.getPrecio() + ((cantidad - 1) * (Product.getPrecio() / Product.getCantidad()));
                carda.addupcar(cantidad, Precio, idproduct, idusu);
                mav.setViewName("redirect:/sub/shopcar.htm?id_usu=" + idusu);
                return mav;
            } else {
                double Precio = cantidad * (Product.getPrecio() / Product.getCantidad());
                carda.addupcar(cantidad, Precio, idproduct, idusu);
                mav.setViewName("redirect:/sub/shopcar.htm?id_usu=" + idusu);
                return mav;
            }
        }

    }

    public Product cargarclientebyid(int id) {
        final Product Product = new Product();
        String sql = "select * from tbproducto where IdProducto =" + id;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Nombre"));
                    Product.setDescripcion(rs.getString("Descripcion"));
                    Product.setPrecio(rs.getDouble("Precio"));
                    Product.setStock(rs.getInt("Stock"));
                }
                return Product;
            }

        }
        );
    }

    public Product cargarclientebyidcar(int id, String tableid, int idusu) {
        final Product Product = new Product();
        String sql = "select * from tbcarrito where " + tableid + " =" + id + " and usu_id_usuario =" + idusu;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Nombre"));
                    Product.setDescripcion(rs.getString("Descripcion"));
                    Product.setPrecio(rs.getDouble("Precio"));
                    Product.setStock(rs.getInt("Stock"));
                    Product.setItem(rs.getInt("Item"));
                    Product.setCantidad(rs.getInt("Cantidad"));
                }
                return Product;
            }

        }
        );
    }

}
