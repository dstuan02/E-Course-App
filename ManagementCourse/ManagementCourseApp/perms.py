from rest_framework import permissions


class OwnerAuthenticated(permissions.IsAuthenticated):
    def has_object_permission(self, request, view, obj):
        return self.has_permission(request, view) and request.user == obj.user


class AdminAuthenticated(permissions.IsAuthenticated):
     def has_object_permission(self, request, view, obj):
        #  getattr lấy đối tượng
        role = getattr(request.user, 'role', None)
        breakpoint
        print("role:", role)

        return self.has_permission(request, view) and role == 'admin'


