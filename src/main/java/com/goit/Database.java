package com.goit;

import org.h2.Driver;

import java.sql.*;

public class Database implements AutoCloseable {
    private static final String URL = "jdbc:h2:~/test";
    private static final String LOGIN = "admin";
    private static final String PASSWORD = "admin";

    private static Database instance;
    private final Driver driver = new Driver();
    private Connection connection;
    private Statement statement;

    private Database() throws SQLException {
        DriverManager.registerDriver(driver);
        openConnection(URL, LOGIN, PASSWORD);
    }

    public static Database getInstance() throws SQLException {
        if(instance == null){
            instance = new Database();
        }
        return instance;
    }

    private void openConnection(String url, String login, String password) throws SQLException {
        connection = DriverManager.getConnection(url, login, password);
        statement = connection.createStatement();
    }
    public Connection getConnection() {
        return connection;
    }

    public ResultSet executeQuery(String sql) throws SQLException {
        return statement.executeQuery(sql);
    }

    public int executeUpdate(String sql) throws SQLException {
        return statement.executeUpdate(sql);
    }

    public boolean execute(String sql) throws SQLException {
        return statement.execute(sql);
    }

    @Override
    public void close() throws Exception {
        statement.close();
        connection.close();
    }
}
