Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212674A9D6F
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440247; cv=fail; b=ivRAbnoxV5PDjm8kA6LixxUqjOaX5R4dufEKy3GE9fI3SFOZPOBU2wJRp9kztsK7SRKzNTNCOV1UGPoyIOhY2d/TpOzYDpQPPwR0qMliukgKmU+jvb1eqlCf3M3QC/taQse8caPTpv8XupPSYwIAMV56iQoIgf/bDbInR9hJdeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440247; c=relaxed/simple;
	bh=D8G4/JEZCTXLtE4Qu57A1FWtKTcdcfbHiOjux8ucO9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KP/OurLjtYprp+E2/Gn1INZya5xrnS/Bd3/grao1x45ca1AWGcSYsKBbREbtN41kxnRFJIqd48mAXYAdJ1BBL7LtPYBpYTtvgfe7TFxyC2aKr0oashmmhTA35bAYbz1IndXP0JOavOvURfv0Ika4LcCf1NWX/ThgVFUCiLLZuak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aPF60T/E; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aPF60T/E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keN7pe9LaTaZpmRsxeMZ9YTiOflrZ2AdRpH4+pmm755NNCUchlyBLljmeykMob+lnBf/kXj5nMyn+h5kFopmr8+T25rG1zMigaI8eMTWk4UReDtv3cmYwBcJ7QQBAPyeVvvyEENHXnRCDH93haSsn+yByatnO65LBjPt2niMuxu9h25IKdOV8CJd12nmcEXqAZb1He5heIpF3jHsamf/87yQ0Cjhuk6edrgu+tOTPndDHc8us71gHJrOIEcx3URAgYD4vkiL95MbZFtd1HwhfC7GxRri3kucqy0QEn4Xwterp1Hq0qU33pqjLntKrBV+nZ7h8gzixgF2/1gPy7YE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8G4/JEZCTXLtE4Qu57A1FWtKTcdcfbHiOjux8ucO9k=;
 b=F0mMpgC1MEFiBsNyAXm4A8D6k6s/iJrl/Gr5id3mBOp4EV338XqE1PKrsofphvMuK7747RSOtLT9ddTGXrjcyNXPaFuGbajc1axqWtOqVs5KyZtfmnTCfjSu+iwVn3SM/6dXV9HtQv7u1MNdwqXgfX/tI4mYnddfi0FDgVfqn0vBn4Ictsrk9/bceJjBaxKMyNeMwI/bcoP0FtI5cbpRuzGTJQW1h87myJVRtlmaP7k2AxEdSp/eOXI0oOONATT5nBWvHrbPdI+q6NJ4eJGZ3tdHIC+sAAE9KQVZCVDT3L2pE/cDhNlUDGHSS69DWk92dHzfx9IaH6/S2bZ4rARKDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8G4/JEZCTXLtE4Qu57A1FWtKTcdcfbHiOjux8ucO9k=;
 b=aPF60T/EcKTFGKs2kGI7TYsO1MSoNGq0jxwLBsystv4X5U1432OkCoueleUCrW1adGXOGFhBQc2VRXAoe/dzlc95slu2UAwvxLjFxYiI2T1EBNKHcMp7k9nnwXZgSjJHMRus70sXyMjNBCiDe/+VrNqtLw5VGhfyN/uYjAK+p3uYssJrXL7t/t1S3A0xfd3+RbGQIWr+/woPnOLkxT47kvrXXoXCH5YkGVcmTymaS2RmzpYv4PkU0r4Gg4RX+/U63Gy14u3wjOqqX8lbMP9hoO9rlKTpR8H2QSrN2CSJR0r3wS3mz0+KGKsN/gdp0VGBUTXxdwBP5zGU+cvvtaLRTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MW3PR12MB4460.namprd12.prod.outlook.com (2603:10b6:303:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Thu, 3 Sep
 2026 12:57:20 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 12:57:20 +0000
Date: Thu, 3 Sep 2026 09:57:18 -0300
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
	Andre Przywara <andre.przywara@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260903125718.GI4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ay0diyavw.fsf@kernel.org>
X-ClientProxiedBy: BN9PR03CA0768.namprd03.prod.outlook.com
 (2603:10b6:408:13a::23) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MW3PR12MB4460:EE_
X-MS-Office365-Filtering-Correlation-Id: 00e02624-321e-4dfd-e486-08df09bae39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|10067099003|11063799006|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rTn1Tmv3wi7ehKkA/lDZOsrHRfc9mvoVcpVYBvl7HkHYYvZIR9FntE/o/JYf3aFoAOc3LV6J0Suf67JlkvmNLahk4Bq+rwyInMFRin+hcp9SNfw8PLBypWBl7faja5P4oClI63mpbyxs5MemOevC7A6TUmoAI8MFGPISXQid9B6cFWnKPIuWyI/E4f9Y7bZutlrMEiDbglTO8kHW+LzwgPtCP+ZuvPuh+5rMurpjbfusZSlZ/Yplnp8RelMDlYI0g9QWyGee7oXavyGqpE5b778Sdltp5SPds8T4Kw/whlq+onrfr1X7411vVLj/zQ9VvcZiBcuM69dirisbFAPBizGSdyiJoS/rP5nEV0ngPRdmIP9IeS0PIVVVSMRmX8F1JUIcLPtnH7ELDa0GjJGzKMEcZnLB9uSWOUsAQgDIsUQnd3Bzuv7jRfigh4LY4HWPi4nYxt0Ca8iW8AHnFwdmehRtYZV9+Ge07HYUd87mAFpJVDNhuffock0use2qBRFDlAvL0Tox89jbfq66wMdrlG8tPfh6qYtQihXhj7mAnRuPhAN9r4C1JKS5xeTmNoQKW3+GIAWmDmKMdJUw6a7GlLMs13VzkyYZ4AQM78cRgn/FNkwypiBVaTJpiM9yYi0HnDYB8wJzKWV8BQmWRsB769cQcQ+vQ2+JilBhQWdjM8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?npO0ElS5W4mpV0IvRw3Fsp7ef2JN1P8nlZMbp8PnjJuRM631uWhoVscVWs6X?=
 =?us-ascii?Q?0zmuE1gP2ZGv3O3d68G73F18aNfiyAM2zEsY3ZyzmJxk7su6tsepWI8qbCOh?=
 =?us-ascii?Q?6r1oXj5ZsQy1sLgbYpwA/zDCH6u8zWUntATjd/KFroHoklbdYdzu1XJ0yKps?=
 =?us-ascii?Q?DHBhawhrwXgtwwQoaDwoauTW8uytLMggLIS2PZjiRdplvJFuAS5CzNe9bS3g?=
 =?us-ascii?Q?J3gjdqKk9iu0PuWqq5v01LEojHrpnC5BSxAb2xeCD8VIEKK5M5Ie4pbLfcd4?=
 =?us-ascii?Q?wjIQNAjfBwFlmT7QIYq1JaoX4BgLAT9dDnej4k8ei1BmyAIEdlkZkWgXtH61?=
 =?us-ascii?Q?adIBcDYoyqK2cwGBkWv7qstwYEnSYmyVLoHUhDJBGPD97UObMWVmXLq1HNPj?=
 =?us-ascii?Q?Isa9Mrhl2GMYMYrTV5IFZXiq/8Ei2RyHZV6Kln59Dxz390DXs9nkWVOMZede?=
 =?us-ascii?Q?ZW01NNmKtsHE+0TGEqJ4I9kzZk/S9lLhs0LDty6z122Cd0+pEycV3pQNqWPg?=
 =?us-ascii?Q?/n4jBy2Vugk7ohCt2F89Bi2LBK8d2Hj0X3j0i053tyXP2mzAU1JSPuFYysQm?=
 =?us-ascii?Q?C2ahurWYASOP1ewMoXFRlZYDxo9etl6ckC1WY77zU9wmVISm28prCfcglPKD?=
 =?us-ascii?Q?2xn1XMFJzy8LpXbF4xP0/wJ3DMt2Ercm+Wmb6UKKH3DHFAN/SZZUG7vb33dt?=
 =?us-ascii?Q?T+uxFc1fcQPwMkGGaw9Dq0Mo+G448MgQJj3KFPgK3IMwOBIhUL1LMTj4F6lc?=
 =?us-ascii?Q?iYQ6VnhfVfuTW8Ex792w7H5pCZgAiAf6qkOa8Wt4a07yKjIPbeDW+z1vwzI4?=
 =?us-ascii?Q?PBB5AFboCxcowfL3g62huPjm/pIaAnmEIQD8hLzRb0IyDw6ELX4f2+O5rwEw?=
 =?us-ascii?Q?y8XoVORamEQcsZ79KeD+CnP3ODHNkzxWnopthKCoG18o0ftm5y0Dc68wwThD?=
 =?us-ascii?Q?3RpLzmjMQFr1mc2D+iyCnGiAevBZnyr/qdZTUZb81pk5MUhH20rq5TZu0eKL?=
 =?us-ascii?Q?t8EQNPMqCmakZVPEi2eUknA8sgOxMrJ+UwflsSVWnTfzV7Sskeqt1ULseESQ?=
 =?us-ascii?Q?bwKXA/r7mVKSfDibWG+VYrYQiJcJtEMbFlQmCsuk8KCHujNM9qe/09T0XSl9?=
 =?us-ascii?Q?HzjSuqpjhdGtNOSH4MJhAqJAEHCkVeuiv4N1lzvs+PBtqoNU7j+WMdiPYQLd?=
 =?us-ascii?Q?HFjWAg6qL4BwwNBczM803hSHYOr3CIQjhBvCY49Wxbg6/L2w2WeSxkMl+ktX?=
 =?us-ascii?Q?lTqfsu4YoMm+16POvPOOmnRqhSrFkWHJET0GB9sFNVbcJw3T2NXEXxIDbZed?=
 =?us-ascii?Q?O62b4fgogiP9GHoWDX/4TsvSbir3IAgjQCqndb/yC7xZLGbY4lj93lc/qEMV?=
 =?us-ascii?Q?Ct1dkbCWbs1Fh6UHF6QGE9Y/LYQnc6jPKZKCEMdY8clrkvP8DuFxllomNwiT?=
 =?us-ascii?Q?1+NEyDb5B5dEoz6oWptUO1cvuwxzQ4Em96i/OLrQTHAfgmtkXygttBlpoVMb?=
 =?us-ascii?Q?Yy84pWTOEMlK5lkh57zh3pWRem3NvJ55VQJA6C9FoCUScnvbXWzOQ1FP5A2i?=
 =?us-ascii?Q?sz63DJfOBQLkJFZmmorPMDlShyj4ibP35cYa85c1wE15YLIEYeeez9OS/zjy?=
 =?us-ascii?Q?3kt8ILXRu6FildmheIMVxuLu2JGsrXpls2GQeoszoTg1PvSNw/+F/kScR7IQ?=
 =?us-ascii?Q?f6/uX8d4DE0IWpLswZBHHq4KK4RInxSzy4f04D2fUX+7R48o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e02624-321e-4dfd-e486-08df09bae39a
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:57:20.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IeNfZHnxjsNx8f9sl9I/L/iumfgboKxIVFyhabXRXD0gGp61rW4gHUp8Ter74r+W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4460

On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:

> I have updated the bus to match devices using func_id.

Did you have any thoughts on how to handle ARM's versioning scheme
too?

I'm not sure what the rules are but it seems like if the major changes
then the API is incompatible? So shouldn't every driver advertise a
supported major, and the major be in the modalias and checked by match
too?

Jason
