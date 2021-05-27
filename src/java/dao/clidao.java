/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author Andres Olmos
 */
public class clidao {
    JdbcTemplate jdbctemplate;
    dbconect con =new dbconect();

/**
 * @param nonbre nombre a consultar
 * @param apellido nombre a consultar
 * @return retorna una lista
 * @author Andres Olmos
 */
 public List consultarcliente(String nonbre , String apellido){
 List personabean = new ArrayList();
 this.jdbctemplate = new JdbcTemplate(con.conectar());
 String sql = "select usu_correo_vendedor,contrasena from tbusuario where usu_correo_vendedor = '"+nonbre+"' and contrasena = '"+apellido+"' ";
 personabean = this.jdbctemplate.queryForList(sql);
 return personabean;
 }
///**
// * @return retorna una lista
// * @author Andres Olmos
// */
// public List testcliente(){
// List personabean = new ArrayList();
// this.jdbctemplate = new JdbcTemplate(con.conectar());
// String sql = "select * from prueba";
// personabean = this.jdbctemplate.queryForList(sql);
// return personabean;
// }
/**
 * @param nonbre nombre del cliente a agregar
 * @param apellido apellido del cliente a agregar
 * @param celular edad del cliente a agregar
 * @param correo correo del cliente a agregar
 * @param direccion correo del cliente a agregar
 * @param contrasena correo del cliente a agregar
 * @author Andres Olmos
 */
 public void actcliente(String nonbre,String apellido,String celular,String correo,String contrasena, String direccion){
  this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "insert into tbusuario (usu_nombre_usuario,usu_apellido_usuario,num_cel,usu_correo_vendedor,contrasena,usu_dir) values ('"+nonbre+"','"+apellido+"','"+celular+"','"+correo+"','"+contrasena+"','"+direccion+"')";
        this.jdbctemplate.update(sql);
}
 
 public List validaregister(String nonbre ){
 List personabean = new ArrayList();
 this.jdbctemplate = new JdbcTemplate(con.conectar());
 String sql = "select * from tbusuario where usu_correo_vendedor = '"+nonbre+"'  ";
 personabean = this.jdbctemplate.queryForList(sql);
 return personabean;

 }
/**
 * @param contrasena es la contrasena del cliente
 * @param reecuperacion es elcodigo de recuperacion del cliente
 * @author Andres Olmos
 */
public void modcliente(String contrasena, String recuperacion){
  this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "update tbusuario set contrasena = '"+contrasena+"'  where recuperacion = '"+recuperacion+"' ";
        this.jdbctemplate.update(sql);
}
/**
 * 
 * @param recuperacion codigo de recuperacion del cliente
 * @param id id del cliente a eliminar
 * @author Andres Olmos
 */
 public void reccliente(String id, String recuperacion ){
  this.jdbctemplate = new JdbcTemplate(con.conectar());
        String sql = "update  tbusuario set recuperacion = '"+recuperacion+"' where usu_correo_vendedor = '"+id+"'" ;
        this.jdbctemplate.update(sql);
}
 public List busreccliente(String id){
 List personabean = new ArrayList();
 this.jdbctemplate = new JdbcTemplate(con.conectar());
 String sql = "select * from tbusuario where usu_correo_vendedor = '"+id+"'";
 personabean = this.jdbctemplate.queryForList(sql);
 return personabean;
 }
 public static String generarpalabra(){
         String palabra = ""; 
         int caracteres = (int)(Math.random()*20)+2; 
         for (int i=0; i<caracteres; i++){ 
         int codigoAscii = (int)Math.floor(Math.random()*(122 -
         97)+97); 
         palabra = palabra + (char)codigoAscii; 
         } 
         return palabra; 
     } 

    public void enviarConGMail(String destinatario, String asunto, String cuerpo) {
    // Esto es lo que va delante de @gmail.com en tu cuenta de correo. Es el remitente también.
   
    String remitente = "Beemarking@gmail.com";  
    Properties props = System.getProperties();
    props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
    props.put("mail.smtp.user", remitente);
    props.put("mail.smtp.clave", "BeeMark2020");    //La clave de la cuenta
    props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
    props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
    props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

    Session session = Session.getDefaultInstance(props);
    MimeMessage message = new MimeMessage(session);

    try {
        message.setFrom(new InternetAddress(remitente));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(destinatario));   //Se podrían añadir varios de la misma manera
        message.setSubject(asunto);
        message.setText(cuerpo);
        Transport transport = session.getTransport("smtp");
        transport.connect("smtp.gmail.com", remitente,"BeeMark2020");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
    catch (MessagingException me) {
        me.printStackTrace();   //Si se produce un error
    }
}

}