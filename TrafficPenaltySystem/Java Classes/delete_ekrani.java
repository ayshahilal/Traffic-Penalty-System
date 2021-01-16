/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProjeKodlar;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.*;
import java.awt.event.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
/**
 *
 * @author user
 */
public class delete_ekrani extends JPanel {
    private final JLabel inputLbl   = new JLabel("Enter the personal id to see the debts on the id");
    private final JTextField txt    = new JTextField(12);
    private final JButton btn1      = new JButton("Show the penalty list of the id");
    private final JButton btn2      = new JButton("Erase the debt on the id");
    private final JLabel outputLbl  = new JLabel(" ");
   
    private final JLabel inputLbl2   = new JLabel("Enter the car plate number to see the fines sent to the vehicle owner:");
    private final JTextField txt2    = new JTextField(12);
    private final JButton btn1_2      = new JButton("Show the penalty list for the car plate");
    private final JButton btn2_2     = new JButton("Erase the debt");
    private final JLabel outputLbl2  = new JLabel(" ");
   
    private final DefaultTableModel cezalar;
    private Connection conne;
   
    public delete_ekrani (Connection conn){
		
	Object[] columnNames = {"Ceza id", "Ceza tipi", "ceza tarihi", "ceza adres"};
	cezalar = new DefaultTableModel(columnNames, 0);
	JTable tbl = new JTable(cezalar);
	JScrollPane sp = new JScrollPane(tbl);
        
        int[] columnsWidth = {
            60,70,100,220
        };
        
         int k = 0;
        for (int width : columnsWidth) {
            TableColumn column = tbl.getColumnModel().getColumn(k++);
            column.setMinWidth(width);
            column.setMaxWidth(width);
            column.setPreferredWidth(width);
        };
        
	add(inputLbl);	
        add(txt);	
        add(btn1);	
        add(btn2);	
	add(outputLbl); 
        add(inputLbl2);	
        add(txt2);	
        add(btn1_2);	
        add(btn2_2);	
	add(outputLbl2); 
      
        add(sp);
	
	conne = conn;
	
		
	btn1.addActionListener(new ActionListener(){			
           public void actionPerformed(ActionEvent arg0) {
		goster();
           }			 
	});			
		
	btn2.addActionListener(new ActionListener(){			
           public void actionPerformed(ActionEvent arg0) {
		sil();
           }			 
	});	
        
        btn1_2.addActionListener(new ActionListener(){			
           public void actionPerformed(ActionEvent arg0) {
		goster2();
           }			 
	});			
		
	btn2_2.addActionListener(new ActionListener(){			
           public void actionPerformed(ActionEvent arg0) {
		sil2();
           }			 
	});
		
   }
   
   private void goster()  {
        outputLbl2.setText("");
        txt2.setText("");

	long tc = Long.parseLong(txt.getText());
	String query ="SELECT ceza_id FROM ceza_kaydi WHERE uyg_kisi_tc= "+tc;

         try{
            Statement s =conne.createStatement();
            ResultSet r;
            r= s.executeQuery(query);
            cezalar.setRowCount(0);
	        
	    if (!r.next ()){
                outputLbl.setText("There is no one with this id! ");
            }else{
                outputLbl.setText("Personal debts are on the table");
        	   
		s.close();
				
		String query2 = "SELECT ceza_id,ceza_tipi,ceza_tarihi,ceza_adres FROM ceza_kaydi WHERE uyg_kisi_tc = " + tc;
		Statement s2 = conne.createStatement();
		ResultSet r2 = s2.executeQuery(query2);
                
				
		while (r2.next()){
		    String ceza_id = r2.getString(1);
                    String ceza_tipi = r2.getString(2);      	
		    String ceza_tarihi = r2.getString(3);
		    String ceza_adres = r2.getString(4);
		            
		    Object[] satir ={ceza_id, ceza_tipi, ceza_tarihi, ceza_adres};
		    cezalar.addRow(satir);
               
		}
		s2.close();
           }
	}catch(SQLException e){
           e.printStackTrace();
	}				
   }
   
   private void goster2()  {
        outputLbl.setText("");
        txt.setText("");
       
        String plaka = txt2.getText();
       
        String query ="SELECT ceza_id, ceza_tipi,ceza_tarihi FROM ceza_kaydi WHERE uyg_plaka_no= '"+plaka+"'";

       try{
           Statement s =conne.createStatement();
           ResultSet r;
           r= s.executeQuery(query);
           cezalar.setRowCount(0);
	        
	    if (!r.next ()){
               outputLbl2.setText("The penalty for the car plate has not been found!");
           }else{
                outputLbl2.setText("Debts for the car plate is on the table");
        	   
		s.close();
				
		String query2 = "SELECT ceza_id, ceza_tipi,ceza_tarihi,ceza_adres FROM ceza_kaydi WHERE uyg_plaka_no= '"+plaka+"'";
		Statement s2 = conne.createStatement();
		ResultSet r2 = s2.executeQuery(query2);
				
		while (r2.next()){
		    String ceza_id = r2.getString(1);
                    String ceza_tipi = r2.getString(2);      	
		    String ceza_tarihi = r2.getString(3);
		    String ceza_adres = r2.getString(4);
                    
		            
		    Object[] satir ={ceza_id, ceza_tipi, ceza_tarihi, ceza_adres};
		    cezalar.addRow(satir);
               
		}
		s2.close();
           }
	}catch(SQLException e){
           e.printStackTrace();
	}				
   }
   private void sil()  {
	  
	String cezano  = JOptionPane.showInputDialog("Enter the id of the penalty to be deleted");
	
	String query3 = "UPDATE ceza_kaydi SET uyg_kisi_tc= NULL WHERE ceza_id = '" + cezano + "'" ;
        

	Statement s = null;
       try {
           s = conne.createStatement();
      
           s.executeUpdate(query3);
           s.close();
           JOptionPane.showMessageDialog(this, "The penalty of id has been deleted and its debt has been reduced.");
	}catch(SQLException e){
           e.printStackTrace();
	}	
   }
   
   private void sil2()  {
	  
	String cezano  = JOptionPane.showInputDialog("Enter the penalty id to be deleted");
	String query3 = "UPDATE ceza_kaydi SET uyg_plaka_no = NULL WHERE ceza_id = '" + cezano + "'" ;
       try {
           Statement s  = conne.createStatement();
      
           s.executeUpdate(query3);
           s.close();
           JOptionPane.showMessageDialog(this, " The penalty of id has been deleted and its debt has been reduced.");
	}catch(SQLException e){
           e.printStackTrace();
	}	
   }
   

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
    }
    
}
