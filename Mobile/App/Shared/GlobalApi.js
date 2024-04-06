import axios from "axios";

const SERVER_URL = "http://10.17.48.199:8000";
const SERVER = "http://10.17.48.199:8000";
// const SERVER_URL = "http://192.168.2.133:8000";
// const SERVER = "http://192.168.2.133:8000";
export const endpoints = {
  login: `${SERVER_URL}/o/token/`,
  register: `${SERVER_URL}/user/`,
  "current-user": `${SERVER_URL}/user/current_user/`,
  categories: `${SERVER_URL}/get_categories/`,
  "categories-course": (cateId) =>
    `${SERVER_URL}/get_categories/${cateId}/courses/`,
  courses: `${SERVER_URL}/get_course/`,
  lessons: (courseId) => `${SERVER_URL}/get_course/${courseId}/lessons/`,
  "lesson-details": (lessonId) => `${SERVER_URL}/get_lesson/${lessonId}/`,
  comments: (lessonId) => `${SERVER_URL}/get_lesson/${lessonId}/comment/`,
  "add-comment": (lessonId) => `${SERVER_URL}/get_lesson/${lessonId}/comments/`,
  "register-courses": (courseId) =>
    `${SERVER_URL}/user/${courseId}/add_course/`,
  "check-register-courses": (userId) => `${SERVER_URL}/user/${userId}/check/`,
};

export const api = (token) =>
  axios.create({
    baseURL: SERVER,
    headers: {
      Authorization: `Bearer ${token}`,
    },
  });

export default axios.create({
  baseURL: SERVER,
});
