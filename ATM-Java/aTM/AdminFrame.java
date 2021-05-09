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
		setTitle("管理员界面");
		Container c = getContentPane();
		c.setLayout(null);
		setBounds(500, 500, 500, 500);
		this.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);// 关闭
		JButton sz = new JButton("系统设置");
		JButton jf = new JButton("账号解封");
		JButton mx = new JButton("明细查询");
		JButton tc = new JButton("退出");
		sz.setBounds(0, 400, 150, 50);
		jf.setBounds(180, 200, 150, 80);
		mx.setBounds(180, 50, 150, 80);
		tc.setBounds(330, 400, 150, 40);
		c.add(sz);
		c.add(mx);
		c.add(jf);
		c.add(tc);
		setVisible(true);
		// 添加监听器
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
		JOptionPane.showMessageDialog(null, "功能尚未实现，敬请期待！");
	}
}