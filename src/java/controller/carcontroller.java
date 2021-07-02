/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import dao.DaoProduct;
import dao.cardao;
import dao.clidao;
import dbconect.dbconect;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.personabean;
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
                carda.addcar(iduser, idproduct, Product.getPrecio());
                if (astre == null || astre.isEmpty()) {
                    carda.evvent(iduser);
                }
                mav.addObject("Product", new Product());
                mav.addObject("person", astra);
                mav.addObject("product", carda.testprod());
                mav.setViewName("sub/buyer");
                return mav;
            } else {
                String tableid = "tbproducto.IdProducto";
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
        String tableud = "tbcarrito inner join tbproducto on tbproducto.IdProducto = tbcarrito.IdProducto";
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
        } else {
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
        String rol = request.getParameter("rol");
        String table = "tbusuario";
        String type = "usu_id_usuario";
        List astra = carda.searchid(idusu, table, type);
        if ("Vendedor".equals(rol)) {
            DaoProduct DaoProduct = new DaoProduct();
            mav.addObject("Product", new Product());
            mav.addObject("person", astra);
            mav.addObject("product", DaoProduct.viewAllProductsid(idusu));
            mav.setViewName("sub/seller");
            return mav;
        } else {
            mav.addObject("Product", new Product());
            mav.addObject("person", astra);
            mav.addObject("product", carda.testprod());
            mav.setViewName("sub/buyer");
            return mav;
        }
    }

    @RequestMapping(value = "sub/upcar.htm", method = RequestMethod.GET)
    public ModelAndView upcarshop(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        cardao carda = new cardao();
        int idusu = Integer.parseInt(request.getParameter("idusu"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        int idproduct = Integer.parseInt(request.getParameter("IdProducto"));
        String tableid = "tbproducto.IdProducto";
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

    @RequestMapping(value = "sub/showbuy.htm", method = RequestMethod.GET)
    public ModelAndView showbuy(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("idusu"));
        cardao carda = new cardao();
        clidao clida = new clidao();
        DaoProduct prod = new DaoProduct();
        List astra = carda.searchitem(id);
        int o = 1;
        do {
            int idpro = Integer.parseInt(request.getParameter("idpro_" + o));
            Product Product = this.cargarusuariobyid(idpro);
            Product carrito = this.cargarclientebyidcar(id);
            int stock = Product.getStock() - carrito.getCantidad();
            carda.addshops(carrito.getCantidad(), carrito.getPrecio(), Product.getId_usu(), idpro, id);
            carda.addpay( carrito.getPrecio(), idpro, id);
            carda.addsends(idpro,Product.getId_usu(), id );
            prod.updatestock(idpro, Product.getId_usu(), stock);
            //carda.deleitemcar(id, idpro);
            String asunto = "AVISO DE COMPRA || GreenGround";
            String cuerpo = "Se ha realizado la compra a uno de los productos que publico, el cual es " + Product.getNombre() + ""
                    + ", se le compro una cantidad de " + carrito.getCantidad() + " y el total que le deben cancelar es: $" + carrito.getPrecio();
            clida.enviarConGMail(Product.getUsu_correo_vendedor(), asunto, cuerpo);
            o = o + 1;
        } while (o == astra.size());
        mav.addObject("id", id);
        mav.addObject("product", new Product());
        mav.setViewName("sub/showbuy");
        return mav;
    }

   @RequestMapping(value = "sub/pdfdown.htm", method = RequestMethod.GET)
    public void cretePdf(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("application/pdf");
        cardao carda = new cardao();
        int idUsuario = Integer.parseInt(req.getParameter("idusu"));
        HashMap productos = new HashMap();
        productos = (HashMap) carda.searchitem(idUsuario);
        /*
        
        {IdProducto=19, Car_Precio=100000.0, Car_Item=152, usu_id_usuario=12, 
        Car_cantidad=1, Pro_Nombre=curcuma, Pro_Foto=[B@17b81d35, Pro_Descripcion=sadsd, 
        Pro_Precio=100000.0, Pro_Stock=22, pro_fecha_lote=2021-07-01, pro_fecha_vencimiento=2021-06-05, 
        usu_id=5}
         */

        //for productos.size() para coger todos los valores
        /*Declaración del documento PDF*/
        PdfWriter writer = new PdfWriter(res.getOutputStream());
        PdfDocument pdf = new PdfDocument(writer);
        Document document = new Document(pdf);
        document.setMargins(20, 20, 20, 20);

        
        
        document.add(new Paragraph("Nombre del Producto: " + productos.get("Pro_Nombre").toString()));
        document.add(new Paragraph("Precio del Producto: " + productos.get("Pro_Precio").toString()));
        document.add(new Paragraph("Cantidad Producto: " + productos.get("Car_Cantidad").toString()));
        document.add(new Paragraph("Total: " + productos.get("Car_Precio").toString()));

        /*productos.forEach(k,v) -> (
            
            document.add(new Paragraph("Nombre del Producto: " + productos.get("Pro_Nombre").toString()));
            document.add(new Paragraph("Precio del Producto: " + productos.get("Pro_Precio").toString()));
            document.add(new Paragraph("Cantidad Producto: " + productos.get("Car_Cantidad").toString()));
            document.add(new Paragraph("Total: " + productos.get("Car_Precio").toString()));
        
        
        );*/
 /*
            float pointColumnWidths1[] = {150f, 150f};
            Table table = new Table(3);
            Cell cel1 = new Cell();
            Cell cel2 = new Cell();
            Cell cel3 = new Cell();
            
            table.addCell(cel1);
            table.addCell(cel2);
            table.addCell(cel3);
         */
        document.close();

    }

    public Product cargarusuariobyid(int id) {
        final Product Product = new Product();
        String sql = "SELECT * FROM tbproducto INNER JOIN tbusuario ON tbproducto.usu_id = tbusuario.usu_id_usuario WHERE IdProducto =" + id;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setId_usu(rs.getInt("usu_id"));
                    Product.setUsu_correo_vendedor(rs.getString("usu_correo"));
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Pro_Nombre"));
                    Product.setDescripcion(rs.getString("Pro_Descripcion"));
                    Product.setPrecio(rs.getDouble("Pro_Precio"));
                    Product.setStock(rs.getInt("Pro_Stock"));
                }
                return Product;
            }

        }
        );
    }

    public Product cargarclientebyid(int id) {
        final Product Product = new Product();
        String sql = "select * from tbproducto where IdProducto =" + id;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Pro_Nombre"));
                    Product.setDescripcion(rs.getString("Pro_Descripcion"));
                    Product.setPrecio(rs.getDouble("Pro_Precio"));
                    Product.setStock(rs.getInt("Pro_Stock"));
                }
                return Product;
            }

        }
        );
    }

    public Product cargarclientebyidcar(int id, String tableid, int idusu) {
        final Product Product = new Product();
        String sql = "select * from tbcarrito inner join tbproducto on tbproducto.IdProducto = tbcarrito.IdProducto where " + tableid + " =" + id + " and usu_id_usuario =" + idusu;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Pro_Nombre"));
                    Product.setDescripcion(rs.getString("Pro_Descripcion"));
                    Product.setPrecio(rs.getDouble("Car_Precio"));
                    Product.setStock(rs.getInt("Pro_Stock"));
                    Product.setItem(rs.getInt("Car_Item"));
                    Product.setCantidad(rs.getInt("Car_cantidad"));
                }
                return Product;
            }

        }
        );
    }

    public Product cargarclientebyidcar(int idusu) {
        final Product Product = new Product();
        String sql = "select * from tbcarrito inner join tbproducto on tbproducto.IdProducto = tbcarrito.IdProducto where usu_id_usuario =" + idusu;
        return (Product) jdbcTemplate.query(sql, new ResultSetExtractor<Product>() {
            public Product extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    Product.setIdProducto(rs.getInt("IdProducto"));
                    Product.setNombre(rs.getString("Pro_Nombre"));
                    Product.setDescripcion(rs.getString("Pro_Descripcion"));
                    Product.setPrecio(rs.getDouble("Car_Precio"));
                    Product.setStock(rs.getInt("Pro_Stock"));
                    Product.setItem(rs.getInt("Car_Item"));
                    Product.setCantidad(rs.getInt("Car_cantidad"));
                }
                return Product;
            }

        }
        );
    }
}
