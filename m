Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925455;
	b=qNa6dz2zotwG6u7e9jyo3yhNBhDII2igxq/UhRggI21hMFxIiEw3TpOr0sa3L8oZUsQa
	 0rEtCWleDDUUayKLsJCEnbbeLD2LNt1GnJo1BL1fP3p3FMmD/ScuYxrPLPDq0+z70DBt4
	 cnnBEwtGAExvnuHpJRg8mfSMX+lMr+4M8AZ2jhbav5CCAkwtQj9BdhOyeK4m6U4Vfualf
	 0NT/SpiBOOJPSkC5KkeV87BjZo7UEVMJBvnZe1a2xvVO9d9hQ2Qe/HMUTkhU6VA35OFnv
	 KGjzFySQPK6w0+im4xlgAI/7RR4R3kbXEsBQX0k2M4fcpR1OhMQwWnXwZviHeq8ZGDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925455;
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
	bh=RNF5mQYeYCWXJF3Zp7jeBqd1rboBZ/XHg91Ie4OqZH4=;
	b=oPwhgzDsOvpUIBgOVo9s0dTjfITbs7TAQwhcI1fm+DwvHDAZArjL8EBFfgovwUgUndkE
	 R1VKyH8aChTXSsZZZM0SOcbCQfx3yRvgq5uAat1ZXC8Tyz91itQSFCfWqM9pomymisLCC
	 c1kX3Q2uvcZoVuZi/x+vsFT0Jxek8Z5btYsXQ9bBeJGdy3T1p4tSYyJur0cIyU9rQlUPb
	 WAEzyNf1keq18t3KCHRJImkQ968Ic9YwSevRShW9kVwJIdR7arNSqiJGXvpNpN/Jl5oGo
	 Bj6w9IUyxfRgHXOu0HfiuZd2eeyKKd0Fqry1gQbBE9wNoQs8JHjiZtLRXUVJ5QUEmQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tGefQ1rk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.61
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5275606A32A
	for <linux-coco@lists.linux.dev>; Tue, 17 Nov 2026 14:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5275606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tGefQ1rk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOtbyYtAvgd+4mP7SS6iEo53gPsApRCip6FXumQPxq1L32217tjPDNcGde695SdRkLTEaq+VoBAyxLZcZ5NQOh5r8mFZIGdF/1QSa9JibUpweSnJjXEwf33rq/qdAlnSyhMmFHdDAxmUADIqqQXcEg0fnPHsnA0/ABrLyvhD/CsIIlwMeUShH8+bLzhlo9NOTEPJy6fZUGQPLRLUOoSHdqMRoX8VWNl+s+aZ7dClQ3ge9rKrvV9mf9ueOjd1nuZxbimn7AEFl6VBxix/7Q/aC4m5FuuCVGl7UHZb8TDOENI5uSzKoXt9+yqafoQENTs0Hxwm7Yj1v0sYAuheZPiNPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNF5mQYeYCWXJF3Zp7jeBqd1rboBZ/XHg91Ie4OqZH4=;
 b=KLKl+cy67ZjczQusmt3MESzaaFQ+VpAqGx1lbWZE9M4EXZpLO2Cw0oCsM5/QHsgHtN1wJ56RnEkf03HcMW/3QTU6KP5vpPdCtXqYhcK2HgKlP25/mmfWpxp4gb6WWa1uWNsXJwxy9GXxU3z4OiFftyyqz+w19NOott9xdeGmkWYCFLk1O3syRkGb7G6qmGnqC7XUocuAM9LCMSkQG7Yu5AFiRtMwHS/Ka0765TmqVXCnL+FqTxxMkaQI28ZBHxcrYm7x2L7oXMDIQRGKGVV6TwTe04CtMI5aT7NIqSa28a3nNTOl+edgECE8pJ8FUXy/2SaGPgOO0C9b4VuJ5/xQQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNF5mQYeYCWXJF3Zp7jeBqd1rboBZ/XHg91Ie4OqZH4=;
 b=tGefQ1rkp+EnDhl193bAmgAc6ne5O8Rdhw8pEYHEfAEQ4xIHIY6HntGSj7sL0UIx0v3u5AtsZmwjTVBHf8GO5PfWLK1t7n/+hifC68jEUlbRmpNopA/29YWxLMp1H9aWsoyICd+8EuUTagJeGuvIALC1XZS6kyjUVgvsrht3kmwGq2Q9GC1hmovpM9qXFtpx1yQjFSKaZgowfWEtAkxo10WQidbAhl5/Sq+V5cdX42JUsLxRQVC8IYn6nH04L+q5IFZIijrtbNtU/iQfbroensuLC+y1tkNOjAN3/BcOoIAaVel4XL7799Xr95v5nj3otWd484R8TWJirgsV4KxljQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CH3PR12MB8355.namprd12.prod.outlook.com
 (2603:10b6:610:131::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:24:06 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 14:24:06 +0000
Date: Tue, 17 Nov 2026 10:24:05 -0400
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
Message-ID: <20261117142405.GJ2245175@nvidia.com>
References: <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
 <20261110195745.GG738765@nvidia.com>
 <e44f3f12b3fecdc5f3c05aa1f1b0ceb1befad0b7.camel@intel.com>
 <20261111001606.GH738765@nvidia.com>
 <CO1PR11MB4835656CEB24B31B557162258C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <20261111150029.GJ738765@nvidia.com>
 <CO1PR11MB4835C4C6DA79A84D0F123AD88C712@CO1PR11MB4835.namprd11.prod.outlook.com>
 <a2549a83-6acf-472c-9fd7-69e965707d12@amd.com>
 <20261112145450.GM738765@nvidia.com>
 <9fe0eb87-bce0-469f-8a13-a8a1e310ab62@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fe0eb87-bce0-469f-8a13-a8a1e310ab62@amd.com>
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6016c5-ffdd-47dd-5ec2-08df44b66fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|4143699003|261028144727099003|261026140227099003|261022105027099003|261026121527099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zlzUCFI7SHY3nRRcNQaJeKh2Y2sCx3h6+BrSdlda3H9xG/wq70STd16BedA/bV32ICboWHPLUYhv/MdG4vDjWm2xm+DLSlF6zZ/EklHqi/Alo5RBvuQxw6XeFGpwssW7pgXybvgPGSJP4tH1ndTf8xkf3C1/BgYwxArc5uaqSCHuJhPAxEcaJ87GDa01yBcIssUJFl5w4lxOu0eVNckyHVwKPW9l+0OxjM+6ycuOcWGPqnirgKvH68AGU8bUIu9BSJFzyJyb1dV2YRwyOz4E/gBCCra0MHvqI8qw+r2r4zjFCBtXr3NnjdDsD/AO5X0s9BpKwIYrH8C1FOzqbhiNq4efA+h6AUtMWtHEzNs94YHbhvsDSUjjlMlvVQvh6BuGiKobT8WBDmZeOFbkay7vD3tdvUvquLYBlzIJA+L40giFPAAHeg4JaRLvNDq7i1A60kVxU46gwwQ8rneu/AgUqKIobntz//lIZ55UAw8eUGCj/S2Oa0a6olLGd2anI+TfMWGH59nLmJfcSfeVpBqagFLKoHlAR1teqZw4HcUhTrkQtFRw6exnWD7u332F3tmnmyCE3hqtW874mEqdxOXj7o8hpmOKI12+P/zS/zugt6cjz6To7oKPwTZYV+Ea4wW9k5SXrx3eNqUhczvDiy7m5StuM9lbVH3HBDUfSLqL4Dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(261028144727099003)(261026140227099003)(261022105027099003)(261026121527099003)(261021135927099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?khMNYhLdqrHh+lA+2sUeIv2Kf08YQBmA9v7Kh0yD+jKWmWpNvH7LmcGeXiOh?=
 =?us-ascii?Q?veJ3LTs1gUzNGFhbcIJjl5yUL8L5+DCSHXAT8f+LTrSi3ol46sixB8Xn1cJK?=
 =?us-ascii?Q?sY/4jB9UURPdxVH7ZnBhNyDE2yYc3g41jdF5H+PNXeeilP53fJvUkinrZByR?=
 =?us-ascii?Q?HpCApX3aJjlf0TLPygxznjV2eJZDUX2uxMCXW9ZsjJaEr2/SxvVcSUotXW8H?=
 =?us-ascii?Q?mhKr9YJVSDKLZZqECls9I28LthEJq9SiIDFT3ny5E+gJa4Vw9JPc90tKaA7U?=
 =?us-ascii?Q?NkDeP5MCtTcYRDJJ5rb5tjtpDeOpxtNdcRWEv2LwmcI1mATEiuWZ+Sh6oCEA?=
 =?us-ascii?Q?+o/j5TgOaCx296K1bEczh7XdA1+Em7cfJWum9EudaWUKmvhrn9Wnfp2bkbnG?=
 =?us-ascii?Q?foaxWqJ6YXW6yki3mg7FYKxr9q8g40LZnA1/cvXuWyKXiuMVQsZuAIb1uAuv?=
 =?us-ascii?Q?qE4pj43mhRkw/yfI7oM/OhL48HX+5z55NXtHwMBRZ9d/5HhVMwK++JqVb7rN?=
 =?us-ascii?Q?MPaOwSVgd2filfe/zbLTFtAs+C6lzmAQNM62npHFov8KiOLnEWJa3s5nprSa?=
 =?us-ascii?Q?48TazSgEc4DWRfQgattjo87gXjDhIF/a9vWiYa8kAHviVUhAAMrwgU1OIZy0?=
 =?us-ascii?Q?tpGrm6sB/evUYFaCUPEaJF1r8PpKoPlt02dL5i5Y5C3M8TXIyb0V+t/S/hYn?=
 =?us-ascii?Q?nAaSWhf567zPFzkOo8hcLZwEQclRrNbs7wrsNcmb9VRYRdvnatrbM8IeWxIw?=
 =?us-ascii?Q?+1LiXTJei7EuXSiRJeDE90Vk07d6Ob+5c2IE7qSheYBWbe8imo6dhTbqxrwW?=
 =?us-ascii?Q?T9Q/fSP1wqV7f2ebya0epiuh3LcDMf5IdZbgqEIdJ/Y0jSkPh7Bz0SBgUlgI?=
 =?us-ascii?Q?ieQcT15DK1vzYq6RLyAvhG+z16zL+nwi8jyINIaqiTCCnK7U8EFiXGZjMCtt?=
 =?us-ascii?Q?UIOpN3jW7w54JBRE9zzwtygMbzoUHJg4IpnXPBbTlFefWcq/5rlZqrBlCMuG?=
 =?us-ascii?Q?3Xf6EeEjtqP9pnZNz3cvBWt1KwD967I1FB1EYcQ386J/c4EW3xvbC+3xreNX?=
 =?us-ascii?Q?sdUoCGutjQ+QezMdL+7DuL6FP6y2N7CT8ZNWXeMsBpZI69tMTZauJtodovNo?=
 =?us-ascii?Q?ZmGuLMCwWa9pgCy5tGmjWIhyIgRtvogOm5pMd5McN+ymQBR4KQJ4nQphOB8m?=
 =?us-ascii?Q?hY45E/hB8ayHYCSzFRWR57PLwHLFw9hkHmTA4e6JcPddwOR2IkoRONcgAML+?=
 =?us-ascii?Q?FY1FS97AEZHbE3wREk22z+CEQy+gL6ZeQAgpp1ozBkG6MhXF+Mu4xy6NPEk9?=
 =?us-ascii?Q?VSG83Q1vQ9i0snsIuhsoy7kZ6u1udCVrzGIefrzh3PjxNF2TWPKyAouaFgGK?=
 =?us-ascii?Q?uwvc2jTaAQbdfo7QnRQhxcx4Su3g9rweDLilrk0qJBXjQmli3HG3r5naUPrp?=
 =?us-ascii?Q?OwFfvmwx12A1LbxDGIcF4HEiueuu4C4dAv4LV+FMYz2T0pyIeVtdkrf7lwzg?=
 =?us-ascii?Q?6Y93gRIQ6fY+KIWte+BWFOjlY+/X4mGfcYHmKG1ng7RLVCJB5Di0zsQzbo6J?=
 =?us-ascii?Q?R0LV8Lk7NE9Fji2+h4J+vCImRMN1ZYQ9jfeaGT3wYmfi536EU7snru7YhKnn?=
 =?us-ascii?Q?UNkDa5hQxRXGgWeXcvlQTGhKXV1Vni72NYMbkZVHI8stktWqg0+cJVdR87fr?=
 =?us-ascii?Q?t3LyGS5qmqT8qINSLmmKaLxKZOMuWi2SSDZUlmUn+c//KisZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6016c5-ffdd-47dd-5ec2-08df44b66fed
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:24:06.3879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSEN7FewnG0IHy8eKxh/cl+tkUPPdQ4Th7IwkK/6KcOqmuFmAX2FG67WQ1IL6jTL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

On Tue, Nov 17, 2026 at 10:16:58PM +1100, Alexey Kardashevskiy wrote:

> > You should still clear the sDTE and that should be a non-failable
> > operation.
> 
> In AMD GHCB, the host forwards guest requests to the PSP, and the
> host can screw this up. The guest still gets to know if the host
> tried to meddle. I do not expect it to fail normally but I saw some
> of this while debugging. Thanks,

Like I said, it is completely bad you don't have a fail safe way to
block DMA again. If the guest tries to do this operation and it fails
then it must panic.

I still don't know how your "host controlls dma enable" works with any
possible security. Is crypto involved somehow?

Jason
