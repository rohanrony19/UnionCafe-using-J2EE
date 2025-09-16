<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.0/css/all.min.css"
          integrity="sha512-DxV+EoADOkOygM4IR9yXP8Sb2qwgidEmeqAEmDKIOfPRQZOWbXCzLC6vjbZyy0vPisbH2SyW27+ddLVCN+OMzQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600;700&family=Playfair+Display:wght@700;800;900&display=swap" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .book{
            margin-top:40px;
            color: white; /* Deep purple */
            font-family: 'Playfair Display', serif; /* Elegant font */
            font-style: italic;
            display: flex;
            align-items: center; /* Corrected */
            justify-content: space-evenly;
            font-weight: bold; /* Extra bold */
            font-size: 1.8rem; /* Slightly bigger for visibility */
            letter-spacing: 2px; /* Spacing for stylish feel */
            text-transform: uppercase; /* Optional: make it all caps */
            text-align: center;
            font-weight: 900;
            font-size: 1.8rem;
            margin-bottom:40px;
        }
         .form-blur-box {
     background-color: rgba(255, 255, 255, 0.01); /* almost fully transparent */
  backdrop-filter: blur(6px);
  -webkit-backdrop-filter: blur(6px);
    border-radius: 15px;
    padding: 20px;
    color: white;
  }
         body {
     background-image: url('https://www.speque.com/Posts/TitleImages/5-advantages-of-a-table-booking-management-system-for-restaurants.jpg');
       background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
      <!--min-height: 100vh;-->
      margin: 0;
    }

    </style>
</head>
<body >
<!-- Back Button -->
<button onclick="history.back()"
        style="
          position: fixed;
          top: 20px;
          left: 30px;
          <!--z-index: 1000;-->
          background-color: white;  /* fully transparent background */
          color: black;                   /* white text color */
          border: none;
          padding: 5px 10px;
          border-radius: 5px;
          cursor: pointer;
        ">
    << BACK
</button>


<h1 class="book" style="font-size:bold" id="booking-section">Book A Table Now</h1>
<div class="Booking d-flex justify-content-center align-items-center " >
    <div class="container">
        <div class="row d-flex justify-content-center align-items-center ">
            <!-- Form Column -->
            <div class="col-md-6">
                <form action="#" method="post" class="p-4 border rounded form-blur-box"
                      style=" color: white;">
                    <h3 class="mb-4 text-center" style="color: white;">Book Your Table</h3>

                    <div class="row mb-3 align-items-center">
                        <label for="name" class="col-sm-4 col-form-label">Name:</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="name" name="name" placeholder="Name" required>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="email" class="col-sm-4 col-form-label">Email *</label>
                        <div class="col-sm-8">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email"
                                   required>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="phone" class="col-sm-4 col-form-label">Phone Number *</label>
                        <div class="col-sm-8">
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone" required>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="checkin-date" class="col-sm-4 col-form-label">Check-in Date *</label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control" id="checkin-date" name="checkin" required>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="time" class="col-sm-4 col-form-label">Time *</label>
                        <div class="col-sm-8">
                            <input type="time" class="form-control" id="time" name="time" value="04:00:00" required>
                        </div>
                    </div>

                    <div class="row mb-3 align-items-center">
                        <label for="guests" class="col-sm-4 col-form-label">Number of Guests *</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="guests" name="guests" min="1" max="20"
                                   value="1" required>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-light w-100">Book Now</button>
                </form>
            </div>
        </div>

    </div>
</div>


</body>
</html>