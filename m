Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792698339;
	b=0F9UaHP8vSSYyTz8Zmo9HfgfHlNmPMHk1a4NZIdB4Oe1BchNiqUQDwZhNysk/I7bdgoh
	 qiCqFdpP/2m6JPXMpeGe8IjDRNfldIfeLp2/H1HRb0LjAMVNAH1b21KMwCHaOOOJax0Y3
	 NfOCi18Pe4t087tylSfmMQSSfbAHpM/VHmCSYqw420HWgqOx4P1J30ktI4lxsWCNXLhop
	 uKY3C+AWxTQXEW3pjYA5bDc3g6oxYBP1SGTPmoRXo9oeTDt7quECYwymVzdE9dZvOQKVh
	 IDGNrownEuqySuAId33jRQpov77ZdbecXFTbFKL9V6z8WnD9YnRhnGCgQnQqtj7vN3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698339;
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
	bh=ZKqHKMTiHKepwQ5ppufenHg2t+7qN0dLXHI26j09qU8=;
	b=wogBpA8MjIMN3s5DlXz60cqMkXjDUITimtAhm0zuREqgMSxdVbJdW1ToT8syG6sj5YYw
	 CpAzjvvHqZQmULn00Ndo0nKMCVLYywdaIq+CiqUpqZj2F2B1ZPAaeJq9FrDJkTfxt8V5t
	 MLMH7yHAK5w6BZjHuU749iiUnUTPIwvgUL6FNWYOchfUf7mdx7eVj2VfhJRdNWQuy2K33
	 nAsn51ucLhFn865SQzBbHSfiE7lVMGgdA3VOJ+Lp7rGkfutYLyJ9gG+ZGvDLF5LoA/pLA
	 KqLHBc28C9Im4lteyIQ95w67ogblz10unHNhDATzdkIUuFSopeEbTdkBgCoNd9W5+7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="tvwfw/3J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.60
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F805606A31B
	for <linux-coco@lists.linux.dev>; Thu, 22 Oct 2026 19:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F805606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tvwfw/3J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgBPbxsvPPwndDOAGBT/bLuBIjOWrToeYh6Hdo9rF4eUwnTuRDpsxOq1aHBfJf96pc4w3D/FaLLrY/cWcokNcV339X3JoyJSH9ldla2+s7WnoWHtAqCc+8uJ/FVP9VA0Oz++S1hFhKfUEeN43riSABJfRmoSQeuGDrWq8tLHFEhnp9syuzHa80qz9kWuyjL2jSxJkkDCwLPqGgheCkWljLSKdDuZOI8Zoo6JA2+NVf6Ri+/Wsk9yiDNVqMZduVer/P1JfWFZMJmgQ0/R+JAhjemLtfHvkT5WLBXennIDdGHODPvMGcjAfsaNne2BQsHywPAeE8PNWzwOpyBlmH+yqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKqHKMTiHKepwQ5ppufenHg2t+7qN0dLXHI26j09qU8=;
 b=S1a9yu+Vhh9ReGSyTCu8O6OYgSP7rMColHe45XoztEjjiYcZNChsmysnp8xvehGVGV7V+K85tC12ClDRrytQr2cxMl7W3KQLnwnWUhjTvOpg5qmktYlwCHOl5h4vpPx777Fk1D7nNz0Y4oHxVo/TvQAKuq1gVz8+gyfYKrWeEHcmxE7hpDpn7zjd4i3tUc9uA0L0eY/19HbQLcBDyPZbOQP+tjdl/EkoO6r4b6XUKgy+lyOqdd+mu18XuogpBu6x8xdKzxMpHcudeNOnloPAfymbFkSQiMDziZeZiNl7mfgNHcxnjybqAw2k7KeSflWKhBAj3TWrGhSy2mYj5oz9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKqHKMTiHKepwQ5ppufenHg2t+7qN0dLXHI26j09qU8=;
 b=tvwfw/3JOHBOV+7FjuLO+/BION+X6WmozHWaCjBVxcqTJ9bSaydeUnWgjeOPHN1i/mf8WdU3hEKiG5w1D605NolMuEFe47fgmQ4NxuUnunH2hNvNPK83o07lVgXswH47aSwsMVVMNmaLZ62yzNdyRdEfTcu5pUn1kfgrjupDFAA/iHkXo/na8iaf6RuAIuBtXjToKoD67idlkqfs+p4mYiCdZK2jxej1iF964/tcXv5RC08diVftjZ/tK9lsFucF12b68C14uxq5xphBMlKRrAvdaAfs8PUlMrB8nURMme8vm3veXQI2057CeCjTTL2lGpvmrWR8JCvfNrUhCLnDAA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CH1PPFC8B3B7859.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::622) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:45:31 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 19:45:28 +0000
Date: Thu, 22 Oct 2026 16:45:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jiri Pirko <jiri@resnulli.us>, Dionna Glaze <drdeeglaze@gmail.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	roberto.sassu@huawei.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261022194527.GE3746973@nvidia.com>
References: <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
 <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
 <103486a4a29ecc7b72940dd051c00ae59266bd05.camel@linux.ibm.com>
 <20261021143529.GP3008132@nvidia.com>
 <95b895522bb314187ac1cdc5d0c143c01f0705a9.camel@HansenPartnership.com>
 <20261022131141.GD3008132@nvidia.com>
 <db0f90dde6421c3f2ca0164ea042e73d13b4d02b.camel@HansenPartnership.com>
 <20261022191911.GB3746973@nvidia.com>
 <d3274fc7bea368e7e117fdffcff2193210d9d8b7.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3274fc7bea368e7e117fdffcff2193210d9d8b7.camel@linux.ibm.com>
X-ClientProxiedBy: YT4PR01CA0377.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::26) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CH1PPFC8B3B7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5fc54d-345f-4455-4664-08df30750671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|4143699003|11063799006|10067099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y1eZEQiVtzpXomG7+0KzwVpoA3LtKmkiyWWVvXvhy4F89l6YUOxxqXraZC3ZSnCNpHfc3t+NuykKMZFJ4W32z/7+0tzTRCazIwbDC4cqO/T0r8JZnNR5RcpX/leqLD4JR+9HqElKfIQOV2ehDKwkpd4FzXY+ba2jJKYj6o347/q6aKL4H8sLt2/m/XrSnkzEr5AgxDmJMd1WDBtDbviCxMFFnpM8Wn0v8YjctkfshymzQSygz/jId79pMb0d/QeTUzQslaJjkyQRz7n5Fqs5xJee3IRtaeMI2mJ+RYqi+Ih5EqEer6vMK89zcv8xTIM3i5GJwUCXk5Emi3unfpirm9JQD09nx8tcMJjN/7XzWMcKgpktJjU/4ZP3okItxrFLDxQriU1lNt8QQpAqkeTpItpV+U670YAbqFRgrSsMDHvjMAg99GPzcbACyoFd66jVoVwXAyzZyiHT2CPgDTHtE8UVJSQc6tUDeVYs7OAe2nLkEfny2VUfvM20rrquHO1BlvenS3p+Ou5Ay2w+q1R6n6pXKCeQwv/BpdcJuG0Ahc+rV8nXO2wePPLIANCITY4BSjlHqskiCSh4FisaXd0paNCMc/xfUNQcj4fza9XHnChd55GRb+nSy0wzfqK5DIs40lFl/9XPMlSKHjF2PpzY2Kjp4obXJt/AdH+ev6P9TkQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sa7AsvHZAqMR9pmHRlfn/1XXLZcg045Zhl0yHlmp2ge7xK0O+nhsc4cPaTnX?=
 =?us-ascii?Q?ZNCkgnvthQZofLXwJIkyBHK1ProMowaMhb68AEkrNsxbvgtotOyZ/8rTQ/9X?=
 =?us-ascii?Q?qLflMb+ZN8MxNHzxi2iS6+IBozhVWiRb19dWd52QEMA9LLLSOSopkJTbNC+t?=
 =?us-ascii?Q?hvfcyCmihlqtQgyH9fSgYXQjtdMkp+pkoiUKsbzh3yjppQyENqyZf4PErWm8?=
 =?us-ascii?Q?jqdk3GqnIqM2ee7ttgn08d2JbDNpwCleaTlx2xuGreKMc/JeE85/ErKfVG6p?=
 =?us-ascii?Q?9p5bDubq6NaLrGb0z1i6glBgFNwxi1wKc2YnwqVzktIWUliWgxEmEJEe/MI7?=
 =?us-ascii?Q?uZlZByln3L5nk4UiJTe/IhmXabhGzOVxCnCw4LutWrfbQxL8yGTEk4RVSeJ1?=
 =?us-ascii?Q?8hLUo28iWfZitJPx48vX9jh2q96Kql/ayEtSvFgHoQ7lJbBJV5hfoBBRje4D?=
 =?us-ascii?Q?Z0jQAE+ZZ52g6OP5H/hy4JASL6qTHGSZTNktiVsxKGp3IoNEwI84nmc2Cl8y?=
 =?us-ascii?Q?j53VRRPV2+Z3gAlqVaKntDA1K4q8anSYPu9+UtOHTW5Qjy6ABx9rElRhVxYO?=
 =?us-ascii?Q?DLvehsCBCy79+7lRmo31EhjNFIEsFYeH9vDdZRBB2XDcD5v2JAhjwabqofhm?=
 =?us-ascii?Q?cYy1mgesR7hYk+81hhqhFGcz9PiyL2M8cJh1EuML6Kjh86k7j9n8WMrFiupf?=
 =?us-ascii?Q?yL5UEcvykxmfdgAcFgn8R1J0dUITlKObc4sgvhe91Ca6OweaSfiDe54yjLhQ?=
 =?us-ascii?Q?LO3KpqU7jx9R7uqCpew9jiJXnXlVqLN6q3DMQKXNb/gRZ9ePeYyYUBET0IgE?=
 =?us-ascii?Q?pvhp55UY8sRTdQxgPf4y/tURhZ80Gwugh2JNM1ZJq2OuqiMP2I9ieJRzIfDC?=
 =?us-ascii?Q?omKOzhhjIUly6g32Nn15bZMbuhbtgD4Con8CrQSRRV6VkCCOmovArM4TV493?=
 =?us-ascii?Q?EJrFVAPxnCjFK/aFTd2X7AwCUzwfw7q0grc127MWtN/+xlCyhcIrLMvSFpL7?=
 =?us-ascii?Q?IuCV+ptpAF7Y2V0YgCoPt6UjBiI4lYAflU8QI7/DgIURZUUyn/BWBgPCMni+?=
 =?us-ascii?Q?/tMyjGojFvZ0wE5aOHx9ZWyekfTMm/PPfEUyO105iHkPBr4/jT6FwNyZmebU?=
 =?us-ascii?Q?193AuChy9W2EhBeHSUKVgE5wz+q4OtLvN8ebTbXDTqq2qT8lmmzxLEi7lbVm?=
 =?us-ascii?Q?e6UtV2kiMwmaWvEz1XH/99TgJ8dF4Wu2nNKNHpR1BQTyW3lKe3E06vs+jubj?=
 =?us-ascii?Q?Lj8SP0vGDm7uwkKN68QFLecV0hI41c4Aa1kmYFVBbOCs80iJf3ZnXmfSnvyh?=
 =?us-ascii?Q?RPe7PgWhBCtTnUGUMabuHyKUuXMyLfBd9kTZ6hvk/Gm/bUSgM+RSkguWelzv?=
 =?us-ascii?Q?AwwxbYNDDN90djp8j5RfsLnUuUNa1Dct+fWCQZ2MmiMqBacpMgDK327wyZsx?=
 =?us-ascii?Q?z1YUS2YXYmP8ZxGxROqJ4SAgZ6GezpI5RZZwVQEVJHUFLk6mm9UKrDmsUHD8?=
 =?us-ascii?Q?XoxSroLklsS+knTMLwPOT/Jpjg1XPl7/qteVZWqV/YZN7vhB6I88heYawOBk?=
 =?us-ascii?Q?LJzu6+qlhquM28dB/Nr0lLN9H8e6g+LAe2dpzwTJuDt4Mzu27OzsleIvvNYg?=
 =?us-ascii?Q?aPVKc/M/bX3yVCdInr51drXXr9nDipO3VX+M78fVWpLPC79sATM9mYaJY7Po?=
 =?us-ascii?Q?DCMQ/PQfyvLYfga+qHONTWXqDqfMy7mwQTK9POEb+GLnUi9+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5fc54d-345f-4455-4664-08df30750671
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:45:28.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz866TSiyiWyZjTc9WvmEh4jrAA6+i7l9ybZjH8voWzWOVqHWWFrjWc5kLFKjB+V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC8B3B7859

On Thu, Oct 22, 2026 at 03:37:46PM -0400, Mimi Zohar wrote:

> > Advisory entries shouldn't matter with a scheme like this.
> 
> IMA has something called violations (e.g. open-writers, ToMToU), which are more
> than just advisory.  They intentionally invalidate the IMA measurement list
> since the measurement cannot be trusted.

Maybe I got lost, but when James said "advisory" I understood this as
the TCG type that does not get included in a PCR extend.

Any log that does get extended is a tamper-proof measured log entry
and those have to verified untampered before they can be processed by
anything.

The IMA violations are extended to the PCR so they are normal measured
log entries. AFAICT.

Jason
