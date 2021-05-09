package 迷宫程序;

public class FindPath2 {
	static int outx;
	static int outy;
	static int[][] maze;
	static int i = 1;
	static int j = 1;

	// 给迷宫加上“墙”
	public FindPath2(int[][] map, int outx, int outy) {
		FindPath2.outx = outx;
		FindPath2.outy = outy;
		int row = map.length + 2;
		int col = map[0].length + 2;
		FindPath2.maze = new int[row][col];
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
				System.out.print(maze[i][j] + " ");
			}
			System.out.println();
		}
	}

	public  boolean findPath2() {
		return findPath2(maze, i, j, outx, outy);
	}

	public static boolean findPath2(int[][] maze, int i, int j, int outx, int outy) {
		if (maze[outx][outy] == 5) {
			return true;
		} else {
			if (maze[i][j] == 0) {// 通路，且没走过
				maze[i][j] = 5;// 标记走过
				if (findPath2(maze, i, j + 1, outx, outy)) {// right
					return true;
				} else if (findPath2(maze, i + 1, j, outx, outy)) {// down
					return true;
				} else if (findPath2(maze, i, j - 1, outx, outy)) {// left
					return true;
				} else if (findPath2(maze, i - 1, j, outx, outy)) {// up
					return true;
				} else {
					maze[i][j] = 8;
					return false;
				}

			} else {
				return false;
			}
		}
	}

}
