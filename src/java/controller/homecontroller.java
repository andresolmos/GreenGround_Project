/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DaoProduct;
import dao.cardao;
import validation.personavalidationbean;
import dao.clidao;
import dbconect.dbconect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.Product;
import model.personabean;
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
 * @author andre
 */
@Controller
public class homecontroller {

    private personavalidationbean personavalidar;
    private JdbcTemplate jdbcTemplate;

    /**
     *
     * @author andres Olmos
     */
    public homecontroller() {
        dbconect con = new dbconect();
        this.jdbcTemplate = new JdbcTemplate(con.conectar());
        this.personavalidar = new personavalidationbean();
    }

    @RequestMapping(value = "sub/register.htm", method = RequestMethod.GET)
    public ModelAndView client() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("personabean", new personabean());
        mav.setViewName("sub/register");
        return mav;
    }

    @RequestMapping(value = "sub/register.htm", method = RequestMethod.POST)
    public ModelAndView addvlient(@ModelAttribute("personabean") personabean personabean,
            BindingResult result,
            SessionStatus status) {
        this.personavalidar.validate(personabean, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("personabean", new personabean());
            mav.setViewName("sub/register");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView();
            clidao clida = new clidao();
            String nombre = personabean.getUsu_nombre_usuario();
            String apellido = personabean.getUsu_apellido_usuario();
            String edad = personabean.getNum_cel();
            String correo = personabean.getUsu_correo_vendedor();
            String contrasena = personabean.getContrasena();
            String direccion = personabean.getUsu_dir();
            List astra = clida.validaregister(correo);

            if (astra == null || astra.isEmpty()) {
                clida.actcliente(nombre, apellido, edad, correo, contrasena, direccion);
                mav.setViewName("redirect:/sub/login.htm");
                return mav;
            } else {
                mav.addObject("asa", "Ya existe un usuario registrado con ese correo");
                mav.setViewName("/sub/register");
                return mav;
            }
        }

    }

    @RequestMapping(value = "sub/login.htm", method = RequestMethod.GET)
    public ModelAndView ing() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("personabean", new personabean());
        mav.setViewName("sub/login");
        return mav;
    }

    @RequestMapping(value = "sub/login.htm", method = RequestMethod.POST)
    public ModelAndView adding(@ModelAttribute("personabean") personabean personabean,
            BindingResult result,
            SessionStatus status) {
        this.personavalidar.validate(personabean, result);
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView();
            mav.addObject("personabean", new personabean());
            mav.setViewName("sub/login");
            return mav;
        } else {
            ModelAndView mav = new ModelAndView();
            clidao clida = new clidao();
            cardao carda = new cardao();
            String rol = personabean.getRol();
            String nombre = personabean.getUsu_correo_vendedor();
            String apellido = personabean.getContrasena();
            List astra = clida.consultarcliente(nombre, apellido);

            if (astra == null || astra.isEmpty()) {
                mav.addObject("as", "Datos Incorrectos");
                mav.setViewName("sub/login");
                return mav;
            } else {
                if ("Vendedor".equals(rol)) {
                    DaoProduct DaoProduct = new DaoProduct();
                    mav.addObject("Product", new Product());
                    mav.addObject("person", astra);
                    mav.addObject("product", DaoProduct.viewAllProducts(nombre, apellido));
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

        }
    }

    @RequestMapping(value = "sub/remenber.htm", method = RequestMethod.GET)
    public ModelAndView rec() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("personabean", new personabean());
        mav.setViewName("sub/remenber");
        return mav;
    }

    @RequestMapping(value = "sub/remenber.htm", method = RequestMethod.POST)
    public ModelAndView recing(@ModelAttribute("personabean") personabean personabean) {
        ModelAndView mav = new ModelAndView();
        clidao clida = new clidao();
        String rec = clida.generarpalabra();
        String correo = personabean.getUsu_correo_vendedor();

        if (!correo.equals("")) {
            List astra = clida.busreccliente(correo);
            clida.reccliente(correo, rec);
            String asunto = "CORREO DE RECUPERACION || GreenGround";
            String cuerpo = "El codigo de recuperacion para cambio de clave es: "
                    + "---" + rec + "---, Por favor regrese a la pagina y cambie su contraseña";
            if (astra == null || astra.isEmpty()) {
                mav.addObject("asa", "El correo del usuario no existe");
                mav.setViewName("sub/remenber");
                return mav;
            } else {
                clida.enviarConGMail(correo, asunto, cuerpo);
                mav.setViewName("redirect:/sub/uppass.htm");
                return mav;
            }
        } else {
            mav.addObject("asa", "El espacio esta vacio");
            mav.setViewName("sub/remenber");
            return mav;
        }
    }

    @RequestMapping(value = "sub/uppass.htm", method = RequestMethod.GET)
    public ModelAndView uppass(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("personabean", new personabean());
        mav.setViewName("sub/uppass");
        return mav;
    }

    @RequestMapping(value = "sub/uppass.htm", method = RequestMethod.POST)
    public ModelAndView uppassing(@ModelAttribute("personabean") personabean personabean) {
        ModelAndView mav = new ModelAndView();
        clidao clida = new clidao();
        String confirmacion = personabean.getConfirm();
        String recuperacion = personabean.getRec();
        String contrasena = personabean.getContrasena();
        if (!confirmacion.equals("") && !recuperacion.equals("") && !contrasena.equals("")) {
            if (confirmacion.equals(contrasena)) {
                clida.modcliente(contrasena, recuperacion);
                mav.setViewName("redirect:/sub/login.htm");
                return mav;
            } else {
                mav.addObject("asa", "contraseña no coincide");
                mav.setViewName("sub/uppass");
                return mav;
            }
        } else {
            mav.addObject("asa", "el espacio esta vacio");
            mav.setViewName("sub/uppass");
            return mav;
        }
    }

    @RequestMapping(value = "sub/config.htm", method = RequestMethod.GET)
    public ModelAndView acttclient(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        int id = Integer.parseInt(request.getParameter("id"));
        String rol = request.getParameter("rol");
        personabean personabean = this.cargarclientebyid(id);
        mav.addObject("rol", rol);
        mav.addObject("id", id);
        mav.addObject("personabean", new personabean(id, personabean.getUsu_nombre_usuario(), personabean.getUsu_apellido_usuario(), personabean.getUsu_correo_vendedor(), personabean.getUsu_dir(), personabean.getNum_cel()));
        mav.setViewName("sub/config");
        return mav;
    }

    @RequestMapping(value = "sub/config.htm", method = RequestMethod.POST)
    public ModelAndView modclient(@ModelAttribute("personabean") personabean personabean,
            BindingResult result,
            SessionStatus status) {
        ModelAndView mav = new ModelAndView();
        clidao clidao = new clidao();
        cardao carda = new cardao();
        int id = personabean.getUsu_id_usuario();
        String correo = personabean.getUsu_correo_vendedor();
        String nombre = personabean.getUsu_nombre_usuario();
        String apellido = personabean.getUsu_apellido_usuario();
        String celular = personabean.getNum_cel();
        String dir = personabean.getUsu_dir();
        String rol = personabean.getRol();
        clidao.modicliente(nombre, apellido, correo, celular, dir, id);
        String table = "tbusuario";
        String type = "usu_id_usuario";
        List astra = carda.searchid(id, table, type);
        if ("Vendedor".equals(rol)) {
            DaoProduct DaoProduct = new DaoProduct();
            mav.addObject("Product", new Product());
            mav.addObject("person", astra);
            mav.addObject("product", DaoProduct.viewAllProductsid(id));
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

    @RequestMapping(value = "sub/stats.htm", method = RequestMethod.GET)
    public ModelAndView stats() {
        ModelAndView mav = new ModelAndView();
        clidao clidao = new clidao();
        cardao carda = new cardao();
        String columna = "SUM(tbcompras.Shop_monto) AS monto,Shop_fecha";
        String column = "tbusuario.usu_nombre ,tbusuario.usu_apellido,tbusuario."
                + "usu_correo,tbusuario.num_cel ,SUM(tbcompras.shop_cantidad) AS cantidad";
        String condicionalsel = "group by idVendedor";
        String condicionalbuy = "group by IdCliente";
        String condicionalfech = "group by Shop_fecha";
        mav.addObject("bestprod", clidao.mostseller());
        mav.addObject("bestfech",clidao.statscompras(columna, condicionalfech));
        mav.addObject("bestseller",clidao.statscompras(column, condicionalsel));
        mav.addObject("amountcant", carda.testprod().size());
        mav.addObject("amountusers", clidao.users().size());
        mav.addObject("bestbuyer",clidao.statscompras(column, condicionalbuy));
        mav.setViewName("sub/stats");
        return mav;
    }

    public personabean cargarclientebyid(int id) {
        final personabean personabean = new personabean();
        String sql = "select * from tbusuario where usu_id_usuario  = " + id;
        return (personabean) jdbcTemplate.query(sql, new ResultSetExtractor<personabean>() {
            public personabean extractData(ResultSet rs) throws SQLException, DataAccessException {
                if (rs.next()) {
                    personabean.setUsu_nombre_usuario(rs.getString("usu_nombre"));
                    personabean.setUsu_apellido_usuario(rs.getString("usu_apellido"));
                    personabean.setUsu_correo_vendedor(rs.getString("usu_correo"));
                    personabean.setNum_cel(rs.getString("num_cel"));
                    personabean.setUsu_dir(rs.getString("usu_dir"));
                }
                return personabean;
            }

        }
        );
    }

}
