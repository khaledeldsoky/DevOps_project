#!/bin/bash
set -x

#   بتاعتك ع الدوكر هاب image و حط مكانها اسم  khaledmohamedatia\/app شيل
sed -i "s/khaledmohamedatia\/app:.*/khaledmohamedatia\/app:$2/g" $1