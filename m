Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793666187;
	b=FxjDvIPJAIy6DM7Ja+0DnlbEUI4M5zwX1j/KbX5LKtIq6RYd7iB495Lwlhgs+95YolEU
	 rBBNCZpdrJNblbd5byhm8T7UlfLMwuToEx/krPHF4iHSFtFjApHsEhd3sx34mej2BieHl
	 hrr+g1MrZtGb7xwUmkgxV4jiv/Jux/MMxwdRWGwIndarZwybRXicbN1Qpa6g5T4LbMYz7
	 a3Lp0tZGrkf3PnZzYo3HAthHr0iEaVL4DEn7/2fcD96als+Mo3+zwps32E6541g/vyGJd
	 0wi6LDB8Uq1Goqee/SaeNB0QpVgxT6M4p767QuR5Mp8e2SHw+j/OtPqTFHDulGbIERw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666187;
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
	bh=e7BuwJ/66RybXjpd2K3rEloVztj02mOaYcQ/9XCy8ws=;
	b=OOYyvc5n+6i0RuG7hNwkrfqhuGuEcCA15/JwhOabkQfT1kUaM1yqovs2GcOBqWe48GKW
	 BLAriNAYG+lGO5xHLLYCcxqegRCyOLl92VUZlQSmw/suFaMLNCwgw+infUzhFJoq8SbsL
	 F1IYXgDhDFPltYQlR1Yy0J6rxWtRAohSjIoQJvXv9b4eVUKCIDCrTPE3yaO5SHddrek40
	 huda+3hseEIJtNK7W5SBCmRDsJOnk2tmErlhT6eC+UgDoAD3W2aG0E6Ma7Df/KmyNGUon
	 qRCRz6cjZnuabS4YpRhiIHjToo9H8WSx3xEHsvKHXxTQWrS9ggJ5d29uHZWMuE2HKcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Uq/7d8mW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.3
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC5606A326
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 00:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBC5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uq/7d8mW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxIj9jMhqHJpOmTgoTjaiL5VejSFcPg9XI3HTJVeQQTeQJqEZMNVUsMRRkwvfUZ0DhMmfEXjbk2ShLPGPT3WaF27UDEfm+Yw2JSBX2wG1zQDz/NDA60HjoBMiXkpBBQAnEaC1RhgapMn1lvxh+v5+5ndO+wKuQjF6STSQrJuG9HXlLOhONd/6E61rruvobMYeoLbPGHudzl//XZacvMIFDzC6lkT+WS5QzVh378PB5aHwEqsRjOyZRsdTSUn2NARkO/wfCAVn/MfDZgdOYNzcP7g4NVz1NW5loRzcg66iZbd74yqJARDwr+Pb/WTqPNoJGg0wy5YvtUPxX8nG9eFZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7BuwJ/66RybXjpd2K3rEloVztj02mOaYcQ/9XCy8ws=;
 b=EXHwZwgcv170bce/RSHpiKx2CD6lUXBYw5m2ku0yne/So88kBRvp7jToY54FaebLsJfSwWgtAOoTdycmGNMTBd8+x5M7hJmCQG9XjdElIR55IdgVd00rqNjSUQqG9sTzarYqc1TgJQYm52GhI/sc/Zn3u1Wzk+BkUYm2FV7oHdL/TDdpk5C4H5riQZeg81Mp0uQPAAWOZpDwTH5ILL8vBRYWDgJj+YAPZTPSnIJNUz0NpEAusdn77CU8X71b+86BNgA1EyBcsB/g0JL94bTauOsOyjc9yhifesft3Ky9kB6LAHqG3Rjn3nV8xju3JmNskWmHBwcy28eZSfyijaeUiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7BuwJ/66RybXjpd2K3rEloVztj02mOaYcQ/9XCy8ws=;
 b=Uq/7d8mW79UJRtQDePP46qj5toC0YREL6au0JCoke7XbLW8Qxh0Zev5JR56FvhtPyd6cPVWaMESZLMN2FzYQjYAlB/+TJynmTRNmbeo+U72R3Ge4710S2Bt86XNPKLtULPhQiojLWwDyJciJ0dZ6Gs63w4PZ3lJZ+ArOcyvWOi/F+Jlrq8qagzUsi5g7YIAwKxl3U70JZT5aPhVPttJZHFaOOlwD9q75U9cJK8O70Kp20/lyYCBo8N1EaKdYrt9d72yBiY7TD0RYIgjgUzgPNeeLpC8zuGDkdvEbEpj8AQ74f7WTnxsTy/rB0zjOpeA3mLpG4w+rgO+Ax09x0rsBzA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA0PR12MB7749.namprd12.prod.outlook.com
 (2603:10b6:208:432::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Tue, 3 Nov
 2026 00:36:18 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 00:36:18 +0000
Date: Mon, 2 Nov 2026 20:36:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Li, Xiaoyao" <xiaoyao.li@intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"Hansen, Dave" <dave.hansen@intel.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kas@kernel.org" <kas@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"Peng, Chao P" <chao.p.peng@intel.com>,
	"Verma, Vishal L" <vishal.l.verma@intel.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>,
	"Tian, Kevin" <kevin.tian@intel.com>,
	"hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"bp@alien8.de" <bp@alien8.de>, "Gao, Chao" <chao.gao@intel.com>,
	"aik@amd.com" <aik@amd.com>,
	"yilun.xu@linux.intel.com" <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report during
 device lock
Message-ID: <20261103003613.GD274202@nvidia.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-10-zhenzhong.duan@intel.com>
 <edafb4a0-ba6d-4fc1-a61a-801888e31a9e@intel.com>
 <IA3PR11MB9136663EE7AADEA4768D23E9926F2@IA3PR11MB9136.namprd11.prod.outlook.com>
 <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4fa1858eb35367d0ad5388823017a340d81fda8.camel@intel.com>
X-ClientProxiedBy: SCYP215CA0072.LAMP215.PROD.OUTLOOK.COM
 (2603:10d6:300:149::11) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA0PR12MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f7fdae-4125-4bfc-6f4c-08df39427981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|261102123227099003|4143699003|261028144727099003|261022105027099003|261026121527099003|261021121427099003|11063799006|261026140227099003|261022075727099003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yDsAkKXxBfCFWBbxelmj1gQ3uHX9MXiBJN5t8IiqLOoXWP2n43pxfS+f1HOSpewwOL2PQDO6VhUZkO0EdPenHlcwI77H/LmLyu2RiukFIDhtlbTaNUUSpzLWbk0sabayTKHtRH/MHMxY3ACjj52NQKVdVUzzbPo73+dYA7zh/yzQeEdgtRoQ2k28/0TKXKViRbzaxWBbDBlHHIZuYoFj8blCGtgpG0ibnALqv5hBEY9ufLRbxYYHX8Qxp6xk9Q9tvFdIINZrjDrh0KFkckzYU5p09obLWbVQz5aNRyy23qtP1+MBrwV298ILb1sOeb7CIjX8Lwlr4m8bB3bNMqN0XH80ArrpFBRS7+NUiK3E2DsOSSA+AS/O3KW1/tWOIoYFuP1237uDH6cspinqwtE84yS4zPAMnzKQB8I06sQNUggKG38StTGSw4FjlMfGsL4NsvPbwYjRDOSmiDoDbITLOfHNDB12RptVuw1R5AcCX43l359u2Ms6NJMjpPKI41HQcQ6KY03YQBjkO43MmtrPEBhqeYsrH3VD3cnG9Xv0taD6RHxX2QRFOjsz3yJK6cnmoaee0XD1hDZkwz8W1vYzU2nEvFOQu5Cz6wcWFGp2ODPRzIYI0tuEHcpataaAHqGBxk1GYubabj8Dgc+y15zjVZ7dE2aOzLXjZ+TtG4oR/V0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(261102123227099003)(4143699003)(261028144727099003)(261022105027099003)(261026121527099003)(261021121427099003)(11063799006)(261026140227099003)(261022075727099003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xj9Iq/g1JJrDk5X54mvRUnZU3usVpS0aRbmYQtQ/Y+Qml0IOUTUrxtIb1gQQ?=
 =?us-ascii?Q?/TMFqZsOCP0w2ur9rWlqv1Prczey6iXaAwvnyZUTyX4tNCBYdZid8P3jWSTE?=
 =?us-ascii?Q?T+oW/91x+15PsKG0l1WDxHXaX6yzGf21nJAdUY7v8KY7ZML+2B4/Qk+wEYvB?=
 =?us-ascii?Q?Adw66UVhBtoxVgDrsQcInjc/7Kll2mV8c5nUOmsqyRQ5bUG88z4U1O8GQEEv?=
 =?us-ascii?Q?uSU6nfO/qfa+L5N51ebMCJHbaGozCSuoTcN/9YlxHnwT+20wtjNLze1Roy39?=
 =?us-ascii?Q?UYPhFAy0NlxbwsJJMHnbUksBGwWSauCvAnEp5pZBRfgNXhlFAW21Vg2JKRka?=
 =?us-ascii?Q?hXTtZka9+S5UsyRqU6BrDOCMXJk9b7OhZYjkYvnXPJzJL4ByWkIUfdFWfWHB?=
 =?us-ascii?Q?itN9V0k517qDpIRQRbNR7qOnv2lUMnXC3bdoVOP06i2KTZ8XRnkxPZ42I4GW?=
 =?us-ascii?Q?Wof0JqhHMpPMPePf19OJBBiH51Bo2zDQIYZSDXatXS8VMKD7T4l0qHQS7Fld?=
 =?us-ascii?Q?sl0RDqsSD/DFHjRjcxMwHd7MsAgIgbotdlg5F/C0QiT7hnzV3EyU9JV+WYwq?=
 =?us-ascii?Q?36aTz6xT5widaduJII5rBD5NdzSCS8PBAXkr0clxfodfkSmPJ/kQo+NQmTCx?=
 =?us-ascii?Q?pONYxQEO6X8RM3aG6UkWnhOM2JZ9jJ7zaxCCicna/+GyqO7ZdJXyyA7Hm9IC?=
 =?us-ascii?Q?6Xfd+VfZ84YuJ/NkewbIWgGk4BmV2LrL7RqKLCMjTablVTe3vL8reTnkxqzx?=
 =?us-ascii?Q?peVxZmlnzfiUx0/iCzLfRDFoWs8a06JqTDSANWaOsnCPXYqNYJmksOq4lTG3?=
 =?us-ascii?Q?8hGxTaCQs8coIQleISTWRt6sU076mw4jjdVpk9RjoSaRk5kEy8R2XzNS0ndE?=
 =?us-ascii?Q?yWx2XGALv7hozPd4k1pEafXmZ6EkRW2KrUrJnOVzdGirzny+8KoYq5yox+fN?=
 =?us-ascii?Q?ctqV0bS7KItWKho141H5Hb98O6j6doWqn1HgvsTi0XAkZgDLXp4qp857vek0?=
 =?us-ascii?Q?0Fo1e4MiIId+bwAtlH2dRakIIHX8JH5JpIkR+Hs+GL5LZ8/SuJjx/hOnVKRA?=
 =?us-ascii?Q?/oQkPiWg5Z9A7q+qS5+2osUN7v0mjGZON3I5DwbaGRXu2tvd69t14o4kLQnk?=
 =?us-ascii?Q?GuDOnb8Kjk1lb1x1HY45yrBacxIut9lqKFtbT4rF7+bCEG63GrMHIBzMrduZ?=
 =?us-ascii?Q?QbEJ44JQX/ubbjzA7D8GCkRacMX3kKOiaysclb7oY0HlhtooXAJZzFApkmRw?=
 =?us-ascii?Q?V2U6XWeX48ifFgGu68oG14QoLnGYQaBYn2zBzrm3YH8JV7T2sT26RHxOYYbM?=
 =?us-ascii?Q?FzyhHgHAW4qt8PmKvvv4CPkXA4DOEOhzIUTr2te7AYRBMhuVEM1vROeSfZ4+?=
 =?us-ascii?Q?kRyOdpDyIJ21D8L/Qt4koQA2v6v5tMwPulWKqSk6FlG89rs7eNxStr49E/II?=
 =?us-ascii?Q?HLbgwBIx/8UmCIJa7FM25i2XA3rRvroGMmHZ5DFYVCTfpqtYpkFqf75NCfPe?=
 =?us-ascii?Q?VQ8JOl7von9+UPqRx00ZURURnEsIZIjTAnw02m0fQpNXcfif4QiNO/bzSJXX?=
 =?us-ascii?Q?pkaWZoJQFOKWalJ3Yu6ijucyJXL8vw6Oo7wd2luw51lXtOz0OiWMRqI3RW+H?=
 =?us-ascii?Q?o6oy6NY9njiTiyVQaO+xI76j3QFdiOMS031lDUbVSzxOEGd/hFjxmGcoKKgr?=
 =?us-ascii?Q?k7wIRrLpf6RBVw1Hm0PbbGJQM8neQ5YeQvq1JPAA8Fxseb+J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f7fdae-4125-4bfc-6f4c-08df39427981
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:36:18.0127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jb9gKzSYM7vAoCray5RTLVdQjhwtMSMoEgtWfTPN+rdULCnYR9rSU4/TzSJYzuZX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749

On Mon, Nov 02, 2026 at 09:19:00PM +0000, Edgecombe, Rick P wrote:
> On Wed, 2026-10-28 at 03:23 +0000, Duan, Zhenzhong wrote:
> > > -----Original Message-----
> > > From: Li, Xiaoyao <xiaoyao.li@intel.com>
> > > Subject: Re: [RFC PATCH 09/15] virt: tdx-guest: Capture the TDI report
> > > during device lock
> > > 
> > > On 9/24/2026 12:10 PM, Zhenzhong Duan wrote:
> > > > Retrieve the Trusted Device Interface report through
> > > > TDCM_OP_GET_TDI_REPORT after binding the device.
> > > > 
> > > > Store the report in the PCI TSM device evidence object and free it
> > > > during device unlock.
> > > 
> > > It doesn't talk about why the report is needed, and why it needs to be
> > > stored in
> > > the evidence object.
> > 
> > The report is used in next patch.
> > 
> > With below patch, I think we don't need to store report it evidence object
> > in next version.
> > 
> > https://lore.kernel.org/all/20261005070252.84810-2-ankita@nvidia.com/
> 
> You don't want the reviewer to have to piece together a puzzle by holding a
> bunch of unresolved things in their head as they read the whole thing. Seems
> like a valid comment to me. But the solution is not always just to add more
> things to the log.
> 
> But I think we are still going to break this series apart into subsections for
> getting x86 acks. Consider what could covered in a subsection coverletter too,
> for designing something with overall reviewability.

I would prefer the arch code only contain enough to do the very low
level interface with the TDX module.

Everything related to SPDM Should live in attestation subsystem, and
we are not likely to be having every arch duplicate the object
"caching" either...

Jason
