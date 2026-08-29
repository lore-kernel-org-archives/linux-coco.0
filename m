Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012008.outbound.protection.outlook.com [40.93.195.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277BB39C636
	for <linux-coco@lists.linux.dev>; Sat, 29 Aug 2026 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030709; cv=fail; b=g6tWzXrK0GEpE1BOfY4LzIgEib5/Uer8rizFpYxUpvZQdMlXCLAxbhMSfauy/lXNQuLH7T3xlRxMRgqdqdaEd2M+zYKYl49FSXIPIkWkFCvotldnT366nMCoKuj1ty0du43sCTH/GFgQsMcOfs4E5Ox6jZzDYsCVYASLaz+Bioo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030709; c=relaxed/simple;
	bh=uv118/ZkDwTYah6ErmPsM6kgqAdtrxfwqiuHyQiQ9/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ifPR6IKuqxpcTMVSkhTSbSnBAsSG18xxa2vElbnhPKys++zDu4jJq24X9H0fJb/rlevZLpr8kwPEK+6+ZeVUDU9ujg0kkfPs5s7IEMXPZ3s4WJHnHXd0zNzwN5CvYZUV0fxkDYz6IpxSW4FWpGUtaKYxs6y9TZrgZqhp0FOdc68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bvUmJ7uJ; arc=fail smtp.client-ip=40.93.195.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bvUmJ7uJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiNWaGTxYMTDYUphqd+6J6rttE+QAKigR2D2Z4cMoE4zT+lac5DGg3fYDYflRwV/I/WDl7u8n95F6F0F9V2bxRkicZPwqcj1IDtFln4jpMW8gMi2+2pysmCFpNhm6vm5344V+V9Qfw26mwuYsyTXLb066YKaiMViofQUzm64faSd3dtScJAm5Qd6eHHEdHhI/ciSDqit/9WG4VZpsXhTbZQuoEj4/4W7k6HSNOwsrN6Fgc88YIVCiAuMy3L7+FuTUZV8+12buteZ50ZX5ehe5MfmkAwGr5BUdGCXh8caJw2n0keIsGYi/S8Jgf+V/kFk833nC7Bt7kwY4NnkV+TqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlpoTb/eAt1tihO1Q37efi/h51Atwx+vbffx+Y4rJj0=;
 b=x20LlC+oEpVUkn7tNhXgonrNiBCcQyU8H69Yp89Ie7B0JU8BMAk0YYfp/cTPh/22PszbaPvnKJ9vKthLIHsG1jmB5E11wg0WiZ77OwNPi8T19FRggMSNGCpFR5SMrWfCoj72Phm6wA9OMZ03tEq8BitBC2E6ngQ8YRlss8rrFrDW4e06duqp4Ilmy0Y/mfgswIUtEC/uCwCarJVZ6FxVY1Udfnn8nAcnMqkISYqy/E5R6+NHGYGxjEz0KAj/MnSgw1Dr3ZFEUzxWkSpMBZjTTPUQJSaqkD9MPdbLvD3kGG2aU5IpJfn8szoWrElKbWCmJ+2ZWGZJJ83VcnN0OmZJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlpoTb/eAt1tihO1Q37efi/h51Atwx+vbffx+Y4rJj0=;
 b=bvUmJ7uJX9o/jQkSsxHMfnbfvGtKsFkvsPkIwGkk6sBHfXXovzeV1luEgkdlhquo+CkCakeeOZRRBX08wtxW/nXMizgYmPs8RdZUSOR203zLWVXv+mCleqkNZCw2jqhpcnHf4TQOvV463QfyPAIKS0FT8lvMvxfEYrBHlAi1p2Qq41CeU2O7a2zNya4Gur6MmMOYzIOnRe7218N1T/4ggAQqV4XEEkUeEPbwVXSmttdhIossMMYzzSGIUhS7/cVBH/dX/Hix6w5aBr0hGzG7/iL1WGg429amqva0fYdE+FhT1QDmkUgyUsLONqFxjq1wLreAJ1tu+t9IObu/XjgQGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY8PR12MB7243.namprd12.prod.outlook.com (2603:10b6:930:58::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 19:11:44 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 19:11:44 +0000
Date: Sat, 29 Aug 2026 16:11:43 -0300
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
Subject: Re: [PATCH v9 2/7] firmware: hwrng: arm_smccc_trng: Register as an
 SMCCC device
Message-ID: <20260829191143.GC4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-3-aneesh.kumar@kernel.org>
 <178794567779.4159892.8570190086048719424.b4-review@b4>
 <yq5atsodtqt5.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsodtqt5.fsf@kernel.org>
X-ClientProxiedBy: YT4P288CA0048.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY8PR12MB7243:EE_
X-MS-Office365-Filtering-Correlation-Id: dd32af51-c32e-4a4b-f04c-08df06015d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|22082099003|18002099003|56012099006|3023799007|10067099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	k8WRHBWdndmZJ0KX9tlWHTY8vVstHbzqlNXwfBKgj2+nPKT3QfTeHE79VxAjxXn/zgGOqhWQD4S9kgTqf+ahbyaKs57jnW2LwVEAAeHVAVfZl+rxm9eCk6BMqkjOjm31lAgWqp2TSmk4YbcCcZZBSbLeEA0Hogv6VyTn+PQJXkes5KPNHuTal71N1LOPrK8+7/G2jSrG+r3eHJszqND0qXakOID/jqRylqom9+Sooo1K/xfD3NPbxtZoeZvg3Bs2WYcnL8AOJrZk3Z1v5fIn8e3RbP6XfnfqP/3eHJ/r39DudveNTIOvUSRWzzIkRyAdk7G+rW3j+ItbbSji66SGwEfMoYHfcNNcSeLVWZ2J+Ypy0UJZSRHfhVJjecYOJKUsAJpHZ6e215RkoMLOO/d4LPZfZTnYGrL9pYAzVbL/n2C7ZI+FjyFlgVlpD+eaT8nktfuo2JXE/SJk8naNg/DrbKe7IsoRF0TyeVYkTsKj2RY4BorNl12yDfkFLb2hdbeQ7cPQkf7ix04QuUhI3Bp0PA0tJ4m7Gzgblgz7G31Scuz/dXoMiEPbqwwZfWwwA/2gKFK+uqKAp+gGIljSJqQmNELwCzlkNgxOvufQdORqN6kPbKTny4XDtcUDouxnRs2dEG8iKxrBw6KAlJv4tuHxri9QKeQtumybei2Jx7515kw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(3023799007)(10067099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xG8f1rqEWa8Hokhmi3a9uZd51erDFU5Czzuyri1BpmkqrQBTV8+ywPs+IIJ3?=
 =?us-ascii?Q?DuyhJhzaMVZFHBQMGyLcO7uthvBh77DA2KJXkUSCHYCXLsfLeC9K0H+1c+Vi?=
 =?us-ascii?Q?mQFjaAdzU0Z3U45kaO5r4VTEJWh+WwHQxk235L3UuYgcLZpu0Wdj86dLzDdl?=
 =?us-ascii?Q?5mUaHVjvBz7PLA9/AA9KA/tiGk4PbxFuYlGDSLIkulJfmd5JEwtd95zlvUMC?=
 =?us-ascii?Q?Z0lHkn+NP0WJrx6QdOmz//9zOPpZ5cDywZCCFYXy2UUPloWqixuwNQGXJc9e?=
 =?us-ascii?Q?e/VmOXPtysPsfGaI3ppw75gvzCv9digSWCuX5GJL1g4Blij7T5FmR7IOT6Q8?=
 =?us-ascii?Q?xSPgOT4HFUBqDeWruCzzmUBbAtQip/ojneQvFo2Ocm6kn+W+FdKXZsD/ZdOc?=
 =?us-ascii?Q?5lXKtHez+aRMnzvG1s6DymYbCZ7Kz+qyGn4wY14ugBUy1FcSFXsRLp61vu3L?=
 =?us-ascii?Q?5yGT/dZoVIywAfKwze6BAP0NxH9CBBh2Htlzd5oLejKh3sTSyz0fCl/HVOco?=
 =?us-ascii?Q?yiMHQ0nmZ3AcSJ5sGI0GQ59mhmB1a6USu2h/8PQVKJyTtwJiTe8CBlCgXMWP?=
 =?us-ascii?Q?UBbdqH8WKzJCrL1e9zfYNguoojj/p4kuSVwu0MYyaiAMr94uj4svSVezHzZD?=
 =?us-ascii?Q?4QvrVtA2zhtOhCk8MIMRgamqQQt9Yx5OzWJEc/ALsWrKWSUMwanF5QxJAyUs?=
 =?us-ascii?Q?XdITmqDxQIVwryMlEMRNfNnrokzFlwcxAv6eeIhq/tEYvmeIiGCDNbSgVU1J?=
 =?us-ascii?Q?wuWProavpV+T2XfLzw94HWX85nceijf5rV4jn2H8o1VA277KAX0Bj+d2k2+1?=
 =?us-ascii?Q?cGz6v1dJuKya8V0o+ypUIZ5xfFatjFvSDLD4nqtBMCysJ5eNzCu+TmtQw1W4?=
 =?us-ascii?Q?K3bQeh8+TNzpEjsUNTWl1v/E4mpUu3PjEDt5FdzZHibPFSue0Z8j4G9jMPsP?=
 =?us-ascii?Q?qObO1VUdoa+dseXBacVol2XaqzE9RoUitKRG5YA6SON8sI0nZZD8+bX7U1sz?=
 =?us-ascii?Q?PrsPCHdqrOZwmI1ZqlxBbBplN8hLADw5txkznXvTXjrZLDio6hfOIhkn/FlW?=
 =?us-ascii?Q?PXa767JjiDgH1qpX/noCtvFs8r/+8Eq9otunfAogsqzABjJXV4zM2SYEN6cy?=
 =?us-ascii?Q?EVQTi+SSEVFzoKrF3nWvi/uemj/rC+W6FjrpnVfBIzy2EBkwI+OKGEFFNQHk?=
 =?us-ascii?Q?wIsH8yHchj+KBkpDunvDiVf0HNVGxmCEKbuGzf9EBf5iuClGE9yjWSuQYEM8?=
 =?us-ascii?Q?2rQF0o4Mvmx7OHePf8cAL6rpF9sBW9U65OuL8j2Yj0Ryj/T4qIQg7iO3bGBB?=
 =?us-ascii?Q?nwTZr5thYqvGxSBon7JGmfQ549S/AQe7QbHBBuPxTZRJA6oYHHxjN+FssKmr?=
 =?us-ascii?Q?xMo+LZn3GeBme2S+uftvmEwB2aeUnISywETxU7i0voKQDaAF3kjSAkc+w4ua?=
 =?us-ascii?Q?zJC7FxlKyiP6A3AJne/yEDdkbJU+F2d30ZPyQ2AcXKlAssWnlDREh8Vuc36f?=
 =?us-ascii?Q?DvXTZwq3e1wBAEXI2yBLKCnDoLAvH7/uCYBDT5IgxRDObj5L69nBpHwcHt9g?=
 =?us-ascii?Q?K4o2fGDD3XFetOQZcUrv4aPCqZcjvcQZvyfdHt+kVd/6HJ1XG8KNhzTIrjX5?=
 =?us-ascii?Q?xRLQqpaMkBPOKI0AFQ0joBgG5FWm3JJD7A108VNhln0c8KZ5gvQzn2LpUQmY?=
 =?us-ascii?Q?uCsE49nJ3Jkk1v0NxDlpSE6N1sM5qGKGFkj4JOKda7aXiM6W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd32af51-c32e-4a4b-f04c-08df06015d8d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 19:11:44.5244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE2Ivt31/8+MkyZKWzfLrfBIE3NAAkN9c1qSxmdh292kWnv8q3P+3l0VoK3aaUcr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7243

On Sat, Aug 29, 2026 at 11:24:14AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> >> [ ... 58 lines skipped ... ]
> >> @@ -94,29 +96,37 @@ static int smccc_trng_read(struct hwrng *rng, void *data, size_t max, bool wait)
> >>  	return copied;
> >>  }
> >>  
> >> -static int smccc_trng_probe(struct platform_device *pdev)
> >> +static int smccc_trng_probe(struct arm_smccc_device *sdev)
> >>  {
> >>  	struct hwrng *trng;
> >>  
> >> -	trng = devm_kzalloc(&pdev->dev, sizeof(*trng), GFP_KERNEL);
> >> +	/* validate the minimum version requirement */
> >> +	if (!smccc_probe_trng())
> >> +		return -ENODEV;
> >
> > It feels like slightly poor practice to do this.. It is doing three
> > things:
> >
> > 1) ARM32 disables this entirely for some reason, shouldn't the bus do
> >    it? Maybe it already does?
> >
> 
> Why? The bus only checks whether the firmware function is supported and
> creates the device if it is. Further validation should be the driver's
> responsibility, shouldn't it?

I assume the reason is because the SMCCC call can't work at all on
ARM64? Like sashiko suggested perhaps? If so that is definately bus
code responsibility to filter out uncallable SMCCC's.

> > 3) Checks the version number
> >
> > Maybe the bus should capture the version output and pass it in as an
> > argument to probe so the driver can do the min version check directly?
> 
> One of the earlier discussions suggested that the bus should only check
> whether the function ID is supported, rather than checking for an
> expected version or anything similar. 

I'm not sure about that. If the versions are actually so different
that you want different drivers then having -v1/-v2 in the device
match is a reasonable design. ARM has made major ABI breakages before
like RMM v1/v2 that could motivate a two driver design like that.

> The other alternative discussed was a device-specific callback that
> would perform additional validation and create the device only when
> those conditions were met. It was dropped in favor of the simpler bus
> code above.

I wouldn't do that.. If the API allows capturing generically the
suported version then it could be passed in so it doesn't have to be
queried again. And maybe it could be used in a match someday if
necessary.

But it is no big deal, something to think about.

Jason
