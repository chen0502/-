package 迷宫程序;

public class Findpath1 {

	static int[][] maze;// 迷宮
	static int row;// 迷宮的行和列
	static int col;
	Stack<Point> sta;// 存放路径的栈
	int x;
	int y;
	int d;
	int i;
	int j;
	
	// 定义位置增量数组
	Point[] move = { new Point(0, 1), new Point(1, 0), new Point(0, -1), new Point(-1, 0) };

//重新构造一个迷宫，避免角落的点测试方向和中间的点不一样
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
		System.out.println("使用迷宫为：");
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				System.out.print(Findpath1.maze[i][j] + " ");
			}
			System.out.println();
		}
	}

	public boolean findpath1() {
		Point temp = new Point(1, 1, 0);// 起点
		sta.push(temp); // 起点进栈
		while (!sta.empty()) { // 迷宫路径是否存在的判断条件
			temp = sta.pop(); // 当前位置没有通路，就将该位置出栈
			x = temp.x;
			y = temp.y;
			d = temp.d + 1; // d是该位置的来的方向，由于是pop出来的，证明了d这个方向是错的，转下一个方向，故+1
			while (d < 5) { // 四个方向都是错的，出此循环，到大循环中pop出去，退回前一个点
				i = x + move[d - 1].x;
				j = y + move[d - 1].y; // 转过方向之后的新坐标
				if (maze[i][j] == 0) { // 该点可以到达
					temp = new Point(x, y, d);
					sta.push(temp); // 将该点进栈
					System.out.print("(" + x + "," + y + "," + d + ") ");
					maze[x][y] = 5; // 做标记，标示该位置已经走过
					x = i;
					y = j;
					if (x == row - 2 && y == col - 2) // 到达迷宫出口
					{
						temp = new Point(x, y, 0);
						sta.push(temp);
						return true; // 迷宫有路
					} else // 没有到达迷宫出口，重置d=1，下一个循环找下一个新位置，每个新位置都是从d=1开始试探的，不行再d=2/3/4
						d = 1;
				} else
					d++; // 该点不能到达，转下一个方向
			}
		}
		return false;// 迷宫无路
	}

	public Point[] getpath() {
		Point[] points = new Point[sta.size()];
		for (int i = points.length - 1; i >= 0; i--) {
			points[i] = sta.pop();
		}
		return points;
	}
}
