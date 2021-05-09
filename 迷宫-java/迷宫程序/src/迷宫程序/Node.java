package 迷宫程序;

public class Node<T> // 单链表结点类，T指定结点的元素类型
{
	T data; // 数据域
	Node<T> next; // 引用域
	// 构造函数

	public Node() {
	}

	public Node(T data) {
		this.data = data;
	}

	public Node(T data, Node<T> next) {
		super();
		this.data = data;
		this.next = next;
	}

	// 数据域get属性
	public T getData() {
		return data;
	}

	// 数据域set属性
	public void setData(T data) {
		this.data = data;
	}

	// 引用域get属性
	public Node<T> getNext() {
		return next;
	}

	// 引用域get属性
	public void setNext(Node<T> next) {
		this.next = next;
	}

}