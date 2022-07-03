package type;

import java.util.*;
import symtab.Env;

public class Name extends Type {

    static Name current;
    static Hashtable forwards = new Hashtable();

    String name;
    String supername;
    Env env;

    protected Name(String n, String s, Env e) {
        super(NAME, 0);
        name = n;
        supername = s;
        env = e;
        current = this;
        System.out.println("   NEW CLASS: " + this + " (NAME: " + name + ", SUPER: " + supername + ", ENV: e"
                + env.getCounter() + ")");
    }

    protected Name(String n, String lexeme) {
        super(NAME, 0);
        name = n;
        supername = null;
        env = null;
        forwards.put(n, lexeme);
        System.out.println(
                "   FORWARD REFERENCE: " + this + " (NAME: " + name + ", SUPER: " + supername + ", ENV: e" + env + ")");
    }

    public static Name getCurrentClass() {
        return current;
    }

    public static void putCurrentClass(Name c) {
        current = c;
        String n = c.getName();
        String s = c.getSuper();
        Env e = c.getEnv();
        System.out.println(
                "   CURRENT CLASS: " + c + " (NAME: " + n + ", SUPER: " + s + ", ENV: e" + e.getCounter() + ")");
    }

    public static boolean isForward(String n) {
        return (forwards.remove(n) != null);
    }

    public static Hashtable ForwardHashtable() {
        return forwards;
    }

    public Env getEnv() {
        return env;
    }

    public String getName() {
        return name;
    }

    public String getSuper() {
        return supername;
    }

    public String toString() {
        return "" + tag + name;
    }

    protected String typeString() {
        return name;
    }
}