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
public class tablolu { 
    // frame 
    JFrame f; 
    // Table 
    JTable j; 
  
    // Constructor 
    tablolu() 
    { 
         
        try{
        String user,pass;
        user="postgres";
        pass="9798";  
        Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/trafikCeza",user,pass);
        
        String query = "select * from tipler";
        
        Statement s = conn.createStatement();
	ResultSet r = s.executeQuery(query);
        String uyg1 ="Penalties are recorded only for the person";
        String uyg2 ="Penalties are recorded for the person and the license plate";
        String uygulanma="bos";
        
        String[][] dizi = new String[10][3];
        int i=0;
        while(r.next()){
            int cezatip = r.getInt(1);
            String ihlal = r.getString(2);
            int uyg_tip = r.getInt(3);
            String tip= Integer.toString(cezatip);
                if(uyg_tip ==1){
                    uygulanma=uyg1;
                    
                }else{
                    uygulanma=uyg2;
                }
                
                dizi[i][0] =tip;
                dizi[i][1] =ihlal;
                dizi[i][2] =uygulanma;
                
            i++;
        }
        f = new JFrame(); 
  
        // Frame Title 
        f.setTitle("Traffic violations and their contents"); 
        String[] columnNames = { "Ceza tip id", "İhlal içeriği", "Uygulanma tipi" }; 
  
        int[] columnsWidth = {
            70,300,190
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
        f.setSize(585, 230); 
        f.setLocation(400, 250);
        f.setVisible(true); 
        
        s.close();
        conn.close();
    }catch(Exception e){
                System.out.println("hata:"+ e.getMessage());
    }
        // Frame initiallization 
        
        
        
        
        
       
    } 
  
    // Driver  method 
  // public static void main(String[] args) 
    //{ 
      //  new tablolu(); 
   // } 
} 
