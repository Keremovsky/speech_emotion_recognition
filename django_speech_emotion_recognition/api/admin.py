from django.contrib import admin
from .models import User, Challenge, ChallengeHistory


class AutoDisplayAdmin(admin.ModelAdmin):
    def get_list_display(self, request):
        return [field.name for field in self.model._meta.fields]


@admin.register(User)
class UserAdmin(AutoDisplayAdmin):
    pass


@admin.register(Challenge)
class ChallengeAdmin(AutoDisplayAdmin):
    pass


@admin.register(ChallengeHistory)
class ChallengeHistoryAdmin(AutoDisplayAdmin):
    pass
