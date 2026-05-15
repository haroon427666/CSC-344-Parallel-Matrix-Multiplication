import axios from 'axios';

const API_BASE_URL = 'http://localhost:5000/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json'
  }
});

// Add token to requests
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// Handle response errors
api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem('token');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

// Auth endpoints
export const authAPI = {
  register: (email, password, full_name, role) =>
    api.post('/auth/register', { email, password, full_name, role }),
  login: (email, password) =>
    api.post('/auth/login', { email, password })
};

// Users endpoints
export const usersAPI = {
  getAll: () => api.get('/users'),
  getById: (id) => api.get(`/users/${id}`)
};

// Subjects endpoints
export const subjectsAPI = {
  getAll: () => api.get('/subjects'),
  create: (subject_name, subject_code, teacher_id) =>
    api.post('/subjects', { subject_name, subject_code, teacher_id })
};

// Attendance endpoints
export const attendanceAPI = {
  mark: (student_id, subject_id, status, remarks) =>
    api.post('/attendance', { student_id, subject_id, status, remarks }),
  getStudentAttendance: (studentId, subjectId) =>
    api.get(`/attendance/${studentId}/${subjectId}`),
  getReport: (subjectId) =>
    api.get(`/attendance/report/${subjectId}`)
};

// Notifications endpoints
export const notificationsAPI = {
  getNotifications: (userId) =>
    api.get(`/notifications/${userId}`),
  markAsRead: (notificationId) =>
    api.put(`/notifications/${notificationId}/read`)
};

export default api;
