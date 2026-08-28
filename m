Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010003.outbound.protection.outlook.com [52.101.61.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E882244A417
	for <linux-coco@lists.linux.dev>; Fri, 28 Aug 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787945688; cv=fail; b=THileRZ74nS8mpiTDdmjGiSt1TXKu6c0oKnwiR8pUgumTmVwIVdJ56CjVlLROPwAQPiWZDynpLVlRon5/yj0842UNVhSbN8T0yo5j0I2XP0Jeez7xZgvA6bGqZP17+1P84NYcH2SrFP1yS85ViXvKKReGwYzSs32ArVDLTKDxrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787945688; c=relaxed/simple;
	bh=eeAJ4FS/IEIJbfEzfOWxx87pZPoB43bfAIz7nx8QeC4=;
	h=Content-Type:Subject:From:To:Cc:In-Reply-To:References:Date:
	 Message-Id:MIME-Version; b=STGoo92oY0Y9yO4Px4NIJ76RuLQuv/OWvxucfqlQejFqVovRVocIVYb3PeM736LZ9Z1p1yiFUNf5cMunIX/HBPEVBX2FlApxcc0KSgafBCJCm54MOV4TRkaXIArY6Kt0aReGBRthGV3KU2DKY1J+up/k5fYxdaJ5FbvMmc+IjkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uq4dPLUw; arc=fail smtp.client-ip=52.101.61.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uq4dPLUw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoxQy8AzWFwueHqSjyOMn8vISCnkS2+lKl6YWvRBUfJSPRr3VqAMhXFC2/800XF09wG40PvKAsPS2mYX7RBlYKYzzGNnYiw4psYVBkDdH2Lh+PE5pYTupN5mNclLzyE4oVZdUy/FISm/z7bEiL/Mu/aSvfZZbyezl14TfZbbUGiqikGT7xdGGQ3L9Gb3dcC8ALk6rq4O4vkvrO2B3UaAUyb4eO5akQjwzM8JBKokftRxXpbPHFwq9Yh9fsvxTiyRUgwm/tsryj7D8a08gl8HkTprtmBEtQ1PH7ZLInd8rE/VlJrCn/UIN3D9X+7nAdj3buN9+WraovVzkXh2S3adVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oy/hILovEbCFlJCkUIsfKNif3xxLMuJmeuuf5zSZLCw=;
 b=udd1Nq6SRpgeCigTpcJ+jRQ2kG+ZU5wvJ60En+uZatqkWLEOl5o7Wzoj7bEO/BjKBkolfQYiLvhfkOpAOaAaeVc0cEMUfggJzW1VNuK7VA4fSg3pHtgcowlF/ZTa2+Z9vsrzfX+RxY2dEI8G91H/RzQ1CD9lPzVDb7bevebpx9XwSjk/jAw0VOuEOItMN0OLM4Le4ZvQN09MXT4/n6EZyqa7innpz1vYMPNlVjWSOe8tnpxJFbho1j8wV0UuGG8eZzFtBNwRB9/ZIUo3w2Lwo6UBVLs7JWz4bzJkn5hpVJlJqr9TQkTaBUWW4l9REBiPQ1zVtZP3nn3BgIn51hqSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy/hILovEbCFlJCkUIsfKNif3xxLMuJmeuuf5zSZLCw=;
 b=uq4dPLUwUN27EPbPpz4vs6bNFA6x3s6QPKqXCDkjuLj3dyJxu4YGx/UVGOs7qF2q18iHGpkxDvYxiRmAtDqE9ReehBjSmOInd8uLZVnLKMzgBy5wEFL2DQlmNv9mct2Dx2uBEpK4eCXuZZm2H2GdwCXHcuj1vUuEBz3Qcnn8X5M+81zqOtdVMbw2s8Gs7U8LYZb/Nb21ZVTV+nYfhVb38LMT5gqBBTy1HkQlMVQg38yOqhpxIc1b5UesFKluiDAM4ic0ks4nhxwQYThnUQ859wXQ6A6thUlq2yGGb+zkCcFGDx3YLdBdGA8OECTmrUW10y1j9KgA4qcA66FrXoGLJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CY3PR12MB9608.namprd12.prod.outlook.com (2603:10b6:930:102::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 19:34:42 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 19:34:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>, 
 Suzuki K Poulose <Suzuki.Poulose@arm.com>, 
 Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260805063255.1638614-6-aneesh.kumar@kernel.org>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-6-aneesh.kumar@kernel.org>
Date: Fri, 28 Aug 2026 16:34:37 -0300
Message-Id: <178794567779.4159892.13554089762527571548.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BLAPR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:208:32f::25) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CY3PR12MB9608:EE_
X-MS-Office365-Filtering-Correlation-Id: 190817a1-7cfc-4d40-df46-08df053b673e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	792OCHQ2C39PBtEYTwTxbNUzR2Kz2LT0zvobt93kuWUMDEcp7L7zP1Wfm3uAyujgc2/EZqVFOwVqqGmV9R54qoEnM7cMpMZI96UwRJPpJQFkpbUlzG+toIGKPlFcKQuEIt/XnJAEMuF39BJnQlkfRLvAKSUBixl/aml132bNahrjUPOKHh/lnp/0FUI09T/FADffS0u1G2/srPXVES7rbyYlaXzBgQ7SOaTlhi58qPlUJpAGJGt+R9P0XbBu7aAteRIA5MfQbEAxT2QCDrHKmIQrb1C8Ba9MgqAkFT6225q3Z6DeFq3ztIOgqdwrfb3V3TU7oOPT7s+kceqM8yIdnFGjr5KYcR2Gb0Clo7Bopx3ayA1Jbja28AdPpr/oTHeJu13OhckED9kBZw1hr5Q0f3H20l/OyVi1aH389McHjr6u5QVdM/eltj64OzBLxaB8N+/f/CjWasI6WCmB0jnkd5wrvO1zSqtcvVGPIsH09shA5RjYZgv1qk5b06QtbhFGKk+Y6CS+IqipnObYIWeGbBghysEp+EOGiyvLA56JnqIr33IffywcWsXxgtiY4nhwGG7LEuffb56IT+M4A6EEXrluHw4lGith5Yml0gN7gpZJOYWUZH+4ws7q+vSHIWWPE4rMhJDyUuf8A9K4s7+9AL8Nf2J782hq9Rzw1tj5E1A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THNjZjc4aGk0RjhjVVA4V0JtQ2FYWlJxcnBxRldqamgxRHpVNmRmSllWNW11?=
 =?utf-8?B?S0I4anc1R0Z5OFNRZDQ0c055ZWFNY215SzRQQmwvUXlYVjJ1ZHQxclBzNDk0?=
 =?utf-8?B?OXpFaStFZFR6bVN2cy9PMDFwRCtDc0FxUWVpMCtPSDRBY3hQYlprZ20rK0Vk?=
 =?utf-8?B?ZEZiRUxQblJNckdFZCt1c3hHdXlZUWNVQ3p1L0NycmJCSlhnclZqUmhseDh4?=
 =?utf-8?B?OWFuRmNYOFhRZm9qb2xHUXA3U0ptOHUwaVF0Z0pSVkFFNk4zMW4zQitwdnhP?=
 =?utf-8?B?djErN0M5MVdQVzdDRDV1WWw4VG93ZVhWSlRWci9ORjN1T1pBSGNCa2cyVmZp?=
 =?utf-8?B?Q0NsQS9ScWN4Mk53dzZrK0lrcUp4eTJoU1g3ZGsrV0p0VG8xMmtGUHkwMmNh?=
 =?utf-8?B?RVg1NFBFeEEvZldrclVrSkpVNjdQZGFVZDYzL2ZlZHZNcEU3UXR4SFpuZHZM?=
 =?utf-8?B?WEZTVFVUT044ejlwdW1sS0JibHRNNXlRdFdkQWI0NUNrMzlWS0VJbjIzb3FR?=
 =?utf-8?B?Q21xeFpEVEFhNXFGQWF1QnNNcjRLeG9jclJhd094ZzlWdEI5RElaaG9aMU1K?=
 =?utf-8?B?OXFTWk84eUp5UnZwd0o5L21Qc2wxb2k1azJWWDJzTzFQUGF4em9LMEdqZnk1?=
 =?utf-8?B?cHFsaEpmVm42aGNxbUdnbzhONWxZMlpoS1MweGRwR3BIQUt3ZExFRDE1N2FK?=
 =?utf-8?B?SlltUVVlRHQrcW5Memc2YTd5YStlVWp0aUM4VlpJbHQ1SkZvblZMNm9oYlVq?=
 =?utf-8?B?dGRzaDNGSTFleEJXVWNLVldmZ1FzdTJKbGpIbGVjbUhBMUpuT25wQmljYmRa?=
 =?utf-8?B?RXdHSC9JM01LdHI0Uy9lcGE4SGl0Q3RXOTRNNVBCQnVVWW1tNFRGdU5mKzhk?=
 =?utf-8?B?VmhKTk9UNmgzK3prN0g0YUJoeFpkMDhwZEdiRXI0d2pIRjNSTGJKWVRWTk5k?=
 =?utf-8?B?NjZ0WU9Sc1JpOFRlZVdWWHFIbndKejVsRXVvbnJ3MFVYOGtPeFh4c2E1WDBa?=
 =?utf-8?B?dUxoOFFFRDF0NnF6OGVpa0FxTEw4V0U1ZDFpZGVrU0MvdkxDcTVKb05SeEZZ?=
 =?utf-8?B?WmZma0o0bmlPUnlQM1QzUjdycHkwR2JUY1h5cUw5T1p0Y2ROdTJVWElXZHlL?=
 =?utf-8?B?SDdmRVI1dEEwMllQV3d6WHdYdWlON2dENnBPcjFnSml2SEgvUXVkMEFzRXBs?=
 =?utf-8?B?d2dBajVBS2J3Z3YxTXFiQlArVmVnSVBpb04vOXBSa29ieDdGL0UvL3ZDRlhy?=
 =?utf-8?B?YkhNVmFLT3R3UmZzUm9admhQUHBjMkJsK3Y0OXJDNHRrbGR4NWtielNXbGFv?=
 =?utf-8?B?RG44OEtoZENDV0xnYjhCNWNKRGlKYWdLYVc3b0dZNDdWeVkvdWl0WnB5a2p5?=
 =?utf-8?B?NjZ1VFhsL2dkRklINERkRjlQK01QYURHZXVHb1daZGJIRlVYY1VWRU80MUJv?=
 =?utf-8?B?TkR3NkhaZGd0WEU0Mmp1NFpCdUhtS1J3Qk1JaVFpYXBzblgxU3RkT0hPSzd1?=
 =?utf-8?B?bUNla2dJdXozVTBZbXJDb3pTUEZmMjQ4WHQzQVpSV1JURlBJN25WU0EvNUJO?=
 =?utf-8?B?TGR3TkZ3UDh6SWsyZXlOaVorbFRDZ0xPeHkrM0lNa0gxdnBwam02NmNLRDBM?=
 =?utf-8?B?dFFMOCthR2hWNFo5VHVZZHRsMGNkUkdMTG1sVEdQUVhnSmxxM3ZYSmwyaHlh?=
 =?utf-8?B?Y1JWbzZENjYxL2Vxekc2NlZsZzA2bHc3VXNGemVRd2dMZmVMSlhUVXlxcWxH?=
 =?utf-8?B?cXcxTURwRnBlMWZnUU85QXd3eUxQOGFnd1NpZHJlYVg5L0x5Sk1MbVJqQWY4?=
 =?utf-8?B?NXVQcU1FczBMTmRCeFNESEZ5dGtaeEQ1S1Q4aDBJeU1sdk15TjBwK1dDUnhr?=
 =?utf-8?B?dVdzREtIbEtZQkFUczhzSzl6SDJ0TFBQREY4aC9ZYk1EZ09CWkUwdkdDdEFl?=
 =?utf-8?B?VEducndxbTc2TUhkcXE0M2traVFzaXhWOGRad2YxUDlISXhFNzBVQXZXbDht?=
 =?utf-8?B?eko3UlpvTXM4R3pQckhVdTNFSGk3cmpqdVBZOEVtUFkwdUxwcHZZY3B4U2pK?=
 =?utf-8?B?WllpS0dPNE5mUTc5YmdLVzlvL01FL1M5eitjbGxpcHhGNURFN1dmRXRNTjA3?=
 =?utf-8?B?akYzNGN0Uk9zZWd0ZWs4L3YvZlFhaEdTRjcrazRMOW1oajBFRHZYYmcwYndh?=
 =?utf-8?B?dUJtRzZMam81eGxtQ0k2TUc5cFQ1ZTVtaDN0elQ1MGtKVHVHNFJkSHRlT0ZL?=
 =?utf-8?B?WkFPTTlLeUJsb2NEbU5yNjhqVEpLU3BZL25aOUExRlVHTEdVMnR0eEVDTURs?=
 =?utf-8?Q?7qFVRh+vSzSjl3E/st?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 190817a1-7cfc-4d40-df46-08df053b673e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:34:41.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IntYaQ9+NErSSBqJoGxA2FFa+OClX9PjebaMnD0wM0HH4A9zFne5zXBdaC4XmbNB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9608

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to arm-cca.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.

That's pretty confusing, the module is called arm-cc-guest.ko but it
has host items too?

I would have more expected the module to be named arm-cca and this
file to be guest and a future file to be host or something like that?

It is annoying to change module names but we do it, and I think it
should be no problem in this case since there are no users..

But maybe this patch should be in another series..

-- 
Jason
