for i in /usr/share/crypto-policies/DEFAULT/*ssh*; do [[ "$i" == *bkp* ]] && continue;   grep -P '(^|,)(aes128-cbc)(?=,|$)' "$i" && echo "Match found in $i"; done
