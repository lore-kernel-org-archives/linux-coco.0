Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792502027;
	b=H5JAEunYfnGnZ8gNRSA/fmCFtr+ymi1ZH3OmPqpx2jmkc4x4UR2UrXyYcggUdd+pQdcz
	 7RhUA96vt36QdyX1WtXom2ZVK4m6JjC0/n8zBhAxBFbByPf7z9gTMJ62XNhDf8msJp+oS
	 HYMLn2fQAL2/X+tUQs3R1IhHVvu7VsSkX4FzuH94k7kt64HBJ43rnuOmdqQaqkUbdo0a3
	 WgAzN8Z4PTXRLwGwQNrwsm/7UNAVro+N0q7t1yllUSPEml195miLEEiZVjNkVCbFKjiu9
	 n2l+3GK8WXw5ciYJzWDSc7aAYDnGpdK/hNkn1xK7UlF+3HJZEejVcnFUddPR10UU1EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502027;
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
	bh=zpy89fI7mC6mQcy51CcevvqCtHDlhVmZd27QaJ9aCBo=;
	b=E4mzbqPndLGKGn6vFOht2fveNaGptJdq++rS+paVmKevfQ+ps73CyK894SFoT7dBf41P
	 JlUuJW5+v3ww++0FYykFH698R02NBAIU7ApfwqTAnmEzAxeLYWyQw1b6TnWhyHJSr4z2R
	 YvHUQzFY8+UDaqmxSMEOBFkXFnXcxnQYNfI1uKLwaU5b4asDNuJVBGIDuqwX3iSd/39PJ
	 +P8idnZqwfbXjSiHDaWVD13B4CpmTMpRDFtG3vGNZgkRV/BW3ho9NIq84/0FnyTsWQMsj
	 ZBBJZl2Fx6k2a3lw811VBbmFN4e6niZPXrlyk+IqiwBZPnp55+HV6TOh4t3r4IDPWog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qcVw62Q6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.42
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AE606A320
	for <linux-coco@lists.linux.dev>; Tue, 20 Oct 2026 13:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C45AE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qcVw62Q6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DD/XshHy/yMxaMDPRhK3ZRZGTpY/vHkfQBnUWkZmBhr1lrcaHTmhNF+as15ksR7rUol43jYdm9/XMl0sxOlPWX4odcG9uHd8ooA6aEd9x4KREqWDAbY5oJXkONikSfypkQhqXAgRxpBZi2KXjYvkxGkwHsxzNjTyKihLz7Rr0UmFzkI3TM+VoyEy52Qegq0jaET6f9034i/rvMVXMAV+eQLylVreOofF8F6Xc2M2rlJVOFHrDpvhqYKjN5kUrvTkGvTge3XoqO67cbvLRFQtlL6gBohjlIHBMyIUW4+45rljF78MlTwciiiRcJVvzCvnO6zgm8cC8BFWoR3H/5TNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpy89fI7mC6mQcy51CcevvqCtHDlhVmZd27QaJ9aCBo=;
 b=RF57OQWK3AVYgEP7ZXQSl2HdU1HAc+GsdgDTx+76XOCju8sOLuLMCOMi3NL5Q0e0ARgp3vjhubtfV7ovzLlvSUr6OzNZC5WUFnBBv3DZTbzM92U7vY17xPN5XPU4f4JDZS+/6BsryVPsRagjtDICaWmmauVUBT9pDSCl4t4LBSj3t2QlNYSP9JKsyIyXnFDqoTukhSmzXpAtP3Bb4qGF1jMfLgCDtgMlju3UMNp9DgWeu27KKUwxA6Qqy6IYybogxzpeJsWOhBtCuF22S04SpqACYaOkRCyF2RVVAkqTlDB4KY389LYwrYAY8gFb4tr5T+eBCqjkLhdaJQ1ZyK6akA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpy89fI7mC6mQcy51CcevvqCtHDlhVmZd27QaJ9aCBo=;
 b=qcVw62Q6Qy3GjY4WEFF3KEX32CgRID1zL4Xa3SB51NJIZSRSnkDCG/AlCuy35jV87snE71NQKryTE72qkgVV5r0jdcss/C7WR4LZw4j4mNIsBU5DhWQnW9wBy/U+9ZketBH/XYhj/zAOD6Uj5NcSuUHEhzvVl+49l9x0n2MIs9PK4sGfMpTs37N5XTrhdnrmCftdPwJoJ/XsLqR7SD+gfV4RepuNmUzj2J0DZRfX1b4hm85FUnomeP6yL8ELIXIlL64uw9/FWPOXvKMoY/3+DOSCwxsfpy1QxUrveIG271j+Yx1xn/OR1CWOG/DUlj+HPs9Gqdbw5zNH79We1slBSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DM3PR12MB9415.namprd12.prod.outlook.com
 (2603:10b6:8:1ac::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 13:13:38 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 13:13:38 +0000
Date: Tue, 20 Oct 2026 10:13:37 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Dionna Glaze <drdeeglaze@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, aik@amd.com, jpiotrowski@nvidia.com,
	qinkun@google.com, pgonda@google.com, jic23@kernel.org,
	alistair.francis@wdc.com, ankita@nvidia.com, suzuki.poulose@arm.com,
	kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	jarkko@kernel.org
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261020131337.GU13920@nvidia.com>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <31f7f221d7b63732d057abe064e5b23869103600.camel@HansenPartnership.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31f7f221d7b63732d057abe064e5b23869103600.camel@HansenPartnership.com>
X-ClientProxiedBy: MN2PR20CA0055.namprd20.prod.outlook.com
 (2603:10b6:208:235::24) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 7776efc6-a8cd-4b5c-edc0-08df2eabf45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|6133799003|10067099003|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	DJFn4vud4f1IdokZgINtNZq4slLxHSqkcFOy18ccMHIDUBcYVGsieczxRoOe7TWSopRl3dwLLk0ODkvnjGv/1ejduwv7cW7Vb9q/PovjV5AO75lgkvsuuCmA5jl8tXqMrRpTSBvEWhDkthiDTVNsV8mbcq08AyvfWNi8BpHAZh1op+WbQzPqq27xYVUD/2NlWXkfnxoh/Fcr3nXVvfeghrLfSv91vBcnD+cQPzVvdRwsFeKkULHA+Pa58WiIagdzKvKES9ljhb/IXJVzdRevRefTCUw9zIWjncInW08aXGuzjbH1SbvajBLSkS0fOg/sR/bThd0yp4C68WMBP4oYR3RyqQ9OkXpL1v8YrgGF1/hZlPFdWN1r1pkGbLdVqGY/yxaFuD6N5sEyGqxvZY4l4OKFEGvi7kOxLMW+VY4kgsknDupfXX1AEVFNTf9y1R1pTkCdPHDstrNvgaRWG8aDr5KV5sfSB0rqmJ76AnW3bPPOXblxUlGT8iwCBEeh6LOAt70GrAzy5GJb10sPW64M9BCHK+Qm3n2oU76sEznv3fPoBDdA+Wn1bXzZzct9lYoDWxuYoRXIsqJhh6FrrXFsjOc7PUYJ/WYCEUUfsdGGotZd3xVnkLy/PfeOXblKyjd5ywCBqhi7dxcIxuq8OIFFlqA1Vl4BfoGNcdIfJFylHc8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(6133799003)(10067099003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YvvyJ8fkT2tV/YiwqubZNlILBJvHlV4ESEOB0a8DRWjFoqPB3vCxJweeme78?=
 =?us-ascii?Q?DRy1sWExF3KaYqKurEfK+Fg9vcxxJkriCMYY5+bgDokP63YhrYmsKYccimqN?=
 =?us-ascii?Q?GIXbuqZJRs4/Q8GMjtGBIKPuTtN4utuNY6higR9Dtrp7Cyzxufxl6ycDryvw?=
 =?us-ascii?Q?YubTmUzvzi2sT7Jwl7ZYMKZf9Z0Z3qNe1+I33hgX61E0A3KX4jcemvsmYvzT?=
 =?us-ascii?Q?lO1wkQKiWoS6EXnuEECQEhQ6ri4hc7Hvp8ZQIFlYiB1llp+IRNxf3KKiFkin?=
 =?us-ascii?Q?fBwmg6FK5tfyka/01gEYrSZvqyhHbhP/reIzqZOq0CmWQevdEGXSYYY1tK2Z?=
 =?us-ascii?Q?zBDyfW/OmDr6+8wK0F2PuIrV6i1Fzd5CAkCefDB7pxDSlvBDdXAPLtq8ScO8?=
 =?us-ascii?Q?DLmQXFdOUAh4pGr8qnQ94ag/qs/FeTn8Jv+S3miVAg30jGuOYo6F4H1jgFeb?=
 =?us-ascii?Q?ULBUJB2L0nnlnpKcyxPQyr/9AgHIgv0KEtDTPX5wR1wd5pY4xNfTyn/h9NAW?=
 =?us-ascii?Q?/jtHn7Z6KZcB2IsD18aPpQEMsagC4ln+io9PKNqzKMLPFT0JoLCbacjgywS/?=
 =?us-ascii?Q?VLchVCk1NucitiNIXGbROk4xD2V0gmNTOjKKugGMagdZmRSFLbuEZRMXXH6f?=
 =?us-ascii?Q?6giFGxqAU3NOS2zgtVL4UiJgAngXoKPN+QKdThDGw+yPsou7eNDd1LZOCSTS?=
 =?us-ascii?Q?nA179J5puFxHZ0DOIi97Raonb3b90APs4rtSeuN/vGQwHI1BKdr0BOLMutJC?=
 =?us-ascii?Q?KZlUw3CAcGFkOdLPmYEM7hoKEOffiyJfKAqcsriQhIjQM2h9qi6+STbGeuBE?=
 =?us-ascii?Q?zRLImJO3Vglc3761IeCArTZKx3+Y1bgfOZ3ZjeIXJampmyJgF0RXQDLcsNjo?=
 =?us-ascii?Q?+H+GikGAuut9mAeNc63jfAHHKUW6gtV4e4fVKLtxu+gZMYT4ghuJZsqr+q2m?=
 =?us-ascii?Q?NFkYX4wXptFFr1bvCafIUcFlpNOYqqj0fJ6def0dq5GAifM15Z6f8yGX5B4L?=
 =?us-ascii?Q?7Nm/iZkSTGMHHDwgtnpyqdpBkdZ3xKXekHFkCYfLewBV/zTPAjkHW6N3yMH0?=
 =?us-ascii?Q?BTupspdyEhgdeYbG2A4KnoGR8hP61bW5aXm6s5b4NDBO16aTld4liKA1Luu7?=
 =?us-ascii?Q?tfqAH2mCxO7L3LCMMA+QMXDc09WOtnL7BAN9Pxx+3IpoE3rxMUl0ln6loqy5?=
 =?us-ascii?Q?sO/eNgH0CT/HhOMbxYaFglwVvnJV2TS1fPl2Rp8tOANPE6rsdOrW8gUqiMqy?=
 =?us-ascii?Q?5wo4OeB2tyi/JO78m6QKDjb5NWkm2O0kHZmptDmWSw3Xfx2S3/NIRHL5p48M?=
 =?us-ascii?Q?4qFGPWSeYTH9gthXnYkAx/1CduU+rU5KVIyZa5WYoNwi8ibyk9obL7gi1VK0?=
 =?us-ascii?Q?PRNFG4B/NA0aYPYAsPkjm8dKuVo6/YEP99pYwGZ06MxdXRtbG+DBV7nlrknm?=
 =?us-ascii?Q?R/FIRIVgQ+QAPRJJRLzSctY5biTkDTp/U4V4PNPd+RXY6Optlk1h/Wmn2di5?=
 =?us-ascii?Q?yAx9HfuTM8m+YllWMTWZuTHXgoG4K9mmK8JMVnsoDw/fj9VyzPl9uRTOm5WB?=
 =?us-ascii?Q?w6wEwKqBn559YU8dDdugFpshQ2rTnIMSjoBgDd7+d79675fkL67bPFqGg6kf?=
 =?us-ascii?Q?qTBuvNaag+4VvCG3Tan5VHo4RLZ9R67ryt5PR7fv+vUEvhUj7JZkpq4b7fPd?=
 =?us-ascii?Q?W1XPHGn9OFllR2cUSgkBEh6HKbIZAt46g/FDxT68sMsHDuRE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7776efc6-a8cd-4b5c-edc0-08df2eabf45a
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 13:13:38.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVJXuGfSFUR+rmMsIZnaP3im9jhvf5tYtGcN3VMVmUIYhBJUW6YMoLZgn1o4lCSE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

On Tue, Oct 20, 2026 at 08:49:43AM -0400, James Bottomley wrote:
> On Sat, 2026-10-17 at 17:34 -0300, Jason Gunthorpe wrote:
> > On Sat, Oct 17, 2026 at 11:16:07AM -0700, Dionna Glaze wrote:
> > 
> > > > About 3 months ago we started looking simultaneously how to
> > > > support roots of trust (ROT) HW in place of TPM and how to
> > > > respond to the feedback on the netlink proposal for the TSM SPDM.
> > > 
> > > Given that I was tagged on this thread and not that one, I'd
> > > appreciate a pointer to which you mean.
> > 
> > https://lore.kernel.org/all/20260705220819.2472765-2-djbw@kernel.org/
> > 
> > And then later this:
> > 
> > https://lore.kernel.org/all/20260921131911.532d81f4@kernel.org/
> > 
> > Basically: No netlink.
> 
> That may be the local driver for this particular patch set, but the
> conversation about how general a system for tracking attestations
> should be is much older.

Yeah, we went through the same thought process as below with Dan some
months ago. We went a bit further to include SPDM too..

> When this all first started as coco TSM, it
> was very much an Intel only RTMR tracker for TDX.  The arguments for
> adding TPM2 are simple: SEV-SNP doesn't have RTMRs, so if the system
> were to cover non-Intel confidential computing then it would have to
> include TPM because the way SEV-SNP was going with the SVSM was to
> include an enclave protected TPM to do the post launch measurements.
> 
> However, the next observation is that there's really nothing
> Confidential Computing specific about this (it's just exposing
> measurements and log entries) so if it were to be provably general, it
> should also work for the existing TPM logging and attestations of
> measured boot, so it seemed reasonable to add that from the beginning
> to make sure of the generality.
>
> Finally, there are uses for non-repudiable logging even from user space
> (attested build systems for instance, or the use case we had when I was
> at IBM: attested firewall changes) so if the kernel exposed a generic
> system for doing this regardless of underlying technology that would be
> great.
> 
> I get that there are some things that can't be generalised, like the
> form of the signed quote which is highly technology specific, but it
> does look like the logging and extension piece is similar enough to
> admit a unified interface.

Yeah, exactly, I hope for a general API for, eg signed quote, that can
carry an indication what format the quote is in, but otherwise the
quote can be shuttled through systemd-report without really having to
enlighten it about any particular technology.

Like ARM just posted their FIRME token for non-CoCo case. In an ideal
world it should just slot in and be transparently picked up by
systemd.

Thanks,
Jason
