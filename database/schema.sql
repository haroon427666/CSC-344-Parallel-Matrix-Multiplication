CREATE DATABASE IF NOT EXISTS attendance_system;
USE attendance_system;

-- Users table
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(255) NOT NULL,
  role ENUM('student', 'teacher', 'admin') NOT NULL,
  is_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Subjects table
CREATE TABLE subjects (
  id INT PRIMARY KEY AUTO_INCREMENT,
  subject_name VARCHAR(255) NOT NULL,
  subject_code VARCHAR(50) UNIQUE NOT NULL,
  teacher_id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (teacher_id) REFERENCES users(id)
);

-- Subject enrollment (for students enrolled in subjects)
CREATE TABLE subject_enrollment (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  enrolled_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id),
  UNIQUE KEY unique_enrollment (student_id, subject_id)
);

-- Attendance table
CREATE TABLE attendance (
  id INT PRIMARY KEY AUTO_INCREMENT,
  student_id INT NOT NULL,
  subject_id INT NOT NULL,
  status ENUM('present', 'absent', 'late') DEFAULT 'absent',
  date DATETIME DEFAULT CURRENT_TIMESTAMP,
  remarks TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES users(id),
  FOREIGN KEY (subject_id) REFERENCES subjects(id),
  INDEX idx_student (student_id),
  INDEX idx_subject (subject_id),
  INDEX idx_date (date)
);

-- Notifications table
CREATE TABLE notifications (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  message TEXT NOT NULL,
  is_read BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Create indexes for performance
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
CREATE INDEX idx_attendance_student_subject ON attendance(student_id, subject_id);
CREATE INDEX idx_attendance_date ON attendance(date);

-- Insert demo data
INSERT INTO users (email, password, full_name, role) VALUES
('admin@school.com', '$2a$10$YourHashedPasswordHere', 'Admin User', 'admin'),
('teacher@school.com', '$2a$10$YourHashedPasswordHere', 'John Teacher', 'teacher'),
('student@school.com', '$2a$10$YourHashedPasswordHere', 'Jane Student', 'student');

INSERT INTO subjects (subject_name, subject_code, teacher_id) VALUES
('Mathematics', 'MATH101', 2),
('Physics', 'PHY101', 2),
('Chemistry', 'CHM101', 2);
