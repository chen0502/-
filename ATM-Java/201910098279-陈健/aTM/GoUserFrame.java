package aTM;

import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.WindowConstants;

public class GoUserFrame extends JFrame {
	JTextField jTextField;// 添加文本框
	JPasswordField jPasswordField;// 添加密码框
	JLabel jLabel1, jLabel2;// 添加标签
	JPanel jp1, jp2, jp3;// 添加面板
	JButton jb1, jb2;// 添加登录按钮
	static String accountnum;

//	public static void main(String[] args) {
//		new GoUserFrame();
//	}

	public GoUserFrame() {
		jTextField = new JTextField(16);
		jPasswordField = new JPasswordField(17);
		jLabel1 = new JLabel("用户名");
		jLabel2 = new JLabel("密码");
		jb1 = new JButton("确认");
		jb2 = new JButton("取消");
		jp1 = new JPanel();
		jp2 = new JPanel();
		jp3 = new JPanel();

//设置布局
		this.setLayout(new GridLayout(3, 1));

		jp1.add(jLabel1);
		jp1.add(jTextField);// 第一块面板添加用户名和文本框

		jp2.add(jLabel2);
		jp2.add(jPasswordField);// 第二块面板添加密码和密码输入框

		jp3.add(jb1);
		jp3.add(jb2); // 第三块面板添加确认和取消

		this.add(jp1);
		this.add(jp2);
		this.add(jp3); // 将三块面板添加到登陆框上面
		this.setBounds(500, 500, 300, 200);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setTitle("登陆");
//确定按钮
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// 获取账号
				accountnum = jTextField.getText();
				// 获取密码
				char[] passwordchar = jPasswordField.getPassword();
				String passwordstring = new String(passwordchar);
				String user1 = Atm.user[1];
				String userKey1 = Atm.userKey[1];
				String user2 = Atm.user[2];
				String userKey2 = Atm.userKey[2];
//				case "1234567812345678":123456
				if (passwordstring.equals(userKey1) && accountnum.equals(user1)) {
					UserFrame uF = new UserFrame();
					uF.setVisible(true);
					dispose();
				} else
//				case "1111222233334444":147258
				if (passwordstring.equals(userKey2) && accountnum.equals(user2)) {
					UserFrame uF = new UserFrame();
					uF.setVisible(true);
					dispose();
				} else {
					JOptionPane.showMessageDialog(null, "账号或密码错误，请重新输入");
				}
			}
		});
//取消按钮
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new Atm();
				dispose();
			}
		});
	}
}