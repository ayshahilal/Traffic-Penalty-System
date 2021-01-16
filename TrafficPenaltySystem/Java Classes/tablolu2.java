/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProjeKodlar;
import javax.swing.JFrame; 
import javax.swing.JScrollPane; 
import javax.swing.JTable; 
import java.sql.*;
import javax.swing.table.TableColumn;

/**
 *
 * @author user
 */
public class tablolu2 {
    JFrame f; 
    JTable j; 
  
    tablolu2() 
    { 
         
        try{
        String user,pass;
        user="postgres";
        pass="9798";  
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trafikCeza",user,pass);
        
        String query = "select isim,soyisim ,adres from kisi, ceza_kaydi where tc_no=uyg_kisi_tc except" +
                   " select isim,soyisim, adres from kisi,arac where tc_no=arac_tc_no";
        
        Statement s = conn.createStatement();
	ResultSet r = s.executeQuery(query);
 
        String[][] dizi = new String[10][3];
        int i=0;
        while(r.next()){
            String isim = r.getString(1);
            String soyisim = r.getString(2);
            String adres = r.getString(3);
                dizi[i][0] =isim;
                dizi[i][1] =soyisim;   
                dizi[i][2] =adres; 
            i++;
        }
        f = new JFrame(); 
  
        // Frame Title 
        f.setTitle("Related persons"); 
        String[] columnNames = { "İsim", "Soyisim", "Adres"}; 
  
        int[] columnsWidth = {
            80,80,300
        };
        
        j = new JTable(dizi, columnNames); 
        int k = 0;
        for (int width : columnsWidth) {
            TableColumn column = j.getColumnModel().getColumn(k++);
            column.setMinWidth(width);
            column.setMaxWidth(width);
            column.setPreferredWidth(width);
        }
        
        JScrollPane sp = new JScrollPane(j); 
        f.add(sp); 
        f.setSize(480, 230); 
        f.setLocation(400, 250);
        f.setVisible(true); 
        
        s.close();
        conn.close();
    }catch(Exception e){
                System.out.println("error:"+ e.getMessage());
    }
        // Frame initiallization 
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
}
