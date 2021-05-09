package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.WindowConstants;

public class UserFrame extends JFrame {

//	public static void main(String[] args) {
//		new UserFrame();
//	}
	public UserFrame() {
		setTitle("用户界面");
		Container c = getContentPane();
		c.setLayout(null);
		// 设置按钮
		JButton jb1 = new JButton("查询");
		JButton jb2 = new JButton("取款");
		JButton jb3 = new JButton("存款");
		JButton jb4 = new JButton("转账");
		JButton jb5 = new JButton("改密");
		JButton jb6 = new JButton("退卡");
		jb1.setBounds(0, 50, 100, 40);
		jb2.setBounds(380, 50, 100, 40);
		jb3.setBounds(0, 200, 100, 40);
		jb4.setBounds(380, 200, 100, 40);
		jb5.setBounds(0, 350, 100, 40);
		jb6.setBounds(380, 350, 100, 40);
		// 添加按钮
		c.add(jb1);
		c.add(jb2);
		c.add(jb3);
		c.add(jb4);
		c.add(jb5);
		c.add(jb6);
		// 设置参数
		setBounds(500, 500, 500, 500);
		setVisible(true);
		setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new ChooseChat();
			}
		});
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new GetMoney();
			}
		});
		jb3.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new SaveMoney();
			}
		});
		jb4.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new Transfer();
			}
		});
		jb5.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				new RePassword();
			}
		});
		jb6.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new GoUserFrame();
				dispose();
			}
		});
	}
}
