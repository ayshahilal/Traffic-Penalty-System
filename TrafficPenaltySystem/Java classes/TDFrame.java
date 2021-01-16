/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ProjeKodlar;
import java.sql.*;
import javax.swing.*;
/**
 *
 * @author user
 */
public class TDFrame extends JFrame {
public TDFrame() {
	}
    public TDFrame (Connection conn) {

	setTitle("Cezaları görme ve silme ekranı");
	setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	setSize(1100, 350);       
	setLocation(200, 200); 
	getContentPane().add(new delete_ekrani(conn));	
        
    }
    
}
