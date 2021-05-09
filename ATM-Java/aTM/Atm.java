package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.WindowConstants;

/**
 * @author 陈健
 *
 */
public class Atm extends JFrame {
	public static String[] userList = new String[20];// 用户记录
	public static int accout = 100000;// 第一账户初始钱
	public static int accout1 = 100000;// 第二账户初始钱
	public static String[] user = { "admin", "12", "11" };// 管理员账号：admin,其余为用户账号。
	public static String[] userKey = { "admin", "12", "11" };// key与上面账号对应。

	public static void main(String[] args) {
		new Atm();
	}

	public Atm() {
		setTitle("ATM柜员机登录界面");
		Container c = getContentPane();
		c.setLayout(null);
		// 创建并设置按钮
		JButton gl = new JButton("管理员系统");
		JButton yh = new JButton("用户系统");
		JButton tc = new JButton("退出");
		gl.setBounds(180, 200, 150, 80);
		yh.setBounds(180, 50, 150, 80);
		tc.setBounds(330, 400, 150, 40);
		// 添加按钮
		c.add(gl);
		c.add(yh);
		c.add(tc);
		setBounds(500, 500, 500, 500);
		setVisible(true);// 窗体可见
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);// 关闭
		tc.addActionListener(new tcAction());// 添加监听器
		yh.addActionListener(new yhAction());// 添加监听器
		gl.addActionListener(new glAction());// 添加监听器
	}

//退出按钮响应
	class tcAction implements ActionListener {// 内部类
		public void actionPerformed(ActionEvent arg0) {
			this.gotc();// 调用方法
		}

		private void gotc() {
			dispose();// 退出
		}
	}

	// 用户按钮响应
	class yhAction implements ActionListener {
		public void actionPerformed(ActionEvent arg1) {
			this.goyh();
		}

		private void goyh() {
			GoUserFrame yhF = new GoUserFrame();
			yhF.setVisible(true);
			dispose();
		}
	}

	// 管理员按钮响应
	class glAction implements ActionListener {
		public void actionPerformed(ActionEvent arg2) {
			this.gogl();
		}

		private void gogl() {
			GoAdminFrame glF = new GoAdminFrame();
			glF.setVisible(true);
			dispose();
		}
	}
}