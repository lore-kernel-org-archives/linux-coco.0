Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012063.outbound.protection.outlook.com [52.101.48.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACA332EB8
	for <linux-coco@lists.linux.dev>; Thu, 18 Dec 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766094066; cv=fail; b=Je+zFpiqxvUuyDBHdD2JAdZ+fApHGr5gzfWJgdwO0h4t4HvTYPmpWvJrefoJB3qJftK2eqQvNXam92Z036LMoDpzvUeIg3Mq0nd1chdCA/88btwlzoihh/b+pNb6xH2g/NhQTRK3olnFZWL/cRv3lnAXmFCQjNgHgRHHG56QxBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766094066; c=relaxed/simple;
	bh=dbkJUVZqCEHEQeCGowIIkFwvFXwNr10fxyHvv2oxOnw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=flNYJAvyJN4OKIXC3H+9Zzt+bMYI0bscSWoNoijjKXkl2DUq5V4dFhVrT3U02vkB9h/3jbxYlb2Zb9OBWL3jrBllnEAdnDCKg+UdCy9vkXi02g58PUH2CApuAj2m0kBX+ZlE+skc6eh5EEXrHZBrz8AxBw/pegGBUPOcUTBsqhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QaJswe7Z; arc=fail smtp.client-ip=52.101.48.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QaJswe7Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7xeH+Ub4EBDk3ETEGDas9VzqW5sYR66Z3Z1SJKPprHOM3Cswi4Nhx/NsXAKsE8BBABdq7/+KY7uBZMmpDdgUVuEqEGvmPrY4ivCzLJPb//bALQNI+2HkaX/h8zG4UNv3LBgDThT2jXWE/dQFsu3vc1TW70ZcOTHOZjTmntp7WAcA3PdtQXzLb7HlApXApiJOlscihS1aVDgO/yZBEJC4R11n7Q/hcNXLFF+pHYLrHHM0HywCcifmAiYlKaq0s3tX3i1WGwg5ZlGRSCkWWHCYZwQ/T5dBmnW7kbMx2LWnyA3bMy0e0mLQAyaQWuHlpUcHtqNSmf4bycNMpE1IQuQRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJovfciqZC4fnw2SQQvEi1NZ/2X8DS/IiFuMhq1iwVk=;
 b=DLGDPI3eBhu8/cmS+rm0tOyIiQZyYST6tMoT0o+vkj2tax6tITvv8ZJIc59RSkci1zAb9lO8Wd1gYtULK9bujQ3U8qyAsXwwvAJbNRsTezyDRZs4ysHsvwoT9FHwor7zTCttZ/gv47mo/WO8X6EPMQH3XBjQ341m9tmg1IzQwZpG4+0zySqdLeDrfD2f51m0NYJrsaOO0niyVQZlEGZx5cVr07IFp2GtgMUI5vkAOnjZduzIBAdrMtwllTX9IVMo6CgMFGjlu53sLNLH0jw0zNP/5HPy9Oo0z1UT8OdpEmSVbx8nmQka7+yt8lukwAWt8VfiRf+Wla+pRpI5bsxnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJovfciqZC4fnw2SQQvEi1NZ/2X8DS/IiFuMhq1iwVk=;
 b=QaJswe7ZlKt2g61PsNXuxLETWioq8OsW7lqO63qPPtfuVSrhmpVatcG/pn/YnzuMQzuJ3v4YnPJeahWwsPErSuraYwjY03TSowQqSakKBFtNuPCP9RLDjiUVWAKB6tUHVWpfXEtDQJ1/8mw7OHESDcVdWuh9yk6A4dP5P6rnWaB4ja8xxUGG41siQZ3QAbo2ZQfxTP1B4eUhk9AGfSBDki5c+QaIDjx0IEjkzlJ7AuBXqHsr14nR8rgFA39LdmnVITFmR+dHSp1RRYXR7nH1v6xJ6aaQSgW4dkoZHmLXxT6jj2KI6k52x2pS1GpxsF0k3iOHpeWbbeCBAQ8Hl4kmiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.8; Thu, 18 Dec 2025 21:40:54 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 21:40:54 +0000
Message-ID: <850dc718-0268-43e5-81cd-2d9d2ec77327@nvidia.com>
Date: Thu, 18 Dec 2025 13:40:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] firmware: smccc: lfa: refresh fw details
To: Matt Ochs <mochs@nvidia.com>
Cc: "salman.nabi@arm.com" <salman.nabi@arm.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "andre.przywara@arm.com" <andre.przywara@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Varun Wadekar <vwadekar@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Vikram Sethi
 <vsethi@nvidia.com>, "linux-coco@lists.linux.dev"
 <linux-coco@lists.linux.dev>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "chao.gao@intel.com" <chao.gao@intel.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-6-vvidwans@nvidia.com>
 <44635975-326C-4DD2-BCEC-EB04188E954A@nvidia.com>
Content-Language: en-US
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <44635975-326C-4DD2-BCEC-EB04188E954A@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0077.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::22) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: 754684ca-12b7-431b-4e48-08de3e7e1ecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU9STG5YTUl4T2hGcVNFb2NtVlRybG8xS3FnVkxUZFQ4Z1dscXUwVWkxajRN?=
 =?utf-8?B?MUlnOEVxeWN3RTNjL2VpMFpiZmxOdFF3R3hqcDBQNUZLbDJRVVJMRDlBSzZ4?=
 =?utf-8?B?ZjBkc2QrZW16L015TVFGNS8rWUpQZ01GVUpsVDhUTE1tY2Q2cWtHOUtkT3pw?=
 =?utf-8?B?VjY0UWZXeUl3NlhqTkEwaUJuNER0b3hPMW1pQlh3SW91R1R5bVVBV1c3WWgw?=
 =?utf-8?B?WHFhU2p6MjVDKzY4bTBUTVh6V0lMVG81cW84QitsWWNZWTd5dHc3QzFhM3Zj?=
 =?utf-8?B?OVpUdHdPZXVKZW1FYjM0TnM0TDVvL1NEajR6Y3pKRXJTMkxRWU04TTRtRzRD?=
 =?utf-8?B?Q28yVGsvN0h6dDMzNTA2d0ZlajcxRVNtWFgzNnpqNE40Rm9PcnRQWVFaU2dv?=
 =?utf-8?B?aHdJY2RPQmJzTXdHS1hsUEtDZ2t3bkhJSGZMbEk4Z2FPVlpzYlB6UHpwanJD?=
 =?utf-8?B?bkxPOTJPM1ZXVHZ1SUE1T2FMYzhHVGlBV3B4QnJ2bUExdGpXQ25jTHFpNlY0?=
 =?utf-8?B?TldFTzlsaG1pRHFyeTNuaUpFVzBxR2xpcW9reXlocnpiNDl2QmM4UHhabklE?=
 =?utf-8?B?eG9jL0JSS3k4aGNkOVluMGJrd1lTYkx2NG8yODI4a2Z6OE95TjZCV3RqZkZI?=
 =?utf-8?B?OFJXMnV6cGpwZFEzdG9pRHlJNmt4TmFFTUhPMkR0dEFIUE1TN0NVU0FLaU0z?=
 =?utf-8?B?UTRQWFZZUXNmbHB4TnE4WXZJSWh2YVRabDcrM1FIbjNwcDF2SENKRzRaSTg0?=
 =?utf-8?B?R1ZvdWtNQzBrWld4U2tIek5YN1lLcnphRytkRElJMUY1SlJiMzgzZTZsZnJn?=
 =?utf-8?B?TTg0RmM3VkdtN0o5T1dxdDlTSG9tZEZka3FGajhYUGJIM2hFYVpFRWZIVVJS?=
 =?utf-8?B?MVZ2b1RnYTJKQVdvOGtJenVTMU4wbjRGaExCQ05WcVQzaVZWMjBhV1czSHBK?=
 =?utf-8?B?K01HZkFKSmZhR1k4c05HRjMxa0krVVRXZlNUVmhtMzVWYTN5ajhCWk9GLzRk?=
 =?utf-8?B?UU1YZnJYSURwVElsUUs3WTQzZ1o1UkhhSlprL3V6R1hFRXhpTkFOanhQOWtI?=
 =?utf-8?B?T3lLMG1udkpiN0pLZlkvY2k4NEFLOGU1NjU5d0x1REpoSCtSTHEva0xLZmFN?=
 =?utf-8?B?My9XcUVZa25raXY2bmJoY2VQUzRMWkErVGQyUy9NclFXNklITnhiK2szcFIv?=
 =?utf-8?B?UlZBUXJxbzBTMG1rMlhOd2JhbHdmaXpHNm50Y1djeWtLUUJINmw5R3orS0Z1?=
 =?utf-8?B?Q3lPZDdNM1VVbWhKVHAvNUo5NStpTGR6YjBMTVUzVGNlcDFwNWxwbFN5NFZ0?=
 =?utf-8?B?NlhMVDdBSW93VU1wSnFZdFpvRVA2SnNnV0h0dDUyN1BYR1VwaURmeDE1Y21l?=
 =?utf-8?B?UnBTLzU0U0QwWGF0MlZLc0ZuOEZFa2txSXFPRHNJdE9qYlp4MDhXSjNNOWFW?=
 =?utf-8?B?VXRwK2s4L2kxaGZRUzYxajBuOUhTSlBqTHA1NHFlNFFXVGZqaXJQeGxsZ2pR?=
 =?utf-8?B?RERoYWlWc3RQMVA5WHMzcW5iYmd3V0tYbG5VRUMzQUpHK1NOaER4QzA0TWYy?=
 =?utf-8?B?cVF5UWF0ZWQ1SUJwcjBQVzFjSkFGcnNUZkJ0KysyTDJHNUNTWjhXV2NpVU1W?=
 =?utf-8?B?bkI2RTM3MHdydWl6YW9OZkxhaHVlTVRqVDB3a2hmMzR4eVNUOXY4Tm1Tb1VE?=
 =?utf-8?B?Yk5PMHpaUVUrNUdOdldyNm43TklZbmkwSVYrOG8wemFKQStXWjhVUDVFck50?=
 =?utf-8?B?aGxUSWhBeG9MaU1mYzYzUDhoeXJnUE4zSmxpT1JZb211MmkvVUp5bkJ5SmNs?=
 =?utf-8?B?bThQcU05NzNmdDRIUGJEMW15d3h4VnNWQWp5OVFCZXhtbm9OTkc4SFd6LzNa?=
 =?utf-8?B?Y0dUaDFvKzhNc010ZXpubUhsa0hybGhLUWpJbnhnemF6MmlrSzd2MDE4cCtG?=
 =?utf-8?Q?3E7t5YCLZVALh4mTp2XW2Fjr21MsfUQx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFRDSWNuVUxKQ3lvTjBHVDRDOG4wa0hsZkZqcDlsRTVqQUZockZhTUFMeHUy?=
 =?utf-8?B?MFl0aTFHOGVoazZXczUzc0xwWEVOZWhWZ0gxdTRheVFGM1RCZG1ZcDgzbVFK?=
 =?utf-8?B?TTlaQWI4KzUxVEorNHgyZTF1L3dIZkN6NW9oNnhHdTcyc3RCSHhJazBpM3ZC?=
 =?utf-8?B?cHRWdjlxUTRSUkU3bkh6TzFKQ2YreW10SzZRNi9NNUFuNGJpd0tzMm05TDc0?=
 =?utf-8?B?ODRQRndrTC9Lb0gvU3h5eERhSXVnQUZ6cFpVQ2d0Q0EzNDA0QVNoTkpGU3JD?=
 =?utf-8?B?a1ZiYUM3VFdxTDZ5YXpOMzZSd0R0UkIybjhUQlN2cCthZHZSUWtqMnNPa1JE?=
 =?utf-8?B?MXJJd3htQjBHWWUwUXJzbzVicEVyNTNFbGhFSnJYNnhWaFFsNHZWUnlnTFhK?=
 =?utf-8?B?cEZxdDlKRFlsY2tvSWZta3V6V1BFYzVwNGwxUWJ2ZDVHOVRNL0xaSFFFdCta?=
 =?utf-8?B?dzgxbXlFWFMyR1dRS3I2VEtEU0lXWW5YQWpqNm02ZWxxMjRoMzdpQzJsdll0?=
 =?utf-8?B?ejNKRjVLMW9FelhXSnR3bFE0L1MwUEtZbWw4aGExMVl6UTJHZ05BKzZsS2pY?=
 =?utf-8?B?QUdnVUZnaENzVkhSL0djdk1hWDBUSkl4WkRZTC9PYUNkamRzK1NPaFdTcmtP?=
 =?utf-8?B?NnVwd1ppRFF6NEwyajVuZGNnL0xjbWxLTmxMZktoUlI4am1PSGxOTkFnY0hx?=
 =?utf-8?B?b2xmQWVpTkU3ei9qWThJUGlrU1Y5ekdCajNqUW9ZbzZQM0p4STdZZllVeFNT?=
 =?utf-8?B?bElQZnNnNUtWNjFoVDNwVHdQaExGR2s3YWZRa3FFL3E3S3YxUFRCVWw2NW1t?=
 =?utf-8?B?ZzhZVGphTXY2bWlBeFlzTXlLT0JPZSt3WWRpVTFWR1YwSjVtTThXV1dldkRw?=
 =?utf-8?B?SG9wTFoycCtuZUpWYWhzSjBzR01DRmh3WGlVdTMyRlRQd1JsdlRVTFlUMHhC?=
 =?utf-8?B?L3pUTzVzdmkxNHN0WnB2YjBkaFA2ZEpDdk9HcTNTREhRakh0RGJBdWFFS1Ay?=
 =?utf-8?B?ZHZTWStUbzZrVG1hZ3RvUkw2L1RXeGMyQitscW1GMGRmQlJXTlZ2dXk5YVdY?=
 =?utf-8?B?YVplVWNVcFdNZXZOS3d6aURLT1BNeklabjVCOUlQTnY1N0oxeTZmaDhNT25U?=
 =?utf-8?B?YWdjeGk4OXN4VE80dkIxdkpwais4cVhTV0Jnd2ZtYTcyV1JmSWZ1TTJRdmhD?=
 =?utf-8?B?SlZXTGJjbThETGJWY0RUYzRrNEFUTUNweXExVVhIcit0RWJaZXBDV2dNRE1i?=
 =?utf-8?B?N2RDaVFrb0hMQUNOcHdUbTJRSldXTlFyM2VGZUhhbDVuSDRjL25GYzZRZVdz?=
 =?utf-8?B?aUExQnV5NXY0eEJ6YXN0Ujk0dG1CTldrRGJpdzNRV1F2U0VaaGJiT2xZQmtz?=
 =?utf-8?B?ZTFkQWhrTmNDNjV0UkZwanB3VDFudzhxRmYrWVRrb2E2T0xuRFNxODNOTitn?=
 =?utf-8?B?Q1FNQ3lKc2RDSGdoKzB5TnE2Zjg2akdsbmdPVkxYa2ppQzFJdmgvOUR4YXQ4?=
 =?utf-8?B?QVI2Z0hOWitZVVpqTkUxZWkvWnVMLzhvb2prbHY4bWRaMENneEZIelVqbDRV?=
 =?utf-8?B?SmJsRjR0a0xzc1dtVE5mdjk3RXdyZER0cjc1OE1OL0Ntc2xDa2NXVkFteFIy?=
 =?utf-8?B?WVZjc2tpOVFqUjNrL1YzTFd6Z1hMeXQwQVJKYkZMV2xDZW1KNjAyMXFLSHhw?=
 =?utf-8?B?Yk1FT2ttUzFiaFQ0UFZ3TTZwU2JSaGpYQXZTM0JNVTFSQkdBWW5zTTlTcXhz?=
 =?utf-8?B?dEhRWEtROXRRTTEzNytIQ3p6ME94WHdNaEZrUGJTeEdmL1Q3ZDhvN3Z2VlA0?=
 =?utf-8?B?OUVzZVVvUmJiZUE4WGJXTmduVDlGUzlmUS9nL3VueTVyUnRnUnZKZ1d0UVcx?=
 =?utf-8?B?UU9qRGtiQlg4ckNXRnBSNTFZTkNTdlFYdWY0bHMxRXY2QnBud3p6dkNDM0Jj?=
 =?utf-8?B?RDZqb0szeXJpM0lTbWdRblNJL0YwSzZVa2MwR1VRdW9jVmdMa2tCMTMzS2FQ?=
 =?utf-8?B?UU5wTU1ZZWpuT3o3NUE2QzJsN2RSdkM2Y28zQllSbXRMR3JyWU5qVHptSHFO?=
 =?utf-8?B?bjFZdDRVSTRxS1NwZ0pIVnlFV0NNWkN2NXdyQVBFTm5zTzlUYnNTRmZUNnFI?=
 =?utf-8?Q?VbTUnCasqCr88fB4AeG5nPXAt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754684ca-12b7-431b-4e48-08de3e7e1ecb
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 21:40:53.9873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q21IHNJR1zbYHx6KUMRRWvDG9X6akPGFaAXDTTDGae+LRb7fVg0yLL7EECN0Xd+66ep7he5IJUUzguHlwBkSIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504



On 12/12/25 07:37, Matt Ochs wrote:
>> On Dec 8, 2025, at 16:13, Vedashree Vidwans <vvidwans@nvidia.com> wrote:
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 24916fc53420..334090708405 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
> ...
>> + /*
>> + * Pass 2:
>> + *    If current FW components number is more than previous list, add new component nodes.
>> + */
>> + for (node_idx; node_idx < num_of_components; node_idx++) {
> 
> drivers/firmware/smccc/lfa_fw.c: In function ‘update_fw_images_tree’:
> drivers/firmware/smccc/lfa_fw.c:554:9: warning: statement with no effect [-Wunused-value]
>    554 |         for (node_idx; node_idx < num_of_components; node_idx++) {
>        |         ^~~
> 
> Please drop “node_idx” from the initializer statement.
> 
Thank you, I will include this change in next update.

Veda
