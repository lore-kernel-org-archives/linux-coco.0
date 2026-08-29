Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57161335091
	for <linux-coco@lists.linux.dev>; Sat, 29 Aug 2026 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030819; cv=fail; b=qdkPfLJIqZ7abWpJueaCDWEUM4WKxpyyIsL6XOhSH00eI/B6Q2465b8FgRn2LT5euX9z+R/fRaKDx1J1xgfshBzcCXZ49bBtjj8nov3mSh9nMFR/s4NewTYcUTZMqYiBKYYqAIa/V/4IGOz8EtL3r0MjfiDVwWHXkMN8WwVLeR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030819; c=relaxed/simple;
	bh=4BFtMkZgjRhRe2vJozaOyh+evBh8WH7nvgrK0b+5pTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lZF0K16IgxPGjtg4V08YSYIkzw6utTXz4Rrh8ihMKZrUCdt2BegPTuSMo1Of3PpO9ufNM61lRnHAa6yR0+tbtL/5eLcIwxWMpf3ql9cu5AWrucq0ulk1VpiEWT5J1YBbgw44HiHQ3F1yl9+Yff+n8X8LOCkhiC4/LRKc/4nG59g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DKwyxjV/; arc=fail smtp.client-ip=52.101.56.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DKwyxjV/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qI7bxII65/xEtWCRFLDq2vkh8STk0RYc/N/hkiFQ2JQKRvXVLUs50dijw/Sln452E7oDOwpYyL2q7M9PJazBCkE/stiBhHRU4tUrirBNeBW/QT4nBSj2qKQ592BgEfGmgoMYKzSQEH187Cnci8roG9O2ILXfAvcaQ0ITfQJpXAu9nKlrNorMj//BrxkfCVDpIePBGn4acmgqvfNmBMUf0x3KMm8zPmnGTve1ypMOQ84N5mvyaYrfwkF0kureAzx0IEgi2P5ijNZ0DxWPzq0vbwVtxeJlivOSmoiv+px21gKYoGNbqOi/Jhraz+/79SCbY5NemhKN+poc8xqA64tNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvFpBq6PfC/26tAh+2KK2076K4UaHojSf9h8cRxs3Vs=;
 b=MSEXFF/U8394fbSUalNKEyNLjKiUxTm4sKjC+K6FfVEVmeMwdXtO2uLnww6E1V+qfX0WpLZB8u+ujKDGCIIxiRagZOKdkkzNk+2lu6HiaSQjWZlilJaBe3QJA8XAIKJlDEiRrQMZfqtfWRQIX6ncH6fCgEqyFMdHE9dmZjilMfoeKykHhZj09NIN+8otTBattzns4ql+Fj4R/XMlDEcGrOs2gxtYDXlUVpoCtVeVoQkMoB3BmIekjPy3K0+NqsvnIt1hYOR3Yq+8GXOc2A6z6jxt6dL98/iMtbl6TKbSGGzBCpc8hUc8I8ldaaVsXZlBDWVX0rl0btCrrwv4g2gJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvFpBq6PfC/26tAh+2KK2076K4UaHojSf9h8cRxs3Vs=;
 b=DKwyxjV/CJjZoGj/zuDedcX89bQBop0eTjyEfeHKOS72Q/rhdPQVR7vEnKWt99mTS5xcSix4HGujyvaqgeEwVhFht7vhi7+FR0b0LLH+K7ORrkmaPfuoXXnGy/A5+hYlvk4Nmuz+vSiV/kJvNp/d6j29gUmj6ZJcGVHRoxb6c4syNt/ZGpuoAJXYoVr07vtIPNUGeHcxqX3hhoeLkpwV7Y/QnoE0LbccnHJs2ThqpnhTRainL38k2ru5BbZYZcsNyOAIU33DpaENuh2KvwE5FBwZ4vEYDU/E7V1e7OI1TRAPFEBIwrTYwLesVFMfM57zz/nI22OiLdPxG4A5ZOKY7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sat, 29 Aug
 2026 19:13:33 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 19:13:33 +0000
Date: Sat, 29 Aug 2026 16:13:32 -0300
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
Subject: Re: [PATCH v9 6/7] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260829191332.GD4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-7-aneesh.kumar@kernel.org>
 <178794567780.4159892.17969556982711821646.b4-review@b4>
 <yq5ald9ptpyz.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ald9ptpyz.fsf@kernel.org>
X-ClientProxiedBy: MN2PR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:208:23e::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5a3bf7-2ccb-4542-e069-08df06019e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|6133799003|10067099003|11063799006|3023799007|18002099003|22082099003|4143699003|5023799004;
X-Microsoft-Antispam-Message-Info:
	fdgH/XByh+i3VJ2gXNAE+qwLeO7CYZstECxZa6js+0XzJE2WA2gPxwkLElxiJvbkVU/CBB+zMP/rZ+ontI2/JJTbTfFoDnWU44eh+xASZ3fiqCUMrAWLLx5ikkCBLtinrlWQEPe6WhLTA4RVfC4xm00SaWMIWrTpnODuBatJMeDSceAqgDl2zp6QUPnmjN/v7ZQ2rKe2pLy7KEpmYDeIRnyCQJacZURAy4bgX5atavM3tP6rTd4gG6pGNR/bZav8UCsVrI9Ll5iZbzegEdrJBkkPDtRVFIlJsLbx6JMA+saH+lOlIz1UMstgTddWt1oW6P6oJELu0H/QU7pLm5RU5X+PUtp/Em36t/R2ANR9v43DkfHU3A3LKnxlAVGXGQknmsiawrL6w7wkDjeXLViYsMpmR5p/pXQQLqWUosyKhfGd0HgSSoGRqZyy4nRkOsgz4IBB5HNk4yNaoD2Jyzi3hC8wpp2knKsINbbZQ0nN0qqc21znvAOQKvJ/FyVP98F1radRZxWtniS9WTZmqFd5xaC5OjtIRcnp9WbuDPyVDRUz4BnPimp8AoOUzuOXEOv9jyR7o4v/+P3cX1NlIUBHpO31oqdt3NqBkKnrGcQux8TsrLZNIoVdfz7qYAiC2E2Ga60uBmyQvdEfXc+2rYCEzJhXcFqlb/ByOeBJEvvR+A4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(6133799003)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(4143699003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4VEg1ne8kfAmX6bbHyoS4BHk+Ik+QOAz2lj61707eYeeKkR4tp9H2TsoiX4Y?=
 =?us-ascii?Q?RjJSTFPKA0A9hAreH01tn04uww+JZUjRfLAmg8kXbNKDU7v8un4awlacJLpQ?=
 =?us-ascii?Q?beS/YSlLjoroOWE5HBgPt8gTRK/hT3iBeSmWqnKrzvMCEkrW93Hl147OGe3O?=
 =?us-ascii?Q?TJbS/LSJ9QoXgfIu51id+i99KyN9NA+1itiMfQ0RrwoG+j+vFPUwC2hgV+/U?=
 =?us-ascii?Q?RtgyZBE7SfPC3OaYhuvsrXpcnRF9Q2IuFWOEzF0Tgxz+nN/onh2hkqPz431K?=
 =?us-ascii?Q?LtwxIgE4TMvzoHnoMwH31Os5l0oer6MCb0sHNJXhPgUHqpFgWU8ztYQjc0Ln?=
 =?us-ascii?Q?dgJ8xGvmhnb5pgpfhNq36IX7nok/rndd/SK3fvIjPSwlsMukZyaS/Mer5mFX?=
 =?us-ascii?Q?fvzIVA1LHmTTvQkWWiCAigrh8CyF4Z6ClYtZlGOCNKXw5SpdAG/CiNIExlki?=
 =?us-ascii?Q?PQWf+CMYqFE05HVc/GUXr7wqw42iL6e7IeDmyZqIs1zJAO1bSzGEyX9ulYMz?=
 =?us-ascii?Q?OEI2ygpWFpyfPsd1U0vIBJjJfcnBJnnsOPUnX0gtt26PEiXyMpoRudMhTUEC?=
 =?us-ascii?Q?I+asAVseKjrG9YlRwf5mhaHp9k7fMpFSAPY+ssq7MjauXXolOe8eu8pfbK/+?=
 =?us-ascii?Q?UUId3mk6Y2vbl4nwvY1+bUnBJaMmMJfL0Sf3nK1lo3W8dpkzQQcTH9ZjUQ2C?=
 =?us-ascii?Q?UNx8QKq8ALQqsf3yNpWlzre2YmA6J6yEAeBclfGIQNx1MTVfGR/TohUg32Bg?=
 =?us-ascii?Q?FSQyGJNoCFLlq+dZ9IOnqKqTnsNwe4AakpVtC7hUmahVJPA74CAxR9rS04wt?=
 =?us-ascii?Q?Qb4Qr25DXbOLMJgqJmddZA95gHlMslNkJ/g/5ONMyBeTSkwfnXQoqz3GiTo8?=
 =?us-ascii?Q?eAU92AfpJ7/2v9vjMZh5uO3QojVxk4LwhqZUdr8BgylJNHQnYKEF5tKsnxGU?=
 =?us-ascii?Q?oH2nESpy62U8HYVeJYYbzIaCHNKpIuG7wN5RAHFjfMDjGWUNNXc2kAfGdt0u?=
 =?us-ascii?Q?Mx/OoOCp0u/DbubFxiaPwR+DTisPSPM+/YzMdM59L7D4SPEDaXe30qHMa13B?=
 =?us-ascii?Q?Hj1NKTOxQhwyQ6aqeDk7D0sTrG3EJLjPlTu22TLMJWYrgLsfnF9+skXH57bF?=
 =?us-ascii?Q?tK3I2+N5n1OpWFnT3CtyG1LUWQG77G6denIulBx3UJy2pMnP+vQhzFCBNKgH?=
 =?us-ascii?Q?0qyf0youfpdpSQh+e5d+9tZgOYfohxparB0uvxJ7cptjBL8wjMvJbny5h4vB?=
 =?us-ascii?Q?cwVNr7bpSlfYFZm/AsKnYTHc3FmvSH4wnFCGaq3vdttaCNcEWxWUvdtj9shw?=
 =?us-ascii?Q?NviTDH5WWR3wu9JaTI/f3QXoboOd80sej8CxldqqLRhRMWiWUgc/+SaZ6Z4V?=
 =?us-ascii?Q?IStcH5VS3WT7XYB9TnjUUgXryE73hQDf2W/dt88pBdRu8E/npdoeNqtMi/2N?=
 =?us-ascii?Q?wzzyicUUs83N3sKq2bpODt0qrJQTW+tGz7689ZycBJYFL0rGQjKi/talgzfz?=
 =?us-ascii?Q?mAMPcdWtqoSdev+5DcmuG1qUXqOLEd56fzz7vEQjZXysi2ane4GcErQalwny?=
 =?us-ascii?Q?sn1hjPCf1jar6RteMoq9cIsevPF4mozIGFhUQfkKJUHz03J/Opx/Us5FdY6H?=
 =?us-ascii?Q?OUfi1tEBcGz7Il2UcPVjJc99tyUU9EFujNwUrtBo6Kdoi5YF5YnaB25PGOwX?=
 =?us-ascii?Q?w5NBuKpdtFU7m+M0XE5IDDCHXTrrwJL9KrkE2Wi2m76Y4hoH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5a3bf7-2ccb-4542-e069-08df06019e39
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 19:13:33.0560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/oSNt6t820v1aHB3O05QeBDTyCLvi95PaLA5C3PE0EoNdZp7Z0+PKn9ndjPTEyU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941

On Sat, Aug 29, 2026 at 11:42:20AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> >> [ ... 43 lines skipped ... ]
> >> @@ -94,6 +95,12 @@ static const struct smccc_device_info smccc_devices[] __initconst = {
> >>  		.requires_smc   = false,
> >>  		.device_name    = "arm-smccc-trng",
> >>  	},
> >> +
> >> +	{
> >> +		.func_id        = SMC_RSI_ABI_VERSION,
> >  [Severity: High]
> >  Does this new entry cause uninitialized registers to be passed to the
> >  firmware?
> >
> >  Looking at smccc_probe_smccc_device():
> >
> >  	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> >
> >  The invocation only passes the func_id, leaving r1 uninitialized. Since the
> >  SMC_RSI_ABI_VERSION ABI requires r1 to hold the requested version parameter,
> >  does this leak uninitialized kernel register state to the firmware and pass
> >  a garbage ABI version?
> >
> 
> Yes. This even can result in error return from firmware like
> 
> [   rmm ] SMC_RMI_VERSION                   6 > RMI_RMI_ERROR_INPUT

Yeah, it strikes me that the RSI handshake is quite a different
discovery protocol than the rng. That's unfortunate that it isn't
standardized for this bus design. Still it shouldn't be a big deal for
this code to deal with it, but unfortunate.
 
> >> -	return ret;
> >> +	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
> >> +				       NULL);
> >> +	if (ret < 0) {
> >
> > Can just make unregister the remove function. Don't need to use devm
> > for everything.
> >
> 
> IIUC, you are suggesting to do the below?
> 
> static void cca_tsm_remove(struct arm_smccc_device *sdev)
> {
>         tsm_report_unregister(&arm_cca_tsm_report_ops);
> }
> 
> static struct arm_smccc_driver cca_tsm_driver = {
>         .driver_name = "arm_cca_tsm",
>         .probe = cca_tsm_probe,
>         .remove = cca_tsm_remove,
>         ...

Yeah

Jason
