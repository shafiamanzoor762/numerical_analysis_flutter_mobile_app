from rest_framework import serializers
from .models import User

class UserSerializer():
    class Meta:
        model=User
        # field('name','email','password')
        fields = '__all__'