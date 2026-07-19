NUM_DAYS_STR=$(date -d "$1" +%u)-1
NUM_DAYS=$((NUM_DAYS_STR))
VAL=""
if [[ $NUM_DAYS -eq 0 ]]; then
    VAL=$(date -d "$1" +%Y/%Y-%m-%d)
else
    VAL=$(date -d "$1 -$NUM_DAYS days" +%Y/%Y-%m-%d)
fi
echo $VAL

