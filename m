Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBEE2745C
	for <linux-coco@lists.linux.dev>; Thu, 29 Jan 2026 03:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.145.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769659070; cv=fail; b=XZ0dwcKIC/GQ/9wKooluWMcTOvyt+0QJye3Gi7t/6zlvfn3ItfQaXOS+y+ZtdQ0TVDCU+uNGikGP4wOZ4UutC6IR4rP2Vh52wW9LuDLgLsoD6T3vbqXcNtriX98ndcruOmbN9Ir1XI+uH2ZQ20qkgzb3MVm7RvuEqSiNPSehc+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769659070; c=relaxed/simple;
	bh=aCixALZ1S0amHFg363v0DaUI4z0/Vv1GmFTUNikGeQY=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=YtRCBUuCVnUg7t52qyjEKK1XJ5B+6MBcWJn2gXJfmcv8IZ8OxOI6MMqOmLaxEcInUF8hQpBbLl05jXQe5rxSUht0G8EcjLAJBECcmhM3zwnBlXHwXt8IwbuUhgFnmSHQnvSxUgc23EJp9El9Aaxq7v1GQBVPc1TLcFr+zBSvfvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=ukCnEGv9; arc=fail smtp.client-ip=67.231.145.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="ukCnEGv9"
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T0VbVs1845510;
	Wed, 28 Jan 2026 19:57:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=aCixALZ1S0amHFg363
	v0DaUI4z0/Vv1GmFTUNikGeQY=; b=ukCnEGv9fuy7ceK7BlrRI/wJH+UyRR7m3q
	QZxbpIw6ZzEc2G3/hQ/tPX2S0rRUEDoKi8b++9MHimOUKZZ1T9axUh8wHqIbJ76b
	YRiLkMOIzapPr04sdxxbqBuTJZWGv+m9LEjDTYxfMlIs0bLuwIjtib1ptpN/mSeC
	OCiW3eLqbvOuvj9kOsWh8qNbHp2XKL6bB9ZL1xfsyID0/wjIkG4Ky5JBiYXMdcOt
	cLcMVcphqIKh6c1ySHq24HkvJpD4MX703mWPsukdP5J/blou7cVbbiitrvi7fQp5
	XvjVu/CFfQCOTDCJunLf0mqHIdSJQFFvuEb7pWM8XMJwDwkWOzsw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010048.outbound.protection.outlook.com [52.101.56.48])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4byw38havy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 19:57:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzP7ar0McBjtKSdPVqFlA3Oz3YK8NUC7VR4HB0UhyB9tFozLQW6p592IzEGBwJi6Xcj6SdMEWsbQefdUz5vwazA1h8Ta2MKDflZ97t5Yvn24ip4ywIWXNNwZ9YMyWr1Ggp6rZA2oLgfLUMEhsJGr6oObxQSB4qBz1ZejOMfbCOy2gMiS2aK9hoRWYOoqETJPXQja71PUHkbS/I/5oxGpLRGDkfxzcN5/3YA+7pXy4sBgxCX1FChOE3ITp+oZAmCkd+L5mawnICbCYskXSsQzy2CWbtnkNjhwZZUvzbPU6YUqe2m5LjY8PwsbZeOZbbACN9OnNCx3UcG4wh6x+7BiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCixALZ1S0amHFg363v0DaUI4z0/Vv1GmFTUNikGeQY=;
 b=fWrqpBFWR4p/bPGOCCNaht70Y3Gj2427S8hf9BiBKQhWtEmFMVjTtROhf1EALaDkibhdxyiEoeAMTjXgoVINoEptilV/uGHxgE5LTGg0KZAy3P26oLrPLmICCH3DgrxMpkL15J4U2zItHCbz+zPEmwG1tt7bwzNFXI3x/Czcx2mjMB8ijgYJ+gnjWnEBLs82vMwayc3BB8G53h2vEAnoOuStKDUj1pvcXWPc2L+PtTQ/E3eEnfppG90UrQyX1fifAZ8YJX6vaaGcEJGXYLYVAHEccJ4zmbVZBe8Fh4Ov7pU/H3b4PKMSjnG+aD7AUCjeqmvkjBOZrClN/OhcxpdGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from SJ4PPFCFBC0D89A.namprd15.prod.outlook.com
 (2603:10b6:a0f:fc02::8c7) by BL1PPF3F069BAA8.namprd15.prod.outlook.com
 (2603:10b6:20f:fc04::e19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Thu, 29 Jan
 2026 03:57:42 +0000
Received: from SJ4PPFCFBC0D89A.namprd15.prod.outlook.com
 ([fe80::4aed:b69d:7ff7:1003]) by SJ4PPFCFBC0D89A.namprd15.prod.outlook.com
 ([fe80::4aed:b69d:7ff7:1003%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 03:57:42 +0000
Message-ID: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
Date: Wed, 28 Jan 2026 22:57:30 -0500
User-Agent: Mozilla Thunderbird
From: Kevin Hui <kevinhui@meta.com>
Subject: 6.18 CVM guest kernel boot issues with non-UEFI bootloader
To: linux-coco@lists.linux.dev
Cc: thomas.lendacky@amd.com, youngjaelee@meta.com, hvolkmer@meta.com,
        chrisboltz@meta.com, tzn@google.com, andrisaar@google.com,
        grobler@google.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0057.namprd20.prod.outlook.com
 (2603:10b6:208:235::26) To SJ4PPFCFBC0D89A.namprd15.prod.outlook.com
 (2603:10b6:a0f:fc02::8c7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ4PPFCFBC0D89A:EE_|BL1PPF3F069BAA8:EE_
X-MS-Office365-Filtering-Correlation-Id: fa09649c-ffea-46d1-3ff2-08de5eea8d93
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDcxbnVSN1M4YXk3WU1LRXh1NUVwZ0M1dFhsNnRJemlGM3RkdHlISHYxa3pB?=
 =?utf-8?B?MDdlZHp3dHkxRWlJdXNVcTZhVmZFSWlBN3AzRGd4NkdEemJaYjIzN1YzK0VK?=
 =?utf-8?B?UFl3RzNvM1cyTi90aUpZWmxhL3BtRUlrT2FoZW52cFlNVHo1S2JoOEZUak1s?=
 =?utf-8?B?bktXWmdTekF2SGxxYXliSmlJdFU4alhudTJIa2J0Vnptd3FVbFJOcDBvR092?=
 =?utf-8?B?OFZCMmZxSTJtSFdmTlltWXgwUFBEbXZLU2RPNlBNQ2IvSFU1RXVGUUd5cnJW?=
 =?utf-8?B?dVhCWnpoeWtZc2JlTkY4NnB1YVhOWUpDcVYyWUpMSndUb3JlSWRJMzdWMW80?=
 =?utf-8?B?RlZ6M3ZrODd4TWxrTStVcHRmdWxXU3h6a05VamF6bHM2UTJieG5aZjYveVBV?=
 =?utf-8?B?Y2NZeDhia3BMYWZ4QWZUS21MZjMrdzFySVV6Zy8wRlZ3YisreDBieHQza1Fm?=
 =?utf-8?B?bHBJZ29BU2FEdDVURzJhMHZNTGJlL1FNOTgrNWNMUVNJZkMyczY5cHVjVXJ5?=
 =?utf-8?B?THNlK0ZyR1NiUXRrQ3BGdmVKRlJQSHRIM2YweUpERXNxREMxb2ZVdElDeFQy?=
 =?utf-8?B?ZDFKbzN5RzdQZUI4TVBBU0Q2aCtOayt2VVFGcGlQY2UyVWZhNHBPeXAwOFhi?=
 =?utf-8?B?cUhNM2RqL1pVZFZYcERxdWYwZDBEbHM1TU1iWDdTOENjTW1mR0xlcjdkMnhQ?=
 =?utf-8?B?MEVmV1h1WDBoYVdpQjIvWWRBMlYvdnpUWkRPUW1OZ21xYy9aVmNUcVFhTlZY?=
 =?utf-8?B?OExCMlJKTXRYcE9LRyt2S2I5NFZqcmFHdWw4STZwdGNsNGliWGlLRWZmY2p0?=
 =?utf-8?B?OHIxZ0xHKzhRMG93Rit2bDhSSUdxNXB1VkxFQ29PZ2UxZkZTbHFJNkEveFIx?=
 =?utf-8?B?NGUrako3cUt5UU1JVGlka2gwU3pDSys0YStxRnhVeEdNdUtmbGdhK0FrYUQ5?=
 =?utf-8?B?bEhiTUNOTGUzaGtQeklKRmp4OEN4c2FRMlVIQ2d6VjlFTHVGTFlmZHNrT09r?=
 =?utf-8?B?Vmc4cFZ3NlhEZVNRNjZTNTFOK2kxenB3VFVLTVp1TStUQnJ4YkFtcXo0dkdI?=
 =?utf-8?B?QnJ6UDhyQkR3R2l5S1lYTUZoNTVQNmw0OFRsSUlldlBTbE1ubE0yaXNsMVls?=
 =?utf-8?B?ejdlSTI0cjNHZnRQSG5BWSs0c1ovR3R3SlJsaXh4K0ZvTG8ybk1iUFFaNTJi?=
 =?utf-8?B?eGZpemhOdmhPM0xIRGRmaXZkaGVIb2ZodE9VQmVjSGtqdDZJb2ZZK0x2cTI1?=
 =?utf-8?B?dEdYalhqNWFIb1hQMnVNMkU5dlg3ZEwwSlhrTE5hbm9oT0NVdHJHUmhpZTZo?=
 =?utf-8?B?TUtCSGpGZEJIc1l5QzQrMDNwVEpCdXk0bS8reUNUNFZOQWkvVElzekFuUVJI?=
 =?utf-8?B?WGV2OXdSNG5TTTJ4V2tKeElaRTlKa0RvUmtXWUgyQnBFc1pXYldDSkE5SzBW?=
 =?utf-8?B?R3I5OWFoWGpleUJIaHRLTlZMUjd4K2UyRFE1WnFlQ1M0UkxybWpaeTJNVmY1?=
 =?utf-8?B?ZXhjYzlYamtlazBXbFhkK1kralBxTmNHdXRVNGEwNWwwZGtPNFMrWW5Qallz?=
 =?utf-8?B?alhINmZqYkxLNFova2xjZE1GU0h4SkovZjNWVWZyWnNhUGF5MFIrY1NYbU9Q?=
 =?utf-8?B?QWhTMWwxbkJ3bllWYnJYSXRRQTByZ05qSW5lS1A4UzROb2E2T2p5blpUeWdU?=
 =?utf-8?B?L21HNFBvek1VRXg5ZzUvSU1JS2FweVdVRW1IZWVvYWNaY0FhZHV3MmxIMzIz?=
 =?utf-8?B?Q2tlTDlhbi9tZnN2UkY4ejltU0tLK2hHaGE5a3pNTStZOFR2LzVCRDFVSWJn?=
 =?utf-8?B?U2hQYWs4TXFUb1EvY2czdXBWNmFuamNFMSt2L2wxSGVBS1dIWTZUWTNwMVIy?=
 =?utf-8?B?aDFzMS9MNlY3aWVlSnczVmhDQnF3b3NPRURTNFBnT21iWnhmRDN0TzNNLzVo?=
 =?utf-8?B?SHo0NmZrRWxsU08zeVBqcmVPLy9QS2lhUExKWVBUbFc0K2MwaG1sNUpXejR4?=
 =?utf-8?B?UmNYTXVuUGc3MnpmVmF1M3JBRnVVUTV2cEF1UDhJRGhWeU1KQ0xzVGxwaytF?=
 =?utf-8?B?SjNFSzdrVzRyRS9oZGhKZGRTaTRWNktYeUNxUFNHeG5zemRFQXBlYi9iL3BV?=
 =?utf-8?Q?H3Ly7TAopdgC91RHYYhcTPsMW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ4PPFCFBC0D89A.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTNlcUhtVnBCdCtJYjdKTCt3ME9LVHZaWlp1T0ROUmZNY1grRW03M1gwbGxS?=
 =?utf-8?B?VmE4cUQ0aDJWWEQrV2NYQWxPZWF6bFhUVWVMY1luK3Y5dFhkNy8wdU14dlBm?=
 =?utf-8?B?dWxuTXRSOXNWeXd3NWgwZlVKazdKL2UzMHQya2pwRG5aR2p0aW9vZWJvY3RJ?=
 =?utf-8?B?dXMvbCs1bEVkRHdWcG5ZcXlYNDhOQ3ZHOHlEblZLVG5ibWJDcXpNSHlxNXdh?=
 =?utf-8?B?VkRacVNsc1c1aHcwRXVBaU1qV1h6NVpqelBzQWlrV2JicjJ0eHI2cVdOQll6?=
 =?utf-8?B?RXVIeXpOUHZ6NVU2RVloNDRMUjJuazRxTi9zN3FMYUs3S0pEVmFkQnRXbysy?=
 =?utf-8?B?dkc4MmZ5Sk0vZ0dFZnpYK0FyR04vWVYwMlB2ZjRJVjhCWnNRMUh6QzVYeHlB?=
 =?utf-8?B?Mno0SnB5SkduemlYd21uSzVXaUdNSng2UHZLZUpsUU42LzBvY1pIMlNBUmg3?=
 =?utf-8?B?Zm9QQXc1azNOVWlCY3h2MnVVdDUxUkFBM01maWtKSm9DWnhRbldndzNNZVBQ?=
 =?utf-8?B?RkQ0Qm9OdHdKMG9tTVpkb0dtRDBUR3p4Ym5ZWDhIMXlOU3lBSHFHTi9rWThx?=
 =?utf-8?B?U1FGYTFXWG53Q0xpMHo4a081eVhQU3ZTL3hJQzViZW9Ubk1QSngrUDN5TjlL?=
 =?utf-8?B?VXczQUVrd2VGWTVvVXhsWUJrNmxIZ0I0RndBOGVVT0N0bGd4QktLektoeDdS?=
 =?utf-8?B?N1BEMXU2NW1WS2tZMHV4ZDBQQlBUdGI4Zzc2emZjK3BiL3pZTWVrd0JocFJY?=
 =?utf-8?B?bTB0dU13Vkp2dzlrZkFIWmlqZTJ2YTljUUF1U0d5ZkJYMzRZQW9pVzZtZjZr?=
 =?utf-8?B?U0l6VFBEc2hOamx1SkVIWjNrQWtMcDZuYmpZZFBCOVJtTzY0Mk13WEtqVldU?=
 =?utf-8?B?SmRYSUpOWDdLYXBEVjRjL09HUHdZWkZidExQeko3bWE3SWVTZnplb291a2JG?=
 =?utf-8?B?LzJIdm5ydDBsSUV1NERocWtGUzVzWnQyMi9jVU9hZmh1bWlVNVp0dGhraUdP?=
 =?utf-8?B?TlZKa0RFb0VFdGVRQktYVUFGWjBSS2lBNEhZWmtwcWk2WHNsdGZBSjJoTU4w?=
 =?utf-8?B?YzJiWVhhYzU0SEtXV250K1hnQWhOQWsxOHc5S21ROXpvTHN2TkZiZUd3WENR?=
 =?utf-8?B?VU5kZzVJMGNpTDhySDNQYXNtdTVraTYyWUxUdG9IeFdZUUhSLzRPYVBEV2Zs?=
 =?utf-8?B?ZytwaXFwb1NsbUc5NE5ENldpZnZlQndxVGtaQlltenJZOHZZODk4eDVBR3h5?=
 =?utf-8?B?UlpZcXJqUnVyTGRHZ2Z0VmFHTlkrVWgvS1d3SDRTczZ6MlFGR0wwYVVnWnFL?=
 =?utf-8?B?WUUybnZhbU5iWEo2VGV5OXpMbDdIZCswMlJ4cS9rcUZHeUNXcFpSNXlYSS9s?=
 =?utf-8?B?QVY1aUxvUHlxcDhyMWRYQlgxOWd3RWdOTjlhRGJpdGlWeDlob0NhMzVOdFA2?=
 =?utf-8?B?dVNhSXc4NGR0RWV1K1oyT24reStvVHNXenZ0NUlWRGZHYkQzcXhWQmVVcWtG?=
 =?utf-8?B?VHdLK3hIVmY0T1NIcDBOR1VJK3NpSDdra3IwaTVrSGF4bklPQkVnYWswQmhI?=
 =?utf-8?B?eGRLeHROM2N0RVloL2h2L0lybUtTc3Z0T1lsKzdsYjdrK1NUWlR6WXl5Mmk4?=
 =?utf-8?B?RlpLZTJ5U2wzY09xYWhzNW9tUmFDaHEvUzN0K3NXbzkxR3dnM3hPa3dVSHY0?=
 =?utf-8?B?UTRPdDZKUm9BcVJtVDBlUmdQWE0yQitxTzhkL0R6TGhKVElRNEdWRHcvOEZI?=
 =?utf-8?B?N3JvZ2xER05iNDE3eVRIVDRIeGErTzNGVTFRbGV5NkRpcE9JRjV2UzVxTWJh?=
 =?utf-8?B?TkxOK1JVQ05wN1p6TmtsWmpJbTByU1VqaGRnOURDa3V0UlBBS2NJczY3RGZN?=
 =?utf-8?B?Y0h4eEc2OXlhSGhJMkx4Yk5RYWViVk1hbWxpcTJ2eHFjV2FXNGNBaFpUT0Vi?=
 =?utf-8?B?NTYybXR5SU96czRjWitaSXJRV0FXWUxqdW5SK1FWRkYwa3oyOGRLd0NUWjZy?=
 =?utf-8?B?NTNzR2tFSEFDMUp3Um5HM0xOYjJkS01wc3ptajd3MkNLUUI1cDRIbGFtS3V2?=
 =?utf-8?B?dHhHdmlKK3hzVURUWkJEQnAxUzFIWkc1U1UyZS9ZTCs1MTlRcmpkS041a1RB?=
 =?utf-8?B?M2Qzd2tjRS85WTREV29PaERHN096em5wclZaR25pQzVqYnloYXJ2Q3VMK21F?=
 =?utf-8?B?YmszZUZSWUh2WkZBMlZaL3dyVnZGakYwWlNsUVliUmxlMWpZeHFrYTh3bmVo?=
 =?utf-8?B?WUZoM3ZUeE9MaGNQZ1RRQ01KTUxEYzZiWWkxMnoxNXh2amdyb3AwVkRuM0lh?=
 =?utf-8?B?S3NESjA2UjZFTkVxaDRNRnBKUHZWL2Z2cm5BTFFMaE5qajNSVDFRckRRQmFQ?=
 =?utf-8?Q?mwtQONtcJdtbsbTVQGVK5/H54tzDdhHHPydAPrTMBLF1X?=
X-MS-Exchange-AntiSpam-MessageData-1: JvX21PQL6fdmjQ==
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa09649c-ffea-46d1-3ff2-08de5eea8d93
X-MS-Exchange-CrossTenant-AuthSource: SJ4PPFCFBC0D89A.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 03:57:42.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F06KSLaqe423xcgoGez1xLgUXpOTsWn7dwisHKFAeX8R30/oiKM5bycKf+W39v16+Rh34J+VClD1C3U2h3G1Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF3F069BAA8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAyNCBTYWx0ZWRfXwk5U0BYXrunq
 z7Ked4++Cd9I8twYkCFecARN+CR4tbbB2EB5ivsSrYV74srRHFcJbu2CBTBuomvUVrtRfX0LqEC
 h0jlm+dK2paeRE8zIYwB2jhC0nKTlXz7/ESPCDmIKg2Yojs7RQ7ouOrrLL8ikzw4+n3VdPbaiHp
 QhdxVu5E2alk51fHOuYh0dNJCf+lbrhBbMj87l0nhiNHk3cjO8wQLwRgznyiLKl1U7Myjl/gp2G
 3TSD40rquh1/d/YOgUoRZz8/JSl68AVVCBJFbbAycdchqItboifkDbW0koExl8RmnKbs9hpWjwK
 WcZZOQaHVEJPHNA/3Tx2N19kZrx/bPKTTDWUR5TlFTopTD24vwZ90rCAoMtQguuJvKNnTDfKtEZ
 u9tM4U+Jjd9SuksruId/bc0bNMJ/W+ApWsbXa0jA63blRAx4rwhEZ3dmBN0B/bZFTZ02ioS6VwJ
 M+gD+hnnMqo+NHAGzOg==
X-Proofpoint-ORIG-GUID: Hvn6zd3v51g5SDN47wVjlPrV3ofL81u9
X-Authority-Analysis: v=2.4 cv=W6U1lBWk c=1 sm=1 tr=0 ts=697adab8 cx=c_pps
 a=TQumU+mCWarTt0EIZfG+ng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=2hbFlGmNrB_GbUxva8QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: Hvn6zd3v51g5SDN47wVjlPrV3ofL81u9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01

Hello,

We’ve been using a non-UEFI bootloader to launch SEV-SNP CVMs and noticed that
there’s an issue with booting the newest 6.18 guest kernel with
the stage0 bootloader (https://github.com/project-oak/oak/tree/main/stage0_bin).
The guest kernel boots successfully with 6.17 and below, but fails with 6.18. We
were able to reproduce this with host kernels 6.13.2 and 6.18.3 on Milan/Genoa
hosts.

We traced the commit that started causing boot issues to
68a501d7fd82454525797971c6a0005ceeb93153 and noticed that for some reason the
variable snp_vmpl was non-zero, even though our stack doesn’t run SVSM. This
triggers the sev_es_terminate() call and subsequently crashes the CVM. We
noticed that the commit removes a supposedly redundant rmpadjust() check, but
from our observations it seems that the failed rmpadjust() short-circuited the
check and avoided the underlying issue.

I was chatting with Tom about this, and taking a deeper look at the issue, we
suspect that the BSS is cleared after the sev_enable() call in
arch/x86/boot/compressed/head_64.S, and that because of this snp_vmpl contains
random junk and is not zeroed. When coming through UEFI, it seems that the BSS
is cleared via drivers/firmware/efi/libstub/x86-stub.c, but in a non-UEFI
bootloader there is no call to startup_64 and so this path is never invoked,
leaving whatever random data was in bss to remain.

Perhaps the proper fix for this is to put the variables that are set as part of
sev_enable() into .data so that both non-UEFI and UEFI bootloaders will have the
same treatment from the kernel, but I would love to hear everyone’s thoughts on
this.

Thanks,
Kevin
