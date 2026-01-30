Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010027.outbound.protection.outlook.com [52.101.61.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8A1385EC3
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769798991; cv=fail; b=uuTLHXtNqRYucHp5wrV275Js28Qn+7Ky3imQLvMfsuqPN7BCr5/3CwHal3pqq5GbHdyV60VEpVYOWrA/utegc81ryQ07mIrgRgJVoSBsRc+OjCop5Ba09r6z7FpEKcwW0HybKWbzIuILHSbIhgZjWCzJqNZBCuP94qr3l47xlx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769798991; c=relaxed/simple;
	bh=Buo0FASQCA4MvRwI/zTlUA0GSyCwoHEAqxuprAw6kAo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gaCkh+aNq0d5k+U5Uu8i1AtbOpkEocJ54S+L+g2qANHV4ur7xsehKKBlCr3toiZlsJbnvQ2yjxMfmZ0i6dSmjAs4iuRd3Y6TxJ/Q5NffPkokM2GR61j2sNeIFHIrX28iIBfIeHtwVix6jPtgkMGUwqrzi6r72fJOzfBqk17yisE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5lYGE/m5; arc=fail smtp.client-ip=52.101.61.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5lYGE/m5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vBHTIHPb/ebBAFL64EkCBfuP0A1dTqz9Ngi0SWnOplWzE8azQhFCOIwRZOE8RwQtV+4qvOmCQ5QvNrKve8bKTwFo5zFH5Yjwh/Z8fgTs9gLNrjCOiVXgO3cqBGD3teoRkRT8e2WJHCW1qDjMiHrKkPLTQt4yPzQ3fX4LF08OxMC4PhIG3OaObIu69iMnVYHrexP7p6gCAgmFagJGZOacZT/EswwKpMKccN1gH9rNPOs8+SAuIcVimCeFr2DoAV04sGSj+5xKF3sJCYcKUv7oSKQgx1pgBqT3HLWuyZ2GUvsQU0OwZMZuh5lkcGDuyru1vZtT8kFHM0zmOXIfG2IRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAdHFYtk7vS3rcfbSFGRqYR4KNZxZWA3WlIoXhnP6ME=;
 b=KOZMKs73gYLmxhrDJxxALrJoqmugfpUMVNOYiaaujnqfwdh9lYnCvCCt7dBpK6I0gtVqe2kGsrhs1Z/4Pk/29DU8LF5eS/WYlUM4AfRN75Mvzf04vJdv9cS7q7/LDFXeZVicEcRtYlEv0GR42cLjkwezsjSPkLHXjXZgoQK61FgByvkE5SVnjNVwCb0atlXhVQrWFaxBx1Q2HhrabajjPuDholcV9m39ziFjOTsKRYmJte0aFDwAM5PgLAB3YPO73/y0x6afQhwZ599H5/xBpz1xvjbQMGTclU5Eff2i8OsOAyT9FXrtLMBeS/wV/QXnqJULpvohUfv9vtKw6BT9CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAdHFYtk7vS3rcfbSFGRqYR4KNZxZWA3WlIoXhnP6ME=;
 b=5lYGE/m5bI5Fdk3a4qbL8hMapLabZzyEZLYQTjAtK19RxdnzBW4IMa6/JRtMUDO0g+S4XTbSP43WisLDm/H25WSyMk8Ny+tK5UN7n7CfPREueaS2K/N1291fHsNmkC51nQO6TYgLRCgd/UmEiT2ma8EskF/P3nF0+D+IxendwOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 18:49:46 +0000
Received: from BL1PR12MB5062.namprd12.prod.outlook.com
 ([fe80::5155:289a:c3ed:f959]) by BL1PR12MB5062.namprd12.prod.outlook.com
 ([fe80::5155:289a:c3ed:f959%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 18:49:46 +0000
Message-ID: <6bb2c25f-e51b-4d90-a67e-100bff1af838@amd.com>
Date: Fri, 30 Jan 2026 12:49:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.18 CVM guest kernel boot issues with non-UEFI bootloader
To: Kevin Hui <kevinhui@meta.com>, linux-coco@lists.linux.dev,
 Ard Biesheuvel <ardb@kernel.org>
Cc: youngjaelee@meta.com, hvolkmer@meta.com, chrisboltz@meta.com,
 tzn@google.com, andrisaar@google.com, grobler@google.com
References: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0081.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::7) To BL1PR12MB5062.namprd12.prod.outlook.com
 (2603:10b6:208:313::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 580b3f55-1769-42e2-c9ca-08de60305681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K090S0NYbFcrZmZ3N0thZGZ5bXlSMCs1Q1RCSytiYU0vdjhYZTU4NkxXVDJ5?=
 =?utf-8?B?R2VwbnYrdzAvdU9FVjNBRnhOdGgzV0xseGdiKzA4bHZwOWJjek15L2hUVkJV?=
 =?utf-8?B?TzUwa1VKVnplQWNoK0RRYkZWMFUyZTQzVUhGYm1FTFhIOHFvWURPWWMzNXZT?=
 =?utf-8?B?eHhQbXZ6SnRxVUVsMUQvYjQ4QTViaE9PNmo5d2hkdk1hcVV1VzFiN1MwRXI4?=
 =?utf-8?B?WG9naUJkelBaUy9tOGViUGlNSU91eXMyNlNWczhUNFM2V0tlYmNVcGlLMlhQ?=
 =?utf-8?B?WFZkOC9sd1JKcWExYkdOS0tUM1MzeWE1Tk5sd3ZKc2ovRmVBZ1duY3BiY3RS?=
 =?utf-8?B?U1JISmJ4dUlMK3RtMGtmS20ybk9kcmhBeHRqYmFEdDFQb2RwcEYzaDkwNUto?=
 =?utf-8?B?RDVFakZsN3J1cGEwMTFzNU9QUzlHa0FSM2FRcXovcnZ2RWZSaUtKbkFRUnpp?=
 =?utf-8?B?cnFubVhFUVQrTnRERk5wQmFCaGN5enJZZHluN056S0NEWFBzNWhyUGJFWVVo?=
 =?utf-8?B?Uy9QV0ZwNDFSR3RzRXRpckFhSTlrdmVkZnFZc3gvSjYxK0tkRi9OaE5sUnFi?=
 =?utf-8?B?WU5HanBRZy9TVTN3Z2VHejQ1T3RPTEdQQlZ0dXpqdWRUYkowUFpOT2NyR3Nz?=
 =?utf-8?B?S3ZCQmo2YU9IS24vL2VtV2Qwcm9GaTVQVVIxak5ZN283eXFBK0FMMi9tRWlz?=
 =?utf-8?B?QXF6YnBWazRZSUQrOER2ZTUyZ0FaRy9OUUNYZDU1R3VPNVhyK3ZVSWlnbnJY?=
 =?utf-8?B?WlVmVkVxVnltTjRKQkQ3WWlTVVptci9uZVpLRkF2UG5qVHlYVnJJL1hnSkVU?=
 =?utf-8?B?a0JxT0dBMThBbXNmcHkvNlE4aUVZTll4ZFBTSXJNdXNGc0l0T2NYSUpIQ2NL?=
 =?utf-8?B?K1NTWVJxMG5YUVg2ekU5S2xnbmFoZU9xU0xyam9HMnZZWnVTTEk4RElSK0NZ?=
 =?utf-8?B?S0s0Z2EraE16YVBSekt4QmxkekNlQndIQWNTbkpqMGFWdllvcFVZSXRPUlZV?=
 =?utf-8?B?MEovaVZ0M3QxU1ZuRE1lOVRRYTFuSU5LbnFaRmhRNGZEdVNNbUl1SWd6NXZI?=
 =?utf-8?B?dmM4UDhxREwrZmtNQ2ZlUmlQS2VoaUcvbzcySitUakpxUVN5Q2s0WTV3TWJw?=
 =?utf-8?B?aHJOZkpBSUVQekVrTElaY1lNQ3RHL093cUZlbzk0L2w4TTdEMzNOUy8rcTNn?=
 =?utf-8?B?ZVRPc1phTlUxemxHRisrUkV4dFJrRk5BbmdTUXhnd0N2MGtXM3FFZ0VDNWhE?=
 =?utf-8?B?dXY0dTNkT3IzYmlsdkJJTVpnSEVXNW16MlAwU1l1dmtYOGs2WU5VUUtBcGJq?=
 =?utf-8?B?TjlkZDdUeHd6TEhYUXpGS0pzUmlkMHFxaW9aRmgzOFpUUk9GTWk0elY0a1Np?=
 =?utf-8?B?aGF5NUZIemlmbUkycVZhUlRrL3hxamMxYnNxbGJ4clNobElaaWlRNVM3YXRq?=
 =?utf-8?B?Yy94d2JpVC9XUWZvRzRMYktnNVlpSnpHWExqdGtlVVFSTTIzVFhNUlR0WFJp?=
 =?utf-8?B?NVJ5ZUY3VkhUUHI4OElET0Y5VFk0a2NyTG15VW93RkRueE5uT2hTMFlZckF3?=
 =?utf-8?B?QTRzdlkraFo4M0V4Y3FVckV0WWxndnBGQTR6WE1zYWFNdm9HY3d6V0R4RitH?=
 =?utf-8?B?eENiRWVuNEV5VmJjaHhPOGsrZ0ZMRkFySjRzSXhNSXM4NERSb0lyN2s2b25Y?=
 =?utf-8?B?WGozZzg0RHZDNzBrUDFRUEhrOFYva1d3VzU5ZGY5YTl3K0tJT3Zna0x5eTJw?=
 =?utf-8?B?M2R1YTF4d3BWa1pKU1MyMFNEdzkzOXNISEkwdUFmM2t4QzFSUVdySGIwZGJK?=
 =?utf-8?B?MTR3SFdWanFWUHozNCtRSHg0bHgreDMrZk1YR3dUWXozWVRMcUxaNjRpY292?=
 =?utf-8?B?QlFpOWJuOVlQTkpERDFGb0lJTVVIejVCVHhxSW9XQmFwT1N1ekw1bVlqTXZa?=
 =?utf-8?B?dHBkblcrcnllOVZERytXbnl0RzVPcVhMcHVvdFVteTZ2OFdUVXZaUTlzNnNp?=
 =?utf-8?B?Z0hBNitERkJ5SE9WVENURElWalZFYitkL1RERnJnL1ZPR09uTmdoV2szak1q?=
 =?utf-8?B?MWVzZG9rV1Z3V2FRZDZiZDdid3dRWCtBTDlCZHNEUG1jL2lickx5ZUxhYktp?=
 =?utf-8?Q?evma5xrT9p7GR5xHGBUcGfr/r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5062.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXVrQ0pFNWwvOERha1VTanZSTnZkaTZsUG9yUW1tRVZoVTk3R2JXWFErWGdF?=
 =?utf-8?B?ek92VWs4TXhJbW1JMkx3Nmx5dGNVMy8zNERMMFFzOHk2c3puek9CRWVnc2t3?=
 =?utf-8?B?bTlwaXo5SVFpYktuaVlQdVA0Y200RTlMMGlqR0dEay8wcWMyT1RpMUNRb01O?=
 =?utf-8?B?VXI1djVKbTJLQnpYNFMyM091Z0s1QkpZOE5md2hKQ2U4M3Z5QjllZm5MVS9j?=
 =?utf-8?B?b3dwQ3BTSDVyUVJObFRLU01MSkx3bGFhTE1zNWg0TkJOVTNKLzNudEcwbDBu?=
 =?utf-8?B?OWN0cU5zWW93Y0FBZk9hRVZUYVlrY2NpM0ptNEhpcS91VWJ2YkR0Szl4Z0Qz?=
 =?utf-8?B?N3hzNlcrYlB1ZTlZVzFCNVBIdFFhbDN0ZU5pSUNDTHp1TzNaVE9vYVQ1VGh0?=
 =?utf-8?B?SkQ4K2ZXQlZVYlJvUFVieVdlV0ZyL0pVSGZHVnZaRVFZbmxBR1FneTl6ME1v?=
 =?utf-8?B?MktkbW1sS0V0OEJxN0k5VFFpNHRuV3pYNUFQRUhkRTdMYnpSd2thUUM4bVZk?=
 =?utf-8?B?Sjl1cEtXZGxjdUZsNTlaQ0NDSVhXZzBma2lWanFRWFRrWXowdnRIdkRSa1pD?=
 =?utf-8?B?K0RiOHNoZHg0V0JXZjF1Vnp1bGt6ejhkRjN0OVFsb2FxV2RoQXQxeXpya1ox?=
 =?utf-8?B?ZXJ2NSs0dHFzcVJKTVloMUdlUVlLN3BSajNnRDVaSkVwT1BZcjV0Vi8zSWhG?=
 =?utf-8?B?ajkralhveWlNY3Z1VW5NeXg0d1FwQ3hnbXo2QXB4Q3RmSXl2eW5kNkE2NVcw?=
 =?utf-8?B?dm50YXNtSUtWenFRdkRyMmxRWGlwZkFrdjR2M1N2dzhWTVNtSEVUeTI5TlJx?=
 =?utf-8?B?MU8weTdZSTdPT2Z2Z1hueWp1NnE2Tk9jT0RCTHcvaHdSLzNpKzRzWVJHeXJD?=
 =?utf-8?B?c1Z5MEkxZlBPcE1Dcmw3dEMwVWlBalJvRlJLUWFsVm9GN2ZtRm9UQWRwRFlo?=
 =?utf-8?B?VHVsSWt1ekRNMWR4R1FFTVM2OEE4UmdSejJNYStXenlpQUVtYytVYXZIaFB2?=
 =?utf-8?B?WGtnVE1iS3Fsem53ek9EbHdsbjZuczF3TUVJSEMvR3VaUkErem1DMmV2UXgw?=
 =?utf-8?B?MStPSzhHQ1l4TC9KOHR4bm9mYnA0cGY5M21kekpIajM5ZEdRb2JMR1B4ekl1?=
 =?utf-8?B?NHNZd0NDR0dncjdrbnBYVnQ5ZzJ3SnoraS9NWUhRZTBHWWVwVVVTUUdONEZh?=
 =?utf-8?B?MEE2T2ZabXFDMjBNa2h3ME1JVUNjYWJxN2NKd0g1M1Z5SjlDbUhGcjJwOStX?=
 =?utf-8?B?MndHdW5hdG5mdGdtT0ZWZGJMdzU4aDRiYnBpR0tQcGJPclpISHRocW1YUHNH?=
 =?utf-8?B?QUhZbjMwd3I2eE9BbUNtQnE0dnFYMW1FZHlKbGxVOU9yRDBocCtCNTF1RVNn?=
 =?utf-8?B?YlhtZ0ZNSWYydnVCeHpCMllxR3p4QW9iYjFmTGtzcWNTQkZrUkg4aTRJbkVF?=
 =?utf-8?B?WWpNOWltOS9WUUNkUjJuVmIzcTdRTnZ6b21DVU5uLzQxVkVXcWNtc2pyam9P?=
 =?utf-8?B?SHFrWG02cHJGaERJN0hqZ2ZURGRPemJiOGpHeVpLMnhNZVZ1Q3JqRS9YNWxu?=
 =?utf-8?B?WjNSc25UNXozOExSWVl0SFJmUnVNUllGcmV2Q3lNVTFFNWRSaTZJNmpPZnFV?=
 =?utf-8?B?ZW12U0FCS0VSVTdMdHBUc3U3VXgrZ3lDc01pdGkrY2diNkN2WlAxSzZ0YVpp?=
 =?utf-8?B?NlNjRUsrQm5MNjVJUFQ0b0tLZTRJS0haemYzQ2ROVy9YeWVZWFZNOVgybzB3?=
 =?utf-8?B?M25xZXhXSTdkaExXUTljVVFuQjk1d2dtWjhGdU41WFVab1dSVnRueU1lSnlm?=
 =?utf-8?B?VmhNTTB4ckEyTHFuS3JRSjJVNzJjdklGNU9EVlN2anBOMG5WUEU1akRxd2RG?=
 =?utf-8?B?d0w3YXBvczdVakQwSDhhMDBjQkZqbU5hZkhNdEx2UzBvb1VlejY5ZGRKVGVV?=
 =?utf-8?B?ZzVBN2sza2xLQVl5SmwvMFZMQXJhTWpSdHo3Wm9SZGdacmdRWDNIdHVEclVE?=
 =?utf-8?B?OFZaTjJTbm5jQWFualhTaXA0RTB1S3NlMm1hVDdZR1JaNWhsa0tTR1RZSUh5?=
 =?utf-8?B?NDdiRHFBcG5iNHI4TU51N28yamI1cnBZOFRuVzcvUUxSNkFVSk1Sb2NpZVcx?=
 =?utf-8?B?RXowWHpQRmkxU2JCWk1wNE5Lby8xbGR0UEh4L05uSXJYUTF3dERtYW9IWk1L?=
 =?utf-8?B?S2NoVHp6M0F3ZDNKNnlWYno4VStRL3VNU3RuRXlhcG5aYURWSzRpYVV0ODIy?=
 =?utf-8?B?QjRyTHJZc2d6VUtOQzJHK3I4cEx0aUVhdndPaWt5NisxRWl3Y2tSTVR4MnJy?=
 =?utf-8?Q?oENpeF+IOoAWvW8l2W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 580b3f55-1769-42e2-c9ca-08de60305681
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5062.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:49:46.1686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiZHAlNDd8IvCEHZZjv3B5+oQDCTXAe2G5MINqxCHTbYNSCV1RTppi0kQhU+SXb/hnbZAtrnIU83cAslqLYBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874

Adding Ard

On 1/28/26 21:57, Kevin Hui wrote:
> Hello,
> 
> We’ve been using a non-UEFI bootloader to launch SEV-SNP CVMs and noticed that
> there’s an issue with booting the newest 6.18 guest kernel with
> the stage0 bootloader (https://github.com/project-oak/oak/tree/main/stage0_bin).
> The guest kernel boots successfully with 6.17 and below, but fails with 6.18. We
> were able to reproduce this with host kernels 6.13.2 and 6.18.3 on Milan/Genoa
> hosts.
> 
> We traced the commit that started causing boot issues to
> 68a501d7fd82454525797971c6a0005ceeb93153 and noticed that for some reason the
> variable snp_vmpl was non-zero, even though our stack doesn’t run SVSM. This
> triggers the sev_es_terminate() call and subsequently crashes the CVM. We
> noticed that the commit removes a supposedly redundant rmpadjust() check, but
> from our observations it seems that the failed rmpadjust() short-circuited the
> check and avoided the underlying issue.
> 
> I was chatting with Tom about this, and taking a deeper look at the issue, we
> suspect that the BSS is cleared after the sev_enable() call in
> arch/x86/boot/compressed/head_64.S, and that because of this snp_vmpl contains
> random junk and is not zeroed. When coming through UEFI, it seems that the BSS
> is cleared via drivers/firmware/efi/libstub/x86-stub.c, but in a non-UEFI
> bootloader there is no call to startup_64 and so this path is never invoked,
> leaving whatever random data was in bss to remain.
> 
> Perhaps the proper fix for this is to put the variables that are set as part of
> sev_enable() into .data so that both non-UEFI and UEFI bootloaders will have the
> same treatment from the kernel, but I would love to hear everyone’s thoughts on
> this.
> 
> Thanks,
> Kevin

