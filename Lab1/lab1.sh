#!/bin/bash

echo "Коваленко Александр."
echo "Получение UID и групп пользователя."
echo "Данная программа позволяет по имени пользователя узнать его UID и имена групп, в которые он входит."
echo " "


while true; do
  read -p "Введите имя пользователя или 'выход' для выхода из программы: " username
  echo " "
  
  if [ "$username" == "выход" ]; then
    echo "Всего хорошего."
    echo " "
    exit 0
  fi
  
  uid=$(id -u "$username" 2> /dev/null)
  
  if [ $? -ne 0 ]; then
    echo "Пользователь '$username' не найден."
    echo " "
    continue
  fi
  
  primary_group=$(id -gn "$username")
  
  groups=$(id -Gn "$username")
  
  echo "Имя пользователя: $username"
  echo "UID пользователя: $uid"
  echo "Первичная группа: $primary_group"
  echo "Группы пользователя: $groups"
  echo " "
  done
  
 
