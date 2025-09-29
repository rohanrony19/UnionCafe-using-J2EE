<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f8f9fa; font-family: Arial, sans-serif; }
        .booking-card { border: 1px solid #ddd; border-radius: 8px; margin-bottom: 20px; padding: 15px; background: #fff; }
        .booking-header { font-weight: bold; color: #333; margin-bottom: 10px; }
        .booking-status { font-size: 14px; font-weight: bold; }
    </style>
</head>
<body>
<div class="container mt-4">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark mb-4" style="background: linear-gradient(to right, #6a11cb, #2575fc);">
        <div class="container-fluid">
            <a class="btn btn-light me-2" href="javascript:history.back()">&lt;&lt; Back</a>
            <span class="navbar-text text-white fw-bold">My Bookings</span>
        </div>
    </nav>

    <h2 class="mb-4">Your Bookings</h2>

    <c:choose>
        <c:when test="${empty bookings}">
            <p>You have not made any bookings yet.</p>
        </c:when>
        <c:otherwise>
            <c:forEach var="booking" items="${bookings}">
                <div class="booking-card" id="booking-${booking.id}">
                    <div class="row">
                        <div class="col-md-9">
                            <div class="booking-header"><c:out value="${booking.name}" /></div>
                            <p>Email: <strong><c:out value="${booking.email}" /></strong></p>
                            <p>Phone: <c:out value="${booking.phoneNumber}" /></p>
                            <p>Check-in Date: <c:out value="${booking.checkInDate}" /></p>
                            <p>Time: <c:out value="${booking.checkInTime}" /></p>
                            <p>Guests: <c:out value="${booking.numberOfGuests}" /></p>
                        </div>
                        <div class="col-md-3 text-end">
                            <p class="booking-status text-success">Status: Confirmed</p>
                            <form action="${pageContext.request.contextPath}/Home/User/CancelBooking" method="post">
                                <input type="hidden" name="id" value="<c:out value='${booking.id}'/>" />
                                <button type="submit" class="btn btn-outline-danger btn-sm">Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
