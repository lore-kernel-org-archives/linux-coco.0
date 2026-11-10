Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794340674;
	b=SCwhZE2okMsLt/k8KRHMQ6d7TMvpkD+qQEyguZvVMMuqnmxumNdMW5uFgwPbAZyUXI2U
	 yhkoNkQN45Q1zLp4Axi47AeFxeS4g7X5plRQAsaz5kW3iU0u1UTkboYZXM0ePO1S9dnvu
	 JFPQ0cId+UxIofaQ67WXCveZ1+JEHYSYCWlI7Q3ws6998Afje93ApXlO5niNNnS1TVz19
	 W4tVUN7EmEf7OGvKDgIiblfJ6j9cr8MeSHa8p4Oyw6fdx4aLcSnJZRpUM5uuv4MHhMwS1
	 0Samb7IyveFcwgPWw7EMMTzWZj0lXft6KnyYlC+tLf1mF+IArQbL58xRXgReUyxCa2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340674;
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
	bh=trvapBc7cNL/nadwszdsOEuVIj04JluHNvQMY7I5aCE=;
	b=TES5tScUBUItfwCuoGaHoD95t/4gtKFVnmtvbX0+oLTzkiJwwF5lZOv8K6DjieN/JrvJ
	 D7E04QjKMEER+zck45C0V76/9eEj63iIplryCfUGMN6+2sZjVBJuPC9X2adFXr2pFJz/w
	 VybsSTU4lAubI+ZVuOakhy6t03R+3JOxWQnF29aUSoIC/mCIjjSYfgJb/HINPFjKI4Wya
	 OOuVHyUYMj0UGVc1tu2nxmiEAQB/WhxzLOYNWbyq2JHYclKH/+hJIEKzx/dJA86uQe8hS
	 vXOEHoVuvu9enPf27V+6C57EvE4BrkBWBwtt5OxEdoM9KVjRwPjCarAGtCFzkGk9Lig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kRtIbxmp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.15
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3D606A31C
	for <linux-coco@lists.linux.dev>; Tue, 10 Nov 2026 19:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16C3D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kRtIbxmp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW/JBrT5INPhGQUKpYs+7BazsuR7Z4s7U/w6gRcTve+PICBprvgH9C+JzO8t1dVUZ3J08tpXiixZIES0XIyXg2o2vqwrXxZeqAInAXhWZ5mIsUBM8u3S9B4fqTdIEY20SOna8+brCfnFwKecLqOnhUTjEiArxbypzpRN0ujoq62i5+QNQEDy/RlhFNQ353L99A7BY4/c64dVeO6yNwF413DZjeRn/Cc+0C8acr0ihXCc/IhVLHsH+cXf6rcIgIbDwbQxSTcyITZfSWnD3nLDjMnqcU9LshXYf0K1UG9jzQ7eemOA/9TiiNcvQ9D6qPOf6GJOXouZl03LMot+ZAHc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trvapBc7cNL/nadwszdsOEuVIj04JluHNvQMY7I5aCE=;
 b=BolEn5QvjuA5EnsfxnHEnH3aSQlLo5CX1X92hekAdldYSeaUiGP/fQscuQhpJa5zX0MK2XLgkHJ+lSszag5DHn1K4eAPhoi4fF4UX5zI4p7o3+vT7hKR7688tYzDJRPRr9RPnu/CSeUTi1zvlpvof+bcwW4UDHWy2fFtgiM9L5mKRpMo0L3G2dEFOoMB5H2B567ogRH+bxD1ud9GElJXomFrfvVzw4jHzEDxPR45ydlzVCgCFevOzdbFt2yEr+KxY3VoHyfH8Oz2tX92/uykkb6DwCvDqGiUGfU8n6Jo+J1uMOpBwvhALIew2RFdOl4ugRLrKzzPpZqXoEkaoh0ciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trvapBc7cNL/nadwszdsOEuVIj04JluHNvQMY7I5aCE=;
 b=kRtIbxmpkvwGpg2iF9iB76WQyz+skP0gJUjkKoqQCZE6C7LwV0C2kNgKENhxhUwJuL8kC21Xmm6DLZDy19x5FzevZBhG8roS/OLF3F16mz5gEEL79CMvtriKe62J+FLfL7gcVMAoElYnX50sBC4CnGe1EhqTUx0XRwe4Q4atSVXoL8R39BA4Yh5EzZVRYYg92ykWAwwQcVWRunX33hqU4IMOaGCAX1za22O46+Ltgqx/NJDk6+K3yX8UWpQInujwwAdWYjwkku0lyAHUVGUHMqbXQaL/ggeUmfDkuX5F6NKX1lTg6ATj2qu3ujCuImfwIjh5XS2ff6LT3bdPzai4dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by MW4PR12MB5666.namprd12.prod.outlook.com
 (2603:10b6:303:188::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 19:57:46 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 19:57:46 +0000
Date: Tue, 10 Nov 2026 15:57:45 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"seanjc@google.com" <seanjc@google.com>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 06/15] virt: tdx-guest: Support TDI bind and unbind
 operations
Message-ID: <20261110195745.GG738765@nvidia.com>
References: <8c892695-7ec5-4d93-a74b-487fe535c3f4@suse.com>
 <IA3PR11MB913605FFABBBC42C1FF341E192982@IA3PR11MB9136.namprd11.prod.outlook.com>
 <03c80e1b-2a47-466a-a042-c736f640d3c7@intel.com>
 <IA3PR11MB91368A7BCDAF146ECDC6A4CB92602@IA3PR11MB9136.namprd11.prod.outlook.com>
 <IA3PR11MB9136FE2B23CA52EC68EF2139926E2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <bd0f63af98521d76e0d34ea31f18accc063d1d27.camel@intel.com>
 <IA3PR11MB9136FEF30F06D8D5118B389292692@IA3PR11MB9136.namprd11.prod.outlook.com>
 <a63e7dbdba277b5a551ec74d09144e97f55504dc.camel@intel.com>
 <IA3PR11MB91369A1E95D047DBEDB53B7892722@IA3PR11MB9136.namprd11.prod.outlook.com>
 <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1cdd989f6bcf6a177dcd83e55fb8465e0ee849f.camel@intel.com>
X-ClientProxiedBy: YT3PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::11) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c10de8d-9b96-4940-43c2-08df3f64e3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|18002099003|22082099003|10067099003|4143699003|11063799006|261026121527099003|261022105027099003|56012099006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	puqsyYaLY6djscYIAvR4wjyzISgTlMJjMmDwHtQHuxP8dvGmMWeE05BG104CdL3frMGVT5EBo5sU16CoSfr5N0bEO/mDaqdtD62/+b0GNnGW6fezXPnoMEJs/0eV+l+8kzq16vEEhNmEBy556b2hmSU2ECLABApvgOcCj3Xr7AcO9n9xCOuhWum68uapm+18DjqCJeW331YVkToWNLmBgQixmV09Dk3usegMC0U1iN2ZwZCtGf0KALR1yUj3bl9cNscGe5HJdXB7+SgG7gwOL4X0kRcP4IfALZh46KOcW+aHy1StDy007PjEY7WWSbfR5brkq+v0UEv644potwtvyH8UlhHwbCwkadjPRR0V611PvIDU+153Sm5XH7y/QMWPIGpUyg9VIkL6IAbsToNtWlHTQxZ090uam3+K7Yf6IXzfhF8PkA9Od6P6P5R0gQIz8+14+H4x5UMFUam1S1ofuijUFN95MW3yyjKViJ92D6nKWNeTtIXkXFD7Mw5NeX4L+S/9PKlWLV9hwS16YYmOQfd+hBa96elm8pIyE9eOPAVKxxclYO0C+wzaj4XfYFxEOOWd5+rrCU11wo418hiHy/o7KvlWc4WXLBkgvqWHesVRY/8oWJEbMf5uIQfXc7TlkxypVIRy5Ki331UlC/zeXBagYRr4wlNZmYg5WfM3iHM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261026121527099003)(261022105027099003)(56012099006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A79AE1Sx1Kt86Mx8TdHt7xx8dUgpiJuCNM5HSxgO/yphNT2Bnmxm/wwNn7tN?=
 =?us-ascii?Q?KvS6nW8xAbXxQ0zxzWMAn8xO9xkfhmta+i/xBkAwtvX7cqJfrWhhRRZRr7QU?=
 =?us-ascii?Q?QowuWXF+6npXu+p14FMmUyl+JWRUuVaL7QxpX7p+S77kyAGQRehsVoHKfqhY?=
 =?us-ascii?Q?WOD+U4PODRrwk2BcUtDfBSh1PUAvQzzBv3AO+9yWzLkyLWwhF5vdKe0I+TQO?=
 =?us-ascii?Q?eVi/mBoLnzSsH01OHQb6867VzYmEQwwXFAfCLSO1UnI29DnhQFaw7WfuOmLY?=
 =?us-ascii?Q?qxQqz2uoOSiDdApjvJcd48Rw8/tWcv/hdAdKeANMpQ/CyQyMVNqPqYegvzIp?=
 =?us-ascii?Q?GDToJvFOggdj0yCTdQBFtBg9Aobt8mV4sgluvaKGnzCxbvBDRMCC7mY9TBtL?=
 =?us-ascii?Q?2AmBdG0tQn9DaYEWGdjCQL00W/aywbye9ey0cjKq8pIPxGfEFuPZbqpSh6h8?=
 =?us-ascii?Q?rTkKH0y9yQa06J1F74WAU8tF8vNUXqimPgpGkFT01PIbJ1h0ry8YCV81V5kl?=
 =?us-ascii?Q?dP7fLbuVODmQ6qrftCPK42XR2XO/k4mqAZouLMTFU6Ad8iC57puwZvjEWI3g?=
 =?us-ascii?Q?l4K8/vWKzy5dFgDGhofxBxND8SWLU54+6Zxp3nov84+I9yjQXPjpiSKrsmyg?=
 =?us-ascii?Q?hWktfBSYsTQIdJYwBNbCLXox1xXuSn2SsUVJr34b7XEfbkZbE6Cc5SdYV2aA?=
 =?us-ascii?Q?kOpBTj7WfHh0S3rN99Ss3QH/L+OKiEsGrdL8jzzXanerKO0t8CvloZ5mJz+U?=
 =?us-ascii?Q?wxdNBJcreda/7SjxAFy+xFFnQ2Z8mBX823gXv5IlNB/or/cyL7+Mt8+/3XKN?=
 =?us-ascii?Q?gHlwIMeR0aHI4WdBuykWbliGmjI85LdkO8p5zGzRKYX+rwbMNfQ1Xvq4SsaW?=
 =?us-ascii?Q?cBhfd5A3glLnQtzkgEejHGGepFAVAVl2jVqO+bU61kzl2rP1zZJRcwgUnxVO?=
 =?us-ascii?Q?t5JBhfGIoHTBvH/Xo9d4jz3H/ttpTQf9bpn4uAFfNF91vE2KVv2Fgl1mH+CR?=
 =?us-ascii?Q?9u2v531Um5i0EJM3Dq9/OV1M52hyVMRVzJY/n3o+g2miSLpcbZFYo24+IQ9Y?=
 =?us-ascii?Q?q6WarsOTusGdI0mMQo4/FZaDoqj3eE7mePRzcpsCE4bF5I2uwt4+IjeTPe5l?=
 =?us-ascii?Q?A30Cf5ZDQuehY2i8xazgppoij6RPSUuHo7MVy1q6jaYfUCGl0y+sUxjBXitA?=
 =?us-ascii?Q?EzY0qq+Kzsv0P+nESUdWTJb+fIs16AuyGVf7W3eGifVt9wGo/+R+ccktTEft?=
 =?us-ascii?Q?wGwtZ5VYjid2eSLYjrjhu+x1EdBDgZaEzgwryFDKOtCzbhD3BconkkbN2k1k?=
 =?us-ascii?Q?EKzMJsdGDtV4u/QOKUP8ZH3Fe9mKvzfj2WoDHr1UOwHfSHVkwjayDyv2oAq7?=
 =?us-ascii?Q?DPBv429ErGfr4V8AbGo4GiesQVobuRFjGn51+oMQBxfu0jT1i6ELu3aAtCRh?=
 =?us-ascii?Q?N5TOiLvqeF/uqBPbjMpoUJUJpTmj3zZBW8Nl1gFOlGipwkYXJvqmP6nX2BPU?=
 =?us-ascii?Q?LHwh7hK26PzZISg6L35PdLYPCJGPVVloURpLtoSIhvnNLmiWwajP9tBQq0ZD?=
 =?us-ascii?Q?y+Hu4PdCzuBjARlsnQp8TtZvfBaUGa6UPfQNfoLVlkE+rypzD5xiTlsBDdvt?=
 =?us-ascii?Q?Kj6QRVa8GbomPSaLSYXjKWX7g0M6DlYFraQX3LhGbfU7l34drXkbgtLXAld5?=
 =?us-ascii?Q?aqOVpzCIbLnPofFca/4Fyy7/XkVM3eQ2fTBx5JxftmdE7Qg7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c10de8d-9b96-4940-43c2-08df3f64e3c9
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 19:57:46.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIKk54gNIFrmsYqIqY4BMSQGcZyioVzdZW0GN1CPlHPZ3zXPvHSMLhR1Q69YouwH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666

On Tue, Nov 10, 2026 at 06:55:41PM +0000, Edgecombe, Rick P wrote:

> Additionally, we should probably see if Jason has any opinion on the types of
> errors that guest TSM would like to handle.

Not at this point :\ And perhaps not at all.

Most of this stuff will end up routing through userspace so it has to
be compressed into a errno.

The various VMM to guest specs like GHCI are going to define their own
contracts, and it is up to Intel to ensure that the full route from
  this code -> attestation subsystem -> uapi -> vmm -> GHCI

Preserves whatever semantics have been defined in the spec.

I don't know the answer to the EBUSY question, other than
TSM/attestation will return that to userspace. Can your VMM and GHCI
sort it out?

Jason
