from rest_framework.pagination import PageNumberPagination


class CoursePaginnator(PageNumberPagination):
    page_size=10
