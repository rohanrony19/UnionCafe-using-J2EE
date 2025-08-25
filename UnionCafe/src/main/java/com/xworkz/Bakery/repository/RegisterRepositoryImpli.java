package com.xworkz.Bakery.repository;

import com.xworkz.Bakery.dto.RegisterDTO;

import java.sql.*;

public class RegisterRepositoryImpli implements RegisterRepository {
    @Override
    public void save(RegisterDTO dto) {
        System.out.println("hiii");
        System.out.println(dto);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crud";
            String name = "root";
            String password = "Katherine20*";
            Connection connection = DriverManager.getConnection(url, name, password);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO bakery_details Values(?,?,?,?,?)");
            preparedStatement.setInt(1, 0);
            preparedStatement.setString(2, dto.getFullName());
            preparedStatement.setLong(3, dto.getPhoneNumber());
            preparedStatement.setString(4, dto.getEmail());
            preparedStatement.setString(5, dto.getPassword());
            preparedStatement.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public boolean checkMail(String mail) {
        System.out.println("mail in repo" + mail);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crud";
            String name = "root";
            String password = "Katherine20*";
            Connection connection = DriverManager.getConnection(url, name, password);
            String sql = "select Email from bakery_details where Email=?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, mail);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                return true;
            }

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return false;
    }

    @Override
    public String getPassword(String mail) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crud";
            String name = "root";
            String password = "Katherine20*";

            Connection connection = DriverManager.getConnection(url, name, password);

            String sql = "select Password from bakery_details where Email=?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, mail);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                return resultSet.getString(1);
            }


        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "";
    }

    @Override
    public void updatePassword(String mail, String userPassword) {
        System.out.println("im in repo");
        System.out.println(mail);
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crud";
            String name = "root";
            String password = "Katherine20*";

            Connection connection = DriverManager.getConnection(url, name, password);

            String sql = "update  bakery_details set  password=? where Email=?";

            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userPassword);
            preparedStatement.setString(2, mail);
            preparedStatement.executeUpdate();

        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public RegisterDTO displayAllDataFromEmail(String email) {
        System.out.println("in display details");
        RegisterDTO dto = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/crud";
            String username = "root";
            String password = "Katherine20*";

            Connection connection = DriverManager.getConnection(url, username, password);

            String sql = "SELECT Name, Phone_Number, password FROM bakery_details WHERE Email = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email); // only email needed for query

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                dto = new RegisterDTO();
                dto.setFullName(resultSet.getString("Name"));
                dto.setPhoneNumber(resultSet.getLong("Phone_Number"));
                dto.setPassword(resultSet.getString("password"));
                dto.setEmail(email); // email already known
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException(e);
        }
        return dto;
    }
}