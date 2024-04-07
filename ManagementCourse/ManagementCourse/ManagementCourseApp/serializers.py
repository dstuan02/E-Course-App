from urllib.parse import urljoin

from ManagementCourseApp.models import Category,Course,Tag,Lesson,User, Comment,Like
from rest_framework import serializers

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ['id' , 'name']


class BaseSerializer(serializers.ModelSerializer):
    image = serializers.SerializerMethodField(source='image')
    tags = TagSerializer(many=True)

    def get_image(self, course):
        if course.image:
            request = self.context.get('request')
            if request:
                return request.build_absolute_uri('/static/%s' % course.image.name)
            return '/static/%s' % course.image.name


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = '__all__'

    def get_image_url(self, user):
        return user.image.url


    image_url = serializers.SerializerMethodField(method_name='get_image_url')
    # def create(self, validated_data):
    #     tags_data = validated_data.pop('tags')
    #     users_data = validated_data.pop('user')# Retrieve the tags data
    #     course = Course.objects.create(**validated_data)  # Create the Course object
    #
    #     # Use set() to assign the tags to the many-to-many field
    #     # course.tags.set(tags_data)
    #     # course.users.set(users_data)
    #
    #     for tag_data in tags_data:
    #         tag_id = int(tag_data['id'])
    #         tag = Tag.objects.get(id=tag_id)
    #         course.tags.add(tag)
    #
    #     for user_data in users_data:
    #         user_id = int(user_data['id'])  # Chuyển đổi giá trị 'id' thành số nguyên
    #         user = User.objects.get(id=user_id)  # Lấy đối tượng User dựa trên 'id'
    #         course.users.add(user)
    #
    #
    #     return course

class LessonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Lesson
        fields = ['id', 'subject', 'image', 'tags', 'content', 'create_date', 'update_date','image_url']

    def get_image_url(self, user):
        return user.image.url


    image_url = serializers.SerializerMethodField(method_name='get_image_url')

class LessonDetailSerializer(BaseSerializer):
    liked = serializers.SerializerMethodField()

    def get_liked(self,lesson):
        request = self.context.get('request')
        if request.user.is_authenticated: #ktra đang nhập
            return lesson.like_set.filter(active = True).exists() #ktra like có tồn tại không

    class Meta:
        model = LessonSerializer.Meta.model
        fields = LessonSerializer.Meta.fields + ['liked']


class UserSerializer(serializers.ModelSerializer):
#đăng ký
    class Meta:
        model = User
        fields = ['username','password','first_name', 'last_name', 'email','avatar','avatar_url']
        extra_kwargs ={
            'password':{
                'write_only':True
            }
        }


    def get_image_url(self, user):
        # base_url = 'https://res.cloudinary.com/dhdca9ibd/'

        # if user.avatar and base_url not in urljoin(base_url, user.avatar.url):
        return user.avatar.url


    avatar_url = serializers.SerializerMethodField(method_name='get_image_url')
#
# ghi đè phương thức create
    def create(self, validated_data):
        data=validated_data.copy()

        user = User(**data)
        user.set_password(data['password'])
        user.save()

        return user


class AllCommentSerializer(BaseSerializer):
    class Meta:
        model = Comment
        fields = '__all__'


class CommentSerializer(serializers.ModelSerializer):
    user = UserSerializer()

    class Meta:
        model = Comment
        fields = ['id', 'content', 'user']
