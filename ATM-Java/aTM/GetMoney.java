package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class GetMoney extends JFrame {
//	public static void main(String[] args) {
//		new GetMoney();
//
//	}

	public GetMoney() {
		setTitle("ȡ��");
		Container c = getContentPane();
		c.setLayout(null);
		JLabel jl1 = new JLabel("������Ҫȡ���Ľ�");
		JLabel jl2 = new JLabel("ע�⣺ֻ��ȡ��100�ı����Ľ�");
		JTextField jt1 = new JTextField("0");
		JButton jb1 = new JButton("ȷ��");
		JButton jb2 = new JButton("����");
		jt1.setBounds(210, 125, 150, 50);
		jl1.setBounds(80, 100, 190, 100);
		jl2.setBounds(80, 250, 300, 50);
		jb1.setBounds(80, 300, 100, 40);
		jb2.setBounds(300, 300, 100, 40);
		c.add(jl1);
		c.add(jl2);
		c.add(jt1);
		c.add(jb1);
		c.add(jb2);
		setVisible(true);
		setBounds(500, 500, 500, 500);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String s = jt1.getText();
				int n = Integer.parseInt(s);// ����integer���parseInt()��sת����int����
				if (n == 0) {
					JOptionPane.showMessageDialog(null, "�������");
				} else if ((n % 100) == 0 && (n < 5000 && n > 0)) {
					if (GoUserFrame.accountnum.equals(Atm.user[1])) {
						Atm.accout -= n;
						JOptionPane.showMessageDialog(null, "��ȡ�������ڷ��أ�");
						dispose();
					} else {
						Atm.accout1 -= n;
						JOptionPane.showMessageDialog(null, "��ȡ�������ڷ��أ�");
						dispose();
					}
				} else {
					JOptionPane.showMessageDialog(null, "ȡ���Ľ��ֻ����100��������,��ÿ��ȡ�����ܳ���5000Ԫ��");
				}
			}
		});
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
	}
}
