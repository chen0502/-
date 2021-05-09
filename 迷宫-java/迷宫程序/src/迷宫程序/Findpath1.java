package �Թ�����;

public class Findpath1 {

	static int[][] maze;// �Ԍm
	static int row;// �Ԍm���к���
	static int col;
	Stack<Point> sta;// ���·����ջ
	int x;
	int y;
	int d;
	int i;
	int j;
	
	// ����λ����������
	Point[] move = { new Point(0, 1), new Point(1, 0), new Point(0, -1), new Point(-1, 0) };

//���¹���һ���Թ����������ĵ���Է�����м�ĵ㲻һ��
	public Findpath1(int[][] map) {
		row = map.length + 2;
		col = map[0].length + 2;
		sta = new LinkedStack<Point>();
		maze = new int[row][col];
		int h = row - 1;
		int l = col - 1;
		while (h > 0) {
			maze[h][0] = 1;
			maze[h][col - 1] = 1;
			h--;
		}
		while (l > 0) {
			maze[0][l] = 1;
			maze[row - 1][l] = 1;
			l--;
		}

		for (int i = 1; i < row - 1; i++) {
			for (int j = 1; j < col - 1; j++) {
				maze[i][j] = map[i - 1][j - 1];
			}
		}
		System.out.println("ʹ���Թ�Ϊ��");
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				System.out.print(Findpath1.maze[i][j] + " ");
			}
			System.out.println();
		}
	}

	public boolean findpath1() {
		Point temp = new Point(1, 1, 0);// ���
		sta.push(temp); // ����ջ
		while (!sta.empty()) { // �Թ�·���Ƿ���ڵ��ж�����
			temp = sta.pop(); // ��ǰλ��û��ͨ·���ͽ���λ�ó�ջ
			x = temp.x;
			y = temp.y;
			d = temp.d + 1; // d�Ǹ�λ�õ����ķ���������pop�����ģ�֤����d��������Ǵ�ģ�ת��һ�����򣬹�+1
			while (d < 5) { // �ĸ������Ǵ�ģ�����ѭ��������ѭ����pop��ȥ���˻�ǰһ����
				i = x + move[d - 1].x;
				j = y + move[d - 1].y; // ת������֮���������
				if (maze[i][j] == 0) { // �õ���Ե���
					temp = new Point(x, y, d);
					sta.push(temp); // ���õ��ջ
					System.out.print("(" + x + "," + y + "," + d + ") ");
					maze[x][y] = 5; // ����ǣ���ʾ��λ���Ѿ��߹�
					x = i;
					y = j;
					if (x == row - 2 && y == col - 2) // �����Թ�����
					{
						temp = new Point(x, y, 0);
						sta.push(temp);
						return true; // �Թ���·
					} else // û�е����Թ����ڣ�����d=1����һ��ѭ������һ����λ�ã�ÿ����λ�ö��Ǵ�d=1��ʼ��̽�ģ�������d=2/3/4
						d = 1;
				} else
					d++; // �õ㲻�ܵ��ת��һ������
			}
		}
		return false;// �Թ���·
	}

	public Point[] getpath() {
		Point[] points = new Point[sta.size()];
		for (int i = points.length - 1; i >= 0; i--) {
			points[i] = sta.pop();
		}
		return points;
	}
}
