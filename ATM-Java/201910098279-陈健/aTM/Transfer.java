package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class Transfer extends JFrame {

//	public static void main(String[] args) {
//		new Transfer();
//	}

	public Transfer() {
		setTitle("���");
		Container c = getContentPane();
		c.setLayout(null);
		JLabel jl1 = new JLabel("������Ҫת�Ľ�");
		JLabel jl2 = new JLabel("ע�⣺ֻ��ת100�ı����Ľ�");
		JLabel jl3 = new JLabel("������Է����˺ţ�");
		JTextField jt1 = new JTextField("0");
		JTextField jt2 = new JTextField(18);
		JButton jb1 = new JButton("ȷ��");
		JButton jb2 = new JButton("����");
		jt1.setBounds(200, 175, 200, 50);
		jt2.setBounds(200, 105, 200, 50);
		jl1.setBounds(80, 150, 200, 100);
		jl2.setBounds(80, 250, 300, 50);
		jl3.setBounds(80, 75, 200, 100);
		jb1.setBounds(80, 300, 100, 40);
		jb2.setBounds(300, 300, 100, 40);
		c.add(jl1);
		c.add(jl2);
		c.add(jl3);
		c.add(jt1);
		c.add(jt2);
		c.add(jb1);
		c.add(jb2);
		setVisible(true);
		setBounds(500, 500, 500, 500);
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		jb1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String s = jt1.getText();
				String s2 = jt2.getText();
				int n = Integer.parseInt(s);
				if (n == 0) {
					JOptionPane.showMessageDialog(null, "�������");
				} else if ((n % 100) == 0) {
					if (GoUserFrame.accountnum.equals(Atm.user[1]) && s2.equals(Atm.user[2])) {
						Atm.accout1 += n;
						Atm.accout -= n;
						JOptionPane.showMessageDialog(null, "��ת����Ԥ����Сʱ�ڵ��ˣ�");
						System.out.println("�Ѿ���" + s2 + "ת��" + n + "Ԫ");
						dispose();
					} else if (GoUserFrame.accountnum.equals(Atm.user[2]) && s2.equals(Atm.user[1])) {
						Atm.accout += n;
						Atm.accout1 -= n;
						JOptionPane.showMessageDialog(null, "��ת����Ԥ����Сʱ�ڵ��ˣ�");
						System.out.println("�Ѿ���" + s2 + "ת��" + n + "Ԫ");
						setVisible(false);
						dispose();
					} else {
						JOptionPane.showMessageDialog(null, "�˻������ڣ�");
					}
				} else {
					JOptionPane.showMessageDialog(null, "ת�˵Ľ��ֻ����100����������");
				}
			}
		});
		jb2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				dispose();
				;
			}
		});
	}
}
