package model;

import java.io.InputStream;
import java.time.LocalDate;

public class Product {

    int Cantidad;
    int IdProducto;
    String Nombre;
    InputStream Foto;
    String Descripcion;
    double Precio;
    int Stock;
    int item;
    String contrasena;
    String usu_correo_vendedor;
    int id_usu;
    int cantidad_origin;
    String pro_expiration_date;
    String pro_batch_date;
    
    public Product() {
    }

    public Product(int Cantidad, int IdProducto, String Nombre, InputStream Foto, String Descripcion, double Precio, int Stock, int item, String contrasena, String usu_correo_vendedor, int id_usu, int cantidad_origin, String pro_expiration_date, String pro_batch_date) {
        this.Cantidad = Cantidad;
        this.IdProducto = IdProducto;
        this.Nombre = Nombre;
        this.Foto = Foto;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Stock = Stock;
        this.item = item;
        this.contrasena = contrasena;
        this.usu_correo_vendedor = usu_correo_vendedor;
        this.id_usu = id_usu;
        this.cantidad_origin = cantidad_origin;
        this.pro_expiration_date = pro_expiration_date;
        this.pro_batch_date = pro_batch_date;
    }

    public Product(String nombre, String descripcion, LocalDate pro_expiration_date, LocalDate pro_batch_date, double precio, int stock) {
        
    }

    public Product(String pro_Id, String nombre, String descripcion, LocalDate pro_expiration_date, LocalDate pro_batch_date, double precio, int stock) {
        
    }

    public Product(int IdProducto, String Nombre, String Descripcion, double Precio, int Stock, int id_usu, String pro_expiration_date, String pro_batch_date) {
        this.IdProducto = IdProducto;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Stock = Stock;
        this.id_usu = id_usu;
        this.pro_expiration_date = pro_expiration_date;
        this.pro_batch_date = pro_batch_date;
    }

    public Product(int idusu, int idProducto) {
        this.id_usu = idusu;
        this.IdProducto = idProducto;
    }
    
    
        
    public String getPro_expiration_date() {
        return pro_expiration_date;
    }

    public void setPro_expiration_date(String pro_expiration_date) {
        this.pro_expiration_date = pro_expiration_date;
    }

    public String getPro_batch_date() {
        return pro_batch_date;
    }

    public void setPro_batch_date(String pro_batch_date) {
        this.pro_batch_date = pro_batch_date;
    }

    

    public int getCantidad_origin() {
        return cantidad_origin;
    }

    public void setCantidad_origin(int cantidad_origin) {
        this.cantidad_origin = cantidad_origin;
    }

    

    public Product(int idproduct, String nombre, int stock, String descripcion, double precio) {
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public int getId_usu() {
        return id_usu;
    }

    public void setId_usu(int id_usu) {
        this.id_usu = id_usu;
    }

    public String getUsu_correo_vendedor() {
        return usu_correo_vendedor;
    }

    public void setUsu_correo_vendedor(String usu_correo_vendedor) {
        this.usu_correo_vendedor = usu_correo_vendedor;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public int getItem() {
        return item;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public InputStream getFoto() {
        return Foto;
    }

    public void setFoto(InputStream Foto) {
        this.Foto = Foto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

}
