package com.tastyco;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

    private static final Properties props = new Properties();
    private static final String PROPS_FILE = "/db.properties";

    static {
        try (InputStream in = DBConnection.class.getResourceAsStream(PROPS_FILE)) {
            if (in != null) {
                props.load(in);
            } else {
                System.err.println("Warning: " + PROPS_FILE + " not found in classpath");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static Connection connect() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String dbUrl = getenvOrProperty("DB_URL", "db.url", "jdbc:mysql://localhost:3306/tastyco");
        String dbUser = getenvOrProperty("DB_USER", "db.user", "root");
        String dbPassword = getenvOrProperty("DB_PASSWORD", "db.password", "");

        try {
            return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static String getenvOrProperty(String envName, String propName, String defaultValue) {
        String value = System.getenv(envName);
        if (value != null && !value.isBlank()) {
            return value;
        }
        value = props.getProperty(propName);
        return (value != null && !value.isBlank()) ? value : defaultValue;
    }
}
