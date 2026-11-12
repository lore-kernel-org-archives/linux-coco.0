Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.34
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794495296;
	b=CgZHTVTWWyPKPJ19KkAzH4Jhh26XyX5j+kywwIRT1MxBoT1BhYLTc/yZF8PkDtoq+sP0
	 xW0S/qJHI9ItFhtFOp44jm5stnsIiSqT4axUw091WnqQMyqDLo8nmgWG0VyOnC0SsWUFc
	 W/oN8zc9Vcuk3Y5TtTsh/56Ztrvgj0GGhbLekjOwIc2vX3R2EstUwoHvK6ISsrSXWpmxI
	 TQKtlAH+C6xWX/J+WsF+gsvNsGUuv8Jysvx/Q+simBlrpQgsJ9zZh992+nJdAnEGGPIOw
	 eKov6H/y8gM71PQKGSrcyv/A+uxhBwMvCY3mZPkQLqZW8j10se2asmG7fbkm4vGPaow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495296;
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
	bh=6hKajhZFnhs3/szJvBtizIVKQqkI9pGE0tveM+Z6u4Q=;
	b=RjTd+hLUh7l8TkQ5oB2SX3XjCZd6tnIDTMcYuh4Bz2QeWU693MyjGUnj5tmci01GH8Gr
	 E8CgS8BCtWm5fKzQ0YGn3Z7fPd5Bxz7KnNIXPpkjLXN5Uk6zh4ott1DHrNS9XR3dLIrAs
	 QUMlegv9qPaIeDBvzMYq8/xEg9sGJfLF42TH3vVVHtPl7PHdEI0Yar0YwTHpHIGsvChru
	 Qbbmo01DSA7Goa7XiWIHudxg7+u7WffLBmb4mIXpXBwW34XonryhoQcSHqpTicE0Z1A91
	 fds/XbM4+C6K/wnzhfD03TbHox5tCIp/ofEO2HkmmO1kPi7B45KXP1nl3vFlgmN3ocg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VzRdV1wN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.34
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1893606A884
	for <linux-coco@lists.linux.dev>; Thu, 12 Nov 2026 14:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1893606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VzRdV1wN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSvjCJtbDQG4cTXRsYo7QUrfAFEu6thAKKXXRnZENUiPAr3GbtDHmAZp4DHoHNMmOjGTQWZUBluqz1f9bIU/NmbohQnbEnMROr+wsgfZJ+2V2Mqcr3kzAg19R3jzOvH8nZnWl5oj+4o3n458OwlcqK1hW6o3wQEKYcUCYkh7c3zC+Y+zCc02KBbThHGX4T73G6MFL9tnYLZx2vcmSujlI+p+43TwJuqXJHX4plTOCbhRU9+M2ZzALR1BgVrJLMewrcG7wZoRxmvRq1YsknsHgyHOqge8pCpzNBiU0PWQg59kfdsjKtd9bj584jOYe9caL6KwyR8n3kuspEpAQsfGXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hKajhZFnhs3/szJvBtizIVKQqkI9pGE0tveM+Z6u4Q=;
 b=xU5nEferohADWXKSMaxRQ2gx8+GnPN1R0UAxMiFCOUu7otYFu84D/n3gXblvgA7ZZTb3yalsQHC3Q3bBhl+XUjwomnumqaaHg9NZKvqe/0LyDQNUcKXyO3ysYZBs4zoZCHntC7KE75WCCayrik3mhoDIWq6xVFN8vdW61UT3s0uM6sDld/qmw3nuREnCo/dxo6b1vYAvnQMLRD1gM9owK1QgfGetK8lP3T8Gc2/iIDZp+NqPV77M1oVVtk4obG6Vk0jnIgWefd2apcTlzSj19q3PMJyuKb8d/pCIA4tkB6tABVrsvmvyBBRgANgS0qW1joZQxCW6ZEi6iFhzhfQHSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6hKajhZFnhs3/szJvBtizIVKQqkI9pGE0tveM+Z6u4Q=;
 b=VzRdV1wNcZJKgXXXkhOCrkNeAxl+dZfL91pPRCLkXOkdS1jlKyO2peyKkKsYnPdBJnZwGyBt4qvNi5OTaNjp563FoaANOq4d6YTy8phBPW6fey4xFOLpS5YaOmjGhmin66sd5nhT9irGCYnh5RyyzC4MZUGAeZvp2ggCudaknk4nxVTS8ZAZjfdbKCD09LYF/d82ploOxi6hXLUYgE1RvCEw5Oi7vUPadLGuN5VEyeBKQAJglvLjAxvr7NJ6Pago48tYh9jGxu3Dy8coJ7jIz1jgBcug46UreIa1dX8ep41RmknahWmPI8uD3e4q/TFlYud1rn+KUVepGoAOkRCzDA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SA1PR12MB999254.namprd12.prod.outlook.com
 (2603:10b6:806:4dd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 14:54:52 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 14:54:52 +0000
Date: Thu, 12 Nov 2026 10:54:50 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <20261112145450.GM738765@nvidia.com>
References: <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20261111150029.GJ738765@nvidia.com>
 <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
X-ClientProxiedBy: BN0PR04CA0046.namprd04.prod.outlook.com
 (2603:10b6:408:e8::21) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SA1PR12MB999254:EE_
X-MS-Office365-Filtering-Correlation-Id: b50ed290-a7ee-476d-63a2-08df40cce7f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|5023799004|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261021121427099003|261021135927099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	+Z5lnmIdtencNtLh2QcgPxFejVSLaIcOI87HIU+QRPN5IMKsYSBs70vyh/cGYkC1q+e/fiH88Q1amhKWXQbXxUzXCINT1ThcYJWsnyOyiKVc8ahIBFyEKAaIsgl7qRRro7hlIRmIW956hLfwBIZ5uUwkRT4MXOoqWd2L+X+KyyC7C8aCl56yROESntNwb2LALyH0jwGgCjtrxD4yEabyLBHMN99oSi7Gl97BHgMLLTXNBAUhHIly4/lnm+jOgKyARpfgw/dBEXfcpRbzKWtRqRT0hdsUApLomA0jfmZ2UHAI8wM3XBpmGVX5CMkqdiudhVmoMlMi8nUoS3v9zqjfjX6VvrKVEmSRieoqsSm1RceQNJtAsaL/NKstPmP9oM6A8QfGQeRwGu5ON2zdzT1Cv23y49EXlgMBfjLenULOnOy40q/0cPmXwCN+kzwlkDTrmYOpSo4WkQP+vio18QghncC3iLfHF8Amc/p5mY5FYpWr/uDMWjOjNdZuOIepfd4EfvCs11quvKfJpzKg2CECstJMKsw99z3wycjT1H3ZjspB5ndxePn6nbA0MYqva9JUz7qRCmQzExYXiy3vMw0BmNQoUcUVSmfZrfp1fiRyJSWBqRTH6RTy8WzlhpfoNHDQKdL1zJJ4H3ZBtBnLG5wVF3Wt33GbltkbCtab0gLwuyU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9TxZmJbi1KPUZysc+Gv2hgD0foPtyeJNVOCWMAo/5nREroiHkMoGV10pwb4i?=
 =?us-ascii?Q?6Q+ozsshichHprPyZpRHUEJUAgTjXxsh1ZGIBvtbtcAQHIgKxqpOdXiCJbNv?=
 =?us-ascii?Q?RjpbbAlnLP1muIzdKrUa5hMfXKU1e1GdO4xEwLgETpYRyNPgudpXQG6i1olI?=
 =?us-ascii?Q?wK/Hbpy1v4abRtvi3vL1/YHg6sGU2r3lWopLfTBEZmhhsySetmdmvPT61UMJ?=
 =?us-ascii?Q?sRNFYqApEcZzvWP9SEEg+yN/NPbIJ2mRieEcMcN84cWcD0/h2779r1JMiykm?=
 =?us-ascii?Q?lE2eH7ZsTTY51ahjta3j7pWtFoubfI7M7wvqJ/d6T96cNzjyqsx0XrgfcBFg?=
 =?us-ascii?Q?poT/lJaQhio6EOCPzaD+46fq2Ll9Y6Se2pncadAiJt+2Bjo9PiorjAWVkwY9?=
 =?us-ascii?Q?6l7jf1sOBJ+YM7f0W45XaByrrI2wWOhPX6+uxSw6z3CHl+AnwqIAl/znOQYo?=
 =?us-ascii?Q?q/Cly1xN0soNvtRZKearwQrDZ0i5s5ABsExXNOo4LwLRR64b9li1t1c3GOjS?=
 =?us-ascii?Q?Woy8Kq8iBzWCS7q4EcafZe+fGfo3pNgYykQhAzyeIDyqdETLMIs73Z15eFla?=
 =?us-ascii?Q?4nPvBUnrWU1/esSaSDfOsOn0dd5ZjySk0FxcrUBTPLxu+bNMMjVzwmvSfUAV?=
 =?us-ascii?Q?vYHcKLY7mnEsON1fJUarY3ApUget8Gj80FYKGUM+FzOT3v3T6pI34pzkC1tc?=
 =?us-ascii?Q?pIFd3P06WRKuLYpke/6/qR6vzZTsOPVyt3qjUwKPhP9LKoH0bVj4OoGg5gal?=
 =?us-ascii?Q?YC2mJpjZwaoa7C5tH3VRsoO0YwqbsD4b2QrHgWVPQkShTYfq5LZaVLvq4HWs?=
 =?us-ascii?Q?4A4PtMNBwsrbZCeehNt1U79janv7+xHIi8wF28/hg5eGe7cv1SOI5zNEywtd?=
 =?us-ascii?Q?t589PH4n/0+Qj2Bcr2KCfL+x8GOsEzJHKcib8JegjSaHnoftAk+eWvnBFof0?=
 =?us-ascii?Q?LsqHoJCPm2iQzD10RgVuxGYGrXHEG+FDvh/1Mfv/kNrcsETK5KD5mp60p/Rl?=
 =?us-ascii?Q?gZvCAnDo598/xF6VmRMJ8mDFmdlWXrHDaRoyoper/Y3ItrJG+u5YMJADIMGC?=
 =?us-ascii?Q?sl/pC86oLiGUX9+mEgQwJmwr6cufF0OpdDD33igq0EDhYIJIxuCY4nI1FDZz?=
 =?us-ascii?Q?voN98k/51D83oDXq0HPHcyHG7Ogxajg/RoGZVfQ00rIj6OMJrwoHg8RbwL13?=
 =?us-ascii?Q?Jzaa2YAlSzZw/J76pwpR17wSRbo6fLSPwDtgnpJFLhCebp9fvywkSIwEJ9ZS?=
 =?us-ascii?Q?uxX+KFUilPezRdGBsXQxv8cuXxCkopKSz+ZUkqYwSEyxiR+VObRSXDwYpP2n?=
 =?us-ascii?Q?Vd3glPqofX7DNjaL8/0PMaB0bYsaUnQWqjANTEFVH9yTBf2iobYe/rNIpl9B?=
 =?us-ascii?Q?x8xnpDdcYoK3STXvuNZGdEnQUyOtMMvNQFlCVKGE1Hn/OdnchY912b6eZ1Yf?=
 =?us-ascii?Q?o4TRMgsGi7vPe0ppZew1ISsNZZg83k2TiRMESJHJUug1H/oy/rOha3dk5Y8Z?=
 =?us-ascii?Q?Ld15w7T2ZNKWUwQ3dcXw6R+xNII1umOoFM2iTfmf7H/Nze3KUivpVIcJxWRG?=
 =?us-ascii?Q?YQ1Yvy8DJkhNzubKgK6c2gCIOcvEnKBGAbSTwEIAvrqy8QzjYrmLHsCD59ak?=
 =?us-ascii?Q?wNn1Ouim5m3Qf2ABTiG+h8FLmPymZ+9prErB8JZ4axVtGIyTalqHwISV1wqb?=
 =?us-ascii?Q?yKuOaEc4WufZnGk++wX+LI2Sbg+Mv2hZPeu4rWEdfUXNzaIa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b50ed290-a7ee-476d-63a2-08df40cce7f0
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 14:54:51.9790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI/EY2e0KVWMtUxrgVcZrmJKMTnkTWbgebkcCV4PFj07fkcEUwVdrR0ZKNuOo4fA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999254

On Thu, Nov 12, 2026 at 09:50:12PM +1100, Alexey Kardashevskiy wrote:
> On 12/11/26 10:05, Tian, Kevin wrote:
> > > From: Jason Gunthorpe <jgg@nvidia.com>
> > > Sent: Wednesday, November 11, 2026 11:00 PM
> > > 
> > > On Wed, Nov 11, 2026 at 09:44:42AM +0000, Tian, Kevin wrote:
> > > 
> > > > The interesting case is about such failures after attest e.g. unlock
> > > > which is supposed to be a void operation. Maybe we don't need do
> > > > anything special in tsm core - the secure firmware maintains the
> > > > state machine so future lock will fail if the current state is not
> > > > unlocked.
> > > 
> > > unlock can't fail, we have no way to cope with that.
> > > 
> > > If unlock does not result in the MMMIO returned to host control then
> > > the system will surely MCE.
> > > 
> > > This should have nothing to do with a crashed device, the disposition
> > > of the MMIO is under TDX module control, revert it back to host and
> > > accept you get AERs for the incorrect T= bit if the device isn't syncd.
> > > 
> > > The OS would have to kill the SPDM session and FLR the PF to bring it
> > > all back.
> > > 
> > 
> > Agree but we were talking about different scenarios. Your description
> > is about real device hang, while mine is about unlock failure from
> > guest p.o.v. which can be caused by either hardware issue or host
> > software issues. Or a malicious host may report success w/o actually
> > doing anything.
> > 
> > My point was that the guest can just assume unlock always succeed
> > and rely on the secure firmware to ensure future operations blocked
> > in case of incomplete unlock. We don't need to do anything special
> > within the guest tsm core upon GHCI unlock errors.
> 
> If the guest asked for unlock() and the secure fw failed to do so
> and reported an error (which my hosts cannot hide), then the guest
> memory is still exposed (via DMA) to some unwanted thing. If
> anything - it is time to panic() imho. Thanks,

It is completely bad FW design. If you ask for unlock it cannot fail
in a way that DMA is still enabled. You should still clear the sDTE
and that should be a non-failable operation.

Jason
