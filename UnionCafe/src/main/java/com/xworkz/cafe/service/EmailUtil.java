package com.xworkz.cafe.service;

import com.xworkz.cafe.dto.CartItem;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.List;
import java.util.Properties;

public class EmailUtil {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String FROM_EMAIL = "email";  // your email
    private static final String PASSWORD = "password"; // Your app email password

    /**
     * Sends an email with given subject and message content to the specified recipient.
     * @param toEmail Recipient email address
     * @param subject Email subject
     * @param messageContent Content of the email text
     * @throws MessagingException When sending the email fails
     */
    public static void sendEmail(String toEmail, String subject, String messageContent) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new jakarta.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(FROM_EMAIL));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setText(messageContent);

        Transport.send(message);
    }

    public static void sendOrderConfirmationEmail(String toEmail, List<CartItem> cart, double totalAmount, String paymentMethod) throws MessagingException {
        String subject = "Order Confirmation";
        StringBuilder message = new StringBuilder();
        message.append("Your order has been successfully placed!\n\n");
        message.append("Order Details:\n");

        for (CartItem item : cart) {
            message.append("Product: ").append(item.getProductName())
                    .append("\nQuantity: ").append(item.getQuantity())
                    .append("\nPrice: ").append(item.getPrice())
                    .append("\n\n");
        }

        message.append("Total Amount: ").append(totalAmount).append("\n");
        message.append("Payment Method: ").append(paymentMethod).append("\n\n");
        message.append("Thank you for shopping with us!");

        sendEmail(toEmail, subject, message.toString());
    }

}
