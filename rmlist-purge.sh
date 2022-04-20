PREV=echo find ~/Documents/ -type f -printf "%T@\n" | sort | tail -1 | awk 'BEGIN {FS="."}; {print $1}'

echo $((PREV + 10))

