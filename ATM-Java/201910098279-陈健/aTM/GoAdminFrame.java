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

public class GoAdminFrame extends JFrame {
	JTextField jTextField;// 添加文本框组件
	JPasswordField jPasswordField;// 添加密码框组件
	JLabel jLabel1, jLabel2;// 添加两个标签
	JPanel jp1, jp2, jp3;// 添加三个面板
	JButton jb1, jb2;// 添加确认取消按钮
//	public static void main(String[] args) {
//		new GoAdminFrame();
//	}

	public GoAdminFrame() {
		jTextField = new JTextField(16);
		jPasswordField = new JPasswordField(17);
		jLabel1 = new JLabel("用户名");
		jLabel2 = new JLabel("密码");
		jb1 = new JButton("确认");
		jb2 = new JButton("取消");
		jp1 = new JPanel();
		jp2 = new JPanel();
		jp3 = new JPanel();
//设置网格布局
		this.setLayout(new GridLayout(3, 1));
		// 第一块面板添加用户名和文本框
		jp1.add(jLabel1);
		jp1.add(jTextField);
		// 第二块 面板添加密码和密码狂
		jp2.add(jLabel2);
		jp2.add(jPasswordField);
		// 第三块面板添加确认和取消按钮
		jp3.add(jb1);
		jp3.add(jb2);
		// 将三块面板添加到登陆框上面
		this.add(jp1);
		this.add(jp2);
		this.add(jp3);
		// 设置显示
		this.setBounds(500, 500, 300, 200);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setTitle("登陆");
//确定按钮
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// 获取用户名
				String accountnum = jTextField.getText();
				// 获取密码
				char[] passwordchar = jPasswordField.getPassword();
				String passwordstring = new String(passwordchar);
				String user = Atm.user[0];
				String userKey = Atm.userKey[0];
//管理者账号:admin  管理者密码 :admin
				if (passwordstring.equals(userKey) && accountnum.equals(user)) {
					AdminFrame adF = new AdminFrame();
					adF.setVisible(true);
					dispose();

				} else {
					JOptionPane.showMessageDialog(null, "账号或密码错误，请重新输入");
				}
			}
		});
//取消按钮
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new Atm();// 返回主界面
				dispose();// 关闭当前界面
			}
		});
	}
}
