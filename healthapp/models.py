# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Exercise(models.Model):
    exerciseid = models.AutoField(db_column='exerciseId', primary_key=True)  # Field name made lowercase.
    exercisename = models.CharField(db_column='exerciseName', max_length=100)  # Field name made lowercase.
    calories = models.FloatField()

    class Meta:
        managed = False
        db_table = 'exercise'


class Exerciseprofilemap(models.Model):
    exerciseprofilemapid = models.AutoField(db_column='exerciseProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey('Profile', models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    exerciseid = models.ForeignKey(Exercise, models.DO_NOTHING, db_column='exerciseId')  # Field name made lowercase.
    date = models.DateTimeField()
    caloriesburnt = models.FloatField(db_column='caloriesBurnt')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'exerciseprofilemap'


class Food(models.Model):
    foodid = models.AutoField(db_column='foodId', primary_key=True)  # Field name made lowercase.
    foodname = models.CharField(db_column='foodName', max_length=100)  # Field name made lowercase.
    calories = models.FloatField()

    class Meta:
        managed = False
        db_table = 'food'


class Foodprofilemap(models.Model):
    foodprofilemapid = models.AutoField(db_column='foodProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey('Profile', models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    foodid = models.ForeignKey(Food, models.DO_NOTHING, db_column='foodId')  # Field name made lowercase.
    mealtime = models.CharField(db_column='mealTime', max_length=17)  # Field name made lowercase.
    lastconsumed = models.DateTimeField(db_column='lastConsumed')  # Field name made lowercase.
    calories = models.FloatField()

    class Meta:
        managed = False
        db_table = 'foodprofilemap'


class Medicine(models.Model):
    medicineid = models.AutoField(db_column='medicineId', primary_key=True)  # Field name made lowercase.
    medicinename = models.CharField(db_column='medicineName', max_length=100)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'medicine'


class Medicineprofilemap(models.Model):
    medicineprofilemapid = models.AutoField(db_column='medicineProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey('Profile', models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    medicineid = models.ForeignKey(Medicine, models.DO_NOTHING, db_column='medicineId')  # Field name made lowercase.
    flag = models.IntegerField()
    remarks = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'medicineprofilemap'


class Profile(models.Model):
    profileid = models.AutoField(db_column='profileId', primary_key=True)  # Field name made lowercase.
    profilename = models.CharField(db_column='profileName', max_length=20)  # Field name made lowercase.
    profileage = models.BigIntegerField(db_column='profileAge')  # Field name made lowercase.
    profileweight = models.FloatField(db_column='profileWeight')  # Field name made lowercase.
    profileheight = models.FloatField(db_column='profileHeight')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'profile'


class Sleepprofilemap(models.Model):
    sleepprofilemapid = models.AutoField(db_column='sleepProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey(Profile, models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    noofhrsslept = models.FloatField(db_column='noOfHrsSlept')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sleepprofilemap'


class Stepsprofilemap(models.Model):
    stepsprofilemapid = models.AutoField(db_column='stepsProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey(Profile, models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    steps = models.BigIntegerField()
    date = models.DateField()
    pace = models.FloatField()
    distance = models.FloatField()

    class Meta:
        managed = False
        db_table = 'stepsprofilemap'


class Waterprofilemap(models.Model):
    waterprofilemapid = models.AutoField(db_column='waterProfileMapId', primary_key=True)  # Field name made lowercase.
    profileid = models.ForeignKey(Profile, models.DO_NOTHING, db_column='profileId')  # Field name made lowercase.
    date = models.DateTimeField()
    noofglasses = models.BigIntegerField(db_column='noOfGlasses')  # Field name made lowercase.
    quantityofglass = models.BigIntegerField(db_column='quantityOfGlass')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'waterprofilemap'
