package 迷宫程序;

import java.util.Scanner;

public class MazeTest {

	public static void main(String[] args) {
		int m,n;
		Scanner ab = new Scanner(System.in);
		System.out.println("请输入迷宫的大小M*N");
		System.out.println("M=");
		m = ab.nextInt();
		System.out.println("N=");
		n = ab.nextInt();
		int[][] map = new int[m][n];
		int row = map.length, col = map[0].length;
		System.out.println("请输入迷宫：");
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				System.out.println("请输入map[" + i + "][" + j + "]=");
				map[i][j] = ab.nextInt();
			}

		}
//
//		int map[][] = { 
//		{ 0, 0, 1, 0, 0, 0, 1, 0 }, 
//		{ 0, 0, 1, 0, 0, 0, 1, 0 }, 
//		{ 0, 0, 0, 0, 1, 1, 0, 1 },
//		{ 0, 1, 1, 1, 0, 0, 1, 0 }, 
//		{ 0, 0, 0, 1, 0, 0, 0, 0 }, 
//		{ 0, 1, 0, 0, 0, 1, 0, 1 },
//		{ 0, 1, 1, 1, 1, 0, 0, 1 }, 
//		{ 1, 1, 0, 0, 0, 1, 0, 1 }, 
//		{ 1, 1, 0, 0, 0, 0, 0, 0 } };
//		int m = 9;
//		int n = 8;
//		int row = map.length, col = map[0].length;
		System.out.println("迷宫矩阵:");
		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				System.out.print(map[i][j] + " ");
			}
			System.out.println();
		}

		// 使用非递归算法
		System.out.println("使用非递归算法");
		Findpath1 mi = new Findpath1(map);
		System.out.println("所经道路：");
		if (mi.findpath1()) {
			Point[] points = mi.getpath();
			System.out.println();
			System.out.println("可到达路径:");
			for (int i = 0; i < points.length; i++) {
				System.out.print("(" + points[i].x + "," + points[i].y + "," + points[i].d + ") ");
			}
			System.out.println();
			System.out.println("迷宫表示为（5为所经道路）：");

			for (int i = 0; i < Findpath1.row; i++) {
				for (int j = 0; j < Findpath1.col; j++) {
					System.out.print(Findpath1.maze[i][j] + " ");
				}
				System.out.println();
			}
		} else {
			System.out.println("没有可到达路径！");
		}
		// 使用递归算法
		System.out.println("使用递归算法");
		FindPath2 f = new FindPath2(map, m, n);
		if (f.findPath2()) {
			System.out.println("有通路：5为正确通路，8为所经错误道路");
			for (int i = 0; i < FindPath2.maze.length; i++) {
				for (int j = 0; j < FindPath2.maze[0].length; j++) {
					System.out.print(FindPath2.maze[i][j] + " ");
				}
				System.out.println();
			}
		} else {
			System.out.println("没有通路，8为所经路径");
			for (int i = 0; i < FindPath2.maze.length; i++) {
				for (int j = 0; j < FindPath2.maze[0].length; j++) {
					System.out.print(FindPath2.maze[i][j] + " ");
				}
				System.out.println();
			}
		}
//		ab.close();
	}

}
