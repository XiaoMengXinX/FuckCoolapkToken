UUID=$(cat /proc/sys/kernel/random/uuid)

time=$(date +%s)

time_16=$(echo "obase=16;$time"|bc;echo $num)
time_166666=$(echo $time_16 | tr 'A-Z' 'a-z')

time_hex=0x$time_166666

md5_time=$(echo -n $time|md5sum|cut -d ' ' -f1)

a="token://com.coolapk.market/c67ef5943784d09750dcfbb31020f0ab?$md5_time\$$UUID&com.coolapk.market"

base64_a=$(echo -n "$a"|base64 --wrap=0)

#rm test

md5_a=$(echo -n $base64_a|md5sum|cut -d ' ' -f1)

token=$md5_a$UUID$time_hex

echo $token
