package type;

public class Constructor extends Type {

	static Constructor current;

	Type domain,range;	

	protected Constructor(Type d, Type r) {
		super(CONSTRUCTOR, 0, r.getCode()+" ("+d.getCode()+")");
		domain = d;
		range = r;
		current = this;
		System.out.println("   NEW CONSTRUCTOR: "+this+" (DOMAIN: "+domain+", RANGE: "+range+")");
	}

	public Type getDomain(){
		return  domain;
	}

	public Type getRange(){
		return  range;
	}

	public static Constructor getCurrent(){
		return current;
	}

	public static void putCurrent(String n, Constructor m){
		current = m;
		Type d = m.getDomain();
		Type r = m.getRange();
		System.out.println("   CURRENT CONSTRUCTOR: "+n+", type: "+m+" (DOMAIN: "+d+", RANGE: "+r+")");
	}

	public String toString(){
		return  ""+tag+domain+range;
	}

	protected String typeString(){
		return "constructor: "+range.typeString()+"("+domain.typeString()+")";
	}
}
