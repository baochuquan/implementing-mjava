package symtab;

import java.util.*;
import type.*;

public class Env  {
  static Env top;
  static int num = 0;
  static Env root = new Env(null);
  static int envCounter;
  static ArrayList newEnvs = new ArrayList();
  static Map globals = new HashMap();

  HashMap table;  
  int counter;  
  Env prev;
  List vars;

  public Env(Env p) {
	counter = num;
	num++;
	table = new HashMap();
	prev = p;
      vars = new ArrayList();
  }

  public int getCounter(){
	return counter;
  }

  public static Env getRoot(){
	return root;
  }

  public static Env getCurrent(){
	return top;
  }

  public static void initFirst() {
	envCounter = 0;
	newEnvs.add(envCounter, root);
	top = (Env)newEnvs.get(envCounter);
	put("printf", new Symb(Type.method(Type.voidtype(), Type.voidtype()), null, true));
	put("scanf", new Symb(Type.method(Type.voidtype(), Type.voidtype()), null, true));
	System.out.println(" "+top);
  }

  public static void initSecond() {
	envCounter = 0;
	top = (Env)newEnvs.get(envCounter);
	System.out.println(" "+top);
  }

  public static void next() {
	envCounter++;
	top = (Env)newEnvs.get(envCounter);
	System.out.println(" "+top);
  }

  public static int putClass(String c, boolean p) {
	Name cName = Type.getName(c);
	if((cName != null) && !Name.isForward(c)) { push();
	  			 				  return 1;
	}
	else { Env current = top;
	  	 push();
	  	 cName = Type.putName(c, null, top);
	  	 Symb s = new Symb(cName, cName, p);
	  	 current.table.put(c, s);
		 System.out.println("   PUT "+c+" IN "+current);
	  	 return 0;
	}    
  }

  public static int putClass(String c, boolean p, String sc) {
	Name cName = Type.getName(c);
	if((cName != null) && !Name.isForward(c)) { push();
				 				  push();
	  			 				  return 1;
	}
	else { Name scName = Type.getName(sc);
		 if(scName == null){ push();
					   push();
				  	   return 2;
		 }
		 else { push(scName.getEnv());
			  Env current = top;
			  push();
			  cName = Type.putName(c, sc, top);
			  Symb s = new Symb(cName, cName, p);
			  current.table.put(c, s);
			  System.out.println("   PUT "+c+" IN "+current);
			  root.table.put(c,s);
		 	  System.out.println("   PUT "+c+" IN "+root);
			  return 0;
		 }
	}    
  }

  public static boolean put(String name, Symb s) {
	if(!top.table.containsKey(name)) { top.table.put(name,s);
	  					     System.out.println("   PUT "+name+" IN "+top);
	  					     return true;
	}
	return false;    
  }

  public static void putSymb(String name, Symb s) {
 	Env e = top.prev;
	e.table.put(name,s);
	System.out.println("   CHANGED "+name+" IN "+e);   
  }

  public static boolean putVar(String name, Symb s) {
	if(!top.table.containsKey(name)) { top.table.put(name,s);
	  					     top.vars.add(name);
	  		 			     System.out.println("   PUT VARIABLE "+name+" IN "+top);
	  					     return true;
	}
	return false;    
  }

  public static void putGlobal(String name, String var) {
	globals.put(name, var);
	System.out.println("   PUT CONSTANT "+var+" = \""+name+"\" IN GLOBALS");   
  }

  public static Symb get(String name) {
	return get(name, top);   
  }

  public static Symb get(String name, Env env) {
 	for(Env e = env; e != null; e = e.prev) { Symb found = (Symb)(e.table.get(name));
	  							if (found != null) return found;
	}
	return null;   
  }

  public static List getVars() {
	return top.vars;   
  }

  public List getEvars() {
	return vars;   
  }

  public static boolean remVar(String n) {
	boolean b = top.vars.remove(n);
	if (b) System.out.println("   REMOVED VARIABLE "+n+" FROM "+top);
	return b;   
  }

  public static String getGlobal(String name) {
	return (String)globals.get(name);   
  }

  public static Map getGlobals() {
	return globals;   
  }

  static void push(Env e) {
	envCounter++;
	top = new Env(e);
	newEnvs.add(envCounter, top);
	System.out.println(" "+top);
  }

  public static void push() {
	push(top);
  }

  public static void pop() {
	top = top.prev;
	envCounter++;
	newEnvs.add(envCounter, top);
	System.out.println(" "+top);
  }

  public String toString() {
	if(prev != null) return " e"+counter+": "+"(e"+prev.getCounter()+") "+table+" - VARIABLES: "+vars;
	else return " e"+counter+": "+table+" - VARIABLES: "+vars; 
  }

}