package type;

public class Method extends Type {

	static Method current;
	static String currentName;

	Type domain,range;	

	protected Method(Type d, Type r) {
		super(METHOD, 0, r.getCode()+" ("+d.getCode()+")");
		domain = d;
		range = r;
		current = this;
		System.out.println("   NEW METHOD: "+this+" (DOMAIN: "+domain+", RANGE: "+range+")");
	}

	public Type getDomain(){
		return  domain;
	}

	public Type getRange(){
		return  range;
	}

	public static String getCurrentName(){
		return currentName;
	}

	public static Method getCurrent(){
		return current;
	}

	public static void putCurrent(String n, Method m){
		current = m;
		currentName = n;
		Type d = m.getDomain();
		Type r = m.getRange();
		System.out.println("   CURRENT METHOD: "+n+", type: "+m+" (DOMAIN: "+d+", RANGE: "+r+")");
	}

	public String toString(){
		return  ""+tag+domain+range;
	}

	protected String typeString(){
		return "method: "+range.typeString()+"("+domain.typeString()+")";
	}	
}
