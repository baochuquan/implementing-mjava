package type;

public class Reference extends Type {

	Type referred;	

	protected Reference(Type r) {
		super(REFERENCE, 4, "%struct."+r.getCode()+"*");
		referred = r;
		System.out.println("   NEW REFERENCE: "+this+" (REFERRED: "+referred+", WIDTH: "+width+")");
	}

	public Type getReferred(){
		return referred;
	}

	public String toString(){
		return ""+tag+referred;
	}

	protected String typeString(){
		return "*"+referred.typeString();
	}
}
