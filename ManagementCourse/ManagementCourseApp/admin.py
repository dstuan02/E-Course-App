from django.contrib import admin
from django.template.context_processors import request
from django.template.response import TemplateResponse

from .models import Category,Course,Lesson,Tag, User
from django.utils.html import mark_safe
from django import forms
from ckeditor_uploader.widgets import CKEditorUploadingWidget
from django.urls import path
from ManagementCourseApp import dao
# kế thừa ModelAdmin


class CourseAppAdminSite(admin.AdminSite):
    site_header = 'quản lý khóa học'

    def get_urls(self):
        return  [
            path('course-stats/',self.stats_view)
        ]+super().get_urls()

    def stats_view(self,request):
        return TemplateResponse(request,'admin/stats.html',{
            'stats': dao.count_courses_by_cate()
        })


admin_site = CourseAppAdminSite(name='App')


class CategoryAdmin(admin.ModelAdmin):
    # ghi đè lại thuộc tính
    list_display = ['pk', 'name']
    search_fields =['name']


class CourseForm(forms.ModelForm):
    description = forms.CharField(widget=CKEditorUploadingWidget)

    class Meta:
        model = Course
        fields = '__all__'


class TagInlineAdmin(admin.StackedInline):
    model = Course.tags.through     # many - to -many =>through là lớp trung gian


class CoursesAdmin(admin.ModelAdmin):
    # ghi đè lại thuộc tính
    list_display = ['pk', 'subject']
    search_fields =['subject']
    readonly_fields = ['img'] #hiển thị ảnh => avatar là tên tự đặt
    form = CourseForm
    inlines = [TagInlineAdmin]
    def img(self,course):
        if course:
            return mark_safe(
                '<img src="/static/{url}" width="120" />'\
                    .format(url=course.image.name)
            )


class LessonAdmin(admin.ModelAdmin):
    # ghi đè lại thuộc tính
    list_display = ['pk', 'subject']
    search_fields =['subject']


class UserAdmin(admin.ModelAdmin):
    # ghi đè lại thuộc tính
    list_display = ['pk', 'first_name']
# Register your models here.


admin_site.register(Category, CategoryAdmin)
admin_site.register(Course,CoursesAdmin)
admin_site.register(Lesson,LessonAdmin)
admin_site.register(User,UserAdmin)

admin_site.register(Tag)

