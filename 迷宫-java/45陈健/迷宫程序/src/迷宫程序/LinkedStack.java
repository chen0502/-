package 迷宫程序;

public class LinkedStack<T> implements Stack<T> {
	Node<T> top; // 栈顶指示器
	int size; // 栈中结点的个数

	// 初始化链栈
	public LinkedStack() {
		top = null;
		size = 0;
	}

	// 入栈操作
	public T push(T item) {
		Node<T> newnode = new Node<T>(item);
		if (!empty())
			newnode.setNext(top);
		top = newnode;
		++size;
		return item;
	}

	// 出栈操作
	public T pop() {
		T item = null;
		if (!empty()) {
			item = top.getData();
			top = top.getNext();
			size--;
		}
		return item;
	}

	// 获取栈顶数据元素
	public T peek() {
		T item = null;
		if (!empty()) {
			item = top.getData();
		}
		return item;
	}

	// 求栈的长度
	public int size() {
		return size;
	}

	// 判断栈是否为空
	public boolean empty() {
		if ((top == null) && (size == 0)) {
			return true;
		} else {
			return false;
		}
	}
}