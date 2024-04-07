from distutils.command.check import check

from django.core.mail import send_mail
from django.core import mail
from django.http import HttpResponse
from rest_framework import viewsets, generics, status,parsers,permissions
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView

from ManagementCourseApp.models import Category,Course,Lesson,User,Comment,Like
from ManagementCourseApp import serializers, paginators,perms
from ManagementCourseApp.permission import IsAuthenticated,IsAdmin

# Create your views here.
class CategoryViewSet(viewsets.ViewSet, generics.ListAPIView):
    queryset = Category.objects.all()
    serializer_class = serializers.CategorySerializer

    @action(methods=['get'], detail=True)  # detail=True => truyền id
    def courses(self, request, pk):
        courses = self.get_object().course_set.filter(active=True).all()

        return Response(serializers.CourseSerializer(courses, many=True, context={'request': request}).data,
                        status=status.HTTP_200_OK)

class CourseViewSet(viewsets.ViewSet, generics.ListAPIView, generics.CreateAPIView):
    queryset = Course.objects.filter(active=True).all() #lấy khóa học active
    serializer_class = serializers.CourseSerializer
    pagination_class = paginators.CoursePaginnator

    def get_queryset(self):
        queries = self.queryset

        q = self.request.query_params.get("q")
        if q:
            queries = queries.filter(subject__icontains=q)

        return queries

    @action(methods=['get'], detail=True) #detail=True => truyền id
    def lessons(self, request, pk):
        lessons = self.get_object().lesson_set.filter(active=True).all()

        return Response(serializers.LessonSerializer(lessons, many=True, context={'request':request}).data,
                        status=status.HTTP_200_OK)

    # thêm caterogy học cho khoá học
    # @action(methods=['post'], detail=True)
    # def add_caterogy(self, request,pk):
    #     course = self.get_object()
    #     category_id = request.data.get('category_id', [])
    #     print(category_id)
    #     course.category_set.add(*category_id)
    #
    #     course.save()
    #     return Response('Thành công')


# RetrieveAPIView: lấy chi tiết thông tin =>get
# lấy danh sách lesson
class LessonViewSet(viewsets.ViewSet, generics.ListAPIView, generics.RetrieveAPIView):
    queryset = Lesson.objects.filter(active=True).all()
    serializer_class = serializers.LessonSerializer
    # permission_classes = [permissions.AllowAny]

    def get_permissions(self):
        if self.action in ['add_comment', 'like']:
            return [permissions.IsAuthenticated()]
        return [permissions.AllowAny()]

#     thêm comment
    @action(methods=['post'], url_path='comments', detail=True)
    def add_comment(self,request,pk):
        #dữ liệu server gửi lên lưu trong request.data
        # request.user => lưu thông tin chứng thực
        # get_object => đối tượng hiện tại
        c = Comment.objects.create(user=request.user, lesson = self.get_object(),content = request.data.get('content'))
        return Response(serializers.CommentSerializer(c).data,status=status.HTTP_201_CREATED)

    # like
    @action(methods=['post'], url_path='like', detail=True)
    def like(self,request,pk):
        # nếu đã like bài viết thì created = false và ngược lại
        like, created = Like.objects.update_or_create(user = request.user, lesson = self.get_object() )
        if not created:
            like.active = not like.active
            like.save()

        return Response(serializers.LessonDetailSerializer(self.get_object(),context={'request':request}).data,status=status.HTTP_200_OK)

    @action(methods=['get'], detail=True) #detail=True => truyền id
    def comment(self, request, pk):
        comment = self.get_object().comment_set.all()

        return Response(serializers.CommentSerializer(comment, many=True, context={'request':request}).data,
                        status=status.HTTP_200_OK)


    # @action(methods=['post'], detail=False)
    # def add_lesson(self,request):
    #     a = request.data.get('subject')
    #     b = request.data.get('content')
    #     d = Course.objects.get(pk =1)
    #
    #     c = Lesson.objects.create(subject=a,content =b,course =d)
    #     return Response(serializers.LessonSerializer(c).data,
    #                     status=status.HTTP_201_CREATED)
# DestroyAPIView => xóa
class CommentViewSet(viewsets.ViewSet, generics.DestroyAPIView, generics.UpdateAPIView):
    queryset = Comment.objects.all()
    serializer_class = serializers.CommentSerializer
    permission_classes = [perms.OwnerAuthenticated]

def send_email(subject='Bạn đã đăng ký khoá học tại trung tâm',
               body='Bạn đã đăng ký khoá học tại trung tâm',
               listreceiver = []):
    try:
        connection = mail.get_connection()
        email1 = mail.EmailMessage(
            subject,
            body,
            'ĐĂNG KÝ KHOÁ HỌC <huynhnhu2670@gmail.com>',
            listreceiver,
            connection=connection
        )
        email1.content_subtype = 'html'
        email1.send()
        return True
    except ValueError:
        return False
# CreateAPIView: update và thêm ==> post

class UserViewSet(viewsets.ViewSet, generics.CreateAPIView,generics.UpdateAPIView):
    queryset = User.objects.filter(is_active=True).all()
    serializer_class = serializers.UserSerializer
    parser_classes = [parsers.MultiPartParser]

    # chứng thực
    def get_permissions(self):
        if(self.action.__eq__('current_user')):
                return [permissions.IsAuthenticated()]

        return [permissions.AllowAny()]

    # lấy user theo current => chứng thực từ token
    @action(methods=['get'], url_name='current-user',detail=False)
    def current_user(self,request):
        request.user
        return Response(serializers.UserSerializer(request.user).data)

    # đk khóa học

    @action(methods=['post'], url_name='add_course',detail=True)
    def add_course(self,request,pk):
        user = User.objects.get(id=pk)
        course_id = request.data.get('course_id',[])
        print(user.id)
        print(self.get_object())
        user.course_set.add(*course_id)

        list_send_email = []
        list_send_email.append(user.email)
        send_email(subject="ĐĂNG KÝ KHOÁ HỌC",
                       body="Khóa học của bạn đã được xác nhận đăng ký thành công",
                       listreceiver=list_send_email)
        user.save()
        return Response('Đăng ký thành công',status=status.HTTP_201_CREATED)


    @action(methods=['get'], url_name='check',detail=True)
    def check(self,request, pk):
        id_course = request.GET.get('course')
        course = Course.objects.get(id=id_course)
        check = course.user.filter(id=pk).exists()
        if check:
            return Response(True, status=status.HTTP_200_OK)
        else:
            return Response(False, status=status.HTTP_200_OK)



