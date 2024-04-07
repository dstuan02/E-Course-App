from django.urls import path,include,re_path
from rest_framework import routers
from ManagementCourseApp import views


routers = routers.DefaultRouter()
routers.register('get_categories',views.CategoryViewSet, basename='get_categories')
routers.register('get_course',views.CourseViewSet, basename='get_course')
routers.register('get_lesson',views.LessonViewSet, basename='get_lesson')
routers.register('comment',views.CommentViewSet, basename='comment')
routers.register('user',views.UserViewSet, basename='user')


urlpatterns = [
    path('', include(routers.urls)),


]
