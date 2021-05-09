package 迷宫程序;

public interface Stack<T> {
	T push(T item); // 入栈

	T pop(); // 出栈

	T peek(); // 取栈顶元素

	int size(); // 返回栈中元素的个数

	boolean empty(); // 判断栈是否为空

}