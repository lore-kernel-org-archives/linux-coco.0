Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010032.outbound.protection.outlook.com [52.101.85.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CFA33BBC5
	for <linux-coco@lists.linux.dev>; Sat, 29 Aug 2026 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030447; cv=fail; b=alWyrakT9wzTNv1GH97YpGOrqGaCEaDo5BQ/mXHrLwRgntSG4JZC3jyD+uGjWT9SlgwdKB9iEt4onkMsfPKLnrDwjfoupkBzPzLBXSEj59arOYZLxIaFgeOHgKZTJabrBcTh8kh6yj0Wo+hjhUMQbkZC/iz8jjPjdV8Uj60EXxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030447; c=relaxed/simple;
	bh=amc4a2jHhsa9Y0V7Q44cxri++1sX+TdXYqvVTSrEno0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tf3xwzCyCetP6/uh/gAkG6vHKymN2zOf5XXEk3Q7KjCRfVj0R/STqZGlxwm7wRa2B5UlSVLODdEw4hi3iwE6ZVxhjH1QPq0HgqbhIexZQQ1ZiY0f3l8L3O0So8SEfeWSiQZU4PDyQNlYKfNZS1jhByWOCW6jyhYFIpeiw83INUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fijb0GcG; arc=fail smtp.client-ip=52.101.85.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fijb0GcG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxLhf5RQbuwu1XgY2D6ErCU0BFL03j/GgA8tZux82tJftpYO89OOhT6tUiLVezYu3wfCjoS3FeZAO01RpX3ug/jNdugjsL6T5hWqefg6jIk62W8Q92HxeXjuo/aOenv4V24VgW31qLYFnhyvIkMla0OqweDnxfj+52dRjKHT1ntgbkxvyEeMmbiCXwxspIVgHJvkFCH7jCWoK+59jXo9fvPbGPaririILM6CrX4A58b3IXIUFeiyBY3YbWB3Y+NTNO7GQiaam4hgy7H1m/pgQGrwD6qa8lyUB06x7T/BKK92yM5gqQ77ehMwwSNF/gfsxn3E0OkkuWTI7QNlxTsc3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUujOTCCiPZzGIdAiK0obdhkWg/+mVrVpC2dh9RYlpI=;
 b=u93BM20uY3TckJSrXHnClhTe9QEfg3o629IueF2bq5BgvUaadFCYwEAHzh0ln/IrE6Uhv0JJbWcTWuapSIGCt/JJfeNY+2BnVmaKG6NcTGpzUxxyoZsl4mckPA/UIka5/5BTV4oeNPEP5eoB92ZrJu/m+6bqQA7shkWGLEFpJiRdiY7eXeL1oKZ/hgTVjLrAKufuwiFARSF+v9nrSk7z+1uRTudoebwYIiob9rqEVdXwNuHF0D2/ObepXdkK1zTjkU/mNASojl9+EG6sEoPICHJcTopd3NXm6k/O7WHhAJ5J78h5qEDhtvWdyyDJ8j4P0y+G1P5NmYzVTtIyQ6K4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUujOTCCiPZzGIdAiK0obdhkWg/+mVrVpC2dh9RYlpI=;
 b=fijb0GcGfHjpIdNwKTMfnjrT9nuzWRiuPQrCd4F/qSUL0p7Hz1lox2XCP45LCdFCwk8dijxlo/vc85GSKCny9/qaGE/LwaJJHQpTK2x9+63D0DAVv4cIesSNg+JLwDYu/xgFMZJ1X9XLYVacIRTN5XRfx/VPRrbAXONYZDFhp/hzVCcprCWC2ITnBX88mYIfMxu+Q6eM1i1Xv4DGIuZvOQ6LDhlK5RQ5sb80SVbMGcW6FQ1AqRDPgCqmcN8O73s0jnqqeXweht7aPoi474p456RYrG0hHtxWwb64vfHIhvyiobgwxTEyW8VlWKI9I80sRq4O6wffwhMo4jXn+tvVbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 19:07:22 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 19:07:21 +0000
Date: Sat, 29 Aug 2026 16:07:20 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260829190720.GB4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-6-aneesh.kumar@kernel.org>
 <178794567779.4159892.13554089762527571548.b4-review@b4>
 <yq5ao6eltqfk.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ao6eltqfk.fsf@kernel.org>
X-ClientProxiedBy: MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10)
 To LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d50eaf7-9f29-4d5c-e10b-08df0600c09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	ri1AVhJbWLzaFsSPgwicabm1VZXc7BcW77aE7tNr14QBYWEuFdS5yNu8lVecQY0t92rOxM9FhmeAaujOcnxcNGRCqYMUpEbxW0UeWj2vBLhocTrxYH/eSef2a4IcD4dwx5vQ0O2RIN0DcOFkFGmQUrkV0+m9wFtf2QuxZVN5TFt424q31DEaMB9uNUwFNI7YwbPFGqbCEqrPec9XD0DRi+bN/xxKzEfSAXnN9alMivCf3upN18VitcMDPgeYg8wlEbfP7L/gcctn7ZcYRT4ppESngcPnkE7bq0tvLaaoQfqmRadhGk7lua/gX/AnOqPeXQCzvpnZZeVtSAcxq0tdWUQFpBHUTIvbs5nBjNhvGZzkw3xkBzHFeOscaFS6WsDqvXDyKS8TK1i5gTlu1B0mSAhlxdf+xOzumPqPaochm6V/8WKP03O6mbwOd8nQyDXrxPGdkMD4xip8EwjN20kCtFumXz9T6I43CMX2Lugnh8TF/JwoDD2Tnmyw9rpiT3Dpw0O+HxKfXBYsxRG5K/R7fc/R/Z1F7tNRnjSuRsXNesqPLF8m6tkYY5VobxlTVF8Inx8nyco9stnO/S9YrF5uydh+ClurYTp3CS7hJCbaqDxywf05XEpYusOw9zCxvj9BXzlw7+l5KL+YqcJud/wnNykJIegepLy/ltK0pG5cH/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X2puP6WjcTud9voUx7HWMQpds66xtaDesa/Op3+7/xYUkogKkylfzwLCW/mn?=
 =?us-ascii?Q?N7lWSItyGRYpUqHGqBqcWo+JaziMCB/KZI2zD/dMnNjBJTqzKb8pcbx7lOGV?=
 =?us-ascii?Q?ZVOz5BPO6mdDRQw99lr6RVE2jopaKYQ4vNcVBGt+VgepaVc4JYpH/Y+NckDz?=
 =?us-ascii?Q?WZSG1KtphxzxMzmUeGrmULp/J47DyPcyMtrIt3xxZQRmCyojOCSK2SXZyfna?=
 =?us-ascii?Q?2fyjp4km3VSek+pRaTAJkFbJHcI3u7YDH/HPuO2StZXC2PY8eOp11u/+nEUV?=
 =?us-ascii?Q?8Lz0N11v9CnewhJmHbZACqiC3ncAk5W0JpfENeRU5f5K+L38IUj6HgzFo8iQ?=
 =?us-ascii?Q?KKzBK9acKh6+OT5vHC7B92nUqomZZQLtcV4SSPFrn/EYQv1nkNpd81gveY0u?=
 =?us-ascii?Q?veukeE/y4tPfcO4HD6Y+ZJA9D/2Jzgw9YaNmRxaClyaLlObRq9j4gn3pFfPY?=
 =?us-ascii?Q?8uPevW0+IMKhc3GK3ZgRNzzs2GoxYsv+dZiVoawZHriGWT8j8sye73Rqs9DA?=
 =?us-ascii?Q?k2Qh4VNm8lxQwdbYW9btWV0iGgMs7iIJuTRVwC8nCBzU/xa+D1vFJ5jljNe9?=
 =?us-ascii?Q?8vGAxlvwPRIx9i7js4anuGOYLTQNuplfYQDo9sf+2ZRRrTchdEoZzaO+F4FX?=
 =?us-ascii?Q?AUPEQoF2blEWexI9rWKwK5LMF4dbxl9WTptP4DAChftNgbvzIUeoGbo6viAb?=
 =?us-ascii?Q?mlFYKFxkwhosKkA57YjQEaHHQOVc57DiEb5wXW5BALZodnVn7hEeG5YXmrp4?=
 =?us-ascii?Q?hTwHYFb+YrDsCNVCHinolNpRYtMn+DIcDtvY7q6PS/f29RpGdjU8DAvkTxWh?=
 =?us-ascii?Q?Fhh7B+1/SftoMHNKpgGIuCSqXwxWZV2vuBUAs3/CDq0GmRLda3smw3BxQtkZ?=
 =?us-ascii?Q?NJWsGGRC8piJlopR+bI+2rFL8UFU87nz/xxoDU3VLd9Xlc1hlQXA4UDSab5y?=
 =?us-ascii?Q?4fUmmje8QTaCsyAuw5lDoZy0ece/bhQRwTBMaldT/4lXpfAQ1H4hrHUY7mgb?=
 =?us-ascii?Q?NOn5JIax0icL8ATwwf5xq1NeT87wefY1ne7+BBZkPNEbnKfT/N8RgvQZ1HV7?=
 =?us-ascii?Q?mg65K8JuePcSJcWhGB8kmMX1yxkFJzjdFqkg/2R47PtQYfhCSAzsaSy95+ku?=
 =?us-ascii?Q?Hl5qFuJLafLrQejnWtQNqD6y/cNbfAyY9koxs8DTwwodVjFD3LOcnUCuif94?=
 =?us-ascii?Q?WbwAVv+/z27lVeDCPOWAfv2GeFXiEzURFKlzDhqFGMu3I2hEj/goQ4rtK5WA?=
 =?us-ascii?Q?RNdpBTBq9S7/waBdLPSGZBhqK8KAG8Ok7n1n+9xw2q9/HegIVttiKwG71+OX?=
 =?us-ascii?Q?2jD2KbwvIvV9dr4LWHYD36BNr8HCmxbn3atUXyU88mGLSDXoUtIDbr2yIG6S?=
 =?us-ascii?Q?r0H4dR9ClapBR4Ks5RSwaC/nl51KONfBwTol+NinSoWQxgucTatbF0cIG2CU?=
 =?us-ascii?Q?4JwjSh9iWA8Yy2UApEPWbTEFdCRBRWIGmp0TbZke414uzB0fAyrUe9+j3QDW?=
 =?us-ascii?Q?67PCPvaNspOUi8socvwHxsiQn8kMl06SpaBcTRovXzfUt1aEq4OKf92p3ae1?=
 =?us-ascii?Q?9YhrbeXHi8dZr15U+xCMwdD1teHmZMkRHkTcLea89eCe3LL7sPPdNN6YXA5F?=
 =?us-ascii?Q?i0avr9XlpVWGZGTVFKZstKtfZJBjcBkN+xVnEt/+Y3YyZ33Yo3OMOgMVdsxI?=
 =?us-ascii?Q?OvYRc/xaPRm5kZ6e5fR7LS+vVHPr9ICalXO07fNG81k6nsZg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d50eaf7-9f29-4d5c-e10b-08df0600c09e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 19:07:21.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sp12pos9RqbmcQDVryCaDUZZe0oCtafRkgLew1HpcZWAMWo4yZzBcbfumqfEEOuI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243

On Sat, Aug 29, 2026 at 11:32:23AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> >> The Arm CCA guest driver currently only implements TSM report support, but
> >> follow-up changes will add more TSM-related functionality to the same
> >> module.
> >> 
> >> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
> >> arm-cca-guest module. This leaves room for the module to grow additional
> >> source files.
> >
> > That's pretty confusing, the module is called arm-cc-guest.ko but it
> > has host items too?
> >
> > I would have more expected the module to be named arm-cca and this
> > file to be guest and a future file to be host or something like that?
> >
> > It is annoying to change module names but we do it, and I think it
> > should be no problem in this case since there are no users..
> >
> > But maybe this patch should be in another series..
> >
> 
> We have two modules, arm-cca-guest.ko and arm-cca-host.ko, located in
> their respective directories:
> 
> drivers/virt/coco/arm-cca-guest/
> drivers/virt/coco/arm-cca-host/
> 
> They also have separate Kconfig symbols, ARM_CCA_GUEST and ARM_CCA_HOST.

So this is about renaming the .c file so you can have a multi .c file
module then? The usual kbuild problem. I'd call it guest-main or
similar. Linus has disliked suttering the directory name into the file
name in the past

Jason
