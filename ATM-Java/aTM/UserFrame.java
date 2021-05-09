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
		setTitle("�û�����");
		Container c = getContentPane();
		c.setLayout(null);
		// ���ð�ť
		JButton jb1 = new JButton("��ѯ");
		JButton jb2 = new JButton("ȡ��");
		JButton jb3 = new JButton("���");
		JButton jb4 = new JButton("ת��");
		JButton jb5 = new JButton("����");
		JButton jb6 = new JButton("�˿�");
		jb1.setBounds(0, 50, 100, 40);
		jb2.setBounds(380, 50, 100, 40);
		jb3.setBounds(0, 200, 100, 40);
		jb4.setBounds(380, 200, 100, 40);
		jb5.setBounds(0, 350, 100, 40);
		jb6.setBounds(380, 350, 100, 40);
		// ��Ӱ�ť
		c.add(jb1);
		c.add(jb2);
		c.add(jb3);
		c.add(jb4);
		c.add(jb5);
		c.add(jb6);
		// ���ò���
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
