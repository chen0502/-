package �Թ�����;

public class LinkedStack<T> implements Stack<T> {
	Node<T> top; // ջ��ָʾ��
	int size; // ջ�н��ĸ���

	// ��ʼ����ջ
	public LinkedStack() {
		top = null;
		size = 0;
	}

	// ��ջ����
	public T push(T item) {
		Node<T> newnode = new Node<T>(item);
		if (!empty())
			newnode.setNext(top);
		top = newnode;
		++size;
		return item;
	}

	// ��ջ����
	public T pop() {
		T item = null;
		if (!empty()) {
			item = top.getData();
			top = top.getNext();
			size--;
		}
		return item;
	}

	// ��ȡջ������Ԫ��
	public T peek() {
		T item = null;
		if (!empty()) {
			item = top.getData();
		}
		return item;
	}

	// ��ջ�ĳ���
	public int size() {
		return size;
	}

	// �ж�ջ�Ƿ�Ϊ��
	public boolean empty() {
		if ((top == null) && (size == 0)) {
			return true;
		} else {
			return false;
		}
	}
}