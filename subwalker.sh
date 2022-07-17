#!/usr/bin/env bash
# m8r0wn Principal
# editado por jmbsvene

TARGET=$1
if ! [ $TARGET ]; then
  echo "[!] No target provided."
  echo ">> $0 <example.com>"
  exit 1
fi

OUT_DIR=$(pwd)
TOOLS_DIR=$(pwd)/tools

echo [*] Executing SubWalker against: ${TARGET}


# Modify the individual commands as needed, add API keys and other resources to
# get the best results. Happy Hunting!

cd $TOOLS_DIR/subscraper
echo "[*] Launching SubScraper"
python3 subscraper.py $TARGET -o $OUT_DIR/subscraper.txt &> /dev/null &

cd $TOOLS_DIR/Sublist3r
echo "[*] Launching Sublist3r"
python3 sublist3r.py -d $TARGET -o $OUT_DIR/sublist3r.txt &> /dev/null &

cd $TOOLS_DIR/assetfinder
echo "[*] Launching assetfinder"
./assetfinder --subs-only $TARGET > $OUT_DIR/assetfinder.txt &

cd $TOOLS_DIR/subzzZ
echo "[*] Lauching subzzZ"
./subzzZ -d $TARGET ; cd scans/$TARGET; cp root_subdomains.txt $OUT_DIR/subzzZ.txt &

echo "[*] Waiting until all scripts complete..."
wait

cd $OUT_DIR
(cat subscraper.txt sublist3r.txt assetfinder.txt  subzzZ.txt | sort -u) > subwalker.txt ; cat subwalker.txt | httpx -ports 80,443,81,8443,8080,8000,10000,9000 -silent -threads 1000 | tee -a alive-$TARGET.txt

rm subscraper.txt sublist3r.txt assetfinder.txt subzzZ.txt


RES=$(cat subwalker.txt | wc -l)
RES-alive=$(cat alive-$TARGET.txt | wc -l)
echo -e "\n[+] SubWalker complete with ${RES} results"
echo -e "\n[+] SubWalker complete with ${RES-alive} results"

echo "[+] Output saved to: $OUT_DIR/subwalker.txt"
echo "[+] Output saved to: $OUT_DIR/alive-$TARGET.txt"

exit 0
