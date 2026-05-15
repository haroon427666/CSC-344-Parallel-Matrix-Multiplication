# API Documentation

Complete API reference for the Smart Attendance Management System.

## Base URL
```
http://localhost:5000/api
```

## Authentication
All protected endpoints require JWT token in the Authorization header:
```
Authorization: Bearer <token>
```

---

## Endpoints

### Authentication Endpoints

#### Register User
```
POST /auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "full_name": "John Doe",
  "role": "student"  // student, teacher, admin
}

Response: 201 Created
{
  "message": "User registered successfully",
  "userId": 1
}
```

#### Login
```
POST /auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}

Response: 200 OK
{
  "message": "Login successful",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": 1,
    "email": "user@example.com",
    "full_name": "John Doe",
    "role": "student"
  }
}
```

---

### Users Endpoints

#### Get All Users
```
GET /users
Authorization: Bearer <token>

Response: 200 OK
[
  {
    "id": 1,
    "email": "user@example.com",
    "full_name": "John Doe",
    "role": "student"
  },
  ...
]
```

#### Get User by ID
```
GET /users/:id
Authorization: Bearer <token>

Response: 200 OK
{
  "id": 1,
  "email": "user@example.com",
  "full_name": "John Doe",
  "role": "student"
}
```

---

### Subjects Endpoints

#### Get All Subjects
```
GET /subjects
Authorization: Bearer <token>

Response: 200 OK
[
  {
    "id": 1,
    "subject_name": "Mathematics",
    "subject_code": "MATH101",
    "teacher_id": 2,
    "teacher_name": "John Teacher"
  },
  ...
]
```

#### Create Subject
```
POST /subjects
Authorization: Bearer <token>
Content-Type: application/json

{
  "subject_name": "Physics",
  "subject_code": "PHY101",
  "teacher_id": 2
}

Response: 201 Created
{
  "message": "Subject created",
  "subjectId": 1
}
```

---

### Attendance Endpoints

#### Mark Attendance
```
POST /attendance
Authorization: Bearer <token>
Content-Type: application/json

{
  "student_id": 1,
  "subject_id": 1,
  "status": "present",  // present, absent, late
  "remarks": "Optional remarks"
}

Response: 201 Created
{
  "message": "Attendance marked",
  "attendanceId": 1
}
```

#### Get Student Attendance
```
GET /attendance/student/:studentId/:subjectId
Authorization: Bearer <token>

Response: 200 OK
[
  {
    "id": 1,
    "student_id": 1,
    "subject_id": 1,
    "status": "present",
    "date": "2026-05-15T10:00:00Z",
    "remarks": null
  },
  ...
]
```

#### Get Attendance Report
```
GET /attendance/report/:subjectId
Authorization: Bearer <token>

Response: 200 OK
[
  {
    "id": 1,
    "full_name": "John Doe",
    "email": "john@example.com",
    "total_classes": 10,
    "present": 9,
    "absent": 1,
    "late": 0
  },
  ...
]
```

---

### Notifications Endpoints

#### Get User Notifications
```
GET /notifications/:userId
Authorization: Bearer <token>

Response: 200 OK
[
  {
    "id": 1,
    "user_id": 1,
    "message": "Attendance updated",
    "is_read": false,
    "created_at": "2026-05-15T10:00:00Z"
  },
  ...
]
```

#### Mark Notification as Read
```
PUT /notifications/:notificationId/read
Authorization: Bearer <token>

Response: 200 OK
{
  "message": "Notification marked as read"
}
```

---

## Error Responses

### 400 Bad Request
```json
{
  "message": "All fields required"
}
```

### 401 Unauthorized
```json
{
  "message": "Invalid credentials"
}
```

### 404 Not Found
```json
{
  "message": "User not found"
}
```

### 500 Internal Server Error
```json
{
  "message": "Internal Server Error"
}
```

---

## Response Status Codes

| Code | Description |
|------|-------------|
| 200  | OK - Request successful |
| 201  | Created - Resource created |
| 400  | Bad Request - Invalid input |
| 401  | Unauthorized - Auth required |
| 404  | Not Found - Resource not found |
| 500  | Server Error |

---

## Rate Limiting

Currently no rate limiting implemented. Recommended for production deployment.

---

## Pagination

Not implemented in current version. Recommended for large datasets.

---

## API Testing

### Using Postman

1. Create new request
2. Set URL: `http://localhost:5000/api/auth/login`
3. Set Method: POST
4. Set Body (raw JSON):
```json
{
  "email": "admin@school.com",
  "password": "admin123"
}
```
5. Send and copy the token
6. In Headers, add: `Authorization: Bearer <token>`

### Using cURL

```bash
# Login
curl -X POST http://localhost:5000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"admin@school.com","password":"admin123"}'

# Get all users
curl -X GET http://localhost:5000/api/users \
  -H "Authorization: Bearer <token>"
```

---

## API Versioning

Current API version: 1.0.0

Future versions may include:
- v2: Enhanced features
- v3: GraphQL support

---

## Changelog

### Version 1.0.0 (2026-05-15)
- Initial release
- Basic CRUD operations
- Authentication system
- Attendance management
- Notifications system
