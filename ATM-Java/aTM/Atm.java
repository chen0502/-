package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.WindowConstants;

/**
 * @author �½�
 *
 */
public class Atm extends JFrame {
	public static String[] userList = new String[20];// �û���¼
	public static int accout = 100000;// ��һ�˻���ʼǮ
	public static int accout1 = 100000;// �ڶ��˻���ʼǮ
	public static String[] user = { "admin", "12", "11" };// ����Ա�˺ţ�admin,����Ϊ�û��˺š�
	public static String[] userKey = { "admin", "12", "11" };// key�������˺Ŷ�Ӧ��

	public static void main(String[] args) {
		new Atm();
	}

	public Atm() {
		setTitle("ATM��Ա����¼����");
		Container c = getContentPane();
		c.setLayout(null);
		// ���������ð�ť
		JButton gl = new JButton("����Աϵͳ");
		JButton yh = new JButton("�û�ϵͳ");
		JButton tc = new JButton("�˳�");
		gl.setBounds(180, 200, 150, 80);
		yh.setBounds(180, 50, 150, 80);
		tc.setBounds(330, 400, 150, 40);
		// ��Ӱ�ť
		c.add(gl);
		c.add(yh);
		c.add(tc);
		setBounds(500, 500, 500, 500);
		setVisible(true);// ����ɼ�
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);// �ر�
		tc.addActionListener(new tcAction());// ��Ӽ�����
		yh.addActionListener(new yhAction());// ��Ӽ�����
		gl.addActionListener(new glAction());// ��Ӽ�����
	}

//�˳���ť��Ӧ
	class tcAction implements ActionListener {// �ڲ���
		public void actionPerformed(ActionEvent arg0) {
			this.gotc();// ���÷���
		}

		private void gotc() {
			dispose();// �˳�
		}
	}

	// �û���ť��Ӧ
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

	// ����Ա��ť��Ӧ
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