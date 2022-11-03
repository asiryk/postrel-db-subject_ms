package org.lab1;

public class Main {
    public static void main(String[] args) {
        Container container = new Container();
        container.addChildren(new Container(), new Container(), new Container());

        System.out.printf("children length = %s%n", container.getChildren().size());

        container.setPosition(new Position(150, 150));
        container.setScale(0.67);

        container.destroy();
    }
}
