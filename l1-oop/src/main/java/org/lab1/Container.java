package org.lab1;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Container extends DisplayObject {

    private final List<DisplayObject> children;
    private DisplayObject parent;
    private Position position;
    private double scaleX;
    private double scaleY;


    public Container() {
        this.children = new ArrayList<>();
        this.position = new Position(0, 0);
        this.setScale(1);

        System.out.println("Initialize container");
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public void setParent(DisplayObject parent) {
        this.parent = parent;
    }

    public void setScale(int scaleX, int scaleY) {
        this.scaleX = scaleX;
        this.scaleY = scaleY;
    }

    public void setScale(double scale) {
        this.scaleX = scale;
        this.scaleY = scale;
    }

    public void addChildren(DisplayObject... children) {
        this.children.addAll(Stream.of(children).collect(Collectors.toList()));
    }

    public List<DisplayObject> getChildren() {
        return children;
    }

    @Override
    public void destroy() {
        destroyChildren();
        System.out.println("destroy container");
    }

    private void destroyChildren() {
        System.out.println("destroy children");
        children.forEach(DisplayObject::destroy);
    }

    @Override
    public void render() {
        super.render();
        System.out.println("render specific for container");
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Container container = (Container) o;
        return children.equals(container.children) && Objects.equals(parent, container.parent);
    }

    @Override
    public int hashCode() {
        return Objects.hash(children, parent);
    }

}
