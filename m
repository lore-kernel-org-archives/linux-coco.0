Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792594483;
	b=W/E2s3k3xw9heCESZJJ/pka/1izxauHqowll1NgoieabA+4x5x3yAz3E+Wmigd5CUASJ
	 VnimN43+Wsbrr7DxzN3q/66vh6Ozb4HdjK/wxyRlPi+L3iz1rT9mO/Blj4ZwarQBzimWv
	 EGt9OasKOhDkVBFQQKZGNfjWBG8ekgz56lql5ExCWQZC+Q4mvvu/ORDaMNLammdjoFgYZ
	 bEF1NUDr2Rsz/JD7ym38NSGuylLZL1G6D84hC9p4UwzQ8gaaT1wOZaSWE9ADtJfIawVmM
	 OOHDmsZ2CGVGJ0PpBx/ddnyD1DFhe0InR3STd4WHc0mgWCuML4HYNI5RlSM/ZSjos1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594483;
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
	bh=bTJlSN68cKMU6XSocMCpzWoRJGsSjmOFCj8LmXdCJ5E=;
	b=MdntZk7JcS5ffKs5xPUyuVSB0mLDgeOaPWuN/JH325U6F+ILWXVu/VO5DJ5iTIdX1DVV
	 8OY/4wYpR86nU5v24PikxlT+SvmJvZ04AB5rC4oppcJx3MLHzz4IVQhhzp5Eu1baMkGIM
	 itF6G51k2mM2k4ulAIzzHkYgVFM1kThu+7NlOVWQizy15lA6M+AT11In7oC4Fs/u/bHMD
	 sArSfXl/Cz5tRLfETLVGABlfR9Fu+zw07r2qSn4TZNFFn8tp6H3ewQ3NNEMlOC1UuKXi8
	 FOD3wjbKy7F0isnlv3BHgeLiHFn6sMbTtN9iFVTZ72JtK2CGYe8+XX61CyY1NYKKyMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="mCsm/Y5t";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.32
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0C360A381C
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 14:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0C360A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mCsm/Y5t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnVtl9fdTm2yS5q9Tz465PLT+ITdZPv+XVkPBnJkl7KAIVgFPEUPGMNiuLeFLMghMhhmY/f4T1ve0wllK+gDn/0n7F7AeM73H8QD4Dz0r6kD7vjx8c0lG6wVhTzf8O+5ohvaY+iKHwF/AXRSDhUa5au+CtKiBnQI2SDjEWP1N5NQaBW8knTBFNO6KpfTlgnq3Llme3YG+KKw5OXuB9GLE0I87qu13JYjcRaEeiq8M82/uBFnlIksRFVIT8Wy5mPiCCZa0S0yWezF7EAHCx2/8osofpJk3HC76rsKHbzg9kTAFubZiiCu3a2i//kgkM572+XHV8Sw7US0vAtFa1PaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTJlSN68cKMU6XSocMCpzWoRJGsSjmOFCj8LmXdCJ5E=;
 b=jscAGhNfq+TF58Rp3BKR5f+6/w4kdKjh2957Y2q3WzP42McTCKTvxSgkvqB6gvdpQFpqokFamOAQzx/oOPr2ygwuXaSg4jYCqNcmKxLBiaRoN5mLN8JSg2ZhWdRBOBKLWHNRGVIFEVjJBknUE7d8UJfbo2eyFOxh2ri+1VVAt+h6xxuxvwVgNYGJGejzqqVtJtn91nCmBuRBuwg8NPGfZ5Q4nnf7eTa6lVb17AR/FmQkx83MFqPcKgxl9mfEBKZgi4mV/wrbF7ZC5TZC8GeoE0p/JKkAnQt6xTPsXmIiNsilI10lGMGjHL4vHXZj7kSUwPWVhfArCYJXO1Eab19yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTJlSN68cKMU6XSocMCpzWoRJGsSjmOFCj8LmXdCJ5E=;
 b=mCsm/Y5thsdDuY1AiZjQS2nnjtwdhyVDsPkJyfttMhpIq6ICKurC3Fsd4V6Aq2U8BiuUGQ9rpcvIjcJJVhhcmu2Y1pDG9RE9s9twP0sGegpSnb28lJWv7nUml7Z8JcwPrHWxO4NpSYTyaEYI0zWjdYc+F42QIvqe6TaWCDX5AfxbzfxTDeCFQAi9PgrQJ/VeJSoo775Y4TquieI7Oks5Q4zWCftLKRS322JwdYuRPq0BvoOA9gziePUi9OT0FCLE05Gll8pduO9+VoFM8cX49NBdYx+5fotDXmCpg8DhU7QoKVP6fO8I3zT1Hu6+Qk/ULz67Ns7wvty0h071ZG6V9A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS4PR12MB9563.namprd12.prod.outlook.com
 (2603:10b6:8:282::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 14:54:33 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:54:33 +0000
Date: Wed, 21 Oct 2026 11:54:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, ankita@nvidia.com,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Cedric Xing <cedric.xing@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Cameron <jic23@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
	Kai Huang <kai.huang@intel.com>, Kees Cook <kees@kernel.org>,
	Leon Romanovsky <leon@kernel.org>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Lukas Wunner <lukas@wunner.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>,
	Fang Peter <peter.fang@intel.com>, Petr Pavlu <petr.pavlu@suse.com>,
	rick.p.edgecombe@intel.com, Samuel Ortiz <sameo@rivosinc.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Saravana Kannan <saravanak@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Will Deacon <will@kernel.org>, yilun.xu@intel.com,
	Kevin Tian <kevin.tian@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH] coco/tsm: Update maintainership
Message-ID: <20261021145432.GS3008132@nvidia.com>
References: <0-v1-52697321555d+14e66-tsm_maintainer_jgg@nvidia.com>
 <df162498-3f81-49be-b1e3-ea58c46927d8@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df162498-3f81-49be-b1e3-ea58c46927d8@amd.com>
X-ClientProxiedBy: YT4PR01CA0318.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10a::9) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS4PR12MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: fb307c17-d6a4-4a0c-e985-08df2f8337a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	V01fAPXhpr/f/0ycDlZYkSYHoC2RRVYrZ3pZNn3ycA8Psssta6MdJRTd/aZZr+9TIuZgnfpLMqrfTUKrjsK4ltO3mkZD9Iex5KALTlCk5MoGm+7TQ84nhmVW5HIbh2FOkneeNkJNSW29xQo75YabK4MlpxjfaM92TMHs+BX97xeKjZzlu4HF2gOX5MZT0ZzeTXEjKu6waRkA9uTidAOyb+ndCxH/tP8eTtev03D/trxnx6FNcii6Rb0AuOi1jpb9TPWD4hOQcsM/DT123va8u1YZc/jka0D+S1u7xcdUJDy8KkiPpQ8OEzwusKhQf39jlBjx4jFPKMJ+1cIThQ5k3NNUcynmfP3qp/SfguuXdpx832oAc93BguK0/oKJe6gS7pF8NCrdMkBKoafH0G9Is/2uzMPh4g4EZ37y0eD686yMbDscl+42Ev0+BGWPvo+e6ZrVuCMD1PqA/EQ/JlUaB65rsxyG4v22k+ymz7bTTkwBCSx7LrtIJ1J7i6lVs48OElwZoua5t6ZttjxWeK19DJgq48D7UArc7B3ZQ9d+59awnTpr1LWuJ9JQTL0HH7n4YGvrTmgdJe4VIKiQjyyYE9lCtSqXaEwMN7vPKNOR6jPQML65oFhONkuaL0Uj1sctAhCIbYl419qyGB2C4XUG2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+g+9CsCDtyiJXjiUb9uhyRUlFwRPsMEoPIzHLzsBUbDjJr8fdUbN+25FX5Ch?=
 =?us-ascii?Q?MCYhxivkxrEnxdCypod1bhUG33LIVEWhMSB1FRko6C4DRwhO4v5uGP64WEUI?=
 =?us-ascii?Q?Rk5zV0KvQihdFbTNSyqiixReW8IoIflqZTotwy3tNM39TgpKoeInhKSPL2Nz?=
 =?us-ascii?Q?QoFKCfPOCpBhUnaKADp7DsRlj5Y4jpsRNmsZoSSPUPz30yeKIF1pp17auAAz?=
 =?us-ascii?Q?LbAHR5MNXuinWdsc92OLDRfq2meQsKQr1WiydSb+qKuHnwaH2uaudztvgMaL?=
 =?us-ascii?Q?tnZRXXyoHAo7Dxa+KmB1LD0hlTFaaPg4tq15rFQfc6V+mVrtWXGHSEv+32eA?=
 =?us-ascii?Q?iLeRsIrQ7nZB2x6swYeMCdeNDqtcS3Oa9EVsS3geWkrb+4Qp+LIWRFu9XCjm?=
 =?us-ascii?Q?DbAs94gxCnApp9vJCBI7ValrZdvWFv+6dsdkSLJEG/COUoWb16wU4u9YzQl7?=
 =?us-ascii?Q?i3j3JtQuhwVIiWdiBYQP+I4qX7SdhA9x3v8Dk0bNtAC4ClRRikZO+FefQO0V?=
 =?us-ascii?Q?FfwuPuy6t0oJW3RzXOnHLzKrYVGddLTrYqu01w16n6nmsr8FpFVW96OO6G0X?=
 =?us-ascii?Q?iSbHg4YKf50mcMbuUI8Ep7eVjOyFYj4BJBLwV+8Hzg80kbA5aTWwzUui9x9H?=
 =?us-ascii?Q?RjhXJFooB4hGz/Lsv+r3Py1IbXuEu6myEtM9Ur8UdTe8bqOqdYyObQqZPc5G?=
 =?us-ascii?Q?BPZx1w9UtgHqEloKbZBP6zsOE5KNuSCYBiRfEElEWilroyLpjhlgHeB3+j00?=
 =?us-ascii?Q?rnr6CgwJUnI01z1kgFC3+gl5nOMlFi3QgO6NPlIx9+aqK9sUK8v7mXGjoic4?=
 =?us-ascii?Q?qBx6ChA3uRcwL6SIyld77k4rnPCtYAxpUWK9aEXLDsE/ghaf04liWV6s/EaF?=
 =?us-ascii?Q?8LDbOMe7kTSu8NDg1dGb/jzlSc5t7bJIjs3HChbMdg/Ws7vOQL63YLP+C9bV?=
 =?us-ascii?Q?0wuVB6cYPmsENmvc6xYF1mbglko4k9f/f/+Gpppyphk4GH0Ui2jjw+xH9FA+?=
 =?us-ascii?Q?yGFxoa5x5AhUMhswRtKMgnbRb/H4ys7C7gXMFH43ltiq91KrtRMYw4wij8X7?=
 =?us-ascii?Q?FA1Q162NpvfFZ9ghz14P/dB+cDHnZdTsc6VE8ydkqctslw4M24Al3QFEzAij?=
 =?us-ascii?Q?LNEcsCroVenkXVVntnFBSgNYnBRfDnRwjxfKAeKMffwCUdCe2mZFT41bjVp2?=
 =?us-ascii?Q?vZ5cWIDfE0Lw0zEzNcKP3hiR0DCe5Z33GPDC5RZ2Pdq3Pz1kobg7v6UcAJsU?=
 =?us-ascii?Q?xFn3i6ov4SJDeAHRj+QE9WXW3aBpV3Pxim9ndRYLcXZU8WPXzH8dQfMWyeQw?=
 =?us-ascii?Q?f+dr80eCjO9GkHpyIBnZHycOxApdWZkz9oHxjh7nHaXWHhsF/ZCLeyFoXPkf?=
 =?us-ascii?Q?etQzdMzVtz1Q41TZ+c+WBz/Vqqx3CXVAOuhc2m1xEwEpvhm3I+I2Y39HZ++S?=
 =?us-ascii?Q?SKAqmqEGeNY52TrUrSUGOegBRURs08UvitK0rXAScmk6Mcpz0b10IpMjIzzy?=
 =?us-ascii?Q?1VHcOf9fXlzh7ApY8qjQAKtVEpMqJf4UBnI2gEBsysQxPN4EgP+0hXccp3hq?=
 =?us-ascii?Q?BKvWtY3IzKGpO35XB8r/KLG5ICsjl5m/wW3JQdrNuGTUpz0SZfI1d2NP5w5Z?=
 =?us-ascii?Q?EuTFkJUbmEjLVQT4vxjPoW4fTIPdonbphm/4+52exLFwlecunechUu21Zeok?=
 =?us-ascii?Q?UXTukMxmYUCY/fQf/Eo4vUkiLkgvR69tL10s45LIJdcHvRNv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb307c17-d6a4-4a0c-e985-08df2f8337a1
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:54:33.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHoeXxr/Y8SrZeovcPXbcnZWkT377aXj3PF2UBNIsTcJLntKwNOTvXZTEqhQvJvD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9563

On Mon, Oct 19, 2026 at 07:48:30PM +1100, Alexey Kardashevskiy wrote:
> 
> 
> On 30/9/26 09:26, Jason Gunthorpe wrote:
> > With Dan's passing Aneesh and Jason have volunteered to take this on, with
> > the support of their employers.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   CREDITS     | 9 +++++++++
> >   MAINTAINERS | 3 ++-
> >   2 files changed, 11 insertions(+), 1 deletion(-)
> > 
> > I've now spoken to all the main companies contributing here and asked for
> > volunteers. This is what I could confirm at this point. I'll be at LPC also
> > for any further discussion. Regards
> 
> sorry for being late and my bad communication (I'll do better!), as
> we discussed at LPC, I'm happy to volunteer for M: too. Thanks,

Welcome aboard, I picked it up!

Thanks,
Jason
