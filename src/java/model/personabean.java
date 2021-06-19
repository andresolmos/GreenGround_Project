/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.ejb.Stateless;

/**
 *
 * @author andre
 */
@Stateless
public class personabean {

    private int usu_id_usuario;
    private int idProducto;
    private String usu_nombre_usuario;
    private String usu_apellido_usuario;
    private String usu_correo_vendedor;
    private String num_cel;
    private String contrasena;
    private String usu_dir;
    private String rol;
    private String rec;
    private String confirm;

    public personabean() {
    }

    public personabean(int usu_id_usuario, int idProducto, String usu_nombre_usuario, String usu_apellido_usuario, String usu_correo_vendedor, String num_cel, String contrasena, String usu_dir, String rol, String rec, String confirm) {
        this.usu_id_usuario = usu_id_usuario;
        this.idProducto = idProducto;
        this.usu_nombre_usuario = usu_nombre_usuario;
        this.usu_apellido_usuario = usu_apellido_usuario;
        this.usu_correo_vendedor = usu_correo_vendedor;
        this.num_cel = num_cel;
        this.contrasena = contrasena;
        this.usu_dir = usu_dir;
        this.rol = rol;
        this.rec = rec;
        this.confirm = confirm;
    }

    public personabean(int usu_id_usuario, int idProducto, String usu_nombre_usuario, String usu_apellido_usuario, String num_cel, String usu_dir) {
        this.usu_id_usuario = usu_id_usuario;
        this.idProducto = idProducto;
        this.usu_nombre_usuario = usu_nombre_usuario;
        this.usu_apellido_usuario = usu_apellido_usuario;
        this.num_cel = num_cel;
        this.usu_dir = usu_dir;
    }

    
    
    
    
    

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getRec() {
        return rec;
    }

    public void setRec(String rec) {
        this.rec = rec;
    }

    public int getUsu_id_usuario() {
        return usu_id_usuario;
    }

    public void setUsu_id_usuario(int usu_id_usuario) {
        this.usu_id_usuario = usu_id_usuario;
    }

    public String getUsu_nombre_usuario() {
        return usu_nombre_usuario;
    }

    public void setUsu_nombre_usuario(String usu_nombre_usuario) {
        this.usu_nombre_usuario = usu_nombre_usuario;
    }

    public String getUsu_apellido_usuario() {
        return usu_apellido_usuario;
    }

    public void setUsu_apellido_usuario(String usu_apellido_usuario) {
        this.usu_apellido_usuario = usu_apellido_usuario;
    }

    public String getUsu_correo_vendedor() {
        return usu_correo_vendedor;
    }

    public void setUsu_correo_vendedor(String usu_correo_vendedor) {
        this.usu_correo_vendedor = usu_correo_vendedor;
    }

    public String getNum_cel() {
        return num_cel;
    }

    public void setNum_cel(String num_cel) {
        this.num_cel = num_cel;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contraseña) {
        this.contrasena = contraseña;
    }

    public String getUsu_dir() {
        return usu_dir;
    }

    public void setUsu_dir(String usu_dir) {
        this.usu_dir = usu_dir;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
