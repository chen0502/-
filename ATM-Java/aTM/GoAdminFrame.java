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
	JTextField jTextField;// ����ı������
	JPasswordField jPasswordField;// �����������
	JLabel jLabel1, jLabel2;// ���������ǩ
	JPanel jp1, jp2, jp3;// ����������
	JButton jb1, jb2;// ���ȷ��ȡ����ť
//	public static void main(String[] args) {
//		new GoAdminFrame();
//	}

	public GoAdminFrame() {
		jTextField = new JTextField(16);
		jPasswordField = new JPasswordField(17);
		jLabel1 = new JLabel("�û���");
		jLabel2 = new JLabel("����");
		jb1 = new JButton("ȷ��");
		jb2 = new JButton("ȡ��");
		jp1 = new JPanel();
		jp2 = new JPanel();
		jp3 = new JPanel();
//�������񲼾�
		this.setLayout(new GridLayout(3, 1));
		// ��һ���������û������ı���
		jp1.add(jLabel1);
		jp1.add(jTextField);
		// �ڶ��� ����������������
		jp2.add(jLabel2);
		jp2.add(jPasswordField);
		// ������������ȷ�Ϻ�ȡ����ť
		jp3.add(jb1);
		jp3.add(jb2);
		// �����������ӵ���½������
		this.add(jp1);
		this.add(jp2);
		this.add(jp3);
		// ������ʾ
		this.setBounds(500, 500, 300, 200);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
		this.setVisible(true);
		this.setTitle("��½");
//ȷ����ť
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				// ��ȡ�û���
				String accountnum = jTextField.getText();
				// ��ȡ����
				char[] passwordchar = jPasswordField.getPassword();
				String passwordstring = new String(passwordchar);
				String user = Atm.user[0];
				String userKey = Atm.userKey[0];
//�������˺�:admin  ���������� :admin
				if (passwordstring.equals(userKey) && accountnum.equals(user)) {
					AdminFrame adF = new AdminFrame();
					adF.setVisible(true);
					dispose();

				} else {
					JOptionPane.showMessageDialog(null, "�˺Ż������������������");
				}
			}
		});
//ȡ����ť
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				new Atm();// ����������
				dispose();// �رյ�ǰ����
			}
		});
	}
}
