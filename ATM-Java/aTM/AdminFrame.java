package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.WindowConstants;

public class AdminFrame extends JFrame {
//	public static void main(String[] args) {
//		new AdminFrame();
//	}

	public AdminFrame() {
		setTitle("����Ա����");
		Container c = getContentPane();
		c.setLayout(null);
		setBounds(500, 500, 500, 500);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);// �ر�
		JButton sz = new JButton("ϵͳ����");
		JButton jf = new JButton("�˺Ž��");
		JButton mx = new JButton("��ϸ��ѯ");
		JButton tc = new JButton("�˳�");
		sz.setBounds(0, 400, 150, 50);
		jf.setBounds(180, 200, 150, 80);
		mx.setBounds(180, 50, 150, 80);
		tc.setBounds(330, 400, 150, 40);
		c.add(sz);
		c.add(mx);
		c.add(jf);
		c.add(tc);
		setVisible(true);
		// ��Ӽ�����
		sz.addActionListener(new GoAction());
		mx.addActionListener(new GoAction());
		jf.addActionListener(new GoAction());
		tc.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
	}
}

class GoAction implements ActionListener {
	public void actionPerformed(ActionEvent arg0) {
		this.gosz();
	}

	private void gosz() {
		JOptionPane.showMessageDialog(null, "������δʵ�֣������ڴ���");
	}
}