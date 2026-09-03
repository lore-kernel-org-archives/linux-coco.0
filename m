Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4380B3939A9
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459734; cv=fail; b=WZ7kvePPM1hI1rmPNG6QBmlMachy7J1z/7tcRNkfRbo8V/+jlGs/sPPa3LEWI163LEvscexQ2OAxLdUKhcgDOismQBuxtgeW8IBMx7ATknHcxNs5M3nlQW65npWwZZ42fKQ168SaFiZ116OFUy/GyB+956bGiWZEEze1MjTTGX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459734; c=relaxed/simple;
	bh=9LOePPaQzFehX6DiMiJa0GHVyvgU5B7B7448aHTxchE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tv6CWatWiAE1EZQkWY4aKENyUv1yupiqj7RhVh0mmW6N9U6BTwSxPhtjKIE0y85jcKitBmVp0FtKwSKCcvQO+1OvSQCRjMtsuE07HSpJZnkl+D0wVm3QldAq3VNitPx70LgkTlzhTKw96lqhNvmgzZ5UBW8kpeDxiwJJ/u0hoGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EO/ErnT6; arc=fail smtp.client-ip=52.101.56.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EO/ErnT6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbHpNHtMt53FasVxblWQ8WiHqSpb6UKsstsmM3Ff43G4w6s4XjGOzPHBdAHrfMid+njYIzJBCVutm/l45ACYU6j+4JkRi5x7cQoHdH+EqCtRyo2APBuqfuZxuvHvY/RwSyuDPHZvM/3WYCa80mHkxnnBAs1hKyxH+yc3JY6/lrKpICeG6vJM3uTd3sAaSrGjYkZQ5q1NeDY0/sgfvZDJdhel7IgKJQXXVEA/6nX4sqqHST/IC9+gMHt+2wdtqrtX+mKyr6kq89lP/Wp380p8QzMYZTPV6nPibaO5c11e8W+JfrVYCto+0HQ/IZzFEUDkzpWG6XdED+G58xi90ETyGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cptW1QHwDr7ociRA0ReHiumlKZ0zB1blA4+y1XqZe+c=;
 b=QV2x3TFn0w7miOz77WAyTJzVGpsaBpem6Z5OwEZXQggeQvEhzI02paAZJ8bxdI3Bn6sXsnnU7r2WkzIrV6VueAnCsfVlY45h6jtO4uha3+It6nFUcNEptZo78J6HeAlGnbG40GnOjL5A8liWfCe/sFeQAWgIwkoZ9gc6/dzeqncqtOM6p6RP/wB2/CjURHraadr8KYEJSTFQKgvZK1qAKYQmc9BSSfHcBuNQ2kVuZB3qdXxPKqBCuSnhOeEOafIRA4qJvaZmXMVFvXZNc6Ck4w64+DWF/LtwHl9Z3uJF/rbtm7BR/YqJumy1xOnvGlHM2C42UTg4n2Ijbd0ZFTpNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cptW1QHwDr7ociRA0ReHiumlKZ0zB1blA4+y1XqZe+c=;
 b=EO/ErnT67Knu8P3w7VpQgf9qDUKd8gma6FhM7QXXeov6Jmfp3RXFvIvXQfvKxE6Yfwor9q+4A3t6zDVUDniMgOQ7VrXcmOFacikPE1BlJM6H2ENtfRXv4sVtLN9qSEsUJz1jJyWjMgS2ViFpAGLli5eKnnTN/7dO40lJO/CSSwPRRnJSSHcgYSweu90OR+PREKOEZhKkD9Wi5cwNVAqOxcmPMr3WSzuvNXG8nLnjEl5pOmC8u2Oh9tPyhTLDpuG7c/SnDmJx+Z8o3ZZ2BDcfljublITyz3i2upZM0Dc4oarn5GiUDtcaCwKE0pAcWT+KiHREoo4HY/riXNqlkvZSIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SN7PR12MB7812.namprd12.prod.outlook.com (2603:10b6:806:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:21:53 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 18:21:53 +0000
Date: Thu, 3 Sep 2026 15:21:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903182152.GN4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
X-ClientProxiedBy: YT4P288CA0084.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::18) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SN7PR12MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 11f3b6b6-b6e0-49d0-4ff0-08df09e83aa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|5023799004|4143699003|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	GpJqQJwbkt6Zl8/x34XEGB3uc0msbSLx35aXnfUyy50wssu8yF9tga0/fljwXdczmEAabKw35YVuSbxOJWZvjcnmdJh+mjTloY0VC/OS6dWkj1YeoRFQP5RBR+lky6cP67fA85Im2cVBb7sE1Q9fL0fnKIse1osP86325KVBUrxYsNkj7dSFj9+RoL3ynBQ+lHhZLpFQBK/srEwDHvVPTCg/fSZ4VYOYutZJHpgpbxRv18s+mVkJqxRX2lNNxXgHxUEF5m9dn7Nj3P6JHOzCGhlF5LnrLUmaZa9xK4CEGhKry/iYRShvDkH4J8KEDTjzu/v1Z85SPONkWGRbJSv5gnaMJbj6ik5N7T1Z3eK7xUiHQ0uBrB9gDscQUMZNltXweUM6lqTfelxhO4BeUWM8UxOrIgt1qkg3neHiJQ1IIdWeGGyjdc0NLNHdjp48i3xzQvJvrzbBHS8uwp6bSntAyV7gQGKmoohhFOrQ8TXA56rAaHF5/prZjGTI7j/uBaC1qthKbIFddJ/w4/ZZwgdYTge8WlWI4fW1TlYo1sxvPMaERi0Q75+i3gwmbkJLqfv/3LR2DyXi3jIM9w8GXzcUwCv5xLDwi9/w2Yg+t3Hmwo9gG6cx5wiOVW+39n0exdAonG+p8q6xeHCU8jeh4cbCwYIBktE7I3Gd4zylVijLNZ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y4h4O/pLgnFIiMxbx7pUb0vZfuEl97n9LVEYaja4n3+OUoT4AcxyDLmZB+se?=
 =?us-ascii?Q?gepl+Huvzq9D4y96GbS81KgewMN3YAWed8wJE4RMGePVkVtC1lBEO++UymI6?=
 =?us-ascii?Q?2e/mknYWZyk/IiZiE06F3iekmdNTrErTIJHJVEwp8jtvn2gJe+m7W/QoRPGK?=
 =?us-ascii?Q?QWqEfC8qTsdqSN0NEjMRXTOXUol1lJoa1UcgBa1K0b0gdXeHnkdqY9787bJm?=
 =?us-ascii?Q?tsEh2WWPkm+B5Es4R6mmClZAATuKHXpxxiO9pV90YtVDe4oMIXw9LLOiTWhC?=
 =?us-ascii?Q?pztYypJjIXxWcyeq56l5EDqNjT5EsHOz7eW4eJAjK1Hy89jfzbuhw2G7+i4D?=
 =?us-ascii?Q?cvPTOaf2npf0zYSQAAW2wOv7fMC4XO43djwOxXMbGDJOFEW3Ba/FutF6R6eN?=
 =?us-ascii?Q?VVCx+iJlBJQ779H7YzHUNXuN/emIlwJjwyR1Hqtp5EG9JdzZ1HsQoSWU72jg?=
 =?us-ascii?Q?hY1fkZ8P46pvumpEjMe6rJ7WraWU7z62eN60MozB2lxrFy9TGbRL/XwHZmF1?=
 =?us-ascii?Q?ozSRfiUzA1pVyKk3paZDHRCQ6DKP4hPlFiCwrhCr+5Bd4Ii4NyObmBlFRKbf?=
 =?us-ascii?Q?xn8oe7//rxdojfjWlndiV10Gx6UcuL1GKBfPqbBo/7LBp8wPe94iaN2WjYYM?=
 =?us-ascii?Q?n9F/rTTIo5nKy6s1BZp+EVnGqMK407uFOGrlbkRIFF9VOLNENcRKYdE2Z2jM?=
 =?us-ascii?Q?aavpWAQ8iyNeaCgbyh65u1yNkfgcEYAWWY0txnW+f1tJ3M6p+HduzLZUNwXJ?=
 =?us-ascii?Q?0xLkSm+RI1rHwnDW8QpRhkozg2ET6z8cNTnHUznh5nA3ufykFgEKHNIaxIXo?=
 =?us-ascii?Q?3WOesdmh8h4qp0L4eOgbMsuvZocAOi1aAbiHx4kCAm+YpN0VO7lh2apswN5V?=
 =?us-ascii?Q?mM4WA8kKuJ4Ap+hXKcXZbA/sLlqEq1ZE7PUHvPQA6wijHgBbQ87SVea/yEoX?=
 =?us-ascii?Q?vQbJltVIhLquvaNmg6OH8OqW7iwwEcI0sITXpluh2GQSu1a4C4UCUltqfQ1X?=
 =?us-ascii?Q?l97Xjl3IkflMVcRa+bzL5RmEt5fSu7pjh1tvBahVRJvQgojxrDEuoTKCXW1X?=
 =?us-ascii?Q?+Ga3yRtZ+HQSfszCUeGoMfORdT9cOT+LkG6idhN36NL5NACQGrI1zlFCBFL+?=
 =?us-ascii?Q?tdSCmyoUQ58R3QVKhO9J65R/a5n1nZGW9EDRi24d8QnXlIVzOvC2Vlss7qak?=
 =?us-ascii?Q?sCDNadhfjZ4Fu/oyjZY+MIRbQzSHsfH8ewKSb41LcZlnxQgp3HBWRC6wJ0Uk?=
 =?us-ascii?Q?hvb3w7uS9iPztcu7djLJcgLBZma3EFxdzA+/kS+WtFJy4hmmfubLq7+agJ2d?=
 =?us-ascii?Q?viUlyxk1DYDoeXXMwodudHhZVqEl/XfQqSlkGELYQecyF8l7lO0OIglXR1Vn?=
 =?us-ascii?Q?FGlazc6QitQYCJPHIk0cFcedeaDISabyrfYoy9UQyLVOOp0Hyywddg8SfNxe?=
 =?us-ascii?Q?c1cXAywu/T6x5sicc/GsIamWN17nfRm43KJM5VyyOMoVIJoeLjg7au3eriQ1?=
 =?us-ascii?Q?yym0zUaEKr9BVEYCtEha3RmlsJGHowO7F6/ZxBNIwuTBDgTI77+QjZm3MuL5?=
 =?us-ascii?Q?SkcOu7fqTQDKHN/u91WgRbBZr8Wlz22lKM2436eGxi4lCfDE1CqmsF2OyJJS?=
 =?us-ascii?Q?+cy+9wRc8k+kChhv3e0Rvz6vjgbap/gG8kQ2kmiBJCdUyKuV+rxGxdtPuAfA?=
 =?us-ascii?Q?6SuX8T/vn/SGQ/TX1W+2FRkefi6LaGtl2nbJC/jw5Q0mhz45?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11f3b6b6-b6e0-49d0-4ff0-08df09e83aa0
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:21:53.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7qmQU//Hl7wQDf5dOUl6V1kY9kYqTrYAjD8h+IQrVJId2aNOuiTdJU5ryYm0cge9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7812

On Thu, Sep 03, 2026 at 05:18:16PM +0100, Sudeep Holla wrote:

> Oh yes, we need this whatever you term as "duplication". I would argue
> against terming it as duplications as if you look at the various SMCCC
> based specification, we have zero consistency in how the VERSION command
> is expected to work.

Okay, then that pretty much settles it. Nothing to do

> > Missing a check means FW upgrades might become Linux breaking. 
> 
> Are you referring to the SMCCC bus code or RSI in particular above. I don't
> see any issue with SMCCC bus code check as that is the least we can do and
> must not change with future versions of the firmware as well.

Just in general, SMCCC drivers have to do something smart with the
version.

Like, is this OK:

#define ARM_SMCCC_TRNG_MIN_VERSION	0x10000UL

static inline bool smccc_probe_trng(void)
{
	struct arm_smccc_res res;

	arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
	if ((s32)res.a0 < 0)
		return false;

	return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
}

?

It means you can never publish a version 2 that is ABI breaking
because linux doesn't check for that. Was that ARM's intention with
the version API? It's basically a completely pointless check that
doesn't effectively do anything.

My broader, more general point is that if SMCC is being made into a
discoverable bus, that's great, but it would be even better if ARM
could find a way to progmatically enumerate all the ABIs present on
the SMCC interface to populate the bus. That would necessarily include
some consistent treatment of versioning for consistent
interoperability.

> If lower is also set at v3.0, then I would argue it is firmware upgrade
> issue expecting old kernel with old RSI version supported to work. If
> that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
> right ?

There was many long conversations about this and I think the
conclusion was RSI will broadly not use versions for any kind of ABI
control. It is too coarse to really work in the real world and we must
have strong forward/backwards interoperability inside VMs forever.

Jason
