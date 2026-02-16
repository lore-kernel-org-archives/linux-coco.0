Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C03313272
	for <linux-coco@lists.linux.dev>; Mon, 16 Feb 2026 14:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771253110; cv=fail; b=OnvRwUacxJ6QhlyXExQPWqIuRQIXuASATsdcyCRP5H28yJZObxCnSNVA9DJ5BgrArseOSr4PPgHMR1bcN//UWhheSs7KJ7UgR2O4+Q4o59lv8tImzo6ywF+0Z2UBs/PSwQDq/B+72Ww2Ei+TB3hBEgGbMll5LA0PGoWGsg3Sxc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771253110; c=relaxed/simple;
	bh=SVqimeZxoXip/9Oc0K4VzKJADXmydpQERV4w5wYPat8=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nHj2kLe6g8B4Dt3c+1nOA4J2QscNHmecUBkJgAqgFLELUF0TrcjrWP6qAxCFUAngdk86x6iRKdyKrpzD2ML3WmGhtzKNhTYYOpDNRZKSbB+fLWks1pE2C1l48OVqT0X/GSzUuWtafBQKiYoMuaswTirNt8PzBUXoifE67EG0b8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UkOKapGz; arc=fail smtp.client-ip=40.107.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UkOKapGz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vZ3WL7QP05eqHsbbgKe6FjN2xYBgWTeNkapFwvjvJsZ0HGffprBuC3LMHJuS1XAbIs9DvEjqX/FUTHzCHlMDhTwF7LlEkbsiv3gsDlGVcnFBehEVI6+oCLnXqCl3wECc87HGmu8B/JcNme7OubanoCqlgxvU1jCgqHyF5PW/ZO/K6jJ7prGjguWA8l4MOwniDXSX9ZZ81d5ZEe6yf6DrOzf0pIKyIvTKnVVorh04Q4sgWDOrFiJ7Rr3ytI+ra5bvjJS3KoW8X0GxQV57EhyCx3y1psBcqG6QVOsiBSPJnAklri5q0/ljd2KL4xluhkLAZWjgZmU4piWKjul57n0c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPCaRToXF7uNrQvdBEmDs3Ax6w4oePOAKqu2BXiX68A=;
 b=wE4EXfK7jn6flyCk53ZJRCdVK2Ec514I8n7GQiOZSchYA36KAgV0VLO4ghwBRcvCQUP938W2up34YfeG4r0GuJkIJ6BteqSoHipdUwe4SjiuHl1mNuoSGoqNBW8USBFCGojaybkCvzokuIQKDW3b29uQ0F3RhmRjinWq7ZRhiVlzcs29xfaxdU1AcvlMIwI5OWX9W7itOiyn7VKgrPILooFZ6daNAxJqhRZzX0Y3IKHyFrOm5mwlqDA5/p2mUoFjyqgAFIcCVuKGXacahdbfX6cj3mUMbqL7dKIG2z+zxUOfXEPnsmm8M4RcCyaDR6j255miXM2ZfjRGO5g/z9JVNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPCaRToXF7uNrQvdBEmDs3Ax6w4oePOAKqu2BXiX68A=;
 b=UkOKapGzDl+uAw53pT9Qm6N87hTVFbUKnGVBR83/M/CD+8Ep99MkjEIj2RmwXtu5tFNeQ/jjn6r0s53dxyQhCJUNpCtS7nLh5XUELNQe2ozKU3WYZTPM8kl+xMoK+nUTNsbBldPF6Sht/691vjynuQ33ZHXm7Pd0qXc4o4WPWx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB8660.namprd12.prod.outlook.com (2603:10b6:610:177::5)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 14:45:05 +0000
Received: from CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3]) by CH3PR12MB8660.namprd12.prod.outlook.com
 ([fe80::87aa:52e5:4b72:d5f3%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 14:45:05 +0000
Message-ID: <fe516b2b-4b63-4da2-ab9d-7d3e71e3091b@amd.com>
Date: Mon, 16 Feb 2026 08:45:01 -0600
User-Agent: Mozilla Thunderbird
From: "Pratik R. Sampat" <prsampat@amd.com>
Subject: Re: [PATCH v4 1/2] mm/memory_hotplug: Add support to accept memory
 during hot-add
To: Kiryl Shutsemau <kas@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-coco@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, ardb@kernel.org,
 akpm@linux-foundation.org, osalvador@suse.de, thomas.lendacky@amd.com,
 michael.roth@amd.com
References: <20260203174946.1198053-1-prsampat@amd.com>
 <20260203174946.1198053-2-prsampat@amd.com>
 <d07cbb96-ba30-4dcf-ad14-0479d6a989f2@kernel.org>
 <70be936e-e49d-4485-8d1e-416fdf8f40a4@amd.com>
 <aYR0vqwyFPo3EKAi@thinkstation>
 <ce4334f8-5e54-4dbf-9be0-059279ef1962@kernel.org>
 <aYS8O0phOE41IuEF@thinkstation>
 <fc60cc71-80eb-4058-8d0a-dbd19a5c10ef@kernel.org>
 <aYXYRf4lxm_iQwjE@thinkstation>
Content-Language: en-US
In-Reply-To: <aYXYRf4lxm_iQwjE@thinkstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::35) To CH3PR12MB8660.namprd12.prod.outlook.com
 (2603:10b6:610:177::5)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8660:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ab368f-3a23-4c61-860c-08de6d69f8de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1JsRjZWWWQ1dGFoS3ZKY1hPaVAzdG1Rb3FVSG9YRGlvN3R3cTBCanBMczBx?=
 =?utf-8?B?SDRFZGx0cTcxNUJmc0h1U1Urb1FpY0dIdlhGV05NVkZtNW9USVFQQlZJTXNQ?=
 =?utf-8?B?RTJSUzJpVjB5azZCSDNrRXYrWUx2RXdhWU54RDhvT2NGaUxjZGtBcU5UM2hj?=
 =?utf-8?B?YTR0Zm1ETVM2elEwRlhiVGtCWnprd1BFN01BTzRQblZUWjExayswOE9qZjJQ?=
 =?utf-8?B?Q29YVGZYSFJMbis0aTFNRC9EUnlucFpTTk9MYkFPR3p1OGlDWEwyYytQajND?=
 =?utf-8?B?ZlJXQS9tRW95ZDA1ZVVvb29uc0M4TzM3aUQxUjZnaTJaTC8rckw2aDZtL0Fh?=
 =?utf-8?B?bzQ0SkpsMFVMdUNGcmVrc0t2enROWlltVmtTeVBaUFhZOU1YWTBJTmJLdU9Y?=
 =?utf-8?B?TWRiOFBUclF6azlESktFblpUNXFiNWtnQ2lvbmF4cStKT1ZWZ1YwY1FOajZ2?=
 =?utf-8?B?aFhLajF6d00zWGdDVkw3YitlRE8xcC9QOEErdVZPOFJCblpKOXdxS1BXRkhw?=
 =?utf-8?B?bGhGbVZ6bWdwK252VUwrUE1pdFltZHRiUlZQNjBGeW9qRHhmODQyU0EzNVlu?=
 =?utf-8?B?eEVyM0RzMGtYS3hRaERLbEJnVkJNY0NkWEJRL2k0eEthVWJSSmRJRlBxb0hS?=
 =?utf-8?B?OUVpY0RMcmdxQ1paaFAwK0tlUFlSZlV1dzB1U3U5anJrZWNmQTdUM0JpZTQ4?=
 =?utf-8?B?RUJZaXcwcUxXUkJMcDZyN3dORDAzTTU1V1BES21QR09IUFVzMXlxRUI3dmZw?=
 =?utf-8?B?eFFja3N1amtBdzV5MHZ3cnl0SzJxbzkySjQrSWsvRENxc2hVNWZ6OFd4ZVNu?=
 =?utf-8?B?TXg2RzMxWGdKaUp0TUlKMXdicjhKeG0rYTlCem9ncTF4azNDTFVMVE54UElX?=
 =?utf-8?B?M0djdEZ0NDdvTEVuL2h0WmtJei9HRnE4eHA2aGUzL09za0dIZWtaUS9ZUXlx?=
 =?utf-8?B?eUdPaWVTS0xLMHdyRVBOS3E5Y0lSaVVzeW1FYytjOThVc2twT05ic2VDRmlm?=
 =?utf-8?B?WFVOT2VGdjJ6NTd1M3FUamkzKzM5ZUFMTHJ2OUlkVStwNUxVUjc4SVJyTjFu?=
 =?utf-8?B?MWI0NzFacFJkSEtSRnB2czhmclNKcU5ZYTRyUm9UN0JQQnpOazZWeTVpalpo?=
 =?utf-8?B?VzFsZkpGSTNEeHBrTG5saWhaRVFTOHZlWWtEMUpEYmc3dk9KNWw0NE9pRS9w?=
 =?utf-8?B?MDk3RnNYWlZVa21UZ3hjT1dxVGNJWjh6NUh0TlB2VTZrbXRjTWJjSjNvUDNQ?=
 =?utf-8?B?THZsOE40dzk2T0Z5by9BK1BBYnQ2VTlta2RpVWNhQks3VzBaZnFmR0tIbEtt?=
 =?utf-8?B?Y3J0WXlGTFZ0TDRTdlBWNFV3RmZFRGs0UkhRZ1JGcXJpMU9TVjNwMmwvbjcz?=
 =?utf-8?B?a1hyT095Z3A5aTR4TnVIeGFsYVZmdUU5OHlvZ3dXeVpZS2REWmp1aWYrQjJa?=
 =?utf-8?B?ZFprVzhzdnlwaVM5dHF1ZWJ1QTNFNHp1VEFMak9tazBnTlcrbGRVRDFmMjZM?=
 =?utf-8?B?SWZ6RzFLdkwzaFpQSnBuVXdGdGE4ZVBlM0ZxeFZTNmFZcTBwb0RWbndnNUcw?=
 =?utf-8?B?N1JVK2w4akxIU1llZzZmTDJ5cUtBVGptaSszVXNmQyszSnhJMTFJVFlQbks0?=
 =?utf-8?B?R0lyL2EybTREc0VscjlBczduVjBNeEJzb2RYcjVJdGNrV2kyY1FtQ3ErNEJw?=
 =?utf-8?B?c1pQcGlHVkx5UElyWTNVaW92cERnMHFYMzhUNzRHQ2pVcm5peVFhRjBnNGVv?=
 =?utf-8?B?NkVReTlXdkQwNjNxVkNrdEprUjIrRmlDNzJXSXErZ0NueDBiclZ0NGY2NnNk?=
 =?utf-8?B?VGJLWmFjZWRPdnFwRkVoZ083ckwvVStBVW5mcHY2K1YwQ0ZhalFpOW1YTkdv?=
 =?utf-8?B?S21lSVZsSzdVSjdCZVR1enROM0k0OTdUTlBEeG0wMlpVZ21YeUhrTTlnOTZo?=
 =?utf-8?B?a0doSnR1emhFMXo2dmRMYWVqK2ZHb3kxcG1KSEE4alNlVkVLdndTdng1a2hI?=
 =?utf-8?B?S2ZQMTJCVmE3SDc3eFBIb29GTVppak5INEMva1lPMnZZSGorYTFYZjNGanpx?=
 =?utf-8?B?eThpOFdZemkxMmczUGZ3UEdxdWVNUHJyWDFkMjFQMTVwbEIvZHE2VHpMTzBt?=
 =?utf-8?Q?iuPU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckVuZy9oZ3pZVzU0L1FMR0VJZDhpZDZ0MUY3bDVnb2J1Zy9wUU1xVTZGeURL?=
 =?utf-8?B?akFvRjY1V3MyclRXMGxWWWxUdHoxTWx1SXRta1ZNZ2lXU3N2MUFYamlQVUoz?=
 =?utf-8?B?MDNBTW54SGxGN0pMMlVXUExrSVQxSmM3dGMwUTBjOGJZa051Q1hUUUNqTlh3?=
 =?utf-8?B?NmVxTXQvS0Q5RlN6NDM0Y0FUZGRKeUJ2TzRHWkZOY2FnMDNoZUxhd1lzQVA5?=
 =?utf-8?B?ZHZjRVFOVCtnQTlUbjRSTzUzblcraUVWdTdUVHZ6ZjJxL2VFQ09zK1JPRnZJ?=
 =?utf-8?B?ZEVmWW9ZRzRHVzVEVC80S1lXbW1kck5yczE1NWVnZkZxeGJWSjU3d1YzR1Fh?=
 =?utf-8?B?dWlkcVZPaWVsWmdvNnFxcHZPQ3c5a0gwVmtFWmhoQzVobURpaE9VemRWK2g5?=
 =?utf-8?B?ZGJCTUZMOFM5RDFiL0FwSEV5eGFlN0lHeGk2b1FYR241M1BpVzdWdzdUbU9K?=
 =?utf-8?B?ZUZzVk5FTGJGQTg4V3B1NFcvS3hYeTdpWmJDdmhwQXVxWkRPQzIvT0VZZGFK?=
 =?utf-8?B?Y1UvcU5kSHlCK3o5eDF1MzdUdWhWK2RzYytUVFM0Q3dlOWdTaCtLQ29GeFB0?=
 =?utf-8?B?N1cyZmlHTjlublM4OEVOQzlxSHk3aTdrT2o2TVJxKytEMCtkbmhBZFROT3VG?=
 =?utf-8?B?Z2tGbWpLNHdGUktmY3VXcmd0RjJ1NEhSbmQ2ZDdhLzNISFJpbUtEcEZ6TGxJ?=
 =?utf-8?B?anhNVXlGSW12enV2dWRjVE9uWk1EWm1OSTBaOXRvaDlLK1pub2dYWDkzbzBI?=
 =?utf-8?B?VGFIOC8yMVlOMXZzZDZ2SzZDcnZWT1hiV2NOSlJIWnduZkd5N0hrK0Z2THRO?=
 =?utf-8?B?VDJoQ3ZnUWpUbVlOWUUyZGowTzRlMzcrYitHMVJ2TjNnVEc0aksvd2F5eVNw?=
 =?utf-8?B?cVJ2RXc2R0tXMDJQNUJST2Z1UStKVnczdTVsWTZMMkRTSUM1eDFEZ3ptTkl3?=
 =?utf-8?B?encyenNKMDJtTHpLcTU2bUdFM0o4MEJ1c1JtZ0pxUDVLODd1ektpQnBtTDhN?=
 =?utf-8?B?NUR4clc1UjZpS05xS1hzU1ZoUG4wOFVYWkQ4b01UeklxbVRDcW1wcU53L2ZS?=
 =?utf-8?B?NzlSMXVYTFZXYzlySEhmMzZINzNwVFRVdGtBM3BlVXpUTVg4VmM5NDZIY2Fp?=
 =?utf-8?B?cHA4bExhWlQrZmFaOWtYVTlqVmIwRndwcnR5bjRESURTVU1iYVlWc3RaT3VR?=
 =?utf-8?B?aVZTSGJnNXBDWEx1VEd6MXFGa0N3SnlKV1Z6dnA5Nytjd1hBNDF6WlE1ek5C?=
 =?utf-8?B?cTV4WEZNM2hCOXBXV0Iwa08vSlMwN3FIL2t2eVQ2cG55UTFYbkJvZ1c0aGZs?=
 =?utf-8?B?enhlRnFVWVhCeWlsODBzUDN2T2xXTUxLZDJscHNCT2FtbktwbkN1Z2Y3bVBX?=
 =?utf-8?B?cW5IUVorcG1iZDRWQkx6MnJhUGNCQWRlenNSb1FPaGYySkp1aVdLV0loNnBh?=
 =?utf-8?B?RjB4NUFYMjR3VS9JQ3lCVlhrMjlWVmVRTDdvQ3EzU1h4enRCQVJhOFVBZGJz?=
 =?utf-8?B?SW96Sy9RaWo2Y2RMdFVrTlJRRXhNNmxkYXFzZWJQT1oyendtb0p0Mi9EdmJ4?=
 =?utf-8?B?Mk51Y1N3bG0wMVRCd3FqWkFOWHl5VVIyVWd2R3RjVERXTFFZOFpzcWVVenNS?=
 =?utf-8?B?d0ZYVzY3UWVuNHNteDRlZjg1VUJGRWF5aDV6WGx5ekNBWS8zSVlSbGZ1Qkph?=
 =?utf-8?B?U1ZnQWk5TjJUTDhhWTY0YjJ5OWp2b1VUSkVjVTBnS29uWkpUMXBuYzlvUnRI?=
 =?utf-8?B?ME5MSEhmajVjNDRveGlkRW0yWFVhWkRqMTlSanJPWWNYb2Z5MFB6WEJNREov?=
 =?utf-8?B?Rm1jSmFiMXBRN1JzelBNMjZZQlp6MnRZS2FkZEVXZmNuNUtkZmwxVjVqODQ5?=
 =?utf-8?B?STVMQTJIR0paRWl5QWtkUElCaW5sTHJldFd4OC9lNjhVUnhjT2NDNnB5NElj?=
 =?utf-8?B?TTQ5R1ExSVhLdk16bWFuY29pYnBNWnBKNi9oa3Jna084RmJlYm95ZFdsK3hR?=
 =?utf-8?B?TlZ5dlFBcGJoMG9PWFJLTFN1UGJXUHVQUnBDYk1CZURCL1FIdWVnVGd4VjlK?=
 =?utf-8?B?bnlpcVJCelpoWWwyaFBzSmhBYjhwQTYxeDM1RXVDVjJzUzBCN00yaUVUaUxF?=
 =?utf-8?B?Y1h2NVBKVDNHWm0yUWFEbmJpeUdvdEtpSEdXQUpCb2dqK1J5Ymdabmpvd1p4?=
 =?utf-8?B?cE1nUys5VGp1SDdKSzlXMGxTNm5LVkhZRCtUN3lUc2IvOERmdHIyMXRkZ29V?=
 =?utf-8?B?YVpYRE1mUUVMRHdQZ3hBeDlzem1HQURneDl0SzR6V1U3N0JScHlPRlAvSHpW?=
 =?utf-8?Q?EQ38CrWiNaXOwqqc2W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ab368f-3a23-4c61-860c-08de6d69f8de
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 14:45:04.9877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wy5g92SZ323xo1I7g9d2qGX8GZwY9KI+l3kfzg1AP7llad2rN2SP5k9S4zWp+Tf5iTWsujLaXe+gSRUoKQFXNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536



On 2/6/26 6:03 AM, Kiryl Shutsemau wrote:
> On Thu, Feb 05, 2026 at 06:29:08PM +0100, David Hildenbrand (Arm) wrote:
>>> Ideally, we want to know on boot:
>>>
>>>   - what memory ranges are unaccepted - we have it;
>>>   - what memory range can be removed or added after boot - we don't have it
>>
>> The SRAT describes memory ranges where we can see hotplug memory. Is that
>> too late? We calculate max_possible_pfn based on that.
> 
> The cleanest way would be to declare the ranges in EFI memory map, not
> SRAT. It should be doable.
> 

Got it. I'm speaking to a few EFI folks on how that would work; if we'd
need a new type to specify this or we could piggyback off an existing
type with either the hotpluggable attribute or create a new one.

Thanks,
Pratik
