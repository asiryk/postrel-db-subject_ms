package l8;

import org.junit.Test;

public class AppTest {

    @Test
    public void shouldWork() {
        App app = new App();
        app.initializeDatabase();
        app.fillData();
        app.makeQueries();
    }
}
