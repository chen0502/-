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
		setTitle("取款");
		Container c = getContentPane();
		c.setLayout(null);
		JLabel jl1 = new JLabel("请输入要取出的金额：");
		JLabel jl2 = new JLabel("注意：只能取出100的倍数的金额！");
		JTextField jt1 = new JTextField("0");
		JButton jb1 = new JButton("确定");
		JButton jb2 = new JButton("返回");
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
				int n = Integer.parseInt(s);// 调用integer类的parseInt()把s转换成int类型
				if (n == 0) {
					JOptionPane.showMessageDialog(null, "请输入金额！");
				} else if ((n % 100) == 0 && (n < 5000 && n > 0)) {
					if (GoUserFrame.accountnum.equals(Atm.user[1])) {
						Atm.accout -= n;
						JOptionPane.showMessageDialog(null, "已取出，正在返回！");
						dispose();
					} else {
						Atm.accout1 -= n;
						JOptionPane.showMessageDialog(null, "已取出，正在返回！");
						dispose();
					}
				} else {
					JOptionPane.showMessageDialog(null, "取出的金额只能是100的整数倍,且每次取出金额不能超过5000元！");
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
