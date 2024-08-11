#!/bin/sh
if [ -z "$1" ];then
echo "输入参数 start restart stop"
exit
fi

if [ "$1" = "start" ]
then
gateway=`ps -ef | grep mf-gateway.jar | grep -v grep | awk '{print $2}'`
if [ -n "$gateway" ]
then
echo "gateway进程已存在"
else
echo "启动网关服务"
nohup /usr/java/bin/java -jar mf-gateway.jar --server.port=11116  >/dev/null 2>&1 &
fi
oauth=`ps -ef | grep mf-oauth.jar | grep -v grep | awk '{print $2}'`
if [ -n "$oauth" ]
then
echo "oauth进程已存在"
else
echo "启动认证中心"
nohup /usr/java/bin/java -jar mf-oauth.jar >/dev/null 2>&1 &
fi
sys=`ps -ef | grep mf-sys.jar | grep -v grep | awk '{print $2}'`
if [ -n "$sys" ]
then
echo "sys进程已存在"
else
echo "启动系统服务"
nohup /usr/java/bin/java -jar mf-sys.jar >/dev/null 2>&1 &
fi
codecreate=`ps -ef | grep mf-code-create.jar | grep -v grep | awk '{print $2}'`
if [ -n "$codecreate" ]
then
echo "code-create进程已存在"
else
echo "启动代码生成中心"
nohup /usr/java/bin/java -jar mf-code-create.jar >/dev/null 2>&1 &
fi
storage=`ps -ef | grep mf-storage.jar | grep -v grep | awk '{print $2}'`
if [ -n "$storage" ]
then
echo "storage进程已存在"
else
echo "启动文件缓存中心"
nohup /usr/java/bin/java -jar mf-storage.jar >/dev/null 2>&1 &
fi
monitor=`ps -ef | grep mf-monitor.jar | grep -v grep | awk '{print $2}'`
if [ -n "$monitor" ]
then
echo "monitor进程已存在"
else
echo "启动监控中心"
nohup /usr/java/bin/java -jar mf-monitor.jar --server.port=11121 >/dev/null 2>&1 &
fi
openai=`ps -ef | grep mf-openai.jar | grep -v grep | awk '{print $2}'`
if [ -n "$openai" ]
then
echo "openai进程已存在"
else
echo "启动聊天机器人"
nohup /usr/java/bin/java -jar mf-openai.jar >/dev/null 2>&1 &
fi
scheduler=`ps -ef | grep mf-scheduler.jar | grep -v grep | awk '{print $2}'`
if [ -n "$scheduler" ]
then
echo "scheduler进程已存在"
else
echo "启动调度中心"
nohup /usr/java/bin/java -jar mf-scheduler.jar >/dev/null 2>&1 &
fi
sleep 3
echo "查询进程..."
ps -ef|grep mf-
elif [ "$1" = "restart" ]
then
pkill -f mf-gateway.jar
pkill -f mf-oauth.jar
pkill -f mf-sys.jar
pkill -f mf-code-create.jar
pkill -f mf-storage.jar
pkill -f mf-monitor.jar
pkill -f mf-openai.jar
pkill -f mf-scheduler.jar
sleep 3
echo "查询进程..."
ps -ef|grep mf-
echo "开始启动..."
nohup /usr/java/bin/java -jar mf-gateway.jar --server.port=11116  >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-oauth.jar >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-sys.jar >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-code-create.jar >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-storage.jar >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-monitor.jar --server.port=11121 >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-openai.jar >/dev/null 2>&1 &
nohup /usr/java/bin/java -jar mf-scheduler.jar >/dev/null 2>&1 &
sleep 3
echo "查询进程..."
ps -ef|grep mf-
elif [ "$1" = "stop" ]
then
pkill -f mf-gateway.jar
pkill -f mf-oauth.jar
pkill -f mf-sys.jar
pkill -f mf-code-create.jar
pkill -f mf-storage.jar
pkill -f mf-monitor.jar
pkill -f mf-openai.jar
pkill -f mf-scheduler.jar
sleep 3
echo "查询进程..."
ps -ef|grep mf-
else
echo "输入参数start restart stop"
fi

exit