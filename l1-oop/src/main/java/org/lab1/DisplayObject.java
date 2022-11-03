package org.lab1;

public abstract class DisplayObject {
    public abstract void destroy();

    public void render() {
        System.out.println("render display object");
    }
}
