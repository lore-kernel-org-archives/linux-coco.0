Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012018.outbound.protection.outlook.com [40.107.209.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F4427144B
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860017; cv=fail; b=kSsTY4nsI5q2xsI515a8GlfTb8f1mepwHWbdfalSStXq6/TdklttziTXstTqt8ebB0GK+kqw54FPlJpKnJ3elw5JXFoFk2cjgHvi/gS2zgUXpMu+eNOYaigOOA6UGjs8eULbyIUHkO9u+kx6P8pg0FJO6zxOMiOU3Skp4zXPPMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860017; c=relaxed/simple;
	bh=Xh1Hf1U9pu9qVa9ef9NN7Iufn7QBDAmbbgE7v8p5GIY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=REZqin+SLmPxfR49ScaXS0+6uB88lYlT/YzQBds/53/P13+8nhlMmmkcHeVsiEBMfIhALlKFNtOqeShIGpVGt+MbYfJsSochgq74nkCWRdcD90aSZ0NG1CcqQA+SZblH1orkfhoXIq8FrPAyevfMsvvENvdS0H4h/mMemJRu8Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lTnJkSOo; arc=fail smtp.client-ip=40.107.209.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lTnJkSOo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7cWo17QTQE6OeJMp1Ejlk4tETt6YiDMDATS2mSHCahYR9WTVNoFYqCucqpx3RZ2LoP0SfeT2sVwXd69WLbUrrhFp09LqrGAlsCmA0pKSyMmP4MdE+SXKl9nf214M0JROXgz73hNTP+Su2FechbK9EvGKPBBXXBQcgFf5GnaYuJo9eT3mv69X6T4oGgFW/LJecJVV67sKqqtu88j0EPqRE55xKLebomGBV92Q1goMpnIhvG3CuXwsFy4OA8ur4n4QaYbDHfSSXeozUHNqzDL5YCTlSLX2gkMx48ITtK5CslTg0Ye/Jxn+xOqWM7DfDyeZwmpySeilfbjVq7jUfuBgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6Ed4R8myoTITGoNrmu7xW6i5gB1B+83SdCOkQxGCFc=;
 b=vBHE1E6CONPMkS5j+QK+yBW5UoRY/mX2RV3GxzHGCZIXTvfmWaun7+QTq6RO7DhF2YYMzsSZl9GeMdw9S0wuwkVCHTHu+9sI0ZaskgoIw5IToNWie9AqXZHU2xNmClQlWEZDYJR7raQrmBM3x03gjWgX4qyBM41lTpip/0tJo8xQrG75wBgMSnq6up9Mmn9mqARpANpOPIwzHXL5NU9+nE1RQt2eLGzDFK8v14lGeGBG0zc1B1sJR2DqBCq8+IwBSaEw+dMM44DAM1TTYkH97PkSSPPfecBL3p2r0O5RPIpD21mVvzQMQfwbstu5c7XV/X0lz+hvmY5I7OPDnWUZTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B6Ed4R8myoTITGoNrmu7xW6i5gB1B+83SdCOkQxGCFc=;
 b=lTnJkSOoYntpcYQd1US4p3TUGZ7ZqhuQMTix9a9a5JqULd0t83EqYX2BryhD8fR9RqhN+BRknzrkA9pSkgiJvUF88YCtWlJW55FKEQbAbq0kO2DbaceHcjxFv+sCYbTTSCV6YVbvpY9DNaTUob03tJgMEW9fDOQKGaWQo9Uw9GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by IA0PR12MB7651.namprd12.prod.outlook.com (2603:10b6:208:435::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 14:53:32 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 14:53:31 +0000
Message-ID: <e4571015-5b76-426f-9e12-0181df9ab1f7@amd.com>
Date: Thu, 4 Dec 2025 08:53:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] x86/sev: Carve out the SVSM support code
To: Borislav Petkov <bp@kernel.org>
Cc: linux-coco@lists.linux.dev, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>
References: <20251204124809.31783-1-bp@kernel.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20251204124809.31783-1-bp@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::26) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|IA0PR12MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 0920d0ad-7960-4641-633f-08de3344e453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlFWVkF2Y3h0N2IxU2hyWmY5eVhoeXd1d3VoUjNRRmZGWlhVQjF3UlUvZjQr?=
 =?utf-8?B?eFNPN1V1bDYrS1lyMk5rS2tMcDcxSVhlTmhrcm1UZWtQL09YNHZ4UlJxc01B?=
 =?utf-8?B?ajRXVDBhSnFoeGRCeXZFdTgzRWsralRRL3pNajA4Z3dyZEdaK2czcXdwS0RM?=
 =?utf-8?B?dWdmeHVFTEdSQ3lXNDN5NnFKVlhqNW02MkZWN2ViMFRwQXdCVlVhbVhBb0tD?=
 =?utf-8?B?TDJmaFVxVUR6Ry9weDV4alVEYnBxUXltTGg0aERUUWtwdWlraHMrc0MrbW1s?=
 =?utf-8?B?Y3dZNVd0VWUrdGxyd3Y2TkpUUW05U1JESE5SREtsS0RyVHNpRkVSMldSaGov?=
 =?utf-8?B?K2hsZ1IwOWFKbmhEcDN5YzVkK1RBZldEYVI3QTIwR3BvZG1DK0d5akVGQ3dD?=
 =?utf-8?B?aE9XMjZQNzd0b2hBdEJ1SkRIb3NtNUFQSGFnTkVxMDM3c2lIVTV0TWZ4NnVq?=
 =?utf-8?B?eldub2NUZDQ1WktkZDVPeG9IUGpnNkVkNElDWXNFamhWdjJlOEJNYWNtcjFH?=
 =?utf-8?B?TExPYVdTSzlMSVRJcjZzTHdiVmlMcS90Q3NobXdERmZ1cGhZNnhRaURoaDJH?=
 =?utf-8?B?RTdPQVhnc1VnOU1yc2pkUmFWc0FldlI5OEpheHp3MlEraHRkYnp4YXhseTla?=
 =?utf-8?B?MVk2eTJlNnR5YitQdXJuRXdoVTY5eDk2TWdZNmRnK2ZPQnlJVDIrYWhEREcv?=
 =?utf-8?B?YWQ3ZTlraXVaczZraGpmS0I4NnZhYkJVWlNEcVo3bWl6QkJoOVJSdHkyVkVv?=
 =?utf-8?B?eDlYUHV0UjZ1cHVFOTVZdm94NVhIM2p3bkNRMHNwV3kvS0FEeUdzZGd6aDhL?=
 =?utf-8?B?RWxnWjhwSm1oNmlVcGQ0MVplTWhoaUFUZVA4ajhFVWhRWnRRMFBqZVdXbkxO?=
 =?utf-8?B?RVhESTFjREFhN3RQOHlBY2Vobk8zdmtxdzRjeVU3US9pWDU0NlNCYkdHd3pC?=
 =?utf-8?B?OTlaTkppNjBhYldleGRMYkxpMHYvUXUwZ3JBNnU5T2lDVDNCbFo0ckg1N1JI?=
 =?utf-8?B?bXhZbWFMY3VjZzhJVHF0aGs4eEp3eTN6bExPbXVvVFhSaVpOcCtIUUZrcG5F?=
 =?utf-8?B?UkRqOFlJUlpLTHBJVzJ5cnZRY0pLeHBPdVowell1dUlHeHE5SWVnZjFvOFBF?=
 =?utf-8?B?L05PaHpWWEpvTTYxSWRubDJZTHZsNVNsemw5NkxDdExYQ1Mzcmc0UXRuRHoy?=
 =?utf-8?B?aUFXUU0ySDJNZDFrYjRQZ2o3d1Y5TktpcDN1ZXYrQUppb211OGpZREV2ZWlV?=
 =?utf-8?B?TW1QK0VXVTZXMm1BVGZhMGl1cUZBTTBBUGNFelQxZXBXbDhtZy9qdUZNUkU4?=
 =?utf-8?B?OTFLOCswZktaR1I3MjAydzM4YWo3MFI5UHJXSlV6cjNFKzV2SUQ3LzczRG5D?=
 =?utf-8?B?S2pXWG9oY3lMQWlDVERidlY4cWhqbU5YSjBBenFtUkNrNXJWVUROWXgvaHM0?=
 =?utf-8?B?cXNLL2J4K1hDQmlSZTF5V3dkOU5BMHRpTUx3enN6c2tJelRvTXlwb0NpMDhr?=
 =?utf-8?B?UFRZNUlnUDZZKzNJV0VpTll1RDFoS3hCcHR1MXVJdzg1TlB0aERldnQ0Wllr?=
 =?utf-8?B?WnluOHo5UjJKZmVUWXJRaXNBVmI4MHFjV1VDdU1vbmxUQ0dKblZDbHJoakVz?=
 =?utf-8?B?YmhWeFNKQ2duckhNNVVtYnV5Uk5seTV3Z3R1clFMZmVUdEtLMHFJV1dpSHdN?=
 =?utf-8?B?MU55L1MwR0Y3N2Mvai9KT01YSFVGRjdqSlFnODE2MjVHcGM5Y0xONENJeTJz?=
 =?utf-8?B?WXRING1YL0RpL1FuL25OUm9SYXRDTEJRSHovWHJrRjEzdnd5VHJmT3pZUW9X?=
 =?utf-8?B?S1lZWnhYMXM3OGErem83S0NDTmhJT1ZEcFdnSk1FZUF2RVJ1Ry9CamczVkN1?=
 =?utf-8?B?Nmh0c1NmZFdoVFc4cFMzY05FdFJURmxFZko3bW1mU2ZiYXpwL21jTWUvTlAz?=
 =?utf-8?Q?+AjRLu/XA1VGwA6zFU+44htlXBo35cVH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1cxUTF3cnZHaVF5ZVVHS0cyaUxJRnhEaldqRXVzTEN3TlNhWG0wbmROTndD?=
 =?utf-8?B?UFpNdGFkZXhnbW9OVGtlMjJLVEU4a2FkSGZ6WVFvcVN6N0todVlPenBhQTh3?=
 =?utf-8?B?VVRZVEhsOFJjcFc2WEtBaGJ5clJlcUlFUnRIZVZxQ2I3bHRJYUhocGZyRXpj?=
 =?utf-8?B?Q25hdDRkUzZFeFY5VmJXaEx6M3cvSkZVL0FSQmEycnF4eFpTMzJZajkvNEsr?=
 =?utf-8?B?SGJ3WEowL2UzTG4zVjhtam80eTkrbnBBYkVMck9mRDRaRG5TUnlvUGY2a3V5?=
 =?utf-8?B?YzNWb1loTGlyZ3lXTGg5UytFVmUrcldlRisrbGlxalVrMndZcml2VUlBam10?=
 =?utf-8?B?MG55REREWVErNVY4N3dRMitpZGQrTzhwOHdFaFh4eDAvTkhWckNzZWJwcDU1?=
 =?utf-8?B?aWhYdUdqUDZKNmRHVVRnbjZ3Rmo4ZDZZWkQ4aVdqTFB1NVZzZk82Z2xkaks1?=
 =?utf-8?B?RE9YQ203VW93SjJRam1jQnpkS09TQkt5ajFIdEZHajRvQTNVVWRKRXNzdVFO?=
 =?utf-8?B?dlJUbGdxMnkyTFF4THlseWQyTU53cm1ITFE0YXBrdnJXYTNxUFd2Y1dacThh?=
 =?utf-8?B?UWY0Z0lraDgwbTN6SndjTjVkV0U4UlhuOGhIVzBIaEczREdqMkpYdUFaak5L?=
 =?utf-8?B?L1hJWWFQSjE1MTQ0NExpM25EajQzZkdSaWYrN3l2d3krUjFpVVZ2R2FIS2RV?=
 =?utf-8?B?ZGVwSFdlb0Q0Wkc0WGFsS3Q1MDBiSDRIQUV5dTNlSUdaWi9hNzc5blM2UG9x?=
 =?utf-8?B?Z0pYTG41TVExV1pqVmxjekhPV2dhdkozNlZCeExzQWpoamVsQXJxaXFib0NK?=
 =?utf-8?B?K1E3eTFqd3dMdUlVNHhnZFpORmQ0K3VobkJ3YUhKZmo1MWxsZFRjdDNuQXpM?=
 =?utf-8?B?b1NaMDBub0VLNExKVWNMRmdvL1Y3WGRITWpYaTIxMlJOVUR3dExpTVBuNTlt?=
 =?utf-8?B?dzh4MW8rK2g0MzhWTkRUaUhLYzRYNkJseHZza3RSNkd3K3d1MG53R2U3VVE2?=
 =?utf-8?B?dkRTYmlQTGM1V3RabkhIVUVMUWtibTBjaXdsVERMRjU0UnI2RHduYWhiSkly?=
 =?utf-8?B?RnNiN1p6V0F0S3RDMGVUZFlUK3kwYi9HR1dNUkE2azRSTStBOVRQQnhQWnpY?=
 =?utf-8?B?YkRpdHY5OFRGeVBBc29EajVxeExYc3FBZlIrRHord1Zod3RWYzgybklzbW8x?=
 =?utf-8?B?ZGhCbXVINVdMK1JvZnZSMU5hSHczUCtOV3RObFhiOTFGRlVHN3NwY0c4b0FZ?=
 =?utf-8?B?aU5FUDVxWGdGWE1IN1haVGxaS0Q3TXFEdXBFa3NmOW9XdExSdlBwVlMzTGsy?=
 =?utf-8?B?NlovNnNTWUdjN3Q4TXphamI2M0xlZ1dzR3daaCtnV3hKTDN2MG0vTmdZU0lL?=
 =?utf-8?B?RndlaCtkTXptY0tLYlExbzNxS2pMeTJ3MVJONnpZZEZWS3FvUU5FWFFIYlZ1?=
 =?utf-8?B?ek54UGlYMHRUT1ZZbllZdjBod1gvVU10UGk1Q0dSUEMzd2JIcnRTT0pKamNT?=
 =?utf-8?B?RzdyYmxGQlhKcDhvT3Vzd2pCS1B2YUZCeGZaVWFEM2MwbEFQZUdKWit3Qkpu?=
 =?utf-8?B?dUJWUDFBdkNkc1hzTjJBS2g5R3FXSlpndGdwYTVPT252NDlGNHJVVzg3QzRv?=
 =?utf-8?B?NFAxLzRheXBoL0hGdEFkdGpqU09CTC9qQ1pSRmRLZkJTc1RLdWJvNjhmMVZN?=
 =?utf-8?B?RGhSUEpMVGRZUXZOdEhvcjRjYjBFYWQ5MlpxMVNuU0NiZUdRMTVUaDRsMzZk?=
 =?utf-8?B?bUFrK21QNkZ1MWFjc1F0VXhrb2pHb2c0WVV1WkxiY1BwZXFqdENacTJEZldw?=
 =?utf-8?B?NTMzQUdVTVAxaVhwM3daNExTWFlyUFMwem5mZi8rMW9lZDkwZHdOL2VBbUF1?=
 =?utf-8?B?MTJmZG80MThUUmJDVTJLUFZLYlMrQlUvTDRiajZYYVZ4RjR1Y3dLTGlqQkFU?=
 =?utf-8?B?WW9ZQUtLcHg3UVRiWGN1M1JMUVhNa2JJTXpDeTk5WE5oRDExWWp0ZlR1ZWRo?=
 =?utf-8?B?dnp3Mmw4Z2JDUEFkOEpvRFdOczlJTS9RTXkxWTRuaUk3R3FsZmQvcU8wRlpI?=
 =?utf-8?B?bko1eE5vUmV0ZUhyejBDZ2YyWHBSY00xR1dtVGlucWRrTDkyZ2pkdHZVYnMr?=
 =?utf-8?Q?plcgqHu0Xg2m6E6OmZOmgJh/1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0920d0ad-7960-4641-633f-08de3344e453
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:53:31.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FzcDlvl8anlikBjpZDkwtmEWsla/NH3yWPkSd9aR1AiV5HCnZ4Sls+JaEAWzc512EneSGaBJ2fSzJSoUfKDqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7651

On 12/4/25 06:48, Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> 
> Hi,
> 
> I've been meaning to do this for a while now but didn't have a good idea how
> to do it nicely. Using the internal header makes it almost trivial.

Quick testing doesn't show any issues.

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Thx.
> 
> Borislav Petkov (AMD) (3):
>   x86/sev: Move the internal header
>   x86/sev: Add internal header guards
>   x86/sev: Carve out the SVSM code into a separate compilation unit
> 
>  arch/x86/boot/startup/sev-startup.c           |   3 +-
>  arch/x86/coco/sev/Makefile                    |   2 +-
>  arch/x86/coco/sev/core.c                      | 380 +-----------------
>  .../sev-internal.h => coco/sev/internal.h}    |  32 ++
>  arch/x86/coco/sev/noinstr.c                   |   3 +-
>  arch/x86/coco/sev/svsm.c                      | 362 +++++++++++++++++
>  arch/x86/coco/sev/vc-handle.c                 |   3 +-
>  7 files changed, 403 insertions(+), 382 deletions(-)
>  rename arch/x86/{include/asm/sev-internal.h => coco/sev/internal.h} (75%)
>  create mode 100644 arch/x86/coco/sev/svsm.c
> 

