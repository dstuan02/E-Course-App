from ckeditor.fields import RichTextField
from django.db import models
from django.contrib.auth.models import AbstractUser
from cloudinary.models import CloudinaryField
# Create your models here.


class User(AbstractUser):
    role = models.CharField(max_length=255,null=True, default="student")
    avatar = CloudinaryField('avatar',null=True)
    gender = models.CharField(max_length=255, null=True)
    address = models.CharField(max_length=255, null=True)


# tạo lớp kế thừa
class BaseModel (models.Model):
    create_date = models.DateField(auto_now_add=True,null=True) #auto_now_add: lấy ngày khi tạo
    update_date = models.DateField(auto_now=True,null=True) #auto_now: lấy ngày khi có sự thay đổi
    active = models.BooleanField(default=True,null=True)

    # tạo lớp trừu tượng
    class Meta:
        abstract = True


class Category(BaseModel):
    name = models.CharField(max_length=50, null=False)
    description = RichTextField(null=True)
    def __str__(self):
        return self.name


class Course (BaseModel):
    subject = models.CharField(max_length=255, null=False)
    description = RichTextField()
    image = CloudinaryField('image', null=True)

    # thiết lập khóa ngoại => khóa học thuộc danh mục
    category = models.ForeignKey(Category, on_delete=models.RESTRICT, related_query_name='courses')
    tags= models.ManyToManyField('Tag',null=True)
    user= models.ManyToManyField('User',null=True)
    def __str__(self):
        return self.subject

    class Meta:
        unique_together =('subject','category') #trang danh mục thì tên khóa học không được trùng


class Lesson(BaseModel):
    subject = models.CharField(max_length=255, null=False)
    content = RichTextField()
    image = CloudinaryField('image',null = True)
    # bài học thuộc khóa học nào
    course = models.ForeignKey(Course,on_delete=models.CASCADE)


    #một bài học có nhiều tags
    tags= models.ManyToManyField('Tag')
    class Meta:
        unique_together =('subject','course') #trong khóa học thì tên bài học không được trùng


class Tag(BaseModel):
    name= models.CharField(max_length=50,unique=True)

    def __str__(self):
        return self.name


class Interaction (BaseModel):
    # ai l người tường tác
    user = models.ForeignKey(User,on_delete=models.CASCADE, null= False)
    # tương tác trên khóa học nào
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE ,null=False)

    class Meta:
        abstract = True


class Comment(Interaction):
    content = models.CharField(max_length=255, null=False)


class Like(Interaction):
    active = models.BooleanField(default=True)

# chỉ like 1 lần
    class Meta:
        unique_together = ('user', 'lesson') #user và lesson là duy nhất không được trùng

class Rating(Interaction):
    rate = models.SmallIntegerField(default=0)
