Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.201.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793669215;
	b=ptTHp5+3MZtyf0E4OImXmtabQOYn4RNabEhu9JjdLKSaPBu4v8u/nG2aAm4tV1ZmlLZn
	 EkrrreOIVJ0syePcclHUjJrPWiRCpHItPBn9UdEm3THx8Ck6BP6wninH7McMb2vG8XBoW
	 IzE/mEy9I2/6qhDrJm+ymap5d+Q3a4KqSxQcdHPZO7qF4vpDm/YjKSJIxNMYuEe/Pen8y
	 bYT7CDLjnaM3PQND8Pjn3D9zGRM9jGD00jSj2jc0VhUW0qzDQPfEN6gu9rdfl9rdmtih0
	 pXyfsHW6KlddPsGIfflEZQ/TmbEgFqoV9oGiCvj+PadXF4c2vgNVAvjPxxH1mLf+WmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669215;
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
	bh=oBPfwb/t1W1II7v5sRMid9xnHb0O0rAZEBd8SAbnO9U=;
	b=umd3eC+Jywvrjvm01K+KGEdStI/ZuR4PK/c+HAgc2TycRp8ZqjjcsQPONBpORVIHkBVc
	 uPSJEQguEOJ3LGgDPqlYh83yquYwcgAWXZhAGcgb4K/Xcl99llPhrhqOZkiNgGSPWEMsn
	 KIuUErOlj4KQWXExxKBNgoT71fAl1DMu3sK+KW6fsItNGa0AQV2at5BW1bbAQQAM1/1Od
	 sX2GzAoZkPf4rdaX4En2mC12wzzrAoBnbjEQ4zrA20o9nehyn3U7UH0dyYew2V/f9jVAi
	 xnXLZlNTKtxHvv/HrsN/+zT1Z/d3DhSY+Cqsfi9wf8vSqNncMOUhLCYFAJyDQ3Pj0rg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uvauescv;
	arc=fail smtp.remote-ip=52.101.201.45
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C022C606A334
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 01:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C022C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uvauescv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOD9DMFBLtD1FCEQv5KsonPiyR/MaqqwmV05O/oHR7Lqmua7CzR1bcjPwp85ymkt7xdJRWbhuXLTA2aODBt777JuFutvCq5Rl7qn/h+xFmOWJCVx6f4Mp9d3YpLt2lpD6xVuEQfhuQXFvVctF90iz8QaQrW0f+dA/2pMQXoYA50aA9zh2XNFPBUbnk2+d+tb/XxbEN71I33TWwCcTdd9RP8RELAdB1zzZUOIsDQh+s0h6hdoYgsMgvkI0CB7G9AmmNdDHWJnyu+PbxzBKJygPAGFCmQxgXYfJAJPYN2WqXhSjhGMfpCOvFw3j1BdMt1AUyIjWQr3GV/NqoNcjtsQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBPfwb/t1W1II7v5sRMid9xnHb0O0rAZEBd8SAbnO9U=;
 b=U0XrgjuEREd7pYxvkBTpyORxQ5sVDoTEgcosvHctB9g1d2mDydZ0OfzEVrczlgzzdzcLlNrzR1161sbzhsgpU7Emb79EHSvCV7DUIySYdOwqcq5n9Xjq6sh14WEXMsfAX+I1+oCgDhbt+IwojQSLVFjCHsGD7DiZ8eH06CXb03JZIBAfjSY5QUhxFsQBInzAJOni3/U3E6+yFNbrfR/ovTEO7XvjAbP+pSayKzBmCiNpwpSa1ki9kUaIfx2FAUnhk8D9pEUOrq5xBP+QwdWA/D7F+f9tx5E3pIs/WW50zE2St3X3TIW0lJmUVFwBRoXQnyfKnEgr83EWmQfgVwFvNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBPfwb/t1W1II7v5sRMid9xnHb0O0rAZEBd8SAbnO9U=;
 b=UvauescvxkW+NKJCrkyVkwzdF3IIDDY0XHoJLBbZwtKzq/UoOQTWcFBp6zdVBnXp53VC1n8ymT2v2/8qtdRMS5R4mlnACQ0+h/yf0FTMv32ujuicm6NyNFoJLXiUzTe5UldEmkDVauDF6MhK3ASRdp3yOT11jdGMPpXv7haf9Fg3GQ1b1BYpoiBknTNirTnssJYEeQB0IDz8cCPn/RhWhKDPFfQiJJSQ3ORaB8x2qw7hYYWUHnGtwrqIOLxk7cDL78efRukaWN8WCM1wu+SBMo9fVDyA56ELcwMsZRtdb/HnreDp/pv+CXIg5VdRNtIAKjEFIzX5FcqKNa9xyRF4nA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DM4PR12MB6493.namprd12.prod.outlook.com
 (2603:10b6:8:b6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 01:26:48 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 01:26:48 +0000
Date: Mon, 2 Nov 2026 21:26:47 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Message-ID: <20261103012647.GE274202@nvidia.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
 <20261103003613.GD274202@nvidia.com>
 <1a956c4714be8a9488dbc5806efbb89e47beb6ee.camel@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a956c4714be8a9488dbc5806efbb89e47beb6ee.camel@intel.com>
X-ClientProxiedBy: BN8PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:408:d4::12) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 422b08bb-573a-4a31-b071-08df394987de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CIciHaOFUjR7Thgpo5wGlobUrufCFfojPPJXhhU9NvlnApCBomBi255Xg6KNvQR24mSh8ELPygLoCFlMH09stD3DvFP3wZwpulNHYPLH9vnAltUqR78nq/FmcvO6Mr2B9uvZ+qjhJaNyqxrKJmdvUUxm8mmQXNurfdoZi904e0A1WoHFHK9EE0YoQL7Mv1z8FZ4UfzMfKvF8ds+M/I0fCqCqw7fgVAFvSH+Y7kWfLA2mgRTZAQyqH58KhG+c4XHllprqIIn2PpMVQfJ2J1s7HQWe+qJNzAa+x8vbvPvkxDo7blQF+v8f4QSaeGDrZkpeMNlTCr+WMz+faGnZSmQ4+OhxO1qNQX6cOOiOD69zlWEJcpP/MdP7hAGcxOlX6/mtXuAjsr59PnOT0kPoMq/OkrsUfoFTwQCnBzfsFlyJi8rIsljfheAFz5ffhNQ6aepsLxKTI7Z5RyM+FzD1qspiEKr2AQMsWeYQaPzUj7xDMixQxEeCCGjHUyD5GsQiFVzHG9VxdRUs2mDFZUp8jS+LujzDfUHwJLh40SCGwQYNF/zTNQd7drz39umyCbAUaOdfvQ3VFaLaxN1/TXMehCl+w5jfRXLb3TRs5zPjOR59/ObwZ4OZr21AX5YGu7t/eWGBacKumJ1wPGJ/RUM4Wlh0yGogWbzd4O1aLjfOO8sNecI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SUiWBEzLrw5P3EEcv+TE3Z9wwEAD7Aug1yoc8ns5xuduHuqPnGWCtsbTYGVR?=
 =?us-ascii?Q?ZmIE+AdALhXKBfEg2wq1T3HW6Qit+AhT0EGWi8G/GMwFoj/kY/zA3AEXzA0T?=
 =?us-ascii?Q?J8JQ7euaciYOoeZ97MfQa168mjvoQXW78na1LhHn18kj6XCPthdu2YmaSsQX?=
 =?us-ascii?Q?dMh4Wf4iX/FAI+79ywtDEDpi1gSPQW54LlRFPhGne5fkMlujDOGUuucs15gl?=
 =?us-ascii?Q?U6775YP8M0zpoa/cq5aSBxiIATXuebzes10w51ahHucN3yR86Z2jYnu2GAPI?=
 =?us-ascii?Q?d+rz6ndoGZWJD4dU6fClOFwK+Ca7OOz6MVxAj4Whup75KkQ9FPQ1mzFZe15E?=
 =?us-ascii?Q?Oq6hoZn24gifsroPJ/PkTW6y2HOj0ipr5268MThGkFOGlxXX5umb71VZB+m7?=
 =?us-ascii?Q?L3ru0yjiL79F1k7FO0EHphzuPJ+dGTcS4lheNkSh8EUhWXqJ4BqlTaL7R9Do?=
 =?us-ascii?Q?JKHKMLgLnAhWZJ38P3jsNpQbwtEAlv2uHRK/C52MCbBTuUa0hz2lS7aAagu8?=
 =?us-ascii?Q?nRthu3RPDF3Y9dLLcCFy9aWFMxGwPVvPuSHCmDCLFmSKyopoNE82WU+vClIy?=
 =?us-ascii?Q?ecoZN2ixbv6vNi5jOa+KmfgyJ5AqHhK/MbcrTUm7A1WRLLHXKWwIaYEJ2sRz?=
 =?us-ascii?Q?UjummvkdsCeqOpgtHPNskCWebU5D3VBfWL2jYXyCbqdUIHZlgNWVNtNRvegx?=
 =?us-ascii?Q?5gfA2MDAFR3IXEchKEuGjARapuopa5Z7nb8sAnMSyW6EZEkjp+R/XwBcwi7o?=
 =?us-ascii?Q?Y8rxqrb0nDP/payQWb9ngSS8pqx2t9apTR5xEXG26KG7arGZ3s9VSERAS8wp?=
 =?us-ascii?Q?fd6iznw8voZ8UX8qFfgcykaI3sqNtECFnFy7tmcVwBwnFtcVw7EXOVG+PqTd?=
 =?us-ascii?Q?BqAyOtKlu+tqjzFS79jffLiU7eSU+Qb5j2h/H/dlIG2LBMYPhl+y8eT9CMEl?=
 =?us-ascii?Q?gGgahCKmOpH1UUkWMJ45xyXIy6zP1E/3CshQc6MzW1/XKwRr5+L+ICJKyfC3?=
 =?us-ascii?Q?yH1HFCuj4BkJ4q9ZDLnNUxHCM6MDpLkZpk7jjz0LRoBJxRSaYeboZw8cSiB/?=
 =?us-ascii?Q?gViiCADUN+wgpLaqbW0OQ+yuE87Ogh4syzN+9KWkCz668mqXtX+jKj++pXK1?=
 =?us-ascii?Q?CTmgGi5SJkU6LEL+p+UZmlSz+Ehkheok4EkRwc+fQCTFu8PAjSa2Sxc+8U8z?=
 =?us-ascii?Q?XuBQg5CW7B1MG92KAn3IMKyxsyfnhUCH00kJjzdYQGwdjMLut5lBN9wpCUa5?=
 =?us-ascii?Q?YnpwOLDolthBQwG5WamqOc+epKKFYgAmetJFfRHkjMKMa2lZ7f/jaVH8p+K9?=
 =?us-ascii?Q?mxPKibhooeWD8xFYO4m0iDdbeRMoZLEQwn/4yd9OYmqSFhbQ7UOaGQH3wqkS?=
 =?us-ascii?Q?JMgTsBvm/W9BwrhdmlqaTEG88MnNt3pcMcRkAS/5+uDTXCd0t4fGsn77AL+J?=
 =?us-ascii?Q?PnqNC0xl9ewK+2ETcyx0QW0F6pZxOX6ZDAcPaiT8wZBKOON0c5PlTKMZkC/6?=
 =?us-ascii?Q?CTXS8pANJrZhYivSiCCFZRvENpouefJDcDLNeSbdbDyLp6lbj/0ft+JhPeRM?=
 =?us-ascii?Q?CTVGhOU7ze6I5AoIuiujtFFOkH5cs1kx/SI0QhHA1d7tCawY5HW+LMwJq1YN?=
 =?us-ascii?Q?XtfWRZqNE75TFIgy/CcvPgIKr9n9M0fe3gHVO9Rp6AAcf4N8Ul7z74suNBul?=
 =?us-ascii?Q?kiKQSQe+LEqpWlXJttPY366LmrrBcDSOuHSnzpTpG6qfjBRi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422b08bb-573a-4a31-b071-08df394987de
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 01:26:48.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: juKXyN2haPbQ3afKvbTR1j8VythG9LzKk0Raw6rN9ZGN1gpjW8Wphw5t8fbsVz9o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493

On Tue, Nov 03, 2026 at 12:48:51AM +0000, Edgecombe, Rick P wrote:
> On Mon, 2026-11-02 at 20:36 -0400, Jason Gunthorpe wrote:
> > > You don't want the reviewer to have to piece together a puzzle by holding a
> > > bunch of unresolved things in their head as they read the whole thing. Seems
> > > like a valid comment to me. But the solution is not always just to add more
> > > things to the log.
> > > 
> > > But I think we are still going to break this series apart into subsections
> > > for getting x86 acks. Consider what could covered in a subsection
> > > coverletter too, for designing something with overall reviewability.
> > 
> > I would prefer the arch code only contain enough to do the very low
> > level interface with the TDX module.
> 
> In the past TDX work, we have been making it so the TDX module call wrappers
> were designed based on what the callers needed.

It makes complete sense, yes

Maybe I was too specific to say 'very low level'.

Like arch code shouldn't be running the SPDM FSM or doing "caching"
for example, but that doesn't mean it has to be as low level as just
register packing.

> So to get the x86 acks on these patches, we were going to package them up into
> small chunks that do something small (see PATCH Organization section of
> coverletter). So we can succinctly show what the TSM subsystem needs, and how
> the wrappers are designed for that. 

I think the lock/unlock is possibly pretty straightforward

I feel the viommu design is coming together well and is looking like
it will go once the three arches agree.

Anything to do with SPDM seems like it will need alot of work to get
the right shared code and flows together, I would be careful trying to
prefetch that too much.

Maybe that helps guide what could go first along with drivers?

> Any concerns?

I don't mind, I'm just hoping we can have stuff in more central
locations and not in arch code..

Jason
