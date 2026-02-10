Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55040318BA7
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 23:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767234; cv=fail; b=oyyyEcBEbw1kuIWCAQaYfxzlKFahnceX/LnAbrdtcbUHynGYTQ52KcrsfdoDL1oSCLByIsBx7UIEgeloAe1KRObiUnqp8jyNaOQ7q6VHh3U9bmpB+rL8rVTVjBos7kTiKbH12yHV4iJTw30j6C4nj78yHIPRO/1ZWR0Jxs7tI0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767234; c=relaxed/simple;
	bh=pK2PsyTJ1rUpd5l10PDu7vIOvIsT2L3WNkeab7gdE5E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jv1uVCBhIlYWk4gPqa+sWaTckdBOhQMel+uzH0I/L9u+ZFPoTkucgWjTNgyxFZuS6bBlROQq6pKRodL11I58UmWqzy5Iy4Rq6XeZc1AHXv64+cJXJVcSBVKuBaX6DcBh17B8Q+2GbwBPelUP2OvDbce4jIS1/Qqu0UoSnwrR9Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BPSK1Dr/; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BPSK1Dr/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUuB5g7Xv4vhUW2O3ifR9WXp9zz3XUi3JzxYkSxXHxssy0wzuCcOEGoUSNxgMmdsKwTPE/G6BwEEs73NAkPqZOBXNNJc7S4tN+nyLznC3ln34ANJsGR+JNvyt/e42C4SUfmZrAP+bcFQHqtnL4pKqI2Mv6jlnGMCMqxeQdnu2NuCkl/rMn3Lgd+FIzEVPIttP+K6mONWhfi2RLLywae72gNFO+bXupXVnv0PSm0QSnULZzl1QkDtClEvxQhRV5UDKELKRvGv4VeCgh5BKDMe8utqkYXPNrHj2KilsD8afB7j44ozTiXVk0GIRYW0HIl7nj/0xkwhv7wX/gdu5MoEgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BufhnZjpYUw5UXbHjHvQH3KwBmnubX/oy7izccwT3U=;
 b=NoQfEVOiyTCSx44ODj9P5Wm2t9PMzqVOeQHM2tNfZXRRqk2EzMcrnzeO2n7INr3aBvNfq37MvtuGJQlvXfLPBKAbpsA4rHAwUczMzt+aNMBuGRIR66egVhWt/57Tuyy6YlHULASubD2ATMLJTlcMYAPAXEod0aSOqbHoWLVhSUfGVTH1WVnydaW82A+tpINJkZirYnKVCp2z+zNtav/m0Ctja3YCLb7q2D98dWmBivr4l+8oeF8I/ayIJ6gtisCGQP8u+x8/neUPAcV1cQB3wUEhkwPEOSf8dRsIoZ2/GvplldHNKtuBICPsrAPlSA619B96R8zfWfKvqJ3ZaWE/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BufhnZjpYUw5UXbHjHvQH3KwBmnubX/oy7izccwT3U=;
 b=BPSK1Dr/tKrN39mHVgua2jwBEOiOZG5m8Y1Ew82sqikJATeAlsKFdUr6uhI1+cQqyiDIvljMCKGKuHwvvfOhFGITBjunoOmF3aVWZqyA6mFja6aaWUVRZcpNt+KXbKNJdo3qOSYNDbD6+hsWUciLROKYkHTtjqQwzIwVglSSykuETuCk9o3hmVSbKpWYOJQVjiwYqITWra73hMBBkTL8aN1qv1z7eZv70QiuMIkd8vAMlsYWfJZL4r+9zCdFA+KCD48s5BptyxH/q7VkgG/QN7MYTPkZ7WKjOCg+Rmm2zguniMmT7HP2I3wlefCSlSzbKCB4VaqvBFjS1raWua6EGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Tue, 10 Feb 2026 23:47:08 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:47:08 +0000
Message-ID: <8cd334f3-4fd2-47fa-aecf-dbdb60fc4a6c@nvidia.com>
Date: Tue, 10 Feb 2026 15:46:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
Content-Language: en-US
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, salman.nabi@arm.com,
 sudeep.holla@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org,
 mark.rutland@arm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
 <20260210224023.2341728-2-vvidwans@nvidia.com>
 <cb7f90b5-6e13-4659-a448-1f621b89c71a@oss.qualcomm.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <cb7f90b5-6e13-4659-a448-1f621b89c71a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|CH2PR12MB4277:EE_
X-MS-Office365-Filtering-Correlation-Id: dd0a2311-c330-4cfe-9690-08de68feb3c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0NXR0pUZkFTU1Awb0djVFNCQitwcU0wVFVJN0dUMXdkN1Iva0UxQ2lldUw2?=
 =?utf-8?B?bzVFY3BKeVBEVWdGUmNoTFZtdU1aZk5ZcDdIUGNkWmlqTWE5YzkrS0d4aUV0?=
 =?utf-8?B?NTJZWEc1bm9mcG5FUHdTNGdLWjdSdi90VklSeUZOeFd5TVAzZU1oLytDOFdP?=
 =?utf-8?B?ZzhsaklseFRUWW9ibDZva1pvL3J2TGlOakJEOGp0TmxQSDFiK2pvcnJKa3dw?=
 =?utf-8?B?MWJqNVhpcWlldmFEamwzc1VtU3NCb0Ruc0lXS21XMjd5eDRCOWI3ak1hNERH?=
 =?utf-8?B?UnRrQXlmaG9qcksyNDNzbS8ySW13Rzk2VmtTNS9kQUl0YlNRS2JMK3cxWnpY?=
 =?utf-8?B?U002c281SHVZK2t1YXAvbmIyY3lNUWVtK2ZuZXIzQlllY3l4S2YyL3J2cDE1?=
 =?utf-8?B?SGQ0T0d4RkVHNW5QS0FjYlJTMG9uYk9wcUhPOGxqK0dEbkUzcEkzc0lPN1FX?=
 =?utf-8?B?Nld5NFltMVV3cHpUaUx0N3hMbHFNMEc1TnF2bWRFNXozRnF3VHVaaFhqa1Nh?=
 =?utf-8?B?Rm1oaXdld1FmQzVTcWw2eHk0T1h3d0NSVGFMeTM0MUVzWG1uV1VsSCtXNGIz?=
 =?utf-8?B?WnA2cnFmMGFlZDJ0UzZnTWlaTTg3SGl2ZW1ySG8rNkl3M25RSG5xNmNtS25M?=
 =?utf-8?B?UU9nd0FwdnEyQTQ5YThpSkRoUDlVazhyaDE5UDVFWDUvNUxvRXJLL2NMMFlh?=
 =?utf-8?B?S2dZaUFaL0lVc1p6R0VQaHJOaVFyRVlHekVXZUxxaytyRFR4eUNlVTRTTUNw?=
 =?utf-8?B?cUtmT2dGcFNqcllOMEE3QVZQd2xicElJdmV3eXo2Nis1VnV3aWdFTjBFbmRx?=
 =?utf-8?B?WUNwbTgwZkIwN0hsbjE2U05wRFNuY015NXlHZXNST2lhTHdaeXBja0I3Kzcy?=
 =?utf-8?B?bzI0ZkptQ0lIWlo3RDVKNktEalh1blllY2s3SDROWnJqaHhtdzVTeHpGS1pM?=
 =?utf-8?B?K3oxRTNoS3hPbXRYTjVqM1ZTdFBya1ppYWdTTElPOHNSTEJ4d0NBT0ZaTExw?=
 =?utf-8?B?bFRHRVE1cUJtT3JBQVhxNEYzM1JVNnIxRTVWajkwY09oVGVuQVFpK1NUWmlM?=
 =?utf-8?B?V2FNWjdiNVVReDhURlhqY0t1RjdkdC94b1RyRElneW5jRDUyVFNyWG5RWkNS?=
 =?utf-8?B?ZUQ1QVZ5UTRycVdTSGxLb1FRV2szWS92UzFNS3N0RnlVbE9FbC83OUpIVVVS?=
 =?utf-8?B?ZVJHMHdzRDNvNjVOeWNQNzAveHJ4UVBsMytQNEx0cGJOTTFSQmtYQ2NVM1NX?=
 =?utf-8?B?UHFmR2dYR0p0MUhDYWVsVUdEWWtlSjM4YzY4eFJFOGxRaDdQMkJ6dHQ5bGZt?=
 =?utf-8?B?bW5IRHFRZjB1N1NQd0pjaWRtWHhMeTVYS3RaRkh1ZGZxTnlzTExQbGJXd21l?=
 =?utf-8?B?bFJaUXIzeHlBaUdNYUpYeVpaU1NWbW95UGl0Z1BRdzBiTnhRUG9iOEE5WmM0?=
 =?utf-8?B?QVRTZEJFZWwrcVpCZEl6aUtWK2daa2tzYzlmWWUxNjZFQksrZW1FS09SdXJ5?=
 =?utf-8?B?SDZZSnlnQzJPSjRoWGZ6SDlmWStNN1p2ZUZCeXdlUmhoSW5IMGtxUGlzcGND?=
 =?utf-8?B?ak13UGRHNVYvRVZGbzdlQzBET2h0eG5kS0V1WUxrem04WXZIUGo4TGREWUxD?=
 =?utf-8?B?aWdjZ0t2UjdMNnlnMTUvWktXM3NaN1NpWkd5OE9MdHU3V2pOdWhIREFkREJw?=
 =?utf-8?B?NUIzQU80Z2xWaXRieHJuQ0lxRC9ZbnhiTUlOQTBtS0MrREpyMWNsSzRsQTl0?=
 =?utf-8?B?NTc3NzRLbHU4QW9naXFPQmVNTlVUR3hPbkIwRjZXelo2SWhjMko3SERhcm12?=
 =?utf-8?B?c3JoMGd6ZENuMzF4ZWpnUm9ZYjlLMUd2R3l6NDIxaDdDQzhvQ0RNYkZPVFNO?=
 =?utf-8?B?bTNSYzc4QjkzYVhkSk9FcWNicnZaNFdSZFJ3QW9CV0JwVU1DZVFtTXpHZGJ0?=
 =?utf-8?B?UW0zS0V5RmZpMXVtSy9ZSU9TVDJBMWZCL3pRZHZ6c1IxbHJkem1USWlBOWZN?=
 =?utf-8?B?WFUxN3RBZjhDQXczbHJaKzdxNEJlcjVWK2VwSU1lME55djBna0FaSC9sa3RK?=
 =?utf-8?B?WFdqR2dwYzczTm8wQlM3b3FDQjJHYmFoZzIwbWs0K1Y5R2pIUGp4L0wyUER3?=
 =?utf-8?Q?xolY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enRQRjZ3dFZVM0ozNHM3L2l0dGF2WDNFRXZna1ZUUlFZMjFNSkFkWUVTeUdw?=
 =?utf-8?B?QnVneW1sUHV1bFFVUGc2SzNaOUVVZWtZcnY0bzFNbFphNU1EYWxKQkhZdGNn?=
 =?utf-8?B?cUNtSDBvTXAwUGpoQnpTRkJsRTFnQVF4MWFKaHFMb3grK0VycjNQaGpTUHds?=
 =?utf-8?B?ZldnRnd3WHBObE9oUDNQV2s5OGtEV3RaM1RlYXAyWWJKd0tlNDR4Z09QQjBZ?=
 =?utf-8?B?cFlRTjl6QkRIRzN3UTdUU2NJeGVJWFV6dmYvZWZuS1dtQkVkNkpaajREbDZL?=
 =?utf-8?B?cG1oZ0ZhMS9Td1ZyN3czRUFmMjlTdWRSa2dwVE5HTXBXV2RoM2VZSmFmSkZO?=
 =?utf-8?B?b2k4NTRBeG5nWEw3cWtZSjYvbk1paGdvckNFQXZWRFI3QTVvUk1xVlhuakE3?=
 =?utf-8?B?ZTBoUnZWZ1RpTml3TDR4clNPR0hOOTRuQVFiQWRVVDNKQ3FsNEQ2R21ybDM2?=
 =?utf-8?B?RkJZVGxSekQxYll4MCs3QlhnaENLT3IxRlJxOXNuUldVclI0LzRZQ1hzZFBC?=
 =?utf-8?B?Q3dSNDQwVGpEOWdJZEx6ZWNNaE5JTFBtRm5PMVVPQVhmMjlMcXNROEpNaExC?=
 =?utf-8?B?ZVFGbitsdVg4NUg2VEZGTVNoZ25XZ1Y0YkpsN3M4YW5ZUWdQVVdFRER0NHFZ?=
 =?utf-8?B?UnBWcEI2b0liU3hzd1RudjdYN00wNkdXaUFvOWVrWlNBRmJPZWg0V0h2UnRD?=
 =?utf-8?B?Q3Y5c1NKMXo5VDdzZzJQTDlZQVF2RW40dmNnaUxYTm5tbC8vbmg4dFppaVNW?=
 =?utf-8?B?V2kvY0pUMHNlVWpNWVlBcTRyYzlVYlNuOGxlTURGWlNJY3lCN2RQbU9tSU4y?=
 =?utf-8?B?V2pxc21heU4yR05jYTk4eitFZWdTeThQQjJoTWl3QUhTelFFS2hXR1pkZ0lm?=
 =?utf-8?B?M2pqd1lrU1dWRk5KMWJEUHFGeG1FZzdYTDNZRVFjVG9tZUJPcmVoaTRQeGdB?=
 =?utf-8?B?d1ZYMndxSFFHV1pQYWF5RlNKdTIveExCRVhYS1RhUjhXWHMxUG9HdFhiVmhD?=
 =?utf-8?B?bDNHZTAvaGZJclZ3M2NBd2syZTJoSmtGQVk3N0UvRHg0OE1rb2hTZW5RMG9I?=
 =?utf-8?B?WGFzZmZvYUppTG1lL0JWVU5PZFBUcVRENVNMaVY2SnlkcWRjWnFyY3hLd1g3?=
 =?utf-8?B?bHM3aUdHbVA1SUI1aDBmUkx0bTR3Rm4zeWNUV1dyMWRKY1UzZkttMDBlWFp1?=
 =?utf-8?B?enZXQ0ZZcTRCak95TElmcGw3cTdBQTF5SGk2K0xvMW8rSW1LdXhlUlVRYW8r?=
 =?utf-8?B?RTdQakZ6TTJFY0lDTlJMM240LzRNWW5RLzF2MTBWK3BvTndQSmczdnBSd1V4?=
 =?utf-8?B?RE9Dd1RVZFdscUVEM2hvMEdUNHA2dWYxS0YwaFEvSERrK2ZPNmJueHFDUnJj?=
 =?utf-8?B?Y3JjQ2c2RFpLUFEwbkFpUmlVM3RPQzFkcVg2Q2daSmJ3eEVMTStZakNxajVk?=
 =?utf-8?B?KzM0SXNKclJTRUt6OENicFB0cVBtNGdFd3VSMkxQS2Z6YXQzeUVQaFJyWXVY?=
 =?utf-8?B?ZHJVOFdGSzZ4Y0tMeUszSXRpUENpRGpROHVGK2pSOG1CY0FoeW5DblhDQVFp?=
 =?utf-8?B?K0pvNDQydTFaS2owTWVCVzdTR1RNMGxYaGVKZHBxTlhPdGgrd1A4dUw3aTZV?=
 =?utf-8?B?b2hSRGxCZEQrdmpzOWNxV0JwL0hzeE5Ra2lSL1NUS2JVOU9VMU05anRab3ky?=
 =?utf-8?B?M2l0QU43Z3VYbUpWYWF0Z05xejUvZk5SOTBVS1dQYW5KdERkQjl6engyUGNQ?=
 =?utf-8?B?VHhDSFgzbWFTUG54MGk1bFZocmQ5UGU3ZStaOUpqNXFtKzBpazIzcjUvNUd1?=
 =?utf-8?B?SjJDQzJNOUYxNkcwdm5RZDY4UWdqU2VDUzB0SXJsWjJnc1ZvVk4zOXdrdm9T?=
 =?utf-8?B?RHkwbmptbVJpbHZxcmZDQ3hQUlJrb3YxVTI1NjRyQzlub1RQTEt4b0ZYdWE5?=
 =?utf-8?B?Z0dlRkRFQ3Zaa0piVTFCQkhvYmpjRDZ0YVBLSTJ6Tjl1YzJ0QVovMERxdVdp?=
 =?utf-8?B?M1FXZDlzUFB2VHRtNVJjRWlJNllxYjYxZXgvZjBJVGhjbzZVc3VtNStTWE1W?=
 =?utf-8?B?YWxtekVFY2g4TFc5eTFCZUl6RkFaMFNWZTBieWhmSk9UUXREbGNMTFRLQ1Ry?=
 =?utf-8?B?NTIzTk1wYWNmckRQbGxkU1JtWmllRFp3YjY2bnRuVzlYcXoxWVEya2kwVkNp?=
 =?utf-8?B?cDhRVnNvR0FpYUhUa1lWT3ZmQUZMZkZyR2VVUG9aSERtZ3RTODQxa1h3Rzhv?=
 =?utf-8?B?dWFRUzh2a1ZEck5aYTZRb3JuYUIreWs4eTlQdUVwekhFaW8ybHM5VGpyOVZB?=
 =?utf-8?B?elNRMGN1bUxBTGd4TDFNLytmMFQzaXNiaFlBSlh4TTdKdGhTWGxJQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0a2311-c330-4cfe-9690-08de68feb3c7
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:47:08.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnNH2xC/w0Fra8iLZ5aKp3Vddqi43yrZjwIOTRzq8me44MP+GzjiY2IoFHbl/BxMPJ1dpk66t5tk0j9pwDMuWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277



On 2/10/26 15:10, Trilok Soni wrote:
> On 2/10/2026 2:40 PM, Vedashree Vidwans wrote:
>> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
>> timeout mechanism. This update ensures that any potential hangs are
>> detected promptly and that the LFA process is allocated sufficient
>> execution time before the watchdog timer expires. These changes improve
>> overall system reliability by reducing the risk of undetected process
>> stalls and unexpected watchdog resets.
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> ---
>>   drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index da6b54fe1685..b0ace6fc8dac 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -17,6 +17,9 @@
>>   #include <linux/array_size.h>
>>   #include <linux/list.h>
>>   #include <linux/mutex.h>
>> +#include <linux/nmi.h>
>> +#include <linux/ktime.h>
>> +#include <linux/delay.h>
>>   
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "Arm LFA: " fmt
>> @@ -37,6 +40,14 @@
>>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>>   
>> +/* Prime loop limits, TODO: tune after testing */
> 
> Do you want to keep this TODO? Your patches are not marked as RFC.
> 
>> +#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
>> +#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */
> 
> Are these values going to be tunable from the userspace or kernel module parameters?
> 
>> +
>> +/* Activation loop limits, TODO: tune after testing */
> 
> Ditto.
> 
>> +#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
>> +#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
> ...
> 
> ---Trilok Soni

Thanks for pointing this out.

The "TODO: tune after testing" comment was left in by mistake; it should 
not have been included in a non‑RFC posting.

Regarding tunability: the current series uses fixed values, but I agree 
it would be useful to make these configurable. Adding module parameter 
to adjust the timeout values would make it easier to tune them for 
different platforms and workloads.

I’ll address both of these points in the next revision of the series.

Veda

