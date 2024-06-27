#!/bin/bash

node -v

pnpm build

set -e
VERSION=$(git show -s --format=%h)
VERSION='1.0.'${VERSION}
GROUP=thepsy
NAME=ai-suno
echo ${GROUP}/${NAME}:${VERSION}


# docker rmi ${GROUP}/${NAME}:latest || true
docker buildx build --platform linux/amd64  \
--build-arg SUNO_COOKIE="ajs_anonymous_id=9b7a1540-9dce-41af-acc6-f5c5d5bb44c5; __stripe_mid=ac9d56e4-4536-42cf-867a-59392398abc0780b5c; _cfuvid=gbdTOsd3O7ispXdB9rIlax.WrSayxpj7KFxD5McrBMM-1719097613125-0.0.1.1-604800000; __stripe_sid=7be697d0-9acc-43f7-a50e-1d6c8db2aeba331dfe; __client=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsaWVudF8yaUZzbU8wRE5mMkt3YTl5Y2xBSjh0Vlo0akEiLCJyb3RhdGluZ190b2tlbiI6IjRseW10YTc2dmkxNG85aHBxenF5cW5kcTdmeWNiaXB0bzY2bWhiYmIifQ.tuixDZcEyEJZpiBNsQh7n1tMA13853D5E0cilky1_k1uK1vgsq7_k-dDPFszMXRGaNAt3xqGo5frPQZaFIhg786gseGmxufUO288c9Ba8JgQUP34W7im-1rZP5m2-qjfnp--UN3t4aFVsNBhuaBdevBmhQ246Dj4SYFiWaN35maN7g3EL96np46Bp0gOnrtcUWdT3D0brsx1xQTCh3MVpGJ6kcK3KGAX1dgUUgCVay6lBC5UCIdPM_FBBknF2CqsoPvghp1wzU7ISJzsuv8GZUg5hAW_BjgVHw-HlQlPIS34lkB4E4d1S4XDicIq6im4gojcTkhvlNmFH92zPr3GVA; __client_uat=1719097875; __cf_bm=ibOLPv8P45zSgiZXZe5Y6IY_DTgah_PfEVv5xZc0Qwo-1719098522-1.0.1.1-FHbAS1z21NawealUov5s2YAOe2.BVRxioVcsa_ojcit25n5Xqup1PXfOdJeUj11H7OmObXMtLpnVTYxNLVfZEg; mp_26ced217328f4737497bd6ba6641ca1c_mixpanel=%7B%22distinct_id%22%3A%20%222188b804-f868-4222-a0b6-7d5bc18df59f%22%2C%22%24device_id%22%3A%20%2218fdc701deb5c2-0b2aaae939b203-1a525637-57e400-18fdc701deb5c2%22%2C%22%24search_engine%22%3A%20%22google%22%2C%22%24initial_referrer%22%3A%20%22https%3A%2F%2Fwww.google.com%2F%22%2C%22%24initial_referring_domain%22%3A%20%22www.google.com%22%2C%22__mps%22%3A%20%7B%7D%2C%22__mpso%22%3A%20%7B%7D%2C%22__mpus%22%3A%20%7B%7D%2C%22__mpa%22%3A%20%7B%7D%2C%22__mpu%22%3A%20%7B%7D%2C%22__mpr%22%3A%20%5B%5D%2C%22__mpap%22%3A%20%5B%5D%2C%22%24user_id%22%3A%20%222188b804-f868-4222-a0b6-7d5bc18df59f%22%7D" \
-t ${GROUP}/${NAME}:${VERSION} .

docker push ${GROUP}/${NAME}:${VERSION}
date
echo ${GROUP}/${NAME}:${VERSION} pushed

