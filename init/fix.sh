
grep -v "ft=bash" ../bash > ../bash.tmp
cat ../bash.tmp > ../bash
echo "# vim: ft=bash" >> ../bash
rm ../bash.tmp
