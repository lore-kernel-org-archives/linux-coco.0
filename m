Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C754854EC
	for <linux-coco@lists.linux.dev>; Mon, 14 Sep 2026 22:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789424927; cv=fail; b=jy8aCZvqiaILIR5UNWxBOhTazZVTUGPE2Nh7Sj5RkjMt9qGJPAKJjB86BCKt/QbDLlVKqvIZCJSHlFZ2rClOPmr9M86LYotrSSHjrzEc984GeuC1kCbsn7QtjMRj2SYFFjez4tiDFh+mwxLXIXWDg60/WORRTy5LYwX9FVrkBOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789424927; c=relaxed/simple;
	bh=HCljXYdZpL4rKsAjtzhXsyR4nNFW5OYhjx6r+7R1VMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XIULdP7nXAHt8nLo7FmKM1BCupYEoX2WrsRm1k2OrMvnnGbqejmCiICHzfYs1xeVYbNqKK4NeBJRMvkGmCMg4yASXX8A/kb6Rh1gTJAvfodLRCjFyIyOjzSrUmphKHNszLhlihAhM9FdIlnPoQjautHOdgl5jFwlheXOMkMM9ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AImkHJKU; arc=fail smtp.client-ip=52.101.57.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AImkHJKU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HNLdeyVDXvsFi1bwBrYav0mGmxtMbjQv5WOt692vC37H0x31AnUi1lX9FsUdkEPAGmKwWjnilQiunXPowdVQjmnA9fYwwJ5fxuxhU4zueooldJ4i31nmHR4SwWiA6Wwlf9gbfyo4WmVqiNGmtYyFhrnptfXLY5vKFmU67n9wXA54ys85Erv9SzCibdy82d39QJijMS9BTKyC+0qKZminwyJ4dO8dy2tdxFqXrQczV+yGBj1DTOpqGxtbrcZD+pQG+C6fYZJO8McW6Ukpt45YRW6n348Zz/CBcs0RNgUOjqUOCjE3YeZpRNl3+0anVwzj6T8GEccWUVQAHZpMAoxmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BO+nbHSwrA02c1j3fvUwjIXr+2X/OQXfqmxgnArEusA=;
 b=DKkxR9i6puetiirqrQLnDFn1G0KDi+b3+pJpKgWtpAZZME/KJtMyid5nCeYDNkr80++yhAqj3usXvNSMrZ/IrX22AsPuUo316q6CyocXffxTBg16jyF/F/bSg+yLkAGDrcf0OOvdsIK3clnyhrJmmrkBVOhaIIJRU7N9lmjhvSqKbR4UEoasyHUoPFs5pLbHQ8QCxESCXV4HZy40OBNswXUSgMsxSq2QiEj3CXg94jZUzJkR0oaQsFWjzk/ybeKsT9uWhuMqV5hFxyGD/jGzwX+au0HsOJpd+GbjtpFPIgyMnEhvsGgRLl3HktVoW7HvBPI/AokTofsbWm5/R2R7iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BO+nbHSwrA02c1j3fvUwjIXr+2X/OQXfqmxgnArEusA=;
 b=AImkHJKUMy5vsLJO+x7bo2SDimTtm8DfP6Q3T/J/SxoKosCe4Arv5TSFqyGO5hqSrvXmwVAaG3+n+BJwQuIaTEHMe5h4XfT/XNMaaIs333O3OwOueFKz42sxi3as1rX+fbXw3o6h2sk0OhSXac4uK1Iw3FyVy4dOPfM83WjWSi93GTnPqMF/DakYKQCMKHlcv87E2sst+DFypbFbp0wz6x3yPg/eUDIho5goRHI0LH1tonbAiYPAGGgZ0L+Mjc8xShew+AEY8EkLDK3vSZolvbdJ6wpFpVWiYVt+WyyiI/rbtO/Er6bLeKDQo3P8pm/AXmILGLzstwsEQpZHBA8J3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14) by SA1PR12MB8164.namprd12.prod.outlook.com
 (2603:10b6:806:338::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 22:28:38 +0000
Received: from LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5]) by LY0PR12MB325698.namprd12.prod.outlook.com
 ([fe80::b65f:1548:5b35:e2b5%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 22:28:38 +0000
Date: Mon, 14 Sep 2026 19:28:36 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
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
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v11 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260914222836.GO3968357@nvidia.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-2-aneesh.kumar@kernel.org>
 <20260914133249.00007d35@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914133249.00007d35@oss.qualcomm.com>
X-ClientProxiedBy: MN2PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:208:234::23) To LY0PR12MB325698.namprd12.prod.outlook.com
 (2603:10b6:408:3bb::14)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR12MB325698:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3404d4-8de7-4594-c21b-08df12af85aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	Z4osGj3NNvu5Ptq3fcsWJQRRAVXuVlEd8MxUf4V3Fh7iHRzvCF4pMgNHTYjLjmSVqmv3H7mh1UFuLfcCuY2T9qSX3LOxkunneE2IVcmpJnlWzJghSlq9myA5IFkSYU0LTdsKU7YUk6M9f/7oGbv7iAJISqcLcelQmQ4x5PzK59oY9/+YqK0F/UkIDU2sdZVDzvdkzqlAqAWWNcBfYecgYci9hlRs3p2D22bzIVZakUzYmt+9XWCU3GuStglyprug2lUneDyjHcbhtpxpmZLFTE+WJ03+xPkCSVPVSo92irT+W59rID+c6EAj/CRoyTQBsNJl1lTR9oYFelG1dPQNcfSQEej+Q4NJM2twXo/aLYKLcms7PRVIErGaP9vqihbfwCUNZNYVl7CrX8dEJg53wT8dIpeyhuIu1+r8eHXFUZkdJdSbWgGsvNx9nmBHGkuqZalGwfGvJGCySp5M/NvWfjEtFcSYyhfKo/6MqF4Y2m3V8W2VKCp0jyC5lzgJIwJjf8/PMXc0Zh+F2VcEJ9wf97HPPayOm4s4/vQ5VdV9pkL3iPUhCAZI4l/2T+MreL3D7rcOtysts1A5KnL1wMSMhZcD0fReuiJJjJgF6KzL8MmQbCDs5u9XhaM8wt+kOORWu1jJO5yOJZL4sWs1lfKcjF8lRB1IyJ+z0U3AXztqBlc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LY0PR12MB325698.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?exT/qc1zrOSOYUOAyDeEDoepJhuJHpPUVixPd6IlgKF4TsYbdNtfTV7X/bMn?=
 =?us-ascii?Q?rJogauabKOVE1ecAxpUIOilUWGZlwrDNwIfTJxicpZuwiJ4njepfWEU5xdYC?=
 =?us-ascii?Q?OejLflUy9zJFJxBFPZdwpjg1lKxttHxNpwC1+tmcVjiEtHkqaBf72n+9WKM2?=
 =?us-ascii?Q?pYOmrZIEo2FZTfAuLvwo0NqhEhssA7ZPaUJAtX0ZCFjzuvR8zEgc/CLv0ML5?=
 =?us-ascii?Q?L10MvMyYlIj6TL6VmnHPbfAH/oG9R3eqAeaEMc+tVNfZQaeAac8z4+ZWnIYw?=
 =?us-ascii?Q?jiysqUe2V69LBrxB12qFlEEE4liVArGcvfAj7IXp/+RTdK8OawzSdcN87JnR?=
 =?us-ascii?Q?Xrw5GL3UVRB2mw8KQyqkSFV2qi1hwJNRrJv6FnL+Yr19uYERsBbFiCSWF7za?=
 =?us-ascii?Q?QIvz28obLl6Qco4x+BXAQKnp0QMIcNv7SwqUNQxVp6FtDVXiWSnzRiQmoNFh?=
 =?us-ascii?Q?y19sCredtnZQOwDzMz52HWv2bnAONUA/fJ5TkQ8CuAVpHXn8jEPsgaR4w0oW?=
 =?us-ascii?Q?wxRvtc7JWuVkO/lJ3MD+KybpN1a8PCOJC7Ite+sfSz0Ao4JSFWOqrQNlp1d0?=
 =?us-ascii?Q?L9agB0hsaFPW5xVKShJJvKVkQAtD8/BW9/FT8fXeCSr4HtpBVxd2UHvgCxvU?=
 =?us-ascii?Q?ENz9j3DF+HovrabKHzydcmcorirwlrBI3tAtbCuUxvZJkfv4inbWH6KSi5R0?=
 =?us-ascii?Q?URRBUfcygMC5rC/QD3YoE45K66TR+h0IDeHuk0kZ3sNDa343sfYhBexUaM5H?=
 =?us-ascii?Q?lVr/x1/gmLbFUhJPb/f+TWE1hddZciuT1a3YaJhMUQQM3qi07XzxhqPMzfio?=
 =?us-ascii?Q?jfW9sK1VaT5+m8lLpPrE390dQrUpvpWXh3/B5mOqOGGLfXZYOoIo0Lx7mDRn?=
 =?us-ascii?Q?SQfi4ZnX4CPTkeZozl+qZcnkW3GanhLwIfRSmz9/nljmMbL5LZzexQPkSkAo?=
 =?us-ascii?Q?Qjma+LMTiLQX0/dworT5MexaKgIjyiTPQ8WDKKc55P8eaZ90DTj+lKuHYE98?=
 =?us-ascii?Q?rwN6qseOYb08v7vfLmLAxqhiaMonp3wLXiADze7w93+ElkE7971ocAPDKnsj?=
 =?us-ascii?Q?m+7PKIAoTNgLXmxaPYrZDQyqoGIA8M7IsCO+Uqt6dLptbnlkmphx8QmwWH1e?=
 =?us-ascii?Q?Ii8SckDQAWsylnV17Gah9ETJ4c/alqHp+Nb3QIt1s5lehqwRSZTrEHwMkH6F?=
 =?us-ascii?Q?tV+sLWH+lsNfSBXeXvVWQ7VDS6yptus/QF8OPGvGzB6ij7TixKWkXeCWS99F?=
 =?us-ascii?Q?0nnNsoYpz6NCWS19PWLNDye0wcnMpF7IAig/cafmZ2Ct2CCLZ757c12daj+E?=
 =?us-ascii?Q?D5gP4pLv3H2t5Rd7DzRQkdsL2XWGS7c34a3VV0VlQaM62jNMrcrWJO5VA/gE?=
 =?us-ascii?Q?dG5Ck0JcZa7izrnC0BENh3CABhfLa7fv55LW9X5Ys1S42lBwHVv8/Vhx8uTu?=
 =?us-ascii?Q?yS3PXlb4fBgh/62HjUfgGvIdwLLg1crhFJpvhZIng8jQ6xJFuwjTrHgKmewR?=
 =?us-ascii?Q?0dAj3YAwvbETsbd9zC3y7aPEqXK7c3WXogN+LLFDRcuKY4ViLonBm8dnCNTT?=
 =?us-ascii?Q?Z4OdiSwOq/pbps0oo4gEI/vtlJKr+bflK9ilGkdrUtuPOsVUYeC4iM39rpbs?=
 =?us-ascii?Q?Em7neMCQPKuyqpjT+ikhIK972vW6zAXQiyXKPpJnf6PxygzmtsTm0uZchITn?=
 =?us-ascii?Q?Y6UD1BgqbEFpOvQSy0rCvnghDVK4L1qY2aT/9d74OacXEQAJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3404d4-8de7-4594-c21b-08df12af85aa
X-MS-Exchange-CrossTenant-AuthSource: LY0PR12MB325698.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 22:28:38.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKvL/W51MOOQS6hEQlgJLkPZ+2iQ8BzCac1p38x9DWeFnDLB0mMyLUlqVGpcUFQ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164

On Mon, Sep 14, 2026 at 01:32:49PM -0700, Jonathan Cameron wrote:
> > +struct arm_smccc_device *arm_smccc_device_register(const char *name, u32 func_id)
> > +{
> > +	int ret;
> > +	struct arm_smccc_device *smccc_dev;
> > +
> > +	if (!name)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	smccc_dev = kzalloc_obj(*smccc_dev);
> > +	if (!smccc_dev)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	smccc_dev->func_id = func_id;
> > +	smccc_dev->dev.bus = &arm_smccc_bus_type;
> > +	smccc_dev->dev.release = arm_smccc_release_device;
> > +
> > +	ret = dev_set_name(&smccc_dev->dev, "%s", name);
> 
> Does protecting the string defeat the nice underlying const handling?
> e.g.
> 	ret = dev_set_name(&smccc_dev->dev, name);
> might be better.

Pedenatically the %s is better as it doesn't restrict name to not
include % characters. 

> you'd often see this between an device_initialize() and device_add()
> and then we'd be relying on the device_put() to clean it up.
> 
> So as this stands this is fragile as any error paths that later
> get added...

Yes, but as written it is OK, and this is a common pattern in the
kernel. I agree it is fragile tricky..

Still it isn't an urgent reason to change it around, but the best
pattern is to put the allocate, dev.release=, and device_initialize()
in one 'alloc' function. Then the other function calls it and always
unwinds with put_device. Use device_add().

This avoids mixing the different kfree/put_device error unwind regimes
into the same function..

> > +	if (ret) {
> > +		kfree(smccc_dev);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> 
> here can't free the name allocation.

The funky reasoning is since name failed there is no name allocation
to free

And then device_register() failure must always be done with
put_device, so it will capture the name. As long as name/register are
a pair with nothing between it is "fine".

Jason
