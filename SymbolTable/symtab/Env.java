package symtab;

import java.util.*;

public class Env {
    static Env root = new Env(null);
    static Env top = root;
    HashMap table;
    Env prev;

    public Env(Env p) {
        table = new HashMap();
        prev = p;
    }

    public static int putClass(String c, String sc, Symb s) {
        if (root.table.containsKey(c)) {
            System.out.print("CLASS ENTRY: " + c);
            push();
            return 1;
        }
        if (sc == null) {
            root.table.put(c, s);
            System.out.print("CLASS ENTRY: " + c);
            top.table.put(c, s);
            push();
            return 0;
        }
        if (!root.table.containsKey(sc)) {
            System.out.print("CLASS ENTRY: " + c);
            push();
            return 2;
        } else {
            root.table.put(c, s);
            System.out.print("CLASS ENTRY: " + c);
            top.table.put(c, s);
            push();
            return 0;
        }
    }

    public static boolean put(String name, Symb s) {
        if (!top.table.containsKey(name)) {
            top.table.put(name, s);
            System.out.println("  NEW IDENTIFIER: " + name + " -> CURRENT ENVIRONMENT: " + top);
            return true;
        }
        return false;
    }

    public static Symb get(String name) {
        for (Env e = top; e != null; e = e.prev) {
            Symb found = (Symb) (e.table.get(name));
            if (found != null)
                return found;
        }
        return null;
    }

    public static void push() {
        top = new Env(top);
        System.out.println(" -> CURRENT ENVIRONMENT: " + top);
    }

    public static void pop() {
        top = top.prev;
        System.out.println(" -> CURRENT ENVIRONMENT: " + top);
    }

    public String toString() {
        if (prev != null)
            return prev.toString() + table;
        else
            return "" + table;
    }

}