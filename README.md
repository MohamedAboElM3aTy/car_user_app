# A mini Car Booking Management System.
### A Car management System implemented by Flutter framework.

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

## Task:

* My Task is to build two apps ... Admin & User apps.
* I created the features as Flutter packages to be reusable in any project.
* I used Melos to handle the mono repo logic and implement two apps in the same repo.
* I used Supabase to handle authentication & handle validation [Admin or User]
* I used Supabase as a backend server side to store & handle data.
* User Can view available cars & can book them with a specific Date. 
* The Car can't be booked twice for the same date range.
* Admin Can apply (CRUD) operations for the car.
* Allow users to search for available cars.
* User & admin both can view booking history.
* Users can't book the same car at the same time.
* Admin can view all booking history.
* If admin deletes a car all the bookings related to it will be cancelled.
* Reference booking_table to car_table using car_id as a foreign key.


## Features :dart:
* [x] Melos - To Implement mono repos concept
* [x] Free & Open Source
* [x] Very Easy to use
* [x] Amazing UI 
* [x] Animation using Custom Painter 
* [x] Supabase Authentication (Login, Register & Logout) 
* [x] Validation to not allowing users in any app to log to the other app
* [x] Supabase Storage
* [x] Search for location & get current Location.
* [x] Cubit as State Mangement
* [x] Implement Features as a Flutter Packages.
* [x] The Admin can do (CRUD) operation on car_table. 
* [x] The User Can manage bookings with filter Dates. 
* [x] Search feature. 
* [x] Hydrated bloc to cache the user state. 


## Live Demos 📸  

### Admin App

https://github.com/user-attachments/assets/725b07c4-6664-4fc5-8912-e4330d77cf10

# After user had booked
https://github.com/user-attachments/assets/892f79c0-51dc-43fb-9f8c-106c3ae46236

###

### User App

https://github.com/user-attachments/assets/fe0ab712-94a4-4afc-a9f6-cc09a229195c


## Supabase snapshots


<img width="250" alt="Screenshot 2024-07-27 at 12 38 45 AM" src="https://github.com/user-attachments/assets/9eab803b-b20a-4856-8e3b-2a2c1def0be9">
<img width="250" alt="Screenshot 2024-07-27 at 12 38 56 AM" src="https://github.com/user-attachments/assets/20151520-7b22-4ac4-88a5-de381607c145">
<img width="250" alt="Screenshot 2024-07-27 at 12 39 02 AM" src="https://github.com/user-attachments/assets/3a7a74c2-a183-4a0d-a754-06803a09e569">
<img width="250" alt="Screenshot 2024-07-27 at 12 39 27 AM" src="https://github.com/user-attachments/assets/c2fa91c3-0e2c-4fd4-9f07-b482203aea61">

# You will notice here that each user is stored with his role [admin - user] and authorized access to which app based on his rule
<img width="250" alt="Screenshot 2024-07-27 at 12 40 38 AM" src="https://github.com/user-attachments/assets/54016344-3945-49b8-856a-ab16f661ec7a">
<img width="250" alt="Screenshot 2024-07-27 at 12 40 49 AM" src="https://github.com/user-attachments/assets/db4244e8-7df5-40db-9867-2c30db9cbb6d">





