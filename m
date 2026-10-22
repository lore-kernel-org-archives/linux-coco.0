Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792676561;
	b=uSn5OPfIVNlfOk0kmYFyhWzZgTscCzhpI5RKKiqRgdlL8EfkjCrfBfRO1uokBshhTfh7
	 hqrByBukF3izOueuINAjQHVV++sTDbQEX/7NqKntKNKw0fL0DoYwq8kkOOkTOSFRRAfmp
	 eytRz+WY8kACaKtEX8T5x+2Hkypjlf/KP4hafbAPIMynu8LXx6gAg1vzHcOcyBZDW3q6G
	 WE8TQ53ly4FchDDc5FWFhKu9OGs3unRx3zcxCkC7Yp95mC+aXQpa/T7HDyePXUOheEbqa
	 FCgdvvQCHylRSI19lgQk8iYQ6rDPfxMAQj8WwdwnhFl/1NLkMXcx9kCpVQ+DuXNoWYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676561;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ql/K5PW9xlLbMNu9BgqqjjdbNk5wZ/Porrg9JEoRltM=;
	b=aQgu6aQeS0jiO6H8zOAeE/7mNhPt2pdkUciTnHwedH537IMlhmd9OcSHY8o3KzQJbFud
	 aYdZWa9ig0ZlS9RtFTjL2JsMwrh6BVMp1C1LoIIfhJtQBmGwSYz3+xReZBXsiZxamrZqR
	 BncpEpVzbViS76ee3kCshYj971mt4IErf8u6SPoN+Wc0ZZW4X1IZDOC+KWbI/f3Vy86/f
	 TYrlZLFFthpo7Pb7aDtxGcgzq9WXq+Tn6tmItg1JcRhCkmNREVfLgCjX1uMrbjzLB6V2d
	 fSbvlVyRnMbhsY4GSCBBucjoHD/LCzKKLjv4AFyCDj3BPU6QnzXqMN3FgwcEugB93iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VWObowFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.5
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4C60A2614
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 13:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F4C60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VWObowFF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAAzvI1pkf34QmIJihOoF348p4lP7SdMQjvrzHmPx3ZNk/ZyiWXyDM9rpVl5cOCe6Qr5wTIYl3KaroxaBu0FM2r/zLsrSh/oC1H7OPL2GLdRULrxaXtm678YL6miFsWGbvZzI/rFDvI4bCDe5KhokjFmE45etDbGmEq23uTqW7+2lk0nsDog/xYwLaappDuTfOIH30T2/JiRj/GI8VNB8MXH2PjB0kJ1VkAR2eIrHs/Ueu0C5Ybv3etFOMrifBkfHERQX+1itxHJS6h/GvnDOwSQUmLXzxCD+6osjLBXl3rzdF717AKuY3GsT0EktcdLQZ4+3vZ+N5LYpBOdR9d4Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ql/K5PW9xlLbMNu9BgqqjjdbNk5wZ/Porrg9JEoRltM=;
 b=BE4JbtvIKIjMDLFAte5iq5Ba6JaufKEN1ZtO4PM0jL5xellwhqI78h7i2+b5+n+OkAFgiAayaA03g/lf4XXVa+hOmzcjBViPilQo2yE7iGRjsvjBXY/1jdx/90vBPvZVZVDUpcdG9wXrzLl/G7W4daukopRStZRY1DZJoEvJTKyWWNj+ogajXsVHHOu0J3ryt190oycwYLBnk3Mj6vy2pEc5j/oE85WZ3Dfak9oVgDJd3gW00MgUJPKYyqJy5BgHzxoXvvX8NYjbyVMDNXouVeqeto9NIlFHyGbuihrlGV9MoM/7m8Lw/aLo8/0pi7Q3Nb2O1Si7+Np38STYcRg3Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ql/K5PW9xlLbMNu9BgqqjjdbNk5wZ/Porrg9JEoRltM=;
 b=VWObowFFgU73OUz05gp+PYJlCU6ja/CIkwJZZv7uIh8D9sTdJGjTza93KN47PPtPw6ZdBNT13kiclZdaKFZF2zsKLJPYnW5LkCW24ehU5mK4O8rXLxbiIPp3fZDX8mQzqckHSmKBgaZq38oQ1KQFiR7uvGIlXcvA93Q6fBJcVchPdun/mVRjVzwqJ3sG54DZ0RRDE+POIcrT2DWX0i2ZSV3dZ+wKxkfCrKp/kfrTOdbiFTFMDJskO8zK8HabqbwkkkxinHqbyMPT95Wz3ZU6jJON7Lhr/dAtg5nIxT1kLkWVsGz26tAIqCjbz4z3dkeRquoABxQEO+AoNtpZzoC3YA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MW6PR12MB8734.namprd12.prod.outlook.com
 (2603:10b6:303:249::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 13:42:37 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 13:42:37 +0000
Date: Thu, 22 Oct 2026 10:42:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev
Subject: [GIT PULL] Please pull TSM subsystem changes
Message-ID: <20261022134236.GA3625858@nvidia.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GxLLbMu+HDC54gXI"
Content-Disposition: inline
X-ClientProxiedBy: BL1PR13CA0215.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::10) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MW6PR12MB8734:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf93f5d-e62a-423c-88a4-08df30425583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|11063799006|261009223027099003|261021123027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rI1s/XVbQ1+Jdm7UdqB7lV/coh/GFfmfhJWnVsNQB3NNS3WI9pimLjMrkqrGNKudKazS9RAuA7L5F2CSQoUXy7dum9NObRULJMKPS99QLdVx0Zb3ObKouVhItWul9OwEMv682HIcwXB3QJnzKFDWHOwDWWqshr5I5LGRyKDTOjka/RfUBu8BqAnuftveiPaCGM+W6azgiz5iqxYG/3PT01lsJPDVqNjuAdfT198EIdCQkzIuy74twkPQmmvagSW7piAHiOBWg62MoLMeLldG9mCURc9MsHuYMPW+PZCgDdnjC3/ObaYMwi4tcbDDwgxO5zXCo8vT+QpuzKW0vTiWtlwv62jG3ZrX7LaV6PNxstSdwcMiVJOnNh14KkZq5R2ewGjXWRZ7ZDKCoZf369T7fhJID+qxo02r1Kgax9N8wSEtKfrsQLHl4U8/qD+DG4uh9E1oihfPdICG1/rRBvmK8Bxs6knN+S+QitMK3U9/GFvO7jpAEsDBjtHaplf29qwICfib3jsVObclOAmUhd5PXWtC8zwzNl123sb1R7AMns4I1On1Diz9HFXZyR50jqcO8HWOL66ovmZ2XJKSXo8ntDeOFymfw3ZMs0wOH4mEzJtJDZv/j0Wb70sAIT/NYsDQeSH/PBws6abmmyBkcyOrjdAkswjPQsXKqlLXdHC1rBA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(11063799006)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yw7JPsCQePrfCqbhIxS14HwDl/457U9rOAIKSrpcx/1kil5IYuQeOCTvnKCf?=
 =?us-ascii?Q?BvzxLjOqc6Cq9okkLjhHwlTBHj8dftqcKw1NvsV/K29ipKXIXbRNHy1VW1s7?=
 =?us-ascii?Q?RKgwah7cXzNLTEk+rsSN6k98fgDu8W49UtlgUOFTT0HyCWCEGMs2WI0OByiM?=
 =?us-ascii?Q?s3Er+fUFnDwOLyw4mt8TB4X2j61QDms/7/KIpAbWl2qEg2DVUD0NwzPlNgJy?=
 =?us-ascii?Q?BqKhVzzBhIPp3mx/pd6slXF2+8sqdgF7nvM4mCWZf+Lnezo1l9YryKhkH1tw?=
 =?us-ascii?Q?8r2IhgJ8IVkHalBl4t7cEPsBsEzwLRZ0PAO6lVd5ENY10jKKbhNdu8k0BnOb?=
 =?us-ascii?Q?qmCM4VXwydWVmniIH+aPdW9tgQPn7MsWKPWYqnnxV/5pjC0mt14AOIrXsvCE?=
 =?us-ascii?Q?3Cko0MVDgH3Gq1s3HW3afOFLjzxpGO++TM7wRduTuiUWxta7RcIzSxs7cbvH?=
 =?us-ascii?Q?IfF17lmfJDZ7334HyLHKDpyF5efoOZ0kNSSjsMvpXJfBpBKkcfzgbRfIfW64?=
 =?us-ascii?Q?prwXffoV/cUCS2iwoV9afj/peMVG38z7/5Z1MPqQ4yRjKJYpsbXP5bOGruKv?=
 =?us-ascii?Q?sBL9mQAauewpNO7F0FehxSmHJpIjNG40afKeXoMU7VhYKt6B7BpYQb7TQwY+?=
 =?us-ascii?Q?1eb3WceTEE2cOe1bock05RV+FWdRnqo27ocpZyW/MtW2Fc67S4dqHwJ2bppt?=
 =?us-ascii?Q?Xw9K/s8hdS7GpXQovsaFWnS2TYPHkxfCe4OfS5qdoJe3Tfi3Vs86iSWAlY0e?=
 =?us-ascii?Q?uCpNa6R98xnD1wweEeGieoGbiWw+pHtTPt7jCKb8RhCc/QAg2Bwm8KXOz1MT?=
 =?us-ascii?Q?d81WLagrBEY6d/3SnZPWEr9rX54Vi9GJsuDhurkD15z7Jo5FJnUs+GqQd8t+?=
 =?us-ascii?Q?oJ5q/AfN1FTQIinDFehZxvLXm/bPkVKcxom/RAGUi9eRJy685Zf4H+Hwfptv?=
 =?us-ascii?Q?88g2KRPUEyXFboVx9HBNb7uwUdix6GCGrOMbMctFZbmsgWV5DeCCfyYmC49Y?=
 =?us-ascii?Q?sXf8zRuNbKvdsr6Zi2A3AKUioG6VPJCccszh8Wt95+JPt+F70dQY9UGnKCBR?=
 =?us-ascii?Q?5P3ydhJaZZfVjgl4svDa8pCSgJndtUDy6DqLF/lU3+1gIIcB39Z3TBxOX6Rr?=
 =?us-ascii?Q?wWWmgeANqXK+pjvR3m8Miw2AefG4m+0eRPmrquk1pEh20Ak2KlcCw5q782SL?=
 =?us-ascii?Q?RBcSs3WNwPcGOK8O1Th/PnrPyFVFuHGgsuECgn1femrr6gCvbAYj1Ls2k8rr?=
 =?us-ascii?Q?DMmbbg5uwrS28syT9X/UNcuS5euu+lxnb3xYE45zKG0UQ7DAVynqlgPBCCRS?=
 =?us-ascii?Q?zZxAtUmw/td1YWxBMCeNhhrUt7iQPVmUjwRt03+8hEnIzgSUqs8yKK/qsFGw?=
 =?us-ascii?Q?ihrjieBZ01IiBCbpzOFukUUh8M32L9kDf9hIWgRyiAopbXe/ReJQ+XG0FxOJ?=
 =?us-ascii?Q?bne8caGOacoCNIlHrilF/zILPxVLQRlcgrN2DCkiM5IQfxLBx9kkwf5nhror?=
 =?us-ascii?Q?xYdBwmvnCJQsYxDvZB90vhQwXpQAEU3z3nu/C1WdJkSnQfAL4iBLwTRI3Z2v?=
 =?us-ascii?Q?QI5O1D4WxUvi+EOWLJquqdwlLqvNwAn4FUfxID/mV0uglMIX30rxXXaznoyV?=
 =?us-ascii?Q?9e8ba1wtmBZAIM4S3KiZnYG5YpLHmBe1mvIRPjJUJqQc35z62VYEIcvfgUU9?=
 =?us-ascii?Q?/oMA/EftDfwW7c2z4LR2Nvmv54vsMVVZ5OOUaPG2kWRJ/7m8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf93f5d-e62a-423c-88a4-08df30425583
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 13:42:37.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TmQnDe47VYL08U5TbGeDoCxV7sGgIop/eCAwuOOUtGLh6QcR1zgStniBOUhHOOC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8734

--GxLLbMu+HDC54gXI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

One patch to update the maintainers file following Dan's passing for
TSM subsystem. Three people have volunteered to help complete this
work.

This is a one off PR from my github. I still have to talk to
Konstantin to get the new team setup on the kernel.org tree that TSM
was using previously. It has all the usual gpg signatures, let me know
if you want a different version.

Thanks,
Jason

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  https://github.com/jgunthorpe/linux.git tags/for-linus-tsm

for you to fetch changes up to 47193113641e5e1f9b5758b73d7b7a0273acb836:

  coco/tsm: Update maintainership (2026-10-22 10:31:23 -0300)

----------------------------------------------------------------
tsm v7.4 merge window pull request

Simply update the MAINTAINERS file after Dan's passing

----------------------------------------------------------------
Jason Gunthorpe (1):
      coco/tsm: Update maintainership

 CREDITS     | 12 ++++++++++++
 MAINTAINERS |  5 ++++-
 2 files changed, 16 insertions(+), 1 deletion(-)


--GxLLbMu+HDC54gXI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRRRCHOFoQz/8F5bUaFwuHvBreFYQUCatoSygAKCRCFwuHvBreF
YXw3AQD2RtIcRNSwvULgPbOEc6lxDNdsFGCdNCC6Nn/+qOkUyAD+KUSNWzRHQ4kx
Cqjs381oCcvwQg8gUP0Qg/53/KOhTQc=
=9T9Z
-----END PGP SIGNATURE-----

--GxLLbMu+HDC54gXI--
