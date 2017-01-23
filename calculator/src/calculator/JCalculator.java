package calculator;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
 
/**
 * A simple calculator program.
 */
public class JCalculator extends JFrame implements ActionListener {
    /**
     * Serial Version UID
     */
    private static final long serialVersionUID = -169068472193786457L;//??
    /**
     * This class help close the Window.
     *
     */
    private class WindowCloser extends WindowAdapter {
       public void windowClosing(WindowEvent we) {
           System.exit(0);
       }
    }
 
    int i;
    // Strings for Digit & Operator buttons.
    private final String[] str = { "7", "8", "9", "+", "4", "5", "6","-", "1",
           "2", "3", "*", "0", ".", "=", "/" };
    // Build buttons.
    JButton[] buttons = new JButton[str.length];
    
    // For cancel or reset.
    //JButton reset = new JButton("CE");
    
    // Build the text field to show the result.
    JTextField display = new JTextField(18);
   
    /**
     * Constructor without parameters.
     */
    public JCalculator() {
       super("Calculator");
       // Add a panel.
       JPanel p1 = new JPanel(new GridLayout(4, 4));
       // panel1.setLayout(new GridLayout(4,4));
       for (i = 0; i < str.length; i++) {
           buttons[i] = new JButton(str[i]);
           p1.add(buttons[i]);
       }
       
       JPanel p2 = new JPanel(new BorderLayout());
       p2.setLayout(new FlowLayout(FlowLayout.CENTER));
       // panel2.setLayout(new BorderLayout());
       p2.add(display);
      // panel2.add("East", reset);
       // JPanel panel3 = new Panel();
       setLayout(new BorderLayout());
       add("North", p2);
       //getContentPane().
       add(p1);
       
       // Add action listener for each digit & operator button.
       for (i = 0; i < str.length; i++)
           buttons[i].addActionListener(this);
       // Add listener for "reset" button.
       //reset.addActionListener(this);
       // Add listener for "display" button.
       display.addActionListener(this);
       // The "close" button "X".
       addWindowListener(new WindowCloser());
       // Initialize the window size.
       setSize(150, 400);
       // Show the window.
       // show(); Using show() while JDK version is below 1.5.
       setVisible(true);
       // Fit the certain size.
       pack();
    }  
   
    public void actionPerformed(ActionEvent e) {
       //Object target = e.getSource();
       String label = e.getActionCommand();
      // if (target == reset)
      //     handleReset();
      // else 
       //System.out.println("0123456789.".indexOf(label));
       if ("0123456789.".indexOf(label) >=0)
           handleNumber(label);
       else
           handleOperator(label);
    }
    // Is the first digit pressed?
    boolean isFirstDigit = true;
    /**
     * Number handling.
     * @param key the key of the button.
     */
    public void handleNumber(String key) {
       if (isFirstDigit)
           display.setText(key);
       else if ((key.equals(".")) && (display.getText().indexOf(".") < 0))
           display.setText(display.getText() + ".");
       else if (!key.equals("."))
           display.setText(display.getText() + key);
       isFirstDigit = false;
    }
   
    /**
     * Reset the calculator.
     */
   /* public void handleReset() {
       display.setText("0");
       isFirstDigit = true;
       operator = "=";
    }*/
 
    double number = 0.0;
    String operator = "=";
   
    /**
     * Handling the operation.
     * @param key pressed operator's key.
     */
    public void handleOperator(String key) {
       if (operator.equals("+"))
       {
           number += Double.valueOf(display.getText());
           display.setText(String.valueOf(number));
       }
       else if (operator.equals("-"))
       {
           number -= Double.valueOf(display.getText());
           display.setText(String.valueOf(number));
       }
       else if (operator.equals("*"))
       {
           number *= Double.valueOf(display.getText());
           display.setText(String.valueOf(number));
       }
       else if (operator.equals("/"))
       {
    	   if(Double.valueOf(display.getText())==0)
        	   display.setText("除数不能为0！");   
           else
           {
        	   number /= Double.valueOf(display.getText());
        	   display.setText(String.valueOf(number));
           }
       }
       else if (operator.equals("="))
           number = Double.valueOf(display.getText());
       //display.setText(String.valueOf(number));
       operator = key;
       isFirstDigit = true;
    }
   
    public static void main(String[] args) {
    	//JCalculator a = 
    	new JCalculator();
    }
}
