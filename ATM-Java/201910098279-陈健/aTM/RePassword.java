package aTM;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class RePassword extends JFrame implements ActionListener {
	public JTextField oldPassword, newPassword, checkPassword;
	public JFrame iframe;
	public JPanel ip0, ip1, ip2, ip3, ip4;
	public JButton confirm, cancel, exit;

//	public static void main(String[] args) {
//		new RePassword();
//	}

	public RePassword() {
		iframe = new JFrame("更改密码");
		iframe.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		ip2 = new JPanel();
		ip2.add(new JLabel("原密码:"));
		oldPassword = new JTextField(20);
		ip2.add(new JLabel("\n"));
		ip2.add(oldPassword);

		ip0 = new JPanel();
		ip0.add(new JLabel("新密码:"));
		newPassword = new JTextField(20);
		ip0.add(new JLabel("\n"));
		ip0.add(newPassword);

		ip4 = new JPanel();
		ip4.add(new JLabel("再次输入新密码:"));
		checkPassword = new JTextField(18);
		ip4.add(new JLabel("\n"));
		ip4.add(checkPassword);

		ip3 = new JPanel();
		confirm = new JButton("确定");
		ip3.add(confirm);
		cancel = new JButton("返回");
		ip3.add(cancel);

		iframe.add(ip2);
		iframe.add(ip0);
		iframe.add(ip4);
		iframe.add(ip3);
		iframe.add(confirm);
		iframe.add(cancel);
		iframe.setLayout(new FlowLayout());
		iframe.setVisible(true);
		iframe.setBounds(500, 500, 350, 300);
		confirm.addActionListener(this);
		cancel.addActionListener(this);

	}

	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("确定")) {
			if (GoUserFrame.accountnum.equals(Atm.user[1])) {
				if (Atm.userKey[1].equals(oldPassword.getText())) {
					try {
						if (newPassword.getText().equals(checkPassword.getText())) {

							Atm.userKey[1] = newPassword.getText();
							JOptionPane.showMessageDialog(null, "更改密码成功");
							iframe.dispose();
							dispose();
							new GoUserFrame();
						} else {
							JOptionPane.showMessageDialog(null, "两次输入的密码不一致");
						}
					} catch (Exception e1) {// 捕获账户类中更改密码函数的异常并弹窗显示
						JOptionPane.showMessageDialog(null, e1.getMessage());
					}
				} else {

					JOptionPane.showMessageDialog(null, "原密码错误");
				}
			} else {
				if (Atm.userKey[2].equals(oldPassword.getText())) {
					try {
						if (newPassword.getText().equals(checkPassword.getText())) {

							Atm.userKey[2] = newPassword.getText();
							JOptionPane.showMessageDialog(null, "更改密码成功");
							iframe.dispose();
							dispose();
							new GoUserFrame();
						} else {
							JOptionPane.showMessageDialog(null, "两次输入的密码不一致");
						}
					} catch (Exception e1) {// 捕获账户类中更改密码函数的异常并弹窗显示
						JOptionPane.showMessageDialog(null, e1.getMessage());
					}
				} else {

					JOptionPane.showMessageDialog(null, "原密码错误");
				}
			}
		} else// 如果点击cancel
		{
			iframe.dispose();
			new UserFrame();
		}
	}

}
