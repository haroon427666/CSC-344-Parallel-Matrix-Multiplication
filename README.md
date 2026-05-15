# Smart Attendance Management System

A fully functional, production-ready web application for managing student attendance with role-based access control.

## Features

### Core Features
✅ **User Authentication & Authorization**
- Login/Register with JWT authentication
- Role-based access (Student, Teacher, Admin)
- Secure password hashing with bcryptjs

✅ **Student Features**
- View enrolled subjects
- Check personal attendance records
- View attendance statistics

✅ **Teacher Features**
- Mark attendance for students
- Generate attendance reports
- Track student attendance history

✅ **Admin Features**
- User management (view all users)
- Subject management
- System administration

✅ **Additional Features**
- Real-time notifications
- PDF/CSV export functionality (extensible)
- Responsive design
- Professional UI/UX

## Tech Stack

### Frontend
- **React 18** - UI library
- **React Router v6** - Client-side routing
- **Axios** - HTTP client
- **CSS3** - Styling

### Backend
- **Node.js + Express** - Server framework
- **MySQL** - Database
- **JWT** - Authentication
- **bcryptjs** - Password hashing
- **CORS** - Cross-origin resource sharing

### Database
- **MySQL 8.0+** - Relational database

## Project Structure

```
attendance-system/
├── backend/
│   ├── routes/
│   │   ├── auth.js
│   │   ├── users.js
│   │   ├── subjects.js
│   │   ├── attendance.js
│   │   └── notifications.js
│   ├── server.js
│   ├── package.json
│   └── .env.example
├── frontend/
│   ├── src/
│   │   ├── pages/
│   │   │   ├── Login.js
│   │   │   ├── Register.js
│   │   │   ├── StudentDashboard.js
│   │   │   ├── TeacherDashboard.js
│   │   │   └── AdminDashboard.js
│   │   ├── services/
│   │   │   └── api.js
│   │   ├── styles/
│   │   │   ├── Auth.css
│   │   │   └── Dashboard.css
│   │   ├── App.js
│   │   └── index.js
│   ├── package.json
│   └── .gitignore
├── database/
│   └── schema.sql
└── README.md
```

## Installation & Setup

### Prerequisites
- Node.js (v14 or higher)
- MySQL (v8.0 or higher)
- npm or yarn

### Step 1: Database Setup

```bash
# Open MySQL
mysql -u root -p

# Import the schema
source database/schema.sql;
```

### Step 2: Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create .env file
cp .env.example .env

# Edit .env with your database credentials
# DB_HOST=localhost
# DB_USER=root
# DB_PASSWORD=your_password
# DB_NAME=attendance_system

# Start the backend server
npm start
# Server runs on http://localhost:5000
```

### Step 3: Frontend Setup

```bash
cd frontend

# Install dependencies
npm install

# Start the React development server
npm start
# Opens on http://localhost:3000
```

## Demo Credentials

### Admin Account
```
Email: admin@school.com
Password: admin123
Role: Admin
```

### Teacher Account
```
Email: teacher@school.com
Password: teacher123
Role: Teacher
```

### Student Account
```
Email: student@school.com
Password: student123
Role: Student
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Users
- `GET /api/users` - Get all users
- `GET /api/users/:id` - Get user by ID

### Subjects
- `GET /api/subjects` - Get all subjects
- `POST /api/subjects` - Create new subject

### Attendance
- `POST /api/attendance` - Mark attendance
- `GET /api/attendance/:studentId/:subjectId` - Get attendance records
- `GET /api/attendance/report/:subjectId` - Generate report

### Notifications
- `GET /api/notifications/:userId` - Get user notifications
- `PUT /api/notifications/:notificationId/read` - Mark as read

## Usage Guide

### For Students
1. Login with student credentials
2. View enrolled subjects
3. Check attendance records
4. View attendance statistics

### For Teachers
1. Login with teacher credentials
2. Select subject
3. Mark attendance for students
4. Generate reports

### For Admins
1. Login with admin credentials
2. Manage users
3. Manage subjects
4. View system statistics

## Features Implementation Details

### Authentication
- JWT-based authentication with 24-hour token expiry
- Password hashing using bcryptjs
- Role-based access control middleware

### Database Schema
- **users** - Stores user information
- **subjects** - Course/subject details
- **subject_enrollment** - Student-subject mapping
- **attendance** - Attendance records with status (present/absent/late)
- **notifications** - User notifications

### Security Features
- Password hashing
- JWT token validation
- CORS protection
- SQL injection prevention via parameterized queries

## Deployment Guide

### Deploy Backend to Heroku

```bash
cd backend

# Login to Heroku
heroku login

# Create Heroku app
heroku create your-app-name

# Set environment variables
heroku config:set DB_HOST=your_db_host
heroku config:set DB_USER=your_db_user
heroku config:set DB_PASSWORD=your_db_password

# Deploy
git push heroku main
```

### Deploy Frontend to Vercel

```bash
cd frontend

# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

### Deploy with Docker

```bash
docker-compose up -d
```

## Future Enhancements

- [ ] QR code attendance marking
- [ ] Face recognition attendance
- [ ] Email notifications
- [ ] Analytics dashboard
- [ ] Mobile app (React Native)
- [ ] Automated SMS alerts
- [ ] Advanced reporting with charts
- [ ] Biometric integration

## Troubleshooting

### Database Connection Error
- Ensure MySQL is running
- Check credentials in `.env` file
- Verify database exists

### Port Already in Use
- Change PORT in `.env` (backend)
- Change port 3000 for frontend: `PORT=3001 npm start`

### CORS Errors
- Ensure backend is running on `http://localhost:5000`
- Check CORS configuration in `server.js`

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For issues and questions, please open an issue on GitHub.

## Author

Created for educational purposes.

---

**Last Updated:** 2026-05-15
