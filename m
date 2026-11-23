Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795441022;
	b=rB2NmLzd4dEcb9puH5SazqXMw9O1g6jfYZYG64RWkyon10yz5ijESsJ6feqIjyZv4K4x
	 bXXrhO9Rs+yUGp8ht3sRpDY1a3mpugV2JQEINLi1YnbM/FGCoQuZ/xIaLfX6BRz3QZQan
	 ePY03lWRVioYr5yJLgUwRQ36yBgbiDdZfJ2pr7ldIA+2lH/ESXrYh7mkiNaOST3qIrn3H
	 rZoyIWC839M0dPNoD0lJNMZSZAsZwm19hV9MilWFxT1R+FYU8a09nkQwxT8+qc0sVuDwa
	 g/e3C+HUnSwrQhjYjeYcxfB4SY7PHmi/dpyXFDG58uTaXPByHNzxsXNCsWyP+/gFnBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441022;
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
	bh=nRpiPDBOMluep3phhROg/g+DLaK29Ci9fRjOAk1Y+Xg=;
	b=UIJGhZPrgRjCD6ra8Fbkyaszb6hnPcIOtCQkn9YWi3o0+ZFZpkFbeq90VHLBszkzGVgy
	 N4w/yC1h1zFq336aQYQV/BhoKwfmIgldARAvIJq1Jlg+2jB+6PGFpNEuQOsxfGA0WI2He
	 v07A8B6+vcKmNesYqlW8JAj0ZgbYHWwXLo+H2abWZ9Uc4bnHPXYfKQg5CjBCbgEkN5U3P
	 VX2BEFhiWJv/ob9A7s0TuKtfASGO+Mg3DFY96UCG/JBSWxqrv5Z7SCJMmWGXYG+utt1rF
	 vIDGE+QqhdDNYL3oCAjWPZ/hDdvSFgmcNthBXA583WG7ueXg8USZYAJGfhT23ZHGtgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fzAs1kyl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.9
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013009.outbound.protection.outlook.com [40.93.196.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52A2606A696
	for <linux-coco@lists.linux.dev>; Mon, 23 Nov 2026 13:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A52A2606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fzAs1kyl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0yPi1U57LS8/0eb7aR+xZmQOBI8lfr3ticGphw1FDqF11C94g1PKyy/jMEG/HvQPEUbU0hDbPORbZ0br7Qnp4RAZyKxo6bBFfrd0e8p2YeAfOsCWWry5zpeFGwyR4VwtWRoukjCzMcfHqOV0wzmwbXz1uefJxhnkKqeTgNrGM4KFvIjHuU6Ht+f82SNtBO3oXb5HvOeCy6mkVeOXZH/jXSa2F2xJywHwCrG/r+J4yqoUPkJfJiCznMwtueHwgV8zPPxSPkRFWdfQHqifnYkWfVvSmBKQI42bv2sSvUrTT/emo8euEfMW+jvlJ7U76YlUQnS4RQgSLqiGEV4PpYdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRpiPDBOMluep3phhROg/g+DLaK29Ci9fRjOAk1Y+Xg=;
 b=GDov7/xHkOf7FPQskLxesSbgmBu3nNbe8MExA+y8y765xef1BqOewY8O6DYfy2oSEY/aVuz7Bx5ravU6hoAlvpoZRh2Oia9whlCwnvu/qy2KvUj72yzkHATrP40lVvr4PM/OP/aTALaHdONEia8dCyc0SjN9VbSFNNZQPXvGNy9X/GmXgiwtXMbWgnsWnEIIY0QmvTtK4G10fWd8nJkNuRFcPtyGqCsBs4tlIdCnWLgW7nT9H9Vmjjz2CCjVgloXic9wRCDZ/wsuPbjRbtXpwyovPs3TFMNocotAGCU83dfbr8KEKGu6LX4edK3dttPXoCa8ldUo5q3eNOwE+Fl4kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRpiPDBOMluep3phhROg/g+DLaK29Ci9fRjOAk1Y+Xg=;
 b=fzAs1kylEgLzA6nF+AHekDXt9G+PvO4EXbJrGiGb145EVnAHpsWKJwf3j8FINe0g4XNkKaxnZv33wy3AFhvJI2C9ZWIy3hVB1hQCZJsDJwMHWDNwZLUPxjuk5pZIZZi7yJPGqgyAglkLjMReG2YbxKc8eLqKk+lJAUatF4FuggrcNwUNM7lCiZExJv/bSibtFUA4uHhCcO1bwhaCdf2AdMN2nyl2YJ1Y+LQ5nPgi5mnOyWYFStVkIyHeXRUefQInJ5dPb6JW5BBZ1YVbT2+HzUBTXG71b1KFQ1HsLRxmONPT0RwKbdO+BHrpLCApYVNZaiDuLzvbxUULxQpA78y4/g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by DS2PR12MB464888.namprd12.prod.outlook.com
 (2603:10b6:8:359::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 13:36:57 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 13:36:57 +0000
Date: Mon, 23 Nov 2026 09:36:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Lukas Wunner <lukas@wunner.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update TSM file coverage and repository
Message-ID: <20261123133656.GB178955@nvidia.com>
References: <20261116075420.76205-1-aneesh.kumar@kernel.org>
 <d3ddb1a9-51d5-474c-8dd1-b52865b880ba@amd.com>
 <yq5ay0anwv7z.fsf@kernel.org>
 <20261120140412.GW2245175@nvidia.com>
 <yq5aa4mzrjdp.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aa4mzrjdp.fsf@kernel.org>
X-ClientProxiedBy: MN0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:208:52f::10) To CHBPR12MB731189.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|DS2PR12MB464888:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a7b3b05-c21d-4e82-6846-08df4966d85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|261009223027099003|261022105027099003|261026140227099003|261026121527099003|261022075727099003|261028144727099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	gsfuqZ0ENVWnJ7UlwiuqrMqXRJX/zxzZUcwgGUgqOXu+8OaORlJFSYmczo9WWeMusxTWgr5BXvA3HtlKs8/8kxYwxkYmjtSETrG9apMGeklxgzGjSIeUSgi6lgmBmSzxRzy5PPsnKQvCR7vRG0ca/W6qV67OXxXbmqrVq/nvX1HOI6fwLl/o4VhMEqyctNIC+8tiHbbAD6YllnMCeBbSY6gQtmug+BiXWpyijq36Vrbh6LR6W55IT9huwLty3L1YoBQ2A+QAuznwlUDDCXmXloKTu6PSkeAxiuLiZQk5QehTSuBBDhnJOiO6rStc0tZA0g289Nj7x5Z1jjmcaC2gP/9fmrx82IwYN3IVVmCX9wIeJxDnofdQVieXIOsIisn566jeuY/6ve/C7cIZvBs4cYbLxsMDjRoB5QbfZxevuG6Mid3mDa9IvkXRpe3pyicnnmNsqGl8bVKzHZvbaUvx8+YtWQZ7q9fOwGmr2UzizgNqHePlhQUWa8fduGfm+v2q5KkWNA7G1Z4MLijltmx2I7pMfYae42gk3KOssTnxnLf6dUxSGVesiaKfjOQlQVSBkk10Y7+D3IXL9C7CZqpK3Xq2GuFXXH1NunXNMn3/GOZmSHlKJQVpzk01HPffbxfuTq41hauZ+y/DY+cio11PVa4dzPlH8+IrIRgWSlA/Jgc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(261009223027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261022075727099003)(261028144727099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qgARt3Ir8zrHiIfrItpYUe7rEfEqYNSC+2bsBH/6OYnnBgzRNXY/a6MOrD2F?=
 =?us-ascii?Q?JGlkF6dQ7aZpd5hUB4xHVdXx4jGs5Hl0ofd5+EXBGY3RGqxtYQqENghasB0m?=
 =?us-ascii?Q?51GprkSXuxAFpd+HmhI6r45Ow4fSQWFERL7XNJ+6PJrOEvC3klRm4dIjNP9m?=
 =?us-ascii?Q?7QFbg57mcJ03BN7cA4MJJzYSBnaIiwc5Zfo14QgMGuGsD49E/iR2JpUO+0Yx?=
 =?us-ascii?Q?spWtkSQPzroybiXSkJrw/lACTZom8M6l8WRfQuvWt6TpYoh9v9UhZkqOUOCa?=
 =?us-ascii?Q?TSQ1RqGrfh4s9Q9Ym3VMaFxnbE3NY4N/Wz1+y4JKwbvj623BMYEUhRE1AAFk?=
 =?us-ascii?Q?NVOK0ynuUauMRkZ16LWNASw+ERn3K+fQXfysduD4LODSzHvQ6a0Hui9VYfN6?=
 =?us-ascii?Q?qy/Of5iqinUDMbby8KDv7+muK8RvFlhvTEb2we5/+vTEBLV7uKa1OdPGARe2?=
 =?us-ascii?Q?iA5A9xdYI3/iE7az6L4F1jKqTnF4/ijdH6NrXmxbqT3dL8RQmJfQJ/T1sMAX?=
 =?us-ascii?Q?HW5T/Slz8stj8RhNSGBhNI2BATqHGD+NflRLC+RejYI+TwxXG+ab1LLqq/JR?=
 =?us-ascii?Q?LPKNjtxI4vZKYb5efZaUVeu0zVb5zmySoiPBQYZUVeiEp0aHixwi5sCm8Nhe?=
 =?us-ascii?Q?df2uGm0950EeTC7LdPfXqtSiEsqsnGA85OR7pslCYxHZkUC7aoQe5Kd4ESK5?=
 =?us-ascii?Q?g4DCE2AcR0VEc3qJd5CrM0iiOBpQvPoeaWk2vs+D7TGNmxlqa+ETUPbX8EFe?=
 =?us-ascii?Q?LJ67NHEVMnGU07uHGZJkNWlDp3Z+pRK0Og4rb+WH7Ybmzhgiiin9sEoZiHry?=
 =?us-ascii?Q?gJpKoTm5AEiKECeh/on0hv7P9yCGiOf/qTwiQcg/9tGG5nrzCUgzGYMUcoV4?=
 =?us-ascii?Q?3q2k8f3wKQuzIzPoeLV3KWDaSx7DhcGu2BvFfE5D6CDTPr6k+dsGSEYx33vH?=
 =?us-ascii?Q?w/4cabLCiAPrGfEyWyUBQ8G2Gfc1oKdm3u9LLnQtTV+OeIcwn0qs4g2oLAuk?=
 =?us-ascii?Q?m4xu1D6J29A78IhT05UOLXJB7o8FasQx5YA0e5TP+HiyPIPC+ToRkjPYF7p9?=
 =?us-ascii?Q?cw8emEyE+duMJq71VmEd3RLuCR21FzmvSt1Dp0wxFLryhsZ80xXm+J7Cmn/e?=
 =?us-ascii?Q?Rtx5IJFv9m+m243KAHKlcD/rYXBtYGMlBkagWFGRxXiIUF9gQ4viDqawLNaG?=
 =?us-ascii?Q?vMcvJhUW92mO+CxnKMEhAil6j2kfZIcTIHe3X+UgQ1iF585gbZFkMF9dvWpw?=
 =?us-ascii?Q?0hLafvZV+BfWL3FqR1qQLtFV3EkJt5IjDqUBFAcZ4iV7gIeL/UAILciOS4LK?=
 =?us-ascii?Q?08DaLHzhiIeHm/cRjvBOF+5tH12ZCtsBoVqGElM+yILgsbx57resGu6+CWJq?=
 =?us-ascii?Q?e3xSytR0txJ6rX521q+Hj3BZB91lxMvi3vKKlNX4yBNnwrv8GPGKa9ihehR6?=
 =?us-ascii?Q?OTLWeraqtqRenK3bDKjC+I5ReqtKu9RywTAQBfplJpuNyEz97D8YZnDKhmER?=
 =?us-ascii?Q?k7mZh9Kk+xJfWhBAl37EcuV1y+6i65RKPvte4uPi7w+1JS0jHljalMT1/fMT?=
 =?us-ascii?Q?kWwDqBgPVVj87vsIgivCTpJTtsi0DB3sud+UQEbueNC/QcFPaMILW9XloqJG?=
 =?us-ascii?Q?RrGafaCDlncSc4coHcgXBVEhEb0MT7ALbrbdbB8fg0xc+lwEE5MtqS5aF/lU?=
 =?us-ascii?Q?z14heqIEYn2cIiCtialr7NAMVjPGHsEpZ126Nbwb32VvD1AR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7b3b05-c21d-4e82-6846-08df4966d85f
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:36:57.6774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Lk8/zQPjQQfIO2aeY+nyKXU/iZH+xdlSb1qL0j7rygEBW70igs8ELQ0yRbpCODQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB464888

On Mon, Nov 23, 2026 at 02:53:46PM +0530, Aneesh Kumar K.V wrote:
> >>  drivers/attestation/cca/guest/spdm.c
> >>  drivers/attestation/cca/host/spdm.c
> >>  drivers/attestation/cca/host/vdev.c
> >>  drivers/attestation/spdm/core.c
> >>  drivers/firmware/arm_rmm/da-guest-rhi.c
> >>  drivers/firmware/arm_rmm/da-guest.c
> >>  drivers/firmware/arm_rmm/da-host-stream.c
> >>  drivers/firmware/arm_rmm/da-host-vdev.c
> >>  drivers/firmware/arm_rmm/da-host.c
> >>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-realm.c
> >>  drivers/vfio/pci/vfio_pci_gmem.c
> >>  drivers/vfio/pci/vfio_pci_gmem.h
> >>  .../coco/{arm-cca-guest => arm-cca/guest}/main.c
> >>  drivers/virt/coco/arm-cca/guest/rsi-da.h
> >>  drivers/virt/coco/arm-cca/host/main.c
> >>  drivers/virt/coco/arm-cca/host/rmi-da.c
> >>  drivers/virt/coco/arm-cca/host/rmi-da.h
> >>  drivers/virt/coco/arm-cca/host/viommu.c
> >>  drivers/virt/coco/arm-cca/pci/guest-pci.c
> >>  drivers/virt/coco/arm-cca/pci/host-pci.c
> >
> > It seems okay, though I wonder what pci/host&guest-pci.c is?
> >
> The host side handles:
> 
> 1. Allocating the Root Port PDEV.

Oh? That's exciting, I didn't know we needed to do that... That's
going to need some thought.

> 2. Allocating IDE resources for an external endpoint.
> 3. Connecting the firmware stream and enabling IDE.
> 4. Using a system stream for an RcIEP, without Root Port or PCI IDE resources.
> 5. Marking PF0 ready for device assignment only after setup succeeds.

That's just the normal TSM driver, why is it seperated?

> The guest side handles:
> 
> 1. Preventing PCI driver attachment.

That's Leon's series, shouldn't be in TSM.

> 2. Comparing the current RSI device information with the report and creating MMIO descriptors from it.
> 3. Validating the mappings.
> 4. Requesting RUN and marking the device as accepted.

This also looks like normal TSM stuff, why seperated?

> Most of these are driven during evidence-accept, so the module
> dependencies are (based on lsmod):

The attestation driver should probably have a callback for its accept
operation to the TSM in some way, so we don't have this weird pci
module too.

The tsm struct should be passed in when creating the attestation
driver and it can call back through it for accept.. But I don't know
why we need to leave the 

> Host:
>   arm-cca-host.ko
>     +--> attestation-cca-host.ko
>     |      +--> arm-cca-host-pci.ko
>     |      |      `--> arm-rmm-da-host.ko
>     |      +--> arm-rmm-da-host.ko
>     |      +--> attestation-spdm.ko
>     |      `--> attestation.ko
>     +--> arm-cca-host-pci.ko
>     +--> arm-rmm-da-host.ko
>     +--> attestation-spdm.ko
>     `--> attestation.ko

The last two should be depenencies of attestation-cca-host.ko not
arm-cca-host..

> Realm guest:
>   arm-cca-guest.ko
>     +--> attestation-cca-guest.ko
>     |      +--> arm-cca-guest-pci.ko
>     |      |      `--> arm-rmm-da-guest.ko
>     |      +--> arm-rmm-da-guest.ko
>     |      +--> attestation-spdm.ko
>     |      `--> attestation.ko
>     +--> arm-cca-guest-pci.ko
>     +--> arm-rmm-da-guest.ko
>     `--> tsm_report.ko

Like this, but tsm_report should also be a dependency of
attestation-cca-guest.ko and eventually rolled into attestation.ko
> 
> Common attestation dependencies:
> 
>   attestation-spdm.ko
>     +--> attestation.ko
>     |      `--> ctlv.ko
>     `--> ctlv.ko
> 
> >
> > I kind of wish we had a directory called tsm too..
> >
> > drivers/firmware/tsm/ 

This still seems necessary.

> > Maybe?
> >
> > Can you be consistent with the cca/arm_rmm/arm-cca naming?
> >
> 
> Will name it arm_cca ? 

I'm OK but like I said it doesn't have to do anything with
confidential VMs, so RMM seems better to me.

Also it might make more sense to start with the arch name in the
directory structure. Maybe:

  attestation/arm/cca_host/
  attestation/arm/cca_guest/
  attestation/arm/firme.c

Jason
