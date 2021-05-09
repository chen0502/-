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
	JTextField jTextField;// ����ı���
	JPasswordField jPasswordField;// ��������
	JLabel jLabel1, jLabel2;// ��ӱ�ǩ
	JPanel jp1, jp2, jp3;// ������
	JButton jb1, jb2;// ��ӵ�¼��ť
	static String accountnum;

//	public static void main(String[] args) {
//		new GoUserFrame();
//	}

	public GoUserFrame() {
		jTextField = new JTextField(16);
		jPasswordField = new JPasswordField(17);
		jLabel1 = new JLabel("�û���");
		jLabel2 = new JLabel("����");
		jb1 = new JButton("ȷ��");
		jb2 = new JButton("ȡ��");
		jp1 = new JPanel();
		jp2 = new JPanel();
		jp3 = new JPanel();

//���ò���
		this.setLayout(new GridLayout(3, 1));

		jp1.add(jLabel1);
		jp1.add(jTextField);// ��һ���������û������ı���

		jp2.add(jLabel2);
		jp2.add(jPasswordField);// �ڶ�����������������������

		jp3.add(jb1);
		jp3.add(jb2); // ������������ȷ�Ϻ�ȡ��

		this.add(jp1);
		this.add(jp2);
		this.add(jp3); // �����������ӵ���½������
		this.setBounds(500, 500, 300, 200);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setTitle("��½");
//ȷ����ť
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// ��ȡ�˺�
				accountnum = jTextField.getText();
				// ��ȡ����
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
					JOptionPane.showMessageDialog(null, "�˺Ż������������������");
				}
			}
		});
//ȡ����ť
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new Atm();
				dispose();
			}
		});
	}
}