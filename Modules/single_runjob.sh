#!/bin/bash
#filename   ::  REST_Environment
#Author     ::  Igor Ying Zhang, Xin Xu
#Purpose    ::  run REST
#Version    ::  V1.0(20250313)

nohup singularity exec --bind /share/home/symei:/home/symei --bind $(pwd):/data /share/apps/rust/rest/rest_251017.sif bash -c "rest" > "$1" 2>&1 &
#singularity exec --bind /share/home/symei:/home/symei --bind $(pwd):/data \
#    /share/apps/rust/rest/rest_mpi.sif bash -c "
#        # 先检查文件
#        echo '=== 检查文件内容 ==='
#        sed -n '314,316p' /home/symei/def2-TZVPP-revised/Br.json
#        echo ''
#        
#        # 然后运行rest程序
#        echo '=== 运行REST程序 ===' 
#        rest
#    " > "$1" 2>&1
