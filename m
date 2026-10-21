Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590436;
	b=4gbKZ5pxEBe+SID/NBLqb4iSnzu/Ck9AoxFJn1cpKE9++pp3mEXLg7z5v5igUMM5hXRq
	 M73hpQ+XMFJa7MoJR1NexO0hCVprKzYeaYNmPtLEuYo+NGQ4W2ugbpdCx8pBCYe4EgZiv
	 S0zLusJ2gQkHggH+eceu566jOVQapcp4QgI2/HEXfSBcoiOP2Y2Xq/gI1/1qdTjD/jjV9
	 K8VqQJysswvAAQfC+TQBmc/hhinlGYTTeGdE33cn9sp07ExJO5AySm8pwpFNjJA24oYtr
	 s54IEzcOWetfVw6DJpKLbHWocL4V4tKZdG0oot4Q7WybIVULnNAwy5tp+TGIfoKTTuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590436;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OCgWWOgMir8H7ysibinirwS1ptOig0lTCfsoERCNXoo=;
	b=hGqwT1+miK7eepx9aXnrqpWYxN7T9D2LqU7iYBEiU/hNqqbf1wux9hdPSkzqtHWWoc4x
	 LqCu4nTp6KNQkfkLOWQ+ET6RNDVQjfT87guupOj2939r+YhQ9zvu7lbFugC+XG2HEXHqe
	 q6ECYZbpVPF5JRS4z7YTWH1UT6+eSxlJpevAikJXgrH5N5qrJs7aLpmdE1HuN/z0zMFLc
	 IXaWZQr+1pVQS0HVqzdn1F1uDIjQ4E67wu4QiCQHQgbcdRseKDdodLHIudimVrgslclaa
	 /t9P4RYMNBWupIQpihzRAjc0oCvXopVrvEK079QNP5DlZITbqiSM6LgJ9DEC3RQso6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eclDK+6y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.53
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011053.outbound.protection.outlook.com [40.93.194.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE620606A32F
	for <linux-coco@lists.linux.dev>; Wed, 21 Oct 2026 13:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE620606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=eclDK+6y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+T/I3+1h++u9MiHLSd8lO2t2Lfhf/9ErQFXJadKpb57JtNlczSGrWcF4iV100TGeYmFcxfYu/uBCNlNAaJD02Z+Rhol4vySMtlceegBxodmtSSQggZEzVPqOronSxSVeHMVSsvzGMCCBPiSRQBLmLpxdl5zHmg1G+cCNbbJsQ3oYMnuRSJQXyn5zxv6EYekubYrGjW9tbhlBOqnDEE14rpa+EIT2sJeXoSWFNsYD7UkeaYFYgnJkH05O27nuPuZTt8Eagxq6P4mDSj1q973IgDBHc1hN/k7LVWKCMkVrQ8m4D7s6ZfpJrddnrHEHdKQDY1XERsQiozpa0oUtRnfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OCgWWOgMir8H7ysibinirwS1ptOig0lTCfsoERCNXoo=;
 b=O+yQX7ANsH8fOPv8TjNlidpClVgncHjQuGcet5P2Fmt0d5xBA9gI9Ry0/hYXJvZhjv430GNWII6pvr1XYO8NacW1o/ZqTlpPGkjCrEAF2BurZnSb/Kr2r3KKTOIA1FGXwbSxQ2eLGouVVNRVuA0PItctRrEX1Aj4XGkxzDVVBk00ytpqB/EjqeSsu7imt256lLJ9WNV63BdPJqSPHjdMI6vkB5GkskkPgRR0RFmrZS6vh0iWCgRyv3mNM2Di4/NkDl0Ik9r5vBVv6u0Ku/FLvZOo/XQOVD+duDuD1l/dI4JKo+YpklzHQD1saMponKry5k+8vmJ4hrRbFkOI8xkpVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCgWWOgMir8H7ysibinirwS1ptOig0lTCfsoERCNXoo=;
 b=eclDK+6yJXUdriLgcSQAa+tnxSAJ9VZ3M98+4BbvIjxffoHlAvfj00zSd5N8E5yIeNG6bdZBww3fUWZ047CXy8WKO4FpR/VrziTbmh0XUXm4p30i/HdiFXu/PAC59jYUrZtMLRj6CaTz+ySgychfCp+MNSJdz2eLA3sKT/Nm328=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8131.namprd12.prod.outlook.com (2603:10b6:806:32d::12)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 13:41:16 +0000
Received: from SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46]) by SN7PR12MB8131.namprd12.prod.outlook.com
 ([fe80::c2dd:62c5:67fe:aa46%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:41:15 +0000
Message-ID: <3bf62eea-5ddd-4551-896c-5e95f168429c@amd.com>
Date: Wed, 21 Oct 2026 08:41:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/sev: Apply the RMP table e820 fixups before
 memblock is populated
To: Borislav Petkov <bp@alien8.de>, Ashish Kalra <Ashish.Kalra@amd.com>
Cc: tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, luto@kernel.org, peterz@infradead.org,
 ardb@kernel.org, rppt@kernel.org, akpm@linux-foundation.org, arnd@arndb.de,
 shivankg@amd.com, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev
References: <20261020202818.368416-1-Ashish.Kalra@amd.com>
 <20261021034913.GBatg2OToG0uQD7FvZ@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20261021034913.GBatg2OToG0uQD7FvZ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:610:33::22) To SN7PR12MB8131.namprd12.prod.outlook.com
 (2603:10b6:806:32d::12)
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
X-MS-TrafficTypeDiagnostic: SN7PR12MB8131:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ae6a23-95e4-4b11-15e5-08df2f78fa72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UbLMopUDN/F6J2ywbwQjwi2rQGgcUJJoAcr+Tm8CdOrNcpqtYrny311lfxr7rtkIzwMzM6ynpBIq71/lh/F+2jYUiR8WNlNazuUsku5+cIj/l5XbHpW5UpGleVWr+GqlPt6Q2C60zgvcCdGY9ac2krAD1vr4EQIyw+U8/VqlOCN+7ZG+ML5RTJ0n6//R/aUck6Cbyt7pXZY1atgJiaNDHvoVbM3AkDyOC5nxXeVdEDKfvv27vg8rW5dvQU7QtsBciEJECFrkk2zl1OROWKh6yZiPoWHtv40G6qDXuq0MhNlLGjQ/BpyTfIjv2UuSlBGdYDRcwEZBRd4XJVyuXYtZkFax82+yuweBg9aurr5sd7O6K4cm80L4pJ7GMOEbVl+a60JuBMg3pEl53OBxjf/95eiaPfMuSojltv4nTklLxGwIUtG0bjTD760rW0JzczP6oiIReV83/eHQ0QEAyc/AcSnKC6JrhhL8u5/51hM72MPUbhd3sjRB8Fnp5kk9/jXURy2e42fLs+8+8n4IQOiyDagtYqvPjs1oAvpI9o+vyJV8l8q40NuXb14IbxyUOWdxRF49HUoyvwDljzcYv4NpTjaJ6bRU8o6fUi8yn8WciK1SeFmhV3zj0sAscpm+Um88nN9leVLroN/IrsmHh5Dsm29yCydmAXiyFbQtWBzS87k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8131.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEpIbjJCZkZ3dVhFaE84Ty9rbmlaUUZRSk1vWDZkd3VMQlFCbzNyZmdrdzAx?=
 =?utf-8?B?SzNqSHdrcHdUaXY0ZXdMQ1pGOU1CZlZIMS90VXVlYzVoNVduSkZkaEVqWjBI?=
 =?utf-8?B?dUpQWVUvVzVWekZnaEVCWklkVEo1S3NGUzVOZ2t0eStnVXVscG1IaXBlY1Uw?=
 =?utf-8?B?NElsQ21sMmQ3TEtkNFd4STUyTkFBL252aDh0WGZWRUZsVHhXTHNnNTlXUW16?=
 =?utf-8?B?ZUNzQnAzZmVBUnpmOW5UaUR1Q1NMVmtWV0JDVHpybXFhUnB2YlprcGFnVGFQ?=
 =?utf-8?B?OWxGMGpMaGlXUzZ1eFVCM2ladmZMZkg3Yy9xdEE2RkRVWUgyUVBWdzRrbXd2?=
 =?utf-8?B?QWdNNHlDUWVleXExUU1FMHBqRUpLb0d5SkNmNFM5Y2twRTFWVzNpUWttWTV3?=
 =?utf-8?B?U2JlTG9NcVpUNS82RkY5YktrS1duK0lIYmgyREwyK0tBWndjb1JUb3ZTZnln?=
 =?utf-8?B?UDU5NWJtaUNOK2ZLR3lGTHBVNkYxblJpMjBxRUtORFZqeXhJRkdXWWlrUHdz?=
 =?utf-8?B?Q2QzejhrMC9Gc2lQRFIvSVRMTWNPb2JVRVV3dGtIUW5UODF6a0VIa2t1MkVO?=
 =?utf-8?B?MG5PQ3ZaVnBORll2L3VXWXZzUlhHamV4U3c5R082VFFQTXBZSCtTdWUzRUQr?=
 =?utf-8?B?dk9VZ2ZRbnVkOUU5NjRUbGZQUEROcWYrRnpoV1ZpRTBIQnErbHExUDNZZ1dV?=
 =?utf-8?B?QUtOdUdhS2xhRGhjUWYwYXJRR2NjS29UQ0grbmlRditKSHFETkJFbmdLR0lw?=
 =?utf-8?B?d1l1VTlJWXZZQXdQN3ZSQWluaTZTeWE2SEwxeTc4OW5OY3FHd0ZjbmIrTVcw?=
 =?utf-8?B?MmppYmIzVVJLYUttK2NxZlIwVElJSVZrczZSd21hOG4rSkhGSXRNeXBXZHpq?=
 =?utf-8?B?QzNkM2ZYbFgzSTBTblBnQ0xTNjhjcGUreFBWbjhYanQzcHJDS2tZNktobWtv?=
 =?utf-8?B?cVl5VkRsZW9nK1VleUErZHJWR1ovc0FWWXd2ZlZXTVlqd2R3bnNGMDlsbVNi?=
 =?utf-8?B?VnZQaU9PbnlicUsreFdjNjcxdWpQdVdxM09VekExUUJQaG9rRmZRb24vTTZV?=
 =?utf-8?B?M29OV2l5R2k4cndrR1NxQlhxVHYwQkRQWWRlZUc4UnRGaU1kellVYldjekhO?=
 =?utf-8?B?dERjY3BpZWxsZXliUi9TcDNKaEVzK1ZTSlNjRWhpZVNrNGE4TW9ZbWdCSEdY?=
 =?utf-8?B?ZXJtMVJFUnVGVTFWT1J0OUdhelNHTWlWZFNlWERpVSt3NG9zTWxxUHJuWGls?=
 =?utf-8?B?cHI5K2RJdWdFQVF0d1B2L0xuc0l3VS9sY2x2TjdWenZKc042a0ltMFZBck5z?=
 =?utf-8?B?ZlYxZjlGQTllMmplZGhCUmdGN0FDT3pqbnk5cHJQaVRKT0hLUXBXc0QzT2p2?=
 =?utf-8?B?MWIxUGVCYkFQdzBuTTl2ODM2UWR2MGVZTUlPM0xwaDlNNFRidnprUG1kbXZD?=
 =?utf-8?B?bTNXaWNEcjZFSkJhT3orVkNwZFVVdDIxRytHWC9MRFlELzd5VWxkZmpJZlgy?=
 =?utf-8?B?ZWZhNFJOazdXa1BpUm91YTAvR3hhb3FMQVY2TVVYQ3ZNSGhsM3RCR0wweGRt?=
 =?utf-8?B?d094WnZRZXFFaHJMOERvOFQydWlvekVhL2NrWC92cStMb2kyMk1TQXd0YkpL?=
 =?utf-8?B?Y0lnUllDaDBqaGtjK0R2UUcvYXRmRlg0UndrSXdVZzlaVGFVNVJIWWlWK200?=
 =?utf-8?B?MmFYRjQ0NWkxd2lQVXpVV2FFOFZlVzc2VDRpN2E0K3F5cDlDVTR2YVE2MlRH?=
 =?utf-8?B?OUE4OCt3cHBLYlJBOURpS3J3dXdMOXIwZnBDWDcxa2EyYzFLS1phdk9ib1I4?=
 =?utf-8?B?bUlCS2tlNmhQM3pVWjBzdm5seDkweUMzb2RXcEY5MDg3VXBxNzl2cnZWS2s0?=
 =?utf-8?B?d3JpM3o2aUpyMFNoeURCNnJkUGFlZkZIcXZ4Snl2RlVTOVVyRVl6NllhbDVP?=
 =?utf-8?B?SVdhOGdKRHN5aHp0S1k1UFZuL1hTZ04xdXNDbzdiZ0QrUmJSa25rTHJ6ek1J?=
 =?utf-8?B?TCtYRVJXeUt2YmNmbmhTV1ltS01wR0EzU2cwOFFFaUxRRlBKZ2xwRU1rNDU5?=
 =?utf-8?B?UWpKS1dkV3BhYlRhSlFaYmRBY0JFOThDRmJqNTFvV1hQUWN6VWJPN29mQjRn?=
 =?utf-8?B?Q3JDYW1odm9QbDlqZ0E4d1kvTGtjRUppWTdaNXBWNEs1VlRwMnRlNkJoa2NC?=
 =?utf-8?B?TW5vNU9XaDZWQktrN3Q2U0xsaVZaTXJlQndCTEVtMkQyTmdMQ1oxYUpRM0oz?=
 =?utf-8?B?bmIrR3VHN1Jwc08rQkZlSHpBekwxdDUvemZQUDRiWUtDaUZ3M05PVE9sRmZ6?=
 =?utf-8?Q?PFHWYG4/7XYilqVPvR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ae6a23-95e4-4b11-15e5-08df2f78fa72
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8131.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:41:15.5460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CXIo8WtfatLTPYT5V63f0Cy3ZAoL9inRRQnOA38VcZ3OIbrDIjJsKQ1O46CS8gVbVnnUd09Mtz9wdH7ILMC9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200

On 10/20/26 22:49, Borislav Petkov wrote:
> On Tue, Oct 20, 2026 at 08:28:18PM +0000, Ashish Kalra wrote:
>> From: Ashish Kalra <ashish.kalra@amd.com>
>>
>> When the start and/or end of the RMP table is not 2MB aligned,
> 
> When is that the case? Why aren't they? Why doesn't firmware align them?

It is actually quite common with the contiguous RMP and a bit less with
the segmented RMP as the RMP segments tend to be aligned, but the RMP
segment table tends not to be.

We can ask BIOS to do this in the future, but we have a lot of existing
versions of BIOS out there that don't do this and require this support.

Thanks,
Tom

> 

