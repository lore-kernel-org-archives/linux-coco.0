Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793191283;
	b=RgqFL6MeB5TVRvsqK5lBo8YARaefH49dkirK2GJtsqo/+gZKOxb9b+1c8nj31CwqZ5EM
	 XUyczYTkILNsbFYMxSRqBdccmNZkvJp98mh1G4BQEIK1or0ELnLTdqeBqq18d2iZ1kJEL
	 mpcKyO3mLeNBaoYSnSjFAgYQxI5VKXi4vkqwvgOR5BwiEnACrCraqGdOyNwQi6hhVVja4
	 L+Xo9OjiMNlKUXC++grBrC7hUz+676WJCW12jAAFP7BBn+1bTA/fN9Z/IrZBZhGMBL4f8
	 90D3eGiPOf4qHZzBaWOVY+Gq9of8dXe4vgrsMjBvZyHQZE793ZmJcnFuMZ3WgzoqX1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191283;
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
	bh=v5RFrvvSCrN04nPxcIDxppM3ANN4iKlluHenIDXmtIk=;
	b=TsysCLEcDExwHsefO7CQQbEBwkJN7hRhRiQaKvtq6UjULS58GQvL/lwzrZguzZCHM3Xm
	 45BzVzCyJrdyL+p9u8wEWivJW2G+IqpSqBzfacFcVUMDXaflHwieCxk4qbd3PEaZAWF38
	 2LoekDPgPxrbygY3JnvB3ysbzLfonUeUOW+EUn14KZYMe/vTYFt7Bw+O3EP8xBIHsEmaV
	 +A5Nnb/Q8EylobXNARnkHXhevm1QNu80RIdk/Gd6XpLQcZgfW/Vdokmwx3JAVfEygytZE
	 nXHH6Hyg6upvkk4snMQMZL+UqvRtgAkKAmbLL2cAj8TWOl0NV5Ndmf+dUyuWHdT7xuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VzVjCYXa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.55
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010055.outbound.protection.outlook.com [52.101.85.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D82606A320
	for <linux-coco@lists.linux.dev>; Wed, 28 Oct 2026 12:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67D82606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VzVjCYXa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=buTBnP1Wkk05JxtCgM8ucR5KL5CBOxYCLbSBAb+n1WHdn1ln5SLwVy9GLvnIb0vejCI7jCj5Hjm9d/kxkHUjtcBYg91kU5eOv//r903dOKqx06b4jM4RuSJr8HpjX1NrEPRzx2V6w18gPnrjvddIwEEMNH00a7c09LJCJTstuKrTOU4nWh2Cibt7iutQ3Tpiv5jj8ChjpfYX3fxmxMjlyMQ1iIgIFkIKpVLV9zcLjGs+xAn39tyRPvEcVowy/Jv3gct3ChvkYnstJ+NCupZuxvxrzdIzvgtzrOxO8uWeZXCoYUr9Oae8wRR5BhjhP6MDEcMKSg2qYAT1AfLCFGlyOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5RFrvvSCrN04nPxcIDxppM3ANN4iKlluHenIDXmtIk=;
 b=GXH7kvMOsRjH0scSzYGhd4nODZQnYP2HKQnCM/q5qfN1E+cacd+eT8FUcdYDEwIpk+VtEqFrWFd4NbkOXB5/MT31TrvjBk7+MT/C/fG98f6IMJnE8WXQdEujWPnHw1h7ORUpOqz1UrOMB35VVheP5DdI02k0WjtZY/1a+/aeyh2NrHUW5JtcDtV6nzuRG9gLaVC+ViMJ+++h3uraUD0wjR9kQQZ7ETs9p2+0XmhW6jn6aYDH3nZgF7FQkvuth5gdyzkgM/8kjZzRno3ZbhVRM1nLFB4ZGM58NwTBp1EDdgvYVnXpx2FPRiOwzizwwRXmHhVE94SelcKiJ7WKtowJTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5RFrvvSCrN04nPxcIDxppM3ANN4iKlluHenIDXmtIk=;
 b=VzVjCYXaBuJRXpnTjl3hNZdskQuNqJSJ6MsWK70EhXHoO/k7qNnGDjbmlAP/rRVBzluoG6+h6AYp8uc8Hf3R0/aQjNupk1dpd5LsjXS86fgX58exEDUJF00FWe9Y7O4dof+XfhgpvuFpS6gIbIk/zvDCeVR+HPSHKtR82R4saM3m3q4L1zLXqQbzAWKkPlra8PPtbf10zTT1QLsVRAfrNdduvuE0W7Z7jQJVP9P0mg0QxEsuJTc7vnIqhh/3LaPhxGvN0zEhVlZC/fAGQxYVREXoRoFttpWjCh2C4A1ibKK+H1poSeIn1PoRU0luOdWxalcqC+zW0/2c1OXGSfJmwg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DM6PR12MB4154.namprd12.prod.outlook.com
 (2603:10b6:5:21d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:41:16 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 12:41:16 +0000
Date: Wed, 28 Oct 2026 09:41:15 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
Cc: "Li, Xiaoyao" <xiaoyao.li@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"bp@alien8.de" <bp@alien8.de>, "hpa@zytor.com" <hpa@zytor.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"Gao, Chao" <chao.gao@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>
Subject: Re: [RFC PATCH 12/15] virt: tdx-guest: Support Trust Device
 Interface (TDI) activation
Message-ID: <20261028124115.GC2541714@nvidia.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-13-zhenzhong.duan@intel.com>
 <c81b4b51-4412-4d5d-a073-55fb346a766a@intel.com>
 <IA3PR11MB9136FCB9ABE0B3171BC3A6E2926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA3PR11MB9136FCB9ABE0B3171BC3A6E2926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN9PR03CA0867.namprd03.prod.outlook.com
 (2603:10b6:408:13d::32) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DM6PR12MB4154:EE_
X-MS-Office365-Filtering-Correlation-Id: 8275c00c-a869-4e85-2e7a-08df34f0c20c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|18002099003|22082099003|261026140227099003|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	FQrLQLGIzOPe2LuKHhZnTDtaL6WhpoSsk6ZdPlHo/f73WLe09JHF9ZonJ9z6XCgwt6GSSUri38bVFBLvtmsISOsCD/Z/q+gWUe+h7c4Dty6SzgmHShzMG1gXIRrvLg2ZOoDRlqxqAmghEwO3OIeroXMsQ+MVHEoxy6Fziiqj3PT9WN5bNGLkalCOTWpmpawXctpk64SxW+taxZXuQqVtMNnKrWupNsu1V0lFKQ2EBJ5DNLfdXKM+gDXzqWl55MqfDQ9bp1QwmOG9kTMihnSJgtEQniI6JS0AFWQXy6UJ46xsln+Isy6MeGDI0qh0dnb16hL+jcs+dsfU4E6mXttLp7iR4E7eKvwrufQrDjtmIUUNQktodiK7a8t5kiyUXZm9+L9fxp+c97Mh9QvCcLswWfV3ZUUx4nr4YeBJIyjA2+cZOcf/5ePQ+HAR+ZRyz1KgcmL1yRW/wwWHhofOzMDin+ZGA6UztptxMeTJ8ODnOASAVDx9inWpRmt16Y85WQwJEXH9kDOe98inbcAORbuwkb5Mx11EQnImsv28ySip0NZRxFk7Goq1J6iJ3I4lOxhhT0Z12tDjj22GEiuBa9Fn26rctDCC9r6kWrRo+Qowk9GOR39oarVneQdD/XDdhTCbE8PaxWm5BGkXQXNH0/yqi3rpMzjVjJPdis1pmzn4YJ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(18002099003)(22082099003)(261026140227099003)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lAYylXkYiSoDdwOqNIXbWAoLhcKDd7LIknftIUGEk7pedPuosb71bb9wNLZE?=
 =?us-ascii?Q?velI4yKf2TnTtEhm9QSQqIPwtFrQA76CL+JHGmKtfJ1cEtN13YS/n/RwuzIX?=
 =?us-ascii?Q?Qj6Tt3Iw4Sm/fQpoHRK6ioWYR2DZaUCucZUD68vS3vpHNUdr3IflqHF7hN0t?=
 =?us-ascii?Q?vyHDRfk7xFfdPjKT+6mtyh7gjVYloAlCPVue0rshMmH9jFSDApiq6y+Ps8Ca?=
 =?us-ascii?Q?odhBYA9q5kef4cdUNfrDYR/V2w8IY4kLkqRi/m+fptMGnn/M2gMDEzcBCz0k?=
 =?us-ascii?Q?Xtejhq9yY70aikQFQUOwLzf4Bpm5F8xm0idPAGUwThXBehxaRv1jcy1Qpm6f?=
 =?us-ascii?Q?vJVMP8yku/864llgAIW8flZKFle8CGAhV8J4gNySF77AJRcE9jY+Y9d85yCj?=
 =?us-ascii?Q?Vzf5X/9LXikok3yXuY9Rz9BHI1+ZXD1Lh9Bmkh++uOChqPVtk9SQeMde6HSI?=
 =?us-ascii?Q?8P8KwSft07cYAkijsGjWVjOKGAw0q1aXTLQSTXPJzV8t1La91Dd9c6OvB4lj?=
 =?us-ascii?Q?aDifCXrvyfvq5Cnwq3TPiJquBFkNa2FnQVV5IM+/UX9K5tvkEpwW2oOW1RRP?=
 =?us-ascii?Q?Cw1bXIWMZRSfSB3Jfl2OECZWhL72GfnzTq/mg6vW1MpWwt7OMqP9O8VdyfO4?=
 =?us-ascii?Q?OtmRLwd80Uhkgu+rf13BQ9FN8DeewMb5bYA+miHoqGgJoY2bZEUyvCRvSEKe?=
 =?us-ascii?Q?Kf4mO7iCoo4TfzaRM9xhvRC2Ae4LeUn94PYfTmJP9j4z+03oprA2l1jJj2tR?=
 =?us-ascii?Q?FGKFeHHBVA7MaNNMAipfrHaB1Joc6yAMjmy10S2O9EbP89SFBf5PKof+hw3N?=
 =?us-ascii?Q?uNZU8Ic/OJiPzlD6X4IURAW4E6j3f5vI4qQSaBZfUFb8gwQLZaLdaarCmidd?=
 =?us-ascii?Q?TecIxbklkMNbO3mFJPctQ04bzbq218/PY2z2B/MBJIx9Fu6DPTVuuwRlTySF?=
 =?us-ascii?Q?++DgBlfrNicblrP6WuXPCZRCi4RiOJVQFhdEg6hWiv/gQ4Z35+4Q/YZQjZEG?=
 =?us-ascii?Q?6LdI84XWQy/YPLrMqn4Ana5iEfMB674v4NIGKIBWyPxuxpAdpBeexojRW8BD?=
 =?us-ascii?Q?eBMz1QQoT2vHaZVcJICTRbPF0KvdyOVYNldZfima+7bsDJ5vBe6HRw0uj+cA?=
 =?us-ascii?Q?RtIIkwIQfViio6foMU5N0LeRaN7a6ZoLPYcUZqPrUMZ6vHJZ1tP+KVUTougI?=
 =?us-ascii?Q?r6eVgQVFXTJ4GZAvsvfyRiCCWhBA7Vl7VNljJUq6yrdIegafMh2pAH9w0X53?=
 =?us-ascii?Q?xaPo8rQv9gtDk8a4+oRexdrVU5rRn6um4kuNqF0IO34ujJwXosIE5N8Iz8Qw?=
 =?us-ascii?Q?fJ3pCYCpPCRLh+b2uU3EWLJ+8f4aAWou5n5UeZ2yxJs2k5o7sCOz564r5PuP?=
 =?us-ascii?Q?BrrGkGmXFNiN8ZsQKzyEajk8OKDXm2YxHOSILTyRXk7YHfx3TMdGbv/GFinQ?=
 =?us-ascii?Q?8Xavff78dNjqzIE/7FJt/17yN1hPpcd2N0IlX+XM8GbtT1Xfwyk++d/e6KBO?=
 =?us-ascii?Q?xC/wbz/bLAPBdRG//NzsFc+LZ2Sk3qgajbyf/gLeZocwlQrIFtypuGW0mZeH?=
 =?us-ascii?Q?khmag1uj4PAsKn1IOB4XKt6p1SAPcubL8RcfTOoVEIiEWPz+HgML1gPl+Ses?=
 =?us-ascii?Q?oRvtWRp3zVueUVCKmm0rz5E/V4g2KBHFqCnCguES4c3Z0mSlXur4EHtLvL90?=
 =?us-ascii?Q?SYogQrMaSqwK7tzxZpJRTZ9BZP8Gdb6xpMIOO1PY3T0twKSu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8275c00c-a869-4e85-2e7a-08df34f0c20c
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:41:16.3009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te2vyk5TdhPSdrjyDgcrwze29h19PNcqwhucc25gYyPeysaPAorDW5fp9jMM7shA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4154

On Wed, Oct 28, 2026 at 06:44:57AM +0000, Duan, Zhenzhong wrote:
> >But this patch already calls dma_set_cc_private(). Will it cause problem
> >without
> >the following patch? If so, it has bisect issue.
> 
> Agreed, it make more sense to move dma_set_cc_private() call into enable_dma() callback.

I would be happier if the tsm drivers don't try to do anything with
DMA API. Let the core code do it.

The drivers should just implement the PCIe side of things, lock,
unlock, run.

Jason
