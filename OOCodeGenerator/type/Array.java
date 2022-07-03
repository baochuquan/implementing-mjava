package type;

public class Array extends Type {

	int size;
	Type base;	

	protected Array(int s, Type b) {
		super(ARRAY, s * b.getWidth(), "["+s+" x "+b.getCode()+"]");
		size = s;
		base = b;
		System.out.println("   NEW ARRAY: "+this+" (SIZE: "+size+", BASE: "+base+", WIDTH: "+width+")");
	}

	public int getSize(){
		return size;
	}

	public Type getBase(){
		return base;
	}

	public String toString(){
		return ""+tag+base;
	}

	protected String typeString(){
		return base.typeString()+"[]";
	}
}
