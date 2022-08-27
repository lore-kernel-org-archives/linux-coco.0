Received: from mx0b-0019e102.pphosted.com (mx0b-0019e102.pphosted.com [67.231.157.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B018D46B2
	for <linux-coco@lists.linux.dev>; Sat, 27 Aug 2022 21:42:52 +0000 (UTC)
Received: from pps.filterd (m0074417.ppops.net [127.0.0.1])
	by mx0b-0019e102.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27RHDSsJ025157
	for <linux-coco@lists.linux.dev>; Sat, 27 Aug 2022 21:10:22 GMT
Received: from mqueue.dsn (localhost [127.0.0.1])
	by mx0b-0019e102.pphosted.com (PPS) with ESMTPS id 3j7bft31bv-76
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <linux-coco@lists.linux.dev>; Sat, 27 Aug 2022 21:10:22 +0000
Received: from localhost (localhost)
	by mx0b-0019e102.pphosted.com (8.17.1.5/8.17.1.5) id 27RL3E6Q013083;
	Sat, 27 Aug 2022 21:03:14 GMT
Date: Sat, 27 Aug 2022 21:03:14 GMT
From: Mail Delivery Subsystem <MAILER-DAEMON@mx0b-0019e102.pphosted.com>
Message-Id: <202208272103.27RL3E6Q013083@mx0b-0019e102.pphosted.com>
To: <linux-coco@lists.linux.dev>
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="27RL3E6Q013083.1661634194/mx0b-0019e102.pphosted.com"
Subject: Returned mail: see transcript for details
Auto-Submitted: auto-generated (failure)
X-Proofpoint-GUID: SeWRtmHabjHJUJqAsFNRQB9Uk-cP8LgS
X-Proofpoint-ORIG-GUID: SeWRtmHabjHJUJqAsFNRQB9Uk-cP8LgS
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 ndrscore=0 suspectscore=0
 adjustscore=0 impostorscore=0 clxscore=1012 phishscore=0
 priorityscore=1501 mlxlogscore=364 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208270079

This is a MIME-encapsulated message

--27RL3E6Q013083.1661634194/mx0b-0019e102.pphosted.com

The original message was received at Sat, 27 Aug 2022 21:03:14 GMT
from m0074417.ppops.net [127.0.0.1]

   ----- The following addresses had permanent fatal errors -----
<pelcoservice-shanghai@pelco.com>
    (reason: 550-5.1.1 The email account that you tried to reach does not exist. Please try)

   ----- Transcript of session follows -----
... while talking to aspmx.l.google.com.:
>>> DATA
<<< 550-5.1.1 The email account that you tried to reach does not exist. Please try
<<< 550-5.1.1 double-checking the recipient's email address for typos or
<<< 550-5.1.1 unnecessary spaces. Learn more at
<<< 550 5.1.1  https://support.google.com/mail/?p=NoSuchUser y195-20020a814bcc000000b00340c82a1872si1084437ywa.317 - gsmtp
550 5.1.1 <pelcoservice-shanghai@pelco.com>... User unknown
<<< 503 5.5.1 RCPT first. y195-20020a814bcc000000b00340c82a1872si1084437ywa.317 - gsmtp

--27RL3E6Q013083.1661634194/mx0b-0019e102.pphosted.com
Content-Type: message/delivery-status

Reporting-MTA: dns; mx0b-0019e102.pphosted.com
Received-From-MTA: DNS; m0074417.ppops.net
Arrival-Date: Sat, 27 Aug 2022 21:03:14 GMT

Final-Recipient: RFC822; pelcoservice-shanghai@pelco.com
X-Actual-Recipient: rfc822; pelcoservice-shanghai@pelco.com
Action: failed
Status: 5.1.1
Remote-MTA: DNS; aspmx.l.google.com
Diagnostic-Code: SMTP; 550-5.1.1 The email account that you tried to reach does not exist. Please try
Last-Attempt-Date: Sat, 27 Aug 2022 21:03:14 GMT

--27RL3E6Q013083.1661634194/mx0b-0019e102.pphosted.com
Content-Type: message/rfc822

Return-Path: <linux-coco@lists.linux.dev>
Received: from pps.filterd (m0074417.ppops.net [127.0.0.1])
	by mx0b-0019e102.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27RGpMNM025263
	for <pelcoservice-shanghai@pelco.com>; Sat, 27 Aug 2022 21:03:14 GMT
Authentication-Results: ppops.net;
	spf=softfail smtp.mailfrom=linux-coco@lists.linux.dev;
	dmarc=fail header.from=lists.linux.dev
Received: from lists.linux.dev ([106.110.86.109])
	by mx0b-0019e102.pphosted.com (PPS) with ESMTP id 3j7bft30pt-1
	for <PelcoService-Shanghai@pelco.com>; Sat, 27 Aug 2022 21:03:14 +0000
X-GUID: 6EC3BEB5-DF32-4374-A001-7A69FE4688FE
X-Has-Attach: no
From: "4C9f00e" <linux-coco@lists.linux.dev>
To: "PelcoService-Shanghai" <PelcoService-Shanghai@pelco.com>
MIME-Version: 1.0
Date: Sun, 28 Aug 2022 05:03:14 +0800
Message-Id: <202208280503119295000@lists.linux.dev>
X-Mailer: Foxmail 7, 2, 5, 140[cn]
Content-Type: text/html; charset="GB2312"
Content-Transfer-Encoding: base64
X-Proofpoint-GUID: J3Ahm4muEYRTP1GFu4a0dNEPigxbKgdR
X-Proofpoint-ORIG-GUID: J3Ahm4muEYRTP1GFu4a0dNEPigxbKgdR
X-CLX-Shades: Junk
X-CLX-Response: 1TFkXBx4ZGxEKWUQXaFJielBoQWZ4Z18RClhYF2teGWRDBV15QG5DEQp4Thd gW0N7El9DeX9PeREKeUwXbQV9c0d/E2hrYkYRCkNIFwcSGxEKQ1kXBxgaEQpDSRcaBBoaGhEKWU 0XYF9EQREKWUkXBxkccRsGBx0bdwYHGxwdBhoGBxsaGkIfBgcbGQYacRoQGncGGgYHGxoaBhoGB
 xsfBhoGGnEaEBp3BhoRClleF2hjeREKSUYXR0VeRVhFRkt1QkVZXk9OGBEKSUcXeE9NEQpDThdg GWtCRx5HX29zeH56G21sXx5LGk5kb3pDTVJIYU1OeBEKWFwXHwQaBBgcGQUbGgQbGxoEHQQbGRg QGx4aHxoRCl5ZF0t7aVleEQpNXBcHGBwRCkxaF2gaYUVyYxEKRVkXaBEKTF8XegUFBQUFBQUFBV
 IRCk1OF2lpEQpMRhdoa2tra2sRCkJPF2BbQ3sSX0N5f095EQpDWhcbGhwEGxsaBBIcBBsaExEKQ l4XGxEKQkUXb09Jbk1PWEdtX0sRCkJOF2BbQ3sSX0N5f095EQpCTBdrXhlkQwVdeUBuQxEKQmwX aUB4XnBvT2Vpb2sRCkJYF3pCeRwebmFkRWYSEQpNXhcHGxEKcGgXbU4ZBRhuWH1FaG8QBxsbExE
 KcGgXelhzT1xpExx5E0YQBxsfGREKcGgXawUbbGMdZH1BS3wQBxsfHhEKcGgXYntdZkxpT1NmcG YQBxsfHhEKcGgXZB1tZnJNHR8cTm8QBxsfHhEKcGgXYWIcQBlmWVxfUHMQBxsfHBEKcGgXZ1tDY X9/aXtNQ1AQBxkaEQpwaBdnZkRYY0RSZWJFHBAHGRoRCnBsF24YXG1AbWlHE09SEAcZGhEKbX4X BxsRClhNF0sRIA==

PHA+DQoJPGltZyBzcmM9ImRhdGE6aW1hZ2UvO2Jhc2U2NCxSMGxHT0RkaEp3RmFBSGNBQUN3QUFB
QUFKd0ZhQUljQUFBQ0FBQUFBZ0FDQWdBQUFBSUNBQUlBQWdJREF3TURBM01DbXl2QUFBQUQ2K3Zy
TDVuaElHaWh2VUxFSUFCUUFBQUJyRWN3cVNWREw0M2dBQUFCckFCUUlBQlRMNFFnQUFBTEw0UWpM
NDR3QUFBQUFBQUlBQUFBNkFFU2JBRnhHWHBSd0FDNW5BRzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUNBTEFBL0w0eEJCWlR6TDR3aHZWWlVBQURz
QUFDQUFBQUQzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFFQUNDQUFBQUdRQUFBQUFBQUJn
cENBQUFBQUFBQUJCWlNnQ0FBQUFBQWdBQUFJQUFBSnY5aWtBQUVBQ0FBQUNBZGdBQURRQ2E3UU1B
QUJCWnRBQ2E3QUFBRnpMNHl4dlV2NEFFV2lNN0FVTUFBREw0elJ3M2NKQlp1d0FBQUFBQUFBQUFB
akw0MHlsRjlGQlp1d0FBQ0FBQUFETDVuakw1akNsRmtnQUFBREw2T2kydHJDbEZtRUFBQUFBRVdn
T0FBNHFTVWdPQUE0cVNWWXFTVWdBQUFBV0FCUklHaWdBQUFBQUFBQUFBQUFBQUFETDVuZ0FBQUFB
QUd3QUFCZ0FBQURMNDJ3QUFFQUFBQUFBQUFBQUFBQUFBQUFEWk1yWXVoalBVRURZdWxJRFpNcll1
aGhxUkhqWXVoZ0FEWFVBQUFBQUVBQUFBQUFBQUNBQUFBNEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB
QUFBQUNiQUFCR1hwUndBQzVuQUc0QUFHUUFBQjBBQURwVHB4Z0FBQUFBQUFIM21DQUFBQUVBQWdJ
QS8vOEFBQUwzQUFENkFBSUNBQUFBQUFELysvQ2dvS1NBZ0lEL0FBQUEvd0QvL3dBQUFQLy9BUDhB
Ly8vLy8vOEkvd0FCQ0J4SXNLREJnd2dUS2x6SXNLSERoeEFqU3B4SXNhTEZpeGd6YXR6SXNhUEhq
eUJEaWh4SnNxVEpreWhUcWx6SnNxWExsekJqeXB4SnM2Yk5temh6NnR6SnM2ZlBuMENEQ2gxS3RP
akpCUW9YSUJXb0ZFRFRuaytOUm53YVZhWFNxMWl6RnF5YWtLdlhwVTY1SXJ6YWRTbFpzVnZSVGdY
TGxHM2JzSERSWnAxTDhPdFl0MkxuMHEzck5peGJ2Vm8zVmlYTGwrbEFxbmpCNmoyTTlHeGlzNEFW
Ui80TG1mRkN0UkMvUHRhYWR6TGx0SDM5V2didHVUQm94cDVEVXh4c2x6RGl0S2podG0xY0dYWm55
WkZucDRhY1dtTFQwbjRkQis1dGViZHgwVzlueHo2TmVySkc1NFVYeXk0ZEZURmcwOHpqdXFhTU5U
bjJqTmY1R3YvZkRqMzhjb1BiZFVNUFhwNDR4dXJkeFM5Ty8xdTZjTy9zUTQrUHY3ZXp4L3I4N1pi
Y2NXLzFCNkIydFJGSVdIWUVYZ1JmWUxybFJ4OXRFRG8yV25SMDdUZGhickp4eE5wQjdVbkk0WWZN
R2FqZWlISTk2RjVGOE9XSG4xcjFTUmhoaTdhOVJsNkhPQjZJSTM3UGZVYWFmYmh4K0dKZnJGbDQ0
blhkTGFoa2c2dk5aK0I2eDhYM1hZRVo2bWdla09pcHh1SitvbEc0SkpSUnhzaWVmT0VGZUo1eVJ6
cm9KWVVEcXRZaWdHS0thT0tFd1RWSEhwczc1bWxSZ0pJZHlSdDNLRnAzNFpnUnlvbGxtMEd1QjU2
Z3NIbjM1cHB0WmlrcG5ZWXVpR0NaV203cHFIVlZGaW5rZExobGgxeWx3L1dKSEpPTG5ybnBoVEdX
eW1PZWNCci9TV3FmNlRYcUlhUkZiZ3FvZVpmU2xxV0tkZ3FaSW5lcjl2aWdwSFYyMkdxU3I5a2Fy
SzBINm9nZ2o1WmVsdW1nRU1xWXJKOVM1dGl0aTN0eG14aUl1U29iNUVUZFZrdW1wUTM2SnlwMjBl
STU3WTZZa2R1UXA1cjl5U21ZNnk3SG1YRExtdmxyamVGK2UrOXRQeWJxcTUzSVRsbHRwd0wyK3Ft
MTF5TEttN2hyS3ZpbmN1emlhMnF5K0s2TGFiM3ZHVHdxdVJXWHJLRzh6akpFc29nSmJ4enN5cHBs
Tm01ZHZtWDc3OHRTOWF3bWVqNC9SSExLUVJkdDlORklKNjMwMGlieHpQVFRPNFdwc1krbUtRcXZp
aE5EcmJWZ0FuSkpMNUUwdTRxeHVsdVh2ZVhVZ1RMN1pJZ0FmeWdsMFdiSFRYSFhkRmQyckdIVXNY
emJ1WEwzLzQzdWVMUGltYTZZN2RXZHRkK0lXMnVveEVqdU8zTnYwdTZkYmVLVU82U28xSkhLeURh
TktFOWUrZWNpNXlZMW42ZG1iT2FLZk1JTnV0bGhBMjd1NjRYZkdITzRxNjgrdXV0WUY0ZGk2UjRm
WGp2aVRINHAzcXVQWXNyN1ptTTYvZnZXUmtvTDgvQ3dLZ3drY0RONnZqemx6Yk9jNXN3Tkc1NTlj
eHlUZlgzZjJhc05lYk5QSHIvWnJpT3JQcjdTNWQrSnZHOW9UbTV3NmplL243aWI3ci8zbi9MNkM2
QUFCMGpBQWhyd2dBZ0UzcFVBbU1BRzNpcHI4bU9ncUdoSEtCZEJyMThXekdBRk15Z2RCNFlFTTdV
U244c0d0NjJIUmU1Ykpyd1lxQzRtUE5sNWtDVERTbC9PVE1hNzdqbE9WVFVzVWFpV2hLWVhqZ1NF
NkxPTDVmOWcxS3dMZW90cTMwSFk2MFpWUkI4K2tIb2hGT0xCOU1Nb1o1WHJWZDVpMEFrRjF6OG41
dXd1NWR0VHlQeFV2eXRxamtRYjFGbUZyT2ZGa29HeFZGM0VZWjNNdDcwZTRnK0pJTFBTZmVUVHhv
N0VNRUVTTk9Md2hOY3dKbUlOajFUYUllZW0xRWViMFN5SFRkTFNGZ2QySnJjaGNsNVVFdVRKR2lu
R3ppMXNnNDRFbzY0S2ViSmp1UkJEaWh3a0l6blpwTEo4Y28xQ00rV05vdmdZNk4xSGRyUGM0NGJp
eU1xV1liQ0N5dXZZNElTcHhHZWR5SmpIVEtaNmVuazJFYXBSaE15TXBqU25TYzFxV3ZPYTJNeW1O
cmZKelc1Njg1dlo3Q0QzL2piTUw1SE5uTVhVb1AzWUNNNFpxckJRMEhSbERtbEpTUmV1VVlWNzNH
UTcxVlRVeTAzR0UwU0RwQkVlU1dleHU0R0tWYnpjcDcyUWxhSlZKaVZPZWhvakd1M29JNEVHVXFF
bzh5UVZQelpFZWFsTG9nWTFwQ0s1aUZGamFUU2prU3hqelpKNXB3dTJGSmdVTEdrc04zck9peEx6
YlMwOHBCa2J4OFYzeW5TbUo2V2tJek1GTEpYZTVWMm9qTTFFZnpyRWhUWjBMVU9UbWJoSTZVeVBR
dlNpSlUxaEQ3ZmFVWXBoVVpQK0pLSlZyY3JVR1ZZeXBIb0NxeTZqeXNKaXJuV1MveXpycjlaSlFi
YXVUWG9yQmVWV24zblRoTXAxVzNQOWF4dlp5RTdCR3Zhd2lFMnNZaGZMMk1ZNjlyR1FqYXhrSi92
VGdBQUFPdz09Ij4NCjwvcD4NCjxwPg0KCTxiciAvPg0KPC9wPg0K


--27RL3E6Q013083.1661634194/mx0b-0019e102.pphosted.com--

