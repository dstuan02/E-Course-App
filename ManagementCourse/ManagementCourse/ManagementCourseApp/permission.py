from rest_framework.permissions import BasePermission


class IsAuthenticated(BasePermission):
    message = "Bạn không có quyền truy cập tài nguyên này."

    def has_permission(self, request, view):
        if request.user.is_anonymous:
            return False
        return request.user.is_authenticated


class IsAdmin(BasePermission):
    def has_permission(self, request, view):
        # Thực hiện logic kiểm tra quyền hạn tùy chỉnh ở đây
        return request.user.is_admin  # Ví dụ kiểm tra xem người dùng có quyền admin hay không


class IsUser(BasePermission):
#ktr user có phải admin không

    def has_permission(self, request, view):
        if request.user.is_anonymous:
            return ('Bạn không phải user')
        return request.user.is_authenticated and request.user.role == 'user'

