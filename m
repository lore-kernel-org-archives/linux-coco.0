Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010008.outbound.protection.outlook.com [52.101.193.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7824E3EF1
	for <linux-coco@lists.linux.dev>; Thu,  3 Sep 2026 15:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450395; cv=fail; b=fM1MPjvesymcx/yKMr9/+7Tlj7Yo26Uc5lR2lyUMVPGDVa3vEkJeyuidvtwfxa6mWKP5dixU9lgkzBLOUVdu2D4WAejM39pjVDTrU0B0z0Azqd//Zr7GgIvlf58YyE/zgwddG2pT04XQsMzP1cY3cIRherNYAqemXWbu9EHTet0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450395; c=relaxed/simple;
	bh=EohvMs46pLcZibIn35p5jIZPTL5JpaslsbAMaxvmMwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HKFG8rfxFKCcusEDBZ+SDTzhknHT7XtCzjQLTK0ka9K3u6tENQDO1M52RdwPvryoSPvRmKba36/TVSaaz5le2PgwW2pkCDeW+iaQTkJwtDxZsVv2fPAzvW1GwABXcqBMfVOD1P/wtnTfY38Xb0aOFDyI5uk1SqBNVrw714aVMPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GFTR4jff; arc=fail smtp.client-ip=52.101.193.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GFTR4jff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsfPZb1Bs3uQQp2G+F7+G/zMOW/nxSYtkQoaeFoWBKWuIDbLZOheFVW2vwAWp/fWe7XdGu5dmgqTFo3v8htRXsDdE0u5kZ2WIQ3ERsMR/9QEdiZqaKrSzKZg5vqb7z4NKUuczHP7i32RjcfXzY4YHDOx5m3+ILNFL73XjDrlTP97m/QdaSkT/R00Me1QT9vqut/MD9oYR8FGtzt7SSjX7V1RachPjLtoy5U9ckvXekjYcuwStk/1ka5J0g1buYGNSC3X3bhvMYv3ws9y+yc+y3FoGOQ1EA59QTPFdeOIpKXpsnZnn4qvwkzMP89+hj/s9gFmdW2IUlFRWrU0mvg6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVbFDdYMTBCjcAyPvBikVlQ8KJoqAqw46vpMHvZC7mM=;
 b=TO7pKEydaPcGAShaKLhrI5OBd+GfoBLWh75xLi81vI5P4ZnQPt4NT0sLHXrdNnaxORc9sJRDOtXAW7jZJOm1fB63ngfsohcFwJi6ecBnPknINv59d8EawMOUkrosXEZLIFOklsvk+ZFrW0nza92DmZCTyzZLlMfLaRxkODx2uUd7KSRSXzM2W7P2+2dj1Ti7ViHwIi7blm5atI2h0TpgQlsT2nEs4wpciBQvEk7fQmuI6/Lfd790ipT8HewxH6UXrCBSR814FndlicSYqA9trFDlkDsGmDhOoqk/77aYnAVplpR+PbgieTWQPQBj5czA8MjlI3rdZtbQMiKmjpQQ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVbFDdYMTBCjcAyPvBikVlQ8KJoqAqw46vpMHvZC7mM=;
 b=GFTR4jfflhlhKd9zJgme+Jo2okrCslvPkHSeDvU+eq+XJSiRy8tyOxl6x3jqCYLCVMrQXaUENJENuQ7LO96DIbSmas+Gb1zt3DeMhtunZAyq33uz7hdpm8FPvvBVLZHCJ4etpfcqE8fKLfQHEAL0bgMDErUZnBAPR6xUjfTHO71tRW+Z61ekkRZgfdiobUzuq1a6eRtTds5vMmrWZQGCOwJPDlj5/W2YzbMQQoaXEpwu1G++yOxySdCjXemPWrREkXCPCFGAGONgjDldCWKYPz9zTJHk2whaWUcZbRg1Mq4uQr/HGrhR5t94d33h66LL0plu2xyC00NgDNPlokWtGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DS6PR12MB600424.namprd12.prod.outlook.com (2603:10b6:8:499::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 15:46:27 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:46:27 +0000
Date: Thu, 3 Sep 2026 12:46:26 -0300
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
Message-ID: <20260903154626.GL4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5av78mxv0j.fsf@kernel.org>
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DS6PR12MB600424:EE_
X-MS-Office365-Filtering-Correlation-Id: b64090bf-e389-4f19-d5a7-08df09d283f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|22082099003|18002099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZYEWZOsdMDchbqr9lVBniN1+OQTF6VZ8wcxNJcyBfhAxekhzRL7I/Iu3jE4g4kUW6aK9qet8XibUO5jCYgMBkb4YPbQPtbOkkITICJs5tJUAPXzwmKfmW4SVNB/dAmMJPyaKHWDgTE7A2+Q0S7kG42MGrdB4gEAJMHBGsDI7vyvbeB53fCvTTTCtTtznm2evyipr7mBG0oHiVkCX92EvutDHl4V6hP4E7lqqc2n4tnhXLbvbMz+IjWGmnVAlufCc3snxaZTwKxY6CfHnvBKeuASN97468e7Kp8wsI+D9QrV8qJGHa8dbQgCqjO98CJJYXjLTMk/vQR09R/95GuMILQEwnX/LW8RUqU5rTOKwDwkXEKFaSVS+qAgHeCU7Dn/uxyHXvgYqMw3+Bi9YgCoYqws70BPcrPMNVc8QuDhCaXSB4s4pvyHASlya3wTUyfg0LFQJiDX1HsDpMI0CiHWqolBt7HEeoSVwynLWy78ZlkLCMv82kfsLT3S9ewlK2lS5Zx9FjMVnSqMq3bYj73T3BFUXnS0pUaQlUweo8hpSwAZiCploGpJTsL9qR1pO0g7afeUwarcnlMj/T+NccQlmB2O2k1E4xYmQn8vrwbbAYuZA53qYd41V/s65iQfKtZrom9XSrCTqrFEgNSvhBwRrXlrIE5qvWhaaatu3FNygDKA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xL5B9j7iClWPj7bymG2QnAkrIzKBDYJa5rf94uounbuh2CL4ZYUQKoEeQ0/t?=
 =?us-ascii?Q?IIt8r+s1QGBGQqpHRDR6Si4gfnbD/JDOJVeJe3mPUwPyAB0gRQRs0RKuF4+4?=
 =?us-ascii?Q?g/1yAPxYUXDRVjkI5DZHbmJrcVCaIpjY7Sfzv94/kLT/L3ZHDxYNKMiFccFC?=
 =?us-ascii?Q?Y3FLKkgpmWrIvaPM6v45vPRRX6V1ZDoS+i6QIwsYizNvemJsT6JMO2/sqaEi?=
 =?us-ascii?Q?yRTe0RRvPcfIk/GP2GT2MIyKAW7Bd6O1TECY0th8ku+l6vMA3/wYEFwy13Rs?=
 =?us-ascii?Q?aiVRJBUkd4X5PnR2J4oemK4C8qUKPuPWZXjXHjz9TF+Y1b1+bmeGt48w9L/Q?=
 =?us-ascii?Q?LYXE4qEx/Cx3MzN+bVvNlZxNYaLt7vJAjMGq4eL1jA4kTsWnFpsD1IDz+ccl?=
 =?us-ascii?Q?uMOk34YitF2ZRXVIKkwEZPmnb5NEp8YseG9i8JzLBJ2hoRGi4BlzwehJc7OV?=
 =?us-ascii?Q?4Xyp5eIInQa300z4Ui2+G6rbwCW1eG53l6mozjW6M3FUJ24mikId/g9N0R/K?=
 =?us-ascii?Q?reGeEBcNgJe26/HO4+cbxHqZeAaK19zkSLMHIAXcLwmyBIEZ3OR5AXQQIzl6?=
 =?us-ascii?Q?qa9n4SQFUkuowhaFxyoMkAwnUMHpVbaCTOju3ulT1PtCk/IrKp5oNy61a6mw?=
 =?us-ascii?Q?BucdQ49Zxtin18Sc6JmyW9ZC+PuOACxynLSyAFL5ji3x7dT96wVe9YMldE81?=
 =?us-ascii?Q?tCrAcuVOflNl4jUQeVAEfFtMtL6eqoUZaKwO6AykeFXZioy6MHNLEvUAkXEe?=
 =?us-ascii?Q?BEiVAii4DTjFVpct6gXf3Ryil9LddunHuLGKkl6jZN1ofrgok4Czkyo2euVW?=
 =?us-ascii?Q?L0vuRHGep4aMpb4Sqfj+oTX7eDmronU5IWPIRM0sq/Mq1llcPDZUciHjypsD?=
 =?us-ascii?Q?U86nJNp/stfCoXeE191R4NuGugVJ5FfW6/iwUc1tP0BxlOohkX+RlTvB/epY?=
 =?us-ascii?Q?srfoZi2qJHqFlnS+eUgpdrBjlH6hJjt0rVu1nPGtRyraBqVafo5QJhyhm1YH?=
 =?us-ascii?Q?PBsp0hsF948iJvs0z/5bxiP64Ceh3jhzFs/9nu2qGaoeHbkdx6dvUZbgEnRl?=
 =?us-ascii?Q?S+yB2pcblLY3zl/l08Kh2QpH4Fft+/qOntDmEN0TbWGAmNsBHZelSUpK6LoG?=
 =?us-ascii?Q?xQqhDeiTTLJa5l+qP8A5+LhAKKALDQgDYQy/7sfo0byoXaucHONMdybh17ZN?=
 =?us-ascii?Q?hEEUSJ+7f0Ltao09bQYjgiKTP+8BseaESlf4s59MYKqm4/WkX8ndnlgKFkQl?=
 =?us-ascii?Q?zwKBLvYrIe8QsGFLb1bhMiy8prWWKNzjljzoc8PpIIa42OLViO1sqHApA8jM?=
 =?us-ascii?Q?cQVCeuoJOB2jn7ujsOYAU0R2Wa+64exLt2Am5bdn53KLK7lBy+aQAe0xmyxp?=
 =?us-ascii?Q?WdC5FiNMRAm8ihbkxKh33lkb/Aj7YhYbOnLFlhsfy8L5+TuXBUl78zRo1dcg?=
 =?us-ascii?Q?c4MVnv03m5GJ5TgoQ7xh9qHa712Ehj5LT3d0hRuipvyB5pYmOKee+jGhDAkP?=
 =?us-ascii?Q?P8jOo1okbkrmp1/OO4knubI8hjwAqbyioZcU2WBGXVbRyxLgRVAB6b/59Lb6?=
 =?us-ascii?Q?KN1LZ9RzrFjPTuIgu87VUDo+GKB8lcmQsBXhjH2nV58DMsb//XJszF4BubkL?=
 =?us-ascii?Q?vAHP5utL653y9mkLxUCqPNkE3fj4ng6jX8+gBv3rbWeRreUWypgOP5L8e3XV?=
 =?us-ascii?Q?Zo7Cp+a4QBiA5KSdJkAo9HLwCyXXG1IEYOFo5teYhjKs8b2m?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b64090bf-e389-4f19-d5a7-08df09d283f8
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:46:27.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKIOhABhMYDJXv458yzX6UGd6g2CqzeKr5tJvLfaHwCpRK63kTODdzR6rRASkvnj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB600424

On Thu, Sep 03, 2026 at 08:05:40PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Thu, Sep 03, 2026 at 02:22:51PM +0530, Aneesh Kumar K.V wrote:
> >
> >> I have updated the bus to match devices using func_id.
> >
> > Did you have any thoughts on how to handle ARM's versioning scheme
> > too?
> >
> > I'm not sure what the rules are but it seems like if the major changes
> > then the API is incompatible? So shouldn't every driver advertise a
> > supported major, and the major be in the modalias and checked by match
> > too?
> 
> I expect a single driver to handle the RSI features and determine the
> version range it supports. I don't think we want multiple drivers, each
> handling a different major version of the RMM release. 

I thought the plan was we are only going to support RMM V2 and there
will, never, ever be a V3. :) So RMM is maybe a bit different..

> Given that, wouldn't it be sufficient for the driver's probe routine
> to check the supported version range and return -ENODEV if it is
> unsupported?

It is sufficient, but is that what you want? Every driver needs to
manually check these version things, do they? Do we want this
duplication? Missing a check means FW upgrades might become Linux
breaking.

Jason
