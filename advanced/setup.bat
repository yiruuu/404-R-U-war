@echo off
start "composer install" cmd /k composer install --ignore-platform-reqs

echo ***��Ҫ***��ȴ�composer install���֮���ٽ�����һ��������
echo ���⣬��ȷ�����ű���ÿһ��������ִ�У�����ϵͳ���ܲ���ȫ���������ͨ���ٴ�ִ�нű������

call init.bat

echo ��ʼ���ɹ������������ݿ�root�û������롣

@echo off
set "OldStr=%~dp0"
set "NewStr=%OldStr:\=/%"
set "main-local=%NewStr%common/config/main-local.php"

set "dbname=ru_war"


set /p password=���������ݿ�root�û�������:
set "qout_password='%password%'"

@echo off & setlocal enabledelayedexpansion 
for /f "eol=* tokens=*" %%i in (%main-local%) do ( 
set a=%%i 

set "a=!a:yii2advanced=%dbname%!" 
set "a=!a:''=%qout_password%!" 
echo !a!>>$
)
move $ %main-local%


mysql -u root -p -e "drop database if exists %dbname%; create database %dbname%; use %dbname%; source %NewStr%data/install.sql;"

echo 200 OK