Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795006683;
	b=psXcnza75gan6V1+iWj+BusXdplwBvlHBCEopytDqsnGPKvjeiAlFFL5YT1AG6YJXNnn
	 lEnYRuNs7+TUdGtZ1euLOFfXs90QImxsUFrLws1DNAz9uajU4EdfuWkkiGrDdBZ9wzvmn
	 YjJ56KKPGKIdtVcDTIL+anzIPsSRYpmlzZteDfNiSf+feDAnSYDzc+ux+6QHCHr0M+bCr
	 9+DFQvnR8UF51y3SopAs/SI4sxSDd8cCHEiUl3lkMyV99OCYjSxvV/Ls8rRhZXTMfRJ9i
	 Jipy1Rbgu9KxjqlxLXUitjc5UZKdU0UfKeg4TtHgFk6JGFGgte1Pz1IdzUE3qM/rXBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006683;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=3i8vIvNkys5wlD31tBgksslzhNmpvxT/gbCUD3MFN2k=;
	b=S3VZS2M3pCZq6MMmGdkpnvPHOPTapVy06rIzYF2u+VgM4M6eYDncNbI3bgsapn+0q7kD
	 qjpo57BztCuWwf/evQQyvZtddRc3uqGdhPQo0bVnpuVa6NaFhOWy/dFQREP4oVBONhIb6
	 yqWETk/QNWXP4s9p8u/jnCbA+I5aDER+vSma21JPG6qbzpwr+wfuZi1ZLycpdXQ9cFxl8
	 MLz/L2FQgSpqX/DlRF9ff3G+XIJn5afExnjGYbGNzq33YrI57fpQpTnGEP92FsR3eAIC2
	 MRFLBA4X5ssNOFkuy1ELcgjFiPrh7ZGLb5HbDAv42Hyzl9YY7pgGO/tOK/ZAwc2iRbw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XZ5wra5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.66
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010066.outbound.protection.outlook.com [52.101.201.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94799606A31C
	for <linux-coco@lists.linux.dev>; Wed, 18 Nov 2026 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94799606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XZ5wra5i
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSB0F0ipovKI7RvocZHfawpSQb0gAOgqUKd/iamcH62fOnJwZdunIEiPHGJnDWBBuxYfkBCoOm2+/2z0m1ueom4xDHXn3TMwxLMIiIWfMHBac3OfVexQEQN9kEFL/Af1pDMtGJta/4R4WEYZSMYrE71gP5Z0HbJMSdD3RHE4GAXf4kjW9bWnPECSoCUFk+X7/+QsKA3vZmrneQI5USF9x0d5mlq0z6mk1V7GviA6j1y0u9x0f2Vymmj31mtZ72IPdAHtWzcjxocOnPjj35CK4ppBZFeayjmI9p77J8ssjHv5QwGsIHvDKZ1e/w7frtjESlH+Urhd+LmDnNqIcT69Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i8vIvNkys5wlD31tBgksslzhNmpvxT/gbCUD3MFN2k=;
 b=E8+IFZWhrd8kNiwGHEaQ7YBff4YSmKyztOne8D66VTU7KW6rcdnjPj0I3fNwWfbWJFF1F0l6CyqMWXgk/Q76HdAJ/S3/bfQkx/f+YmWXiEU5u5Q3K63QJCpi+dfkSqHw50/OTHs0WmWAsK6q8DDPdIfwefAp5f8Hk9hreobVJq4b+j+6lefXJpiTnvEJHJutXm/oxxQPauvDSAcvvoiAhHmEnunLdgjQjp4T0kVWX5ampDQed+wKPFlvGgujFmhajBLwsGsDb5k14R9ZQqsg4RarbbreMrWXHpCg4Fcpa6CLiOAOt0lFlsw6lIvoPvBmjDcxQh2ki5++zsYHN5xF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i8vIvNkys5wlD31tBgksslzhNmpvxT/gbCUD3MFN2k=;
 b=XZ5wra5iCiFWJBlG3LozoAk+sdQteambZ63LD/uwBBDgZv3AmKjsZNfLO9O8n0chDieyqKTZPtgyAfGKeUaZQaNuMvW+/L/IgAw4nRrCBLQkOedLhDYDDVAOxs8WNgBPiee6BbKGqKQU8YjJ+96aoD7yDWQaHeYA8eSZ2G7Kvk5rkUaG1eUZHpwhIP/4jdW2nFoLmms/B66ZPX2dn+ZLW/KbnnJm4REX51vSAzSE9zZTL2UcTN5W/7lM0sA9GWp9IdE22+ZUXroFBjBUDlh+jdBORKmIZI+IRBb6d3Zt2/YLlZxp5Id2bnvvi032dimssPWpeiYkZRuIBtioqERlsg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 12:55:57 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 12:55:57 +0000
Date: Wed, 18 Nov 2026 08:55:55 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Lukas Wunner <lukas@wunner.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
Message-ID: <20261118125555.GL2245175@nvidia.com>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
 <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
X-ClientProxiedBy: MN0PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:208:52d::9) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|PH8PR12MB7301:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df9ced7-ae75-470f-ef82-08df457349a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|261022105027099003|11063799006|4143699003|261026140227099003|261022075727099003|10067099003|261021121427099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zw/tY3O97Zv+79bpteATAhaCzeMypAwNSU3m3T1g1HyTq+nNz9gd7Fm24E/i57lzqLZVs78LBTEyJje1gWuuKJjpYu8KZXgIBMfygokl5+sVa2kFHxLjeb7h18YuDOh3ku4yRbQU03QyO/j2BEs1BAvcuecyPdSvYoPFHq7BSw3pc5T8OyO88aUThvnXukmEAXXMpkAcLis8j/q51WOiWKsw6N7e5WISKBpkP7XXeZb5B9kp1GjMoyU22kV9KAnnFM/FrTvhb/IsaQbxhTSneVolC3byYuGal1EC4CtrvdrAoPT5yOZHA24pa5xckhK/aS1BUkQ1dhkYK1ybiJHj/auH0lX1IW66iSB/G5Y7x/o1/N4Mr86hGYibPSkGW8nacIxDPnOqxNGGgAWwKLKEbAnz+HOgyjztCSJ/SRvMnbWZdc6DKhhCIZlwUM/7kWMZLyVsAw/y8OlSeNnX0nklrpOaDjyrYeC683GAl6EGSWJ5QvTzTWCrYCb3+QCPb7joJvKGdNEGpEcHlmGZpbE5I0BjoAK4E058IGCZ9r2LH67TghuDzLk5Beens/oFfjKrAf0h4t0e6/RbIzoWoRs6i1lS/zAph1HWUgkNi/zuwh963VmpTMq6dDl9uVpDmGwsf9azuCV8KYOS3jPpSxXTJnjJsaOxiwHgKoMD4ybaMpU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(261022105027099003)(11063799006)(4143699003)(261026140227099003)(261022075727099003)(10067099003)(261021121427099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mKfYW0mAtIw6Cvjjyc1W38uBLAyzGikQmI+iud+x5YeS0Q6wNM2nCQpFdc54?=
 =?us-ascii?Q?H8aq1knoEmK3Y7wMzLhJu7sVbaDgfaoIPoA0dL1oerCqq2Ul+BRn+5FqxuHl?=
 =?us-ascii?Q?OpQsLzmaz96/kb5kxtgrB+lXP59rsRg0r2/S47vQfEkwzeiaiRIEoJqlTAm3?=
 =?us-ascii?Q?I7NegOXzdddVTUlo+yJBFP3AtKiHz2KRGInHo6RoLCiAJIRs+7VrdznBM6M7?=
 =?us-ascii?Q?MadxytKl+mFk1jMZY7rePsd3LC33IhEF+wp/lCOeQu+BE7K6ZU9eZgb2ietT?=
 =?us-ascii?Q?Qi/WJFSHSnLUqZdhEVaobI19w5mNRYyV3/CcNgJG4r/LSKvvQv+y3FBpWrfG?=
 =?us-ascii?Q?mhqV6wy/ix+feQNJXCobY4b+clMGcR+bVMjkIw1mvgE6mNY+Anwp8+VRw5Rs?=
 =?us-ascii?Q?LrX6cg5AyT+QF17YoNnyAUIwW8scaneE6gh7oxtzBmsYiPwyiiSTbV3iW2si?=
 =?us-ascii?Q?6UKJHip6nkTlbyzSbug6z/76CP4lgDQAswFcv34pnSSMiEwWOmj5rizOpJJd?=
 =?us-ascii?Q?yjtG2STEBKXupTPW4YjPbaVS3KPzu2whB8Zl0c6YNHErleUKlM71XryUy7ln?=
 =?us-ascii?Q?lXj6mVNek9YXQpHOeAW6WX4WLks5GiisIJ1ZnS+Zq/pFptS1TQEM8JJ7ns8H?=
 =?us-ascii?Q?9nQ6MBzfuer/x1i0h9v/G5ItL+6d3Bcegh3uF1HAl9Yh4EUI9BLMGZpushVT?=
 =?us-ascii?Q?f0EA4XBfLGGIG4RW6PLCS76FusTgG5Dc5gL2EyzI3dcLTQ6n88zV8iNpTccd?=
 =?us-ascii?Q?zyFPAYzPEUTxphy2qyO3Asq1GpcaiwBCYQ+KGlXMYZLSg0w1y52MMNbyAZEk?=
 =?us-ascii?Q?lCmVKtvD7AbYbxzSJu5cjd3+fYtQYlXHu+cdHqibiE/vXIG5MifR+sK6tGDg?=
 =?us-ascii?Q?vfbPEPHLgpmVQ79NeQcsxF/dDoP8wf8UAvVH0l6WGxk5uFPH3LzkkOaYXku2?=
 =?us-ascii?Q?MhxQzW/hFN2PAdROF/ai82UX8ys2F36SBQlnGe63II9u+ssXUJAPlv5r6XcO?=
 =?us-ascii?Q?UZ6VA29FyBbEhMPuKBd7fDWAl4hR9kNhL6aKw4g9JwFECwMhO9A6Z/eIru/z?=
 =?us-ascii?Q?cwiSjhi2hlhL4QruQLiPw+NjwYWsGC3OowLEFd5WVmtgaYHmWIftiFRWGrPB?=
 =?us-ascii?Q?AbUy3joMrZlx7eMjE7KZxawRodImBd0KO31VfL1uNS6Uia6IgWS+KeqUDK/C?=
 =?us-ascii?Q?V8R18uiPs4dVXhjGnmbjPKMn4azR1PkpLmfVtjUU8gngsmY8S9FRskVmbyhj?=
 =?us-ascii?Q?7mRX5onHNuOvRtVLV5CfMNvJH2o6AfkeI1q/1n/FargueiVvuYT/QeXzloQm?=
 =?us-ascii?Q?q7cKiTg1sJvLZgDnZzYv5J/t6g3D/Hoif7pBQ8XG/dS6y1Atj6iTK/CYDxwD?=
 =?us-ascii?Q?W/JNVkGBP+6dmU3ddcopQX0VPOBx/PcU70F8ZbOs+WW7b6xnQzGZp+1FDUnX?=
 =?us-ascii?Q?eNqCv9O1b0kTZ8xtEQX50R/R1SL83p/YTKpu8DX6C0e4gqp8Swqukg7/8Q8A?=
 =?us-ascii?Q?kSU4iiy+YzOrpaliCnib9Ca5MbaP3Rhh7BMYgLnHbDugiZjU+35qzM/d8UYb?=
 =?us-ascii?Q?GjdmXDegXiqSHqa3HTXdrLPj/BPp0RmXiTqEK4oF0VIiCR0QyRjDinv/xq30?=
 =?us-ascii?Q?r827SqQFQHdI4Vu4vomcWh092te1beW9r60OxsVdK1R7obKo3IZf+2DS8hcB?=
 =?us-ascii?Q?NVli2wRg0GaG4uoV+owN8JgM7XDTW0MAj11ba3bXlRb4tArD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df9ced7-ae75-470f-ef82-08df457349a2
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 12:55:57.0028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzSOPYqbGwApqM2jR2ftZ5OoJ3HnIWwDN7PIyy1TEwwKBM+PVO9CKSA2bT3a82/p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7301

On Wed, Nov 18, 2026 at 07:44:21PM +1100, Alexey Kardashevskiy wrote:
> On 16/11/26 18:54, Aneesh Kumar K.V (Arm) wrote:
> > Add drivers/virt/coco/tsm-core.c and git repository to the TSM entry.
> > 
> > Cc: Alexey Kardashevskiy <aik@amd.com>
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: linux-coco@lists.linux.dev
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> >   MAINTAINERS | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ccbcdc0799b9..720fe907885b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -28545,11 +28545,13 @@ M:	Jason Gunthorpe <jgg@nvidia.com>
> >   R:	Lukas Wunner <lukas@wunner.de>
> >   L:	linux-coco@lists.linux.dev
> >   S:	Maintained
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tsm/linux.git
> >   F:	Documentation/ABI/testing/configfs-tsm-report
> >   F:	Documentation/driver-api/coco/
> >   F:	Documentation/driver-api/pci/tsm.rst
> >   F:	drivers/pci/tsm.c
> >   F:	drivers/virt/coco/guest/
> > +F:	drivers/virt/coco/tsm-core.c
> >   F:	include/linux/*tsm*.h
> >   F:	samples/tsm-mr/
> 
> 
> I wonder if we can/should also do this now?
> 
> +F:     drivers/crypto/ccp/sev-dev-tsm.c
> +F:     drivers/crypto/ccp/sev-dev-tio.*
> 
> Or move the files but where, drivers/attestation/tio?
> drivers/attestation/amd? And the same question for ARM/Intel. And do
> these drivers/attestation/* become modules? Thoughts? Thanks,

Some goes to drivers/attestation/amd and ideally they become modules

Some other goes to drivers/virt/coco/tsm/ I guess? I haven't thought
too much about that part yet.

But sure for now we should have those files too until we can move
them.

Jason
