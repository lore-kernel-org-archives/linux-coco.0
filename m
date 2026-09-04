Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012067.outbound.protection.outlook.com [52.101.53.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C0494A14
	for <linux-coco@lists.linux.dev>; Fri,  4 Sep 2026 13:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530041; cv=fail; b=XLmITa5zpLcWQPE1ytZDNCyQponHn0udxieKvkT+DD0GCtKoFgGzCYPG7vd3GsnOSdcM7MVEI236EqoBLVGF96BHZ/qEkYoht0iptFa0w2FOIuw7KWu8uOprQ2Zmz2XR5kaMzBS7mtRAk33Rjg27NUE3R0Ool9NgJtYdPBpIzyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530041; c=relaxed/simple;
	bh=pltPylkojT85eVoTttrcomxqkyIDCa/I2Qey9C1p6Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ayQQ6GLP7GaCNrKPDuSz89KjscClNMu1d8siQ6xWD/1ZfpcHSQxDp3zvFSdaKb6qZjQyD9K3t6qfzdOK8WP5QvNzsiy0+mnfACd31vZMrz2pMXDxjH/FTMOX/fTXa3z8uII2aSaAa+GF5dn27u8fBOvlTfIDSGnMEu9lbsGbCwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ADZFan7v; arc=fail smtp.client-ip=52.101.53.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ADZFan7v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9npHNAKVsXghkrTZdk3J5FIqKD5jeUjfyxxpnq7KclOhR3BCZj7nDiegGYiQRFFFnh5CaAjKS4LPOCAO6AcTzkN9tNUniAkcXoklFtoflMkjRHNpL2DxVJnCueU/adKWn9QYRVHM4dz1LFmlNjnaI1vh16oph/c3t0BIyvaRozNEYL26H5Z2Bd8/RRWhvJrrTJObe6IDWEnneM/qFSO4GYo6D8ThhxbLlKhgq0O1Y9mMQESBOkvnlBtxUuxDoQRhN2NCNUhwqvRPhBx8JmzcK/LMV+QkK/iPDA+JwPOb0g4iX1d31qmsp0gVCMJH8BH//a97Jur63PubBMcSd2/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt234HiCeAzM0V3EJigjEnhRdRXBDSOf7A1g/FPjdCk=;
 b=pPyxIqRugQJWWFwgGdk8iX7KcVBX34UE9HavPNYkrFPPb4Lw7lx7e945xT3A/E2qcUXDFtzdI10hsnUldE6VZUvX8ie1pxJvkgCUT43QB7h3XNtdGkL9MwZ6lOtSIIBZNorrChNwY0I7M3Z0mQ0rIXPgIZRlqH9olpVtA1Xuji3mK1eqiz1UHfcghixz7BofT5YIFN15QT5sme/FShDZpymd09e9TW1kUDeGj2NCcOt3WSEt7KylfPRyyGtlwEXet4uhuw0PvBM4OvowLUtr9GiFyJATeatumey3fEBzYep64Db7b+BfMSSOTW/RNLdZUm1qfmjyVmla7o/bEwvq5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt234HiCeAzM0V3EJigjEnhRdRXBDSOf7A1g/FPjdCk=;
 b=ADZFan7vKkeI5f8bD6cBTcKYr7x5eah5l6gRIHpv0DdD1jYuIvXR2HJyJmOiway+Aotyv0Z1i98xg2Nv06PD+7lHmSdZF781MbSPZxKRZk1mjv/D5YDfiR0rcjDOLQ11un/lt+0xDSKZYODheOfR5y4O1zYT/bOdjPA3rNxiJp348s9JA8+ebq0IAmsgqRKGiZwPjWKelGrmOSgMTaLpMYbTfnvsySK76VuSJWrQ7z1ZTg79WaZWpccnpCQLs4BVU4jdQ1RjCOztAifzW7f2WHmdYyM9Kc5dCYV2OGmHhfQpQ4iTGbTqqbGxt7Oy9NaZexCzGEYlDTShVmgol+1CgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by BN3PR12MB9593.namprd12.prod.outlook.com (2603:10b6:408:2cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 13:53:54 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 13:53:54 +0000
Date: Fri, 4 Sep 2026 10:53:53 -0300
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
Message-ID: <20260904135353.GQ4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
 <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
X-ClientProxiedBy: BN9P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::8) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|BN3PR12MB9593:EE_
X-MS-Office365-Filtering-Correlation-Id: 859be903-14e1-4efc-866e-08df0a8bf53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	tbYT7pALyje9404bR5NdDxE85GaOvOudZmlau8oghZ/EPAO7CtFNRmYh6VLzEz57WMGUItvbrJ+GgHXK1dYDr9xnnZXOUY71AXQVC4c+qxbYPkArsmjCvEmBueZAXUBxRm1gtY3XI2hbgErEXx02QfKvFb/ww97sIpue47IS4lEzsLq5T/9sovGz9aax+txoTcpFW9xNs+8CQkzJlNO6omhajHMXrYMai0SJ7newMAlaCmHuhlxChArkx4s/kSazF3Dqo3yFhNbIQt9UdtHnIwBaBwBlBGw596qXaQf2Dt0FHPOxCLGauUcU+wFxFihfvM5dvX5s/zyKO6gnG14Lu5kVJn93dyGn2hUzP/FmRgFfK1Pmkr6phl/f4E/L9oZv6xO3FicikYzgbc68cgHMNu74fAQ3GZhVm+uMdkVuLUWYwfrhJDfxSuZN15ygvGzHnRhUGAr4iMiiytcB9j6Ix+HyHxGVJyCBNs3qTwhsLPRDVMWwSsVyYeNrv9D47B3qeU7Mdq6OUEPmkfYjIIfZyDAMXw4lBvIDm+Qu4Ln3MkRTuSNRHYVWXuj6WWce0mOF+IR9vawJnLrZhZf/3TrfTwcFMTQ1zqjjdr1Dpwq3vJam2q96N9BvCeWoqvxkQTK7ksUFrScIOL9AjKr03fYdrS9T54hdSpPi+2jFAAjkoyg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bRxD+tXJMiDlE1qS9TZOyyTkf0ACnUuDGIMaaBlVC/6cnmOyJwLgct5gKtH5?=
 =?us-ascii?Q?ZCW6thMjUqmdVojH1TO4zjZy65JORRrwvRZ6i0wGcigt+ME/VXcxysKs4AgK?=
 =?us-ascii?Q?orlVXz7Da3XYe34c0rFFFnl6es2lqZS8nBpW7ygkjk3nCDRGVqYqzfmjZni+?=
 =?us-ascii?Q?i/0rWnZFnHlYXxzqdfvn9OXh2OnuJWUjX0gUIFFhKv51xhkVUf4ESbp7/wOp?=
 =?us-ascii?Q?tZU1bHMjirV0g2ZigZhviowwKyhwG5NMYZiEFw6Ac3TbvZWNjP4oCm5hEWi+?=
 =?us-ascii?Q?4GpHI6TugABzKeOvjplWvo4OZAjGKDDxBIcAHLK549aVn3B/qD7qYmVdo9mZ?=
 =?us-ascii?Q?ZLmCjJ/d+Z0wQJHDAA5dejiNG98FBHchHjrXAYM83kPPriAvldsXvnWx6d9W?=
 =?us-ascii?Q?l3w3NtJx4WaW4/9z4S+fgsAJWca3O8C9j37EYehQrLdWXKmB+3dsTIoWOjIs?=
 =?us-ascii?Q?JITI7Q/j43svaLtg+NDrGbOA5mmL1oYFbpaGn17qcfJIWDKc0bDR8X3okFUS?=
 =?us-ascii?Q?uIftSHv6MJ+0q9/od9SxLELMeyyPDz4/bldBMHhVZAo7pgQJYQNbLZQt+bCU?=
 =?us-ascii?Q?jF5yQwfn4TryuhmbQcbXHvMcVOo0CemdWAKGy85aDQYwUwOaZnEa58ZUmiKi?=
 =?us-ascii?Q?7e+EaOKHF4G/D032UciZeWR6cGQjkC30z2p1F/PoB4fVd7GCKmZxCe4FCJ1j?=
 =?us-ascii?Q?bUm2rewTBKROZmP/tIAzv9TpPWAd/m23+wXDVdIDtAFstdj8CvCluZ9nuu5h?=
 =?us-ascii?Q?sTVyX4RBoDXzShYVmdQon4qH30CRXuucZFu5LAkNBcqMne8RATuG87SsNLkb?=
 =?us-ascii?Q?uSR6ZQCifDRzKQVMOL8gBkbUgRDItgffjOgmaPDYp5MM8jlaKG39siDlKlaR?=
 =?us-ascii?Q?TGxFH6TUeikEVmQFuK0xsKH93gZ912sOLUo1TBYJ/zJwdl6UpFmDazkhHCgp?=
 =?us-ascii?Q?VFKSc60HXDbqbTAwDjcl2mBLw7JhflRqbWsK9GYcvIDen2tSpRVa4Y3waijt?=
 =?us-ascii?Q?ukkEafJZni0cwa7O0to1SXeAdYoWg8+Wu2FObBJZSm6dD+xIiHZ7kZhk4p14?=
 =?us-ascii?Q?E0kr4XuFbangnros169qQRFOCNvGsep6NtcNMAmL/w94XJ2k7pMMC19c+s0b?=
 =?us-ascii?Q?kO7pJGO9Aym9PMV0mUcHSE1qIO2XrCsbO15FN+lIsMlyC9qmP7yo2RoXMuLP?=
 =?us-ascii?Q?YammNIk8ouUAi2QEWo5vtXZwO0yGYko2N7s2wSBh9+9hQv/4Y8Gc8rzOsxj+?=
 =?us-ascii?Q?Czoar+0kpvows4iviRUHn1TJB9N7OsMuDBTR51Adm0m2Wwt8u/w+l8vYXYV/?=
 =?us-ascii?Q?DRSG4j4Xdg67u/9PzYgObQd1bVcMP/yH6JY1IvYnZsUqNyValIQJpYtic4kB?=
 =?us-ascii?Q?Ba2aEFKMpKwY/iUbyDoWjx50Inoo946tVko0VzDH6ECaaLm2NwjiI1eSn1A7?=
 =?us-ascii?Q?gOJA/gvUCvqr3wtRLh4FiBxX/wd4z+NSGoYeYoZ5d2Ev79pqkhYlj0UQO39F?=
 =?us-ascii?Q?f7ezsGREcNQnhioAEyvNClQRO0LgMply1OpauzJPFYXoplAPJx67WQDNuxvh?=
 =?us-ascii?Q?+3tx9Xzivj+7QnHQS/nE1cErKR4oZRJl9iVMQ6Ln0YdQ3Eq3RKUJHvPGSKgF?=
 =?us-ascii?Q?wkou4xQOIHpjr4ss1h0A3daDyy7Z8Ju5G7YUqQXIeEJOLjCk5b+SyaG010Qz?=
 =?us-ascii?Q?LOvwtW6ZndJ77NrsyJuneA7pYWTzKkvlK5HP0k/JuXM292Rr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859be903-14e1-4efc-866e-08df0a8bf53a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 13:53:54.2407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeXXsZI3OAODFHy/cdktSQ1P8VhbAa/WlxI//5HkWMyWk+ciVe7mCTEPslpysP0e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9593

On Fri, Sep 04, 2026 at 11:02:56AM +0100, Sudeep Holla wrote:
> > It means you can never publish a version 2 that is ABI breaking
> > because linux doesn't check for that. Was that ARM's intention with
> > the version API? It's basically a completely pointless check that
> > doesn't effectively do anything.
> 
> I didn't get that. The example above checks for minimum TRNG version,
> so it won't break in any way for v2. What am I missing ?

If ARM sticks to what they have done in other specs, a V2 could define
ABI that is not compatible with V1 at all. (semantic versioning and all)

So the kernel check above will happily pass a v2 interface and then
send garbage into the incompatible ABI.

The ecosystem couldn't accept this. An ABI breaking V2 can never
exist, so the versioning is much less useful that a normal semver
scheme.

If it was MAJOR(version) == 1 then it might make a little more sense.

I'm saying that broadly none of this version stuff seems to be doing
much useful work. Even the more complicated RSI lower/uppper stuff was
not good enough and they are going to follow a new scheme.

I think the bus is a nice idea! If you keep going down that logical
path the next stop is to have a SMCCC that discovers the FW ABIs
available. That would be a good moment to take a pause and try to set
a versioning system standard that actually works consistently for the
entire ecosystem.

IMHO to lean into the bus design I would have a discovery SMCCC that
returns a list of supported ABIs, something like (spec, spec version,
ABI, FID, feature supported bitmap).  There could be overlaps if the
FW supports several ABI incompatible versions, like RSI v1 and RSI v2.

Then you do a driver search and the strongest match sees the bus code
issue a "set SMCCC" that says 'I picked index #3 behave like that
please' and then the actual SMCC driver would use a features scheme to
further fine tune things.

Instead of versions you have ABI's and feature bits describing what is
supported. This is far closer to how the HW interfaces ARM designs
tend to work, and is much more aligned to how I understand RMM is
going.

It could be consistent and layer on top of what you have now without
ABI breaking anything.

Regards,
Jason
