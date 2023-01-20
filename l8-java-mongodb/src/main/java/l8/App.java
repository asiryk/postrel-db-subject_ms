package l8;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import com.mongodb.client.*;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.time.LocalDate;
import java.util.*;

import static com.mongodb.client.model.Filters.*;

@SuppressWarnings("DuplicatedCode")
public class App {
    private MongoCollection<Document> spareParts;
    private MongoCollection<Document> orders;
    private MongoCollection<Document> clients;
    private MongoCollection<Document> managers;

    public void initializeDatabase() {
        ConnectionString connectionString = new ConnectionString("mongodb+srv://dbuser:<PASSWORD>@cluster0.oh6ix60.mongodb.net/?retryWrites=true&w=majority");
        MongoClientSettings settings = MongoClientSettings.builder()
                .applyConnectionString(connectionString)
                .serverApi(ServerApi.builder()
                        .version(ServerApiVersion.V1)
                        .build())
                .build();
        MongoClient mongoClient = MongoClients.create(settings);
        MongoDatabase database = mongoClient.getDatabase("company-parts");

        spareParts = database.getCollection("SparePart");
        orders = database.getCollection("Order");
        clients = database.getCollection("Client");
        managers = database.getCollection("Manager");
    }

    public void fillData() {
        Document sparePart1 = new Document("_id", new ObjectId());
        Document sparePart2 = new Document("_id", new ObjectId());
        Document sparePart3 = new Document("_id", new ObjectId());
        Document sparePart4 = new Document("_id", new ObjectId());

        Document order1 = new Document("_id", new ObjectId());
        Document order2 = new Document("_id", new ObjectId());
        Document order3 = new Document("_id", new ObjectId());
        Document order4 = new Document("_id", new ObjectId());

        Document client1 = new Document("_id", new ObjectId());
        Document client2 = new Document("_id", new ObjectId());
        Document client3 = new Document("_id", new ObjectId());
        Document client4 = new Document("_id", new ObjectId());

        Document manager1 = new Document("_id", new ObjectId());
        Document manager2 = new Document("_id", new ObjectId());
        Document manager3 = new Document("_id", new ObjectId());
        Document manager4 = new Document("_id", new ObjectId());

        // region SpareParts
        sparePart1.append("Name", "Wheel").append("Price", 800);
        spareParts.insertOne(sparePart1);

        sparePart2.append("Name", "Tire").append("Price", 300);
        spareParts.insertOne(sparePart2);

        sparePart3.append("Name", "Disk").append("Price", 200);
        spareParts.insertOne(sparePart3);

        sparePart4.append("Name", "AntiFreeze").append("Price", 150);
        spareParts.insertOne(sparePart4);
        // endregion


        // region Order
        List<Object> spareParts1 = new ArrayList<>();
        spareParts1.add(sparePart3.get("_id"));
        spareParts1.add(sparePart2.get("_id"));

        List<Object> spareParts2 = new ArrayList<>();
        spareParts1.add(sparePart2.get("_id"));

        List<Object> spareParts3 = new ArrayList<>();
        spareParts1.add(sparePart1.get("_id"));
        spareParts1.add(sparePart2.get("_id"));

        List<Object> spareParts4 = new ArrayList<>();
        spareParts1.add(sparePart3.get("_id"));

        order1.append("SpareParts", spareParts1).append("Discount", 10);
        orders.insertOne(order1);

        order2.append("SpareParts", spareParts2);
        orders.insertOne(order2);

        order3.append("SpareParts", spareParts3);
        orders.insertOne(order3);

        order4.append("SpareParts", spareParts4);
        orders.insertOne(order4);
        // endregion


        // region Client
        List<Object> orders1 = new ArrayList<>();
        orders1.add(order1.get("_id"));
        orders1.add(order2.get("_id"));

        List<Object> orders2 = new ArrayList<>();
        orders2.add(order3.get("_id"));

        List<Object> orders3 = new ArrayList<>();
        orders3.add(order4.get("_id"));

        List<Object> orders4 = new ArrayList<>();

        client1
                .append("FirstName", "Michael")
                .append("LastName", "Bay")
                .append("BirthDate", LocalDate.of(1987, 10, 10))
                .append("Orders", orders1);
        clients.insertOne(client1);

        client2
                .append("FirstName", "Vasyl")
                .append("LastName", "Oven")
                .append("BirthDate", LocalDate.of(1985, 2, 8))
                .append("Orders", orders2);
        clients.insertOne(client2);

        client3
                .append("FirstName", "John")
                .append("LastName", "Cage")
                .append("BirthDate", LocalDate.of(1997, 10, 10))
                .append("Orders", orders3);
        clients.insertOne(client3);

        client4
                .append("FirstName", "Rick")
                .append("LastName", "Sanchez")
                .append("BirthDate", LocalDate.of(1977, 3, 6))
                .append("Orders", orders4);
        clients.insertOne(client4);
        // endregion

        // region Manager
        Map<String, String> tenderPhones1 = new HashMap<>();
        tenderPhones1.put("Company11", "0673832019");
        tenderPhones1.put("Company12", "0673832017");

        Map<String, String> tenderPhones2 = new HashMap<>();
        tenderPhones2.put("Company21", "0673832015");

        Map<String, String> tenderPhones3 = new HashMap<>();
        tenderPhones3.put("Company31", "0673832018");
        tenderPhones3.put("Company32", "0673832018");
        tenderPhones3.put("Company34", "0673832012");

        Map<String, String> tenderPhones4 = new HashMap<>();
        tenderPhones4.put("Company41", "0673832018");
        tenderPhones4.put("Company42", "0673832011");
        tenderPhones4.put("Company44", "0673832012");

        List<Object> clients1 = new ArrayList<>();
        clients1.add(client1.get("_id"));
        clients1.add(client2.get("_id"));

        List<Object> clients2 = new ArrayList<>();
        clients2.add(client3.get("_id"));
        clients2.add(client4.get("_id"));

        List<Object> clients3 = new ArrayList<>();

        List<Object> clients4 = new ArrayList<>();

        manager1
                .append("FirstName", "Rebecca")
                .append("LastName", "Goodwin")
                .append("BirthDate", LocalDate.of(1997, 10, 10))
                .append("TenderPhones", tenderPhones1)
                .append("Commission", 4280)
                .append("Clients", clients1);
        managers.insertOne(manager1);

        manager2
                .append("FirstName", "Oleh")
                .append("LastName", "Davidson")
                .append("BirthDate", LocalDate.of(1995, 10, 10))
                .append("TenderPhones", tenderPhones2)
                .append("Commission", 3255)
                .append("Clients", clients2);
        managers.insertOne(manager2);

        manager3
                .append("FirstName", "Mathew")
                .append("LastName", "Gray")
                .append("BirthDate", LocalDate.of(1991, 8, 3))
                .append("TenderPhones", tenderPhones3)
                .append("Commission", 2500)
                .append("Clients", clients3);
        managers.insertOne(manager3);

        manager4
                .append("FirstName", "Garry")
                .append("LastName", "Owens")
                .append("BirthDate", LocalDate.of(1985, 1, 1))
                .append("TenderPhones", tenderPhones4)
                .append("Commission", 1500)
                .append("Clients", clients4);
        managers.insertOne(manager4);
        // endregion
    }

    public void makeQueries() {
        System.out.println("===================================");
        System.out.println("===================================");
        System.out.println("===================================");

        System.out.println("PRINT ALL DOCUMENTS");

        //Output
        System.out.println("Managers:");
        managers.find().forEach(System.out::println);

        System.out.println("clients:");
        clients.find().forEach(System.out::println);

        System.out.println("orders:");
        orders.find().forEach(System.out::println);

        System.out.println("spareParts:");
        spareParts.find().forEach(System.out::println);

        System.out.println("TWO CONDITIONS");

        Bson twoConditions = and(lte("Commission", 2000), gte("Commission", 1000));
        managers.find(twoConditions).forEach(System.out::println);

        System.out.println("AGGREGATION");

        Document unwind = new Document("$unwind", new Document("path", "$SpareParts"));

        Document lookup = new Document("$lookup",
                new Document("from", "SparePart")
                        .append("localField", "SpareParts")
                        .append("foreignField", "_id")
                        .append("as", "SparePartObject"));

        Document group = new Document("$group", 
            new Document("_id", "$SparePartObject._id")
            .append("SparePartCount", new Document("$sum", 1)));

        Document sort = new Document("$sort", 
            new Document("SparePartCount", 1));

        AggregateIterable<Document> results = orders.aggregate(
            Arrays.asList(unwind, lookup, group, sort));

        results.forEach(System.out::println);
    }
}
