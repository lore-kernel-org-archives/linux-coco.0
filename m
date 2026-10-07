Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010069.outbound.protection.outlook.com [52.101.193.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C674A64FD
	for <linux-coco@lists.linux.dev>; Wed,  7 Oct 2026 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379327; cv=fail; b=ucsd2ATrMErZPYSK/kNyv4NhZqs8Z0Veg7CM+0pD8OYRm0uosagww1aXZh6l4Y9HiKwi8eY/E+qZlNar4QGGlSauR09PLCOf6gV7lfVIkYmz3gv/QqRhQVER5KLsA4WMZpWWF6BouAQKukfUa872UpVFZQYc0Whnc0egUnas+F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379327; c=relaxed/simple;
	bh=P0bEhxKd/fwD14WHsm8kXIiDn8hUjCxxamQkAcD6VZc=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M8MsB8nu7ksDkMzciV1V6/37hl5QQN65qYk0vLAfCYzwMs4UShKvKbHwBPlhnzejSoS46jOxqF0LqGnTbNIZ960MVGzp9n08sUaR3D0CqchEv2UTVEpJicSc0qd3D+WcC4c6ZbOfGz5FZVqipbApe/gQCh/1VEYXlE5hk1lchLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UESfF4sl; arc=fail smtp.client-ip=52.101.193.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UESfF4sl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laELcXeaPbwqAmkdO4SCmhBCEtAXCnJUQYhVqe48sdSHdxf3fC8mQs2PCDDKMYtdXtXbgEAOjYzVh5kax/xykeg6qr0vBX6iNonCxdUjZDvetsCsCkRhqbYE3ijdrxVrpAKCSww+kYq8EiYrcKdExAPsGSPFep9GxOPsulFnF7ehrvgoDNidsLsc1CKTsFxHErxJ/aZR5VKAuSYRhFCUkt+By/sQEynvlt8RU1pQqtVHhDCgtjlzn13cXJchlaPoA3BN+ApL1svZRuLbgqUaWmf0066k0FSynwB2bDqiP5T/Z18SGOsWa2HSJzukbn/JTTXhHc/wRI448dMVS/8Pcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMsG5CGdHXiifQjCeBCUl3giHBd5ehld/NJNduaTkvM=;
 b=v4FEJyP9rNsM3O1PFyKkJ6brjqfYP60HvmuFWceDhXYJgERYRybGqe8nmD6bUATazJnYNqAIW7DMV6V8CBSoX2kQCVbSuCjpLf1yzjKRGiEY6H50OBRQJwzc1GLXcKBvFfF/c/GbpMKsmlEgItrPOT4knnSpswheIYf0PSMGm0K1bYZfJIbU/tp0y0Bmx8A/Dm68KTn5sJ6p7oSACSckKyrVowzhCfPUTlrO4WT+y9ZxZnZxJXgkT9UWbM27IGeQXPpUMUMbqB1pZEEK2F2RMEgAaG6HeBsfRN0dokF6fx7HrwLGnvokG9aUhJAixjddz6/1U6Rqgi4Vz4Op6pXnjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMsG5CGdHXiifQjCeBCUl3giHBd5ehld/NJNduaTkvM=;
 b=UESfF4slbccQDbDhuh1dUuwZ634k0Kv4npyDHzq3b/2uws+l1B4qOGzkv4qo22JsEG63vQmyNToy1c5VqOlDAuWf4YpiI0hfx9aZFnutgujP+CMwmNpwFi8PyT3cTdWyWKdipZrRJhxxMPFNJq0ltCZFkrL+bx5eKlFQ8RxYHIE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CHXPR12MB999219.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::8) by BN3PR12MB9569.namprd12.prod.outlook.com
 (2603:10b6:408:2ca::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 13:21:46 +0000
Received: from CHXPR12MB999219.namprd12.prod.outlook.com
 ([fe80::da19:941f:da0c:2408]) by CHXPR12MB999219.namprd12.prod.outlook.com
 ([fe80::da19:941f:da0c:2408%2]) with mapi id 15.21.0496.015; Wed, 7 Oct 2026
 13:21:46 +0000
Message-ID: <95028cfa-9974-4e65-995a-6cfc627210e6@amd.com>
Date: Wed, 7 Oct 2026 23:21:44 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security Protocol
 (TDISP)
From: Alexey Kardashevskiy <aik@amd.com>
To: "Quigley, David" <david.quigley@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 ankita@nvidia.com, aneesh.kumar@kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-coco@lists.linux.dev
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com> <amk7Xzm5jmz+6SPJ@ziepe.ca>
 <anFE7m164AmchTy/@yilunxu-OptiPlex-7050> <20260805005533.GB28508@ziepe.ca>
 <apeF/peEzdxvKeWR@yilunxu-OptiPlex-7050>
 <2e721509-0aee-47ee-b17a-688876e02f74@amd.com>
 <612371b6-955b-40f0-89f6-7c8bc936093d@intel.com>
 <cd7a7dd5-1aba-4986-8430-ca535fb34f22@amd.com>
Content-Language: en-US
In-Reply-To: <cd7a7dd5-1aba-4986-8430-ca535fb34f22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0020.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::9) To CHXPR12MB999219.namprd12.prod.outlook.com
 (2603:10b6:610:2fd::8)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHXPR12MB999219:EE_|BN3PR12MB9569:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f3fd33-6b24-4974-90f9-08df2475ef7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BAzSKK5YZsWmvOIE88v3J/Clt2l5LB2q9HJcYN+nK0DCQhvfDrT2zqpIxXqgcCPjSbf8x8WJUfbFjaTXYTAs4c1vSlOShMl6RPnwvI+W+NCAEAhHmTF8t8n2wRzd+c2GZrjpofaQy7c99dfB30phro53Ey4w8C43ONKIRTqJdKo4Pxe/BxKGhnqQ8euGbLznkwoB6ccha0LjBV7Q7t6WWk62v79gUY4o4ZPjn9XHRau/cpvajKw7ldATKGBWcdzDdWDIB0xoFGymTbgG+1Njv7wYcz8QoSnKyC2MLtVGD86zVzDvxlEUPSBYqCGY7qWasUn6p40d1T7GHkAlE16h341Mdi0D/xGLdEkPNtzTJ2xOBFeN1HzvbVbJzXAZ+xnFtF/xGbRbFYfoab1SJ65F6Vraaumrmy7qHh0zkAHJy1sdSsPxOoMzZXNPMh0CgKXaxUVpMnZ9Qmn2hOQ6rcy91pv+d+MrYdlnbvA/ZDRv7vFEhU13XDi1Cbyh40845uty6+RthaQnaIAGAkkTevPxoXLGqFQ9K336tUUffSRtAyYDLvm/eveXNWT+8SKSpvIsc8QQfSX4Y2EpZ8md8R9DcAvSTHWQrW1n80B++XQIgVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHXPR12MB999219.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VloyQ3ZCamVuWHpXZ1BNWk15WmRhd2xsd3NOWjB2dkdmdFdIOGp0WUI0cm9N?=
 =?utf-8?B?YmpmM3VmSmZzbmdMbUJpbS9MZ1c3NXdDb1Rma0I0bXVzUU9WNkUrcjVlRFVR?=
 =?utf-8?B?azAzZmdrWWNXSzkvWmZ0OU9KK2lCRTFud00yNkxIVXhkd3BNZ3dYakJJcUJy?=
 =?utf-8?B?VHVkL0VWbGkvcm02YjQ1dWs1WFBkZkF0Z0FBdGVvREo4R1I0bDhDUzZVSlZY?=
 =?utf-8?B?UW40RU5TV1p3aGU2Wk1rbkxGRGp2cTNVY3hjb0kvTmthWHQvNlp4czMrSUlU?=
 =?utf-8?B?WnBISUlNM3JjdmozZmxRUW9TUUFUZk5sbXNGZGg3YUxKZllWMDhYdXkvQVBO?=
 =?utf-8?B?eWRTaWFDQ2M0WnpWRVhPckF2VmtFckppamhXdEFOUENwem42UHJJdWxkUEJH?=
 =?utf-8?B?c0QrYTZZazUwaXpFdGQ0UWRZYWQzZkRnYisyRGlSQUNQTlR3NSsrQzB3UVk0?=
 =?utf-8?B?MEUrbzdjNjNuank4TmZjckN0K2pQZnllSzhmSFlQeHJud3E5Vjk4TXBLYmc2?=
 =?utf-8?B?V3ZKbGwzaXV0NkFMWG42YXUwcGk2NFVoeUVUcWlZUUVNdDFUUjJVbm0wcStB?=
 =?utf-8?B?OUJ0R2xxWlVEQ2p2VkdLSExJYjhILyszRmJ6ekN0eEpoTDBwVkJ4U24rODUw?=
 =?utf-8?B?c21Hazl0WFBORTFVZEc4akRUNjFSU3VHMTVFeEowU0xrS0dmNVdpVFFkSjBj?=
 =?utf-8?B?MzMvalBXb2hTVXFOc0RodXhlME1mZlVWN1JMdzh3SGFyZzhUK2FLdTkvell2?=
 =?utf-8?B?dUtYZVNyYTZhNVFZeHBJQXB1UjJxWWgvWWVaUXV2ZXJkTFczZXpRQlhWNm1Y?=
 =?utf-8?B?NklNZXFZN2lpV0JoYVNqSzJHdXd4a3JzZnRCeGdVS04wOVRGM0lhWWZocGFJ?=
 =?utf-8?B?QytwUHdMTXloMlJsS1N5OEZPR3JYSzZISFJneEc2dFkyQUFTVHpJZkoySEwz?=
 =?utf-8?B?WGJBRGtaZ2w3ZlRiS2xHVENsdU5ySzJQbmt4VFNCbkZyam9kbVIzU3dDYk03?=
 =?utf-8?B?bW0zS0VZUnhpRWlYQ0VSYXZrZzJqMFVGTnJZWHJLWmJrLytVcmFtdUFBaFFF?=
 =?utf-8?B?RDFjdHpSaHc3V1FRNmtkbTVPTjY5ck5zRks5MGNuK052SWlETzJvOEFzUGpF?=
 =?utf-8?B?VGtsSjVNRStHNU5mczN2d1NsUmZrZ1BiVWdXYVZQUXg4NklqdU81bVJueWc3?=
 =?utf-8?B?YWxDQU1TT05KQjhDbENWamNNZGpRcG85V0U0dHdUR0dTL1llVkI5NVBUeUpQ?=
 =?utf-8?B?cmh2OXZjdmdlQThtYzUyckloYU9tQ1NmVFU3ZW1GdUNMb05oZlYzbm9OeTJB?=
 =?utf-8?B?U29WYlV5aHM4ODUvMG9rNDA5M1FnU09seEI5MExWV0pBdG9kdDFLMlVwaXRL?=
 =?utf-8?B?RFpKbzZLL2x3U2lDR0JkMyt2blh3OUlKRWg5aGtjNHozdnhVSG9jOWdXLzhC?=
 =?utf-8?B?N29jTjlGRXVPQkJyN1l5MUEwRjNQYWdwVVAxYWdVa2xOL1dPeTY4Rm42TTE4?=
 =?utf-8?B?MkJkR1JWQTJYbi9nd2lGQ2hMcWtIeUk1MEtRVjdBVEtibHpWam84Mm1vUzR2?=
 =?utf-8?B?bXJxMUlaNGNVUHp0SXphaXdIc1grdXI2R1I3cWFLazZTaFM4bmI4cTdJR1BI?=
 =?utf-8?B?dmFLWDdlZEQ4cnpKb0I1cWZrYytoV3BHWWxhY0pvSHBwcmtRM2lKVzErY0tq?=
 =?utf-8?B?Zmw5TS9DWG12UktQdlZhcHhYMS9FZVZoNmMzYkt2dmtqUlVpaW5FbGZ4N3ZQ?=
 =?utf-8?B?OWt6RCtDNjhYbVZyNEVsYjhzVERTRUJEWVhwbjNVRUxnUHVQZnliSFZudGl5?=
 =?utf-8?B?UWNGWk5XbzJJeW5yK2hWOWNYWWtYd1dmL3VqUVJsaGtnbGJ3R3J6UjVHWitG?=
 =?utf-8?B?Rks5OXdVSjllc2NCZSt2cWhiMkpkNlVXTW13MFRwc04wT0ZYNUFsc2ZZQTdw?=
 =?utf-8?B?ZSs0aXBxTWVRblpHZWdqQ053MWt5bVZPWDRqL1VjRDQveGh5Tyt0SE5RMm4w?=
 =?utf-8?B?aDFqSlJneEFaNitXdFVzSk5hNEduQUplNFJmTVZ3eFN1RXRRalJRMGRINDR5?=
 =?utf-8?B?QlNYckNKUlV0RHROVFpLSmdWVHRLb1NOVWtHUDAzaytRLzl6UVFlQ3gyODFZ?=
 =?utf-8?B?WlgzWTY0Tk05dzRVN2dCejFvSmhMU1J1bmhjM0JkOEFXcFdYVDlNazN4OU50?=
 =?utf-8?B?U1pRWGJ0dlhVdVMrb0daUlBDcXI4RU14UG1iRWVId0xZeENpckNvbEpydkNO?=
 =?utf-8?B?Wk84dWREZlZMUXlOVmtCVWErZllXTUdZU1NXQ05YMkhJRnVSb3p5SUUxbWRB?=
 =?utf-8?Q?kDUsn9bk5ZOOvWO7VN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f3fd33-6b24-4974-90f9-08df2475ef7a
X-MS-Exchange-CrossTenant-AuthSource: CHXPR12MB999219.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:21:45.9991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzw+IJXyxqc89bcIWGowyq7sPc+NfYHxJAn7UWifbYyh43jQ3OE3uIeI7+I2dENwlMxzrbn4Xnsll0b6M+iGng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9569



On 15/9/26 12:07, Alexey Kardashevskiy wrote:
> 
> 
> On 15/9/26 05:29, Quigley, David wrote:
>> [You don't often get email from david.quigley@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Was there a decision made for a new meeting time? If not are we still
>> going to be meeting this week at Dan's original meeting time?
> 
> No new decision is made yet.
> 
> I dislike the idea of 2 separate calls, unlikely that both times are outside of my 00:00-06:00 so I am going to miss one of them constantly.
> 
> Here we voted: https://crab.fit/iommufd-tsm-call-593432


For those who lost the link - here is a friendly reminder to vote. Thanks,


> 
> 7/7 - no overlap. 6/7 - there are 2 options, 1hr each but I'll need Lu Baolu or Xu Yilun to cooperate :)
> 
> So this friday call is likely to happen at the same old time. Thanks,

-- 
Alexey

