package aTM;

import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;

public class ChooseChat extends JDialog implements ActionListener {
//	public static void main(String[] args) {
//		new ChooseChat();
//	}
	public ChooseChat() {
		setTitle("选择");
		setBounds(500, 500, 300, 300);
		Container c = getContentPane();
		c.setLayout(null);
		JLabel jl1 = new JLabel("请选择要查询的项目：");
		JButton jb1 = new JButton("余额");
		JButton jb2 = new JButton("记录");
		c.add(jl1);
		c.add(jb1);
		c.add(jb2);
		jl1.setBounds(100, 40, 200, 50);
		jb1.setBounds(50, 150, 100, 50);
		jb2.setBounds(150, 150, 100, 50);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		jb1.addActionListener(this);
		jb2.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().equals("余额")) {
			if (GoUserFrame.accountnum.equals(Atm.user[1])) {
				new Money();
				this.dispose();
			} else if (GoUserFrame.accountnum.equals(Atm.user[2])) {
				new Money2();
				this.dispose();
			}
		} else {
			new History();
			this.dispose();
		}
	}
}

class Money extends JFrame implements ActionListener {
	public Money() {
		setTitle("余额");
		setBounds(500, 500, 300, 300);
		Container c = getContentPane();
		c.setLayout(null);
		String s = String.valueOf(Atm.accout);
		JLabel jl1 = new JLabel("余额：");
		JButton jb2 = new JButton("返回");
		JLabel jl2 = new JLabel(s + "元");
		c.add(jl1);
		c.add(jb2);
		c.add(jl2);
		jl1.setBounds(50, 40, 200, 100);
		jb2.setBounds(100, 200, 100, 50);
		jl2.setBounds(100, 40, 100, 100);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		jb2.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		dispose();
	}
}

class Money2 extends JFrame implements ActionListener {
	public Money2() {
		setTitle("余额");
		setBounds(500, 500, 300, 300);
		Container c = getContentPane();
		c.setLayout(null);
		String s = String.valueOf(Atm.accout1);
		JLabel jl1 = new JLabel("余额：");
		JButton jb2 = new JButton("返回");
		JLabel jl2 = new JLabel(s + "元");
		c.add(jl1);
		c.add(jb2);
		c.add(jl2);
		jl1.setBounds(50, 40, 200, 100);
		jb2.setBounds(100, 200, 100, 50);
		jl2.setBounds(100, 40, 100, 100);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		jb2.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		dispose();
	}
}

class History extends JFrame implements ActionListener {
	public History() {
		setTitle("记录");
		setBounds(500, 500, 300, 300);
		Container c = getContentPane();
		c.setLayout(null);
		JButton jb2 = new JButton("返回");
		c.add(jb2);
		jb2.setBounds(100, 200, 100, 50);
		setVisible(true);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		jb2.addActionListener(this);
	}

	public void actionPerformed(ActionEvent e) {
		dispose();
	}
}
