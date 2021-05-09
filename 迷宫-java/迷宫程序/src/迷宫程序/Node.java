package �Թ�����;

public class Node<T> // ���������࣬Tָ������Ԫ������
{
	T data; // ������
	Node<T> next; // ������
	// ���캯��

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

	// ������get����
	public T getData() {
		return data;
	}

	// ������set����
	public void setData(T data) {
		this.data = data;
	}

	// ������get����
	public Node<T> getNext() {
		return next;
	}

	// ������get����
	public void setNext(Node<T> next) {
		this.next = next;
	}

}