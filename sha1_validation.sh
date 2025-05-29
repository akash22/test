for file in /usr/share/crypto-policies/DEFAULT/*ssh* /etc/ssh/sshd_config; do
  [[ "$file" == *bkp* ]] && continue
  if grep -E 'hmac-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1|gss-gex-sha1|gss-group14-sha1' "$file"; then
    echo "❌ Vulnerable config found in $file"
    grep -E 'hmac-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1|gss-gex-sha1|gss-group14-sha1' "$file"
  else
    echo "✅ $file is clean"
  fi
done
