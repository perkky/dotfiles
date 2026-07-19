OFFSET="0"
if [ "$#" -ge 2 ]; then
    OFFSET=$2
fi

NUM_DAYS_STR=-$(date -d "$1" +%u)
NUM_DAYS=$((NUM_DAYS_STR+1+OFFSET))
VAL=""
if [[ $NUM_DAYS -eq 0 ]]; then
    VAL=$(date -d "$1" +%Y-%m-%d)
else
    VAL=$(date -d "$1 $NUM_DAYS days" +%Y-%m-%d)
fi
echo $VAL

