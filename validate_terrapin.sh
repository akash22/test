for file in /usr/share/crypto-policies/DEFAULT/*ssh*; do
  [[ "$file" == *bkp* ]] && continue
  if grep -q 'chacha20-poly1305@openssh.com' "$file"; then
    echo "❌ Vulnerable config found in $file"
    grep 'Ciphers' "$file"
  else
    echo "✅ $file is clean"
  fi
done
