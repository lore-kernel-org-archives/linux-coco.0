Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC123A9DA4
	for <linux-coco@lists.linux.dev>; Thu, 14 May 2026 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756728; cv=fail; b=YyZckeoyQI7K15uEi0NLFCVK1FFebg1RjANZry53CJDIkv+SVMp/vbMz/dEUt6ZBxQSTlM4T7vMhXv2DboQLehcY3LN7qHl+ghk+SQ3eub/Nyt60TGZv7o4Qp4FxYJkdzs6IS09sOCgzvgZqGvfoXvgTMSWKIx0l5uCh8eCGqN4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756728; c=relaxed/simple;
	bh=23sfh/JEj6Z9DxNtOALAnoyP2A6HVbGpRTaQBg72wz0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jhapZBGOehc58BC3V4YKR5nNqaVyBGgj6I4aAy+q4SZq51uqCb3LxLTOAP93XYKFpVeVBaGWJ/tum6aUxKcNFXKvh1mfgnWZXlNhwpz8+Md49cQrY9KOx5bE2cr16ns7qr/fXfi/a0vhvS35KlgDP2r27JhtdsX8nMbG+AYTYR8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=REl06Ogi; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=REl06Ogi; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="REl06Ogi";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="REl06Ogi"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MJrVBAYqYychBJ5tT7xbpcibRBiIVOF0Ll17AvjomcoNr1aBEX7Q1j194pQv8M3C6MX2iWZ+LvoRFz2Vz+rZlT0Tz0bWJcFvVd4eisX83Yv/zxC96FcYiQ7oL63aEpBt6GVKCkFfl6X+bDeBLgmzQmoSL9S92HEGT8ciskuscw9cNSR8ytlldD30VsufV7OIgslS3dY23je8caNYcCcI6UkVat93aaD/WKRplkc84wXieIvr8/HRJwRcXuGC7ZvLh3yQKAwSK/6voKpGTTM+z6RLLcPvGh/WZYsRUU+eVpM5e4tk9bI8CFu9esyKg6d5qedqdHg4q6laIewLK/ixkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw2J8cZhJ8Y74LUSB+AG48JADkIwA5jfsP8USNzdeCw=;
 b=H1MJ4xv9/HYcIp2AOympMMgOD0agWuaY+verFpuWH8H3EJZ3iTVxEYU/irRI3QrqaJYWpI35obyW+eJNMG8qMIcaORXdsVpvJ8VaTRAcdJTWas0byFdrrzOUxWUhIiViX0AHr+4BP/cm1+XvKbrToBdGdRAX6YX50RgUPXVQEAVyqjVVqE+BvIRsVdmmJRy0ZcHn2s4ZiRXDpH+oICBZhnwP8Bjonld8m2pbNYdjYMHvjE6VqP++cPFUfubvhMqFqZUrmuMo9SuI5GwHAhntOWijAdHPkuFFJR28+qH7cxU5EinvAShNGqOkhd5q4HRLSdzUIh87Jx2G6904i8SnPQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iw2J8cZhJ8Y74LUSB+AG48JADkIwA5jfsP8USNzdeCw=;
 b=REl06Ogi563MQd7ojRezejxW4qpZF/k4ZZBF5PMpP6+cRupwi6ex+6TskA2F+p6RSZYvKQaQ1xeeYABJw1fTlFjjrJulo+WgMnbFLEfeHlCdlmJFNHhk+rWFctWAyG3zHICNGcYrt2AOn98sFv5uLYmUVvschNiamCxq9UmhgIs=
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by AS8PR08MB6581.eurprd08.prod.outlook.com (2603:10a6:20b:33a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Thu, 14 May
 2026 11:05:18 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::a1) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 11:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Thu, 14 May 2026 11:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQd3jhzNdhDt4MXm7uLLlec6Y+sAaURQkRCKoE6JJ6SdzndzFWvlevop3anL2aEn839nWIEAbIyAHMHDIVjyF2VeN4jQRFvXp9wRJtSoQOnIrjRFhZgeZgCjkQuOVnHNQ+lO8a6KpKZQuyJDHoqlc6gtjPPCmEtSEipCbadFlK2bbHHxnrTMwBPYUdHZX0uf0kylzgpbbkiIo8ei/4Vlj2I+iaKmnOR8zT1IYtz3W6w4bB1yq2ZYpS1VDewXFAQV+IVR9UA1qvb/VAnZR4w93v4R+EQx+8AlMJEqNvAFZeVqsQpSGKEmZlreA1SW+riEXHoug0/oxApV0vQicgZSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iw2J8cZhJ8Y74LUSB+AG48JADkIwA5jfsP8USNzdeCw=;
 b=T9GJy4QB73MpGFneJh7RNYlCAS9Y8n2UuOwf3Vz3PxxvsbTw8rDHXeOi547Um7oCjPWZ2F6D/tOpw1oF7wRrXK3zNafYucUJ6NEPg/3HPD8zJUWMw7t6aAlIPVMINsIOFBEO2kXFVGMPxk948FGLGium+n+0+beT27Oaoeq9/LUapiPkSzBYvzUye+QRL10UepKHVt60sIJU1dhcUr0kQ6aYdtsN4ca5DglTbzjBDGkGgDTHO41Am7f1iQrNyhIFkL8NSS5LnzLUbojgfN2ykEMgUfwkYWAp5/BFtF5PsdBQevPLF7RMr8g3K0a9wbW1JlSsCK4xjL45K/065TVBEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iw2J8cZhJ8Y74LUSB+AG48JADkIwA5jfsP8USNzdeCw=;
 b=REl06Ogi563MQd7ojRezejxW4qpZF/k4ZZBF5PMpP6+cRupwi6ex+6TskA2F+p6RSZYvKQaQ1xeeYABJw1fTlFjjrJulo+WgMnbFLEfeHlCdlmJFNHhk+rWFctWAyG3zHICNGcYrt2AOn98sFv5uLYmUVvschNiamCxq9UmhgIs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB7616.eurprd08.prod.outlook.com (2603:10a6:10:320::20)
 by DB3PR08MB10336.eurprd08.prod.outlook.com (2603:10a6:10:43b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 11:04:14 +0000
Received: from DU0PR08MB7616.eurprd08.prod.outlook.com
 ([fe80::ec0b:cee1:2dd7:8b3f]) by DU0PR08MB7616.eurprd08.prod.outlook.com
 ([fe80::ec0b:cee1:2dd7:8b3f%5]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 11:04:14 +0000
Message-ID: <0c88bcee-65b5-4328-87e6-e1c714c3d1ca@arm.com>
Date: Thu, 14 May 2026 12:04:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] firmware: smccc: coco: Manage arm-smccc platform
 device and CCA auxiliary drivers
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <20260514094030.42495-2-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260514094030.42495-2-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::7) To DU0PR08MB7616.eurprd08.prod.outlook.com
 (2603:10a6:10:320::20)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB7616:EE_|DB3PR08MB10336:EE_|AM4PEPF00027A6C:EE_|AS8PR08MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: dd936c7f-5e63-485d-8438-08deb1a8ae82
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 AHBY0lDTAwHlsKVgYlQH5hWthFXR7Wmn6i08eJnevTHGXRfTc6DT4ZFTqHM9eer2MN5tDS+0wa/P7PuR8QCmNDyutyDBUWuNfDiHajk72TaXIW/k+KdfT2O53REslhoo65T3WR6UWz4gZg6IijISSUqrceyOEyPJS7afJUCKY5BT2usDrwKHe6NNmC0vkdjkIA1aoqu0/RKrDvTqZCdQFRPqP6PVlsM+yonc5CKUV6jwDu2vFfy+yVki0xDM2+gxGMyNN8sjsti0ndwf4PH4WOFrOK7RR6hpY4pmN7aeMyOTidxZ95JxXnDgB0nvC0vabTicFUnrsEpnzMgcRwLOFDGdnyc/nDJF0l1UQqclf1LiYy0OiY2hO1lqXL0Z/5FXpkWmIGRxutXhqxeldXVEhguEZZ45TZpMFnQpvbaQ1hgUwA5ncxsPeQ0ylMEn6hXFSwYdxBPTD12kornRJYyt6BMPuu8Ry9sfFUUglcGF5OkPl8chzMF3MAFj4vr4zobTBFDGrVvIbGXXhsy9Ejqh1r1TlTlue5Hwb+rQGlf78ObcCnv5GtL3j3eKw8cCpO289v00Md3GznOZINy4RqnpJYzdp51RKj4+VQFYs2qt6p11BCWbQ7/Nk3p6a792DW/3m319T84SoutMH9YX0NBwbQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB7616.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 T5vJKFgrQjglsICn13ABOOUXjsultx50NTFW4pAJfomgZ3ssx6h7a5jYiAQ+eqhZebMboo+elnLyCaPlTf6rWzNy2rHBORt/ItPoU6KcwcgZSu3VLxpvbncT+9QlTdUCUxYS3xbuc2apxUzpfPxt64yu7R/kPhtKEQRTdZvh31DVZvSYx6yIHwKhKRb/ZRbv1u8ngSenKaIbwPHBr9cf7v+rk+ksus40zfwmaa7JY8zp0QtnIJeButQTl5IJWf3/efTxUCwiKo11wsJjQWE8dUkLznb2rKCzOG/MDGqqvWPJI5rqzqxU7VNNbkYqJmi1DT9qEKaUj2/BfvEBmkfiOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10336
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4beb2496-5449-4fa1-b8af-08deb1a888c7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|376014|35042699022|13003099007|4143699003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	f4KUfwxErjj0wUMZB8gVN9ECuEtIF8vYzETQW0BtU77ZzOax+ZFoGXfXCeWFWO3RzuBwMJCuwniEoTXqPFeOTFdG6N6j8RN6DMLt36OHlC/7A5bHccvYi+oxB86KNQBQ5Af1ISiA6aGRNKhXur9KyqsKEdR+GOF4eM7oP8uD9XSINl+WnxuoZ49AMXN1AccO4ZoZ2ETPyZqLK79yOkJhZDncbzaE8/PfcJYpEaBOiSZOqRRt8dB3Halv8nYl1MGLV93/c95M11/plItR95u9IwS6Md5nz4JTVXPY7luQeJJ2sW102uwhERIivhGChvBxv9XIkhFshQ3W4sN01KMVEygXQ3XjRIBSLvqTnA+v1DldJJgDdXY7v2QDUpX0lKJry3Br2QIBbcSy6rtThzOIbMpEl4U1I8e0gZueVXZpPAZqhMJJ4awRN2qJgJbNq0AaCx4/pQsc6DPOkkCJOzzkNXvJbPQx3znqCywMJb1yshC1QLBK97aQ5PSfXQ0v+ewC3YvELZWa9Dtp4XC2VZgvF5K8jJUGtYv+owdLmrp5P9mDXiQCKDrNjtwc3VnVuWsmBsrPi1wNwAmvAES1sv/x9p8lqaz/MxUDcs3E+z8tyizY5EXjS1rdeaxEVfywbt4j1vBGvQXZzIJhrd8SQHpG6kPpB+S8MVmKaF7xd59gWO78LP7S7LFhRVOmilI8bNfu
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(376014)(35042699022)(13003099007)(4143699003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1VUIzwnov/+zEfg6ltSK+B4I/6a91N1OhfAPrWsBnJm5I7wzfbdFpb1cSPIHWon2uBO1GnGsT0oACsF/h+fsBSQdFU7Wy9rdX9lDlRQ0JQ9bCrwxvauuvPtqTGz+6u1+r4a3w7rKoCvtIYmXTVHMTguGoJNeX764eMlEiKN+jL7q74xxbl8ejtUpjFrcyQ/cKDQSg/bW9xw+RIKgRjDoIV/ASuILQUxxahT05Xd4ie+WR8B66ATvX6dCCXnUB3ScqJlmtOBaOwOPXEyYGreC1IQHHNGoFHTeuThMaN8Rs/VwXqeEmNLT87gQhT40gQvEvlQvtZqood4j9aOIvLkD+Iv6QDvza0ntwYQOsnWscCoJnN8RylSK60mtFwTiglf0JtViaDmHv3cowYrpnKDDX6cTXTdj2+yUmC/LZdq8JhEYjEdnUKY6Umr3XRlQxf6+
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 11:05:17.2573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd936c7f-5e63-485d-8438-08deb1a8ae82
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6581

Hi Aneesh

On 14/05/2026 10:40, Aneesh Kumar K.V (Arm) wrote:
> Make the SMCCC driver responsible for registering the arm-smccc platform
> device and after confirming the relevant SMCCC function IDs, create
> the arm_cca_guest auxiliary device.
> 

There are a few changes squashed in to this patch. Please could we
split the patch in the following order ?

1. Add platform device for arm-smccc
2. Move TRNG to Auxilliary Device - (Even though it is a later patch, 
move it before the RSI changes)
3. Move RSI dev as Auxilliary
4. Add the firmware sysfs ABI.

That way, first two could be merged while we figure out (3) and (4)


> Also update the arm-cca-guest driver to use the auxiliary device
> interface instead of the platform device (arm-cca-dev). The removal of
> the platform device registration will follow in a subsequent patch,
> allowing this change to be applied without immediately breaking existing
> userspace dependencies [1].
> 
> [1] https://lore.kernel.org/all/4a7d84b2-2ec4-4773-a2d5-7b63d5c683cf@arm.com
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/include/asm/rsi.h                  |  2 +-
>   arch/arm64/kernel/rsi.c                       |  2 +-
>   drivers/firmware/smccc/Kconfig                |  1 +
>   drivers/firmware/smccc/Makefile               |  1 +
>   drivers/firmware/smccc/rmm.c                  | 24 ++++++++
>   drivers/firmware/smccc/rmm.h                  | 17 ++++++
>   drivers/firmware/smccc/smccc.c                | 17 ++++++
>   drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>   drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>   .../{arm-cca-guest.c => arm-cca.c}            | 59 +++++++++----------
>   10 files changed, 94 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/firmware/smccc/rmm.c
>   create mode 100644 drivers/firmware/smccc/rmm.h
>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (84%)
> 
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 88b50d660e85..2d2d363aaaee 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -10,7 +10,7 @@
>   #include <linux/jump_label.h>
>   #include <asm/rsi_cmds.h>
>   
> -#define RSI_PDEV_NAME "arm-cca-dev"
> +#define RSI_DEV_NAME "arm-rsi-dev"
>   
>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>   
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 9e846ce4ef9c..8380e5ba88d2 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
>   }
>   
>   static struct platform_device rsi_dev = {
> -	.name = RSI_PDEV_NAME,
> +	.name = "arm-cca-dev",
>   	.id = PLATFORM_DEVID_NONE
>   };
>   
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..2b6984757241 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -8,6 +8,7 @@ config HAVE_ARM_SMCCC
>   config HAVE_ARM_SMCCC_DISCOVERY
>   	bool
>   	depends on ARM_PSCI_FW
> +	select AUXILIARY_BUS
>   	default y
>   	help
>   	 SMCCC v1.0 lacked discoverability and hence PSCI v1.0 was updated
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..146dc3c03c20 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM64) += rmm.o
> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
> new file mode 100644
> index 000000000000..728338cb5a22
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +
> +#include "rmm.h"
> +
> +void __init register_rsi_device(struct platform_device *pdev)
> +{
> +	unsigned long ret;
> +	unsigned long ver_lower, ver_higher;
> +
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> +		return;
> +
> +	ret = rsi_request_version(RSI_ABI_VERSION, &ver_lower, &ver_higher);
> +	if (ret != RSI_SUCCESS)
> +		return;
> +
> +	__devm_auxiliary_device_create(&pdev->dev,
> +				       "arm_cca_guest", RSI_DEV_NAME, NULL, 0);
> +}
> diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
> new file mode 100644
> index 000000000000..a47a650d4f51
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _SMCCC_RMM_H
> +#define _SMCCC_RMM_H
> +
> +#include <linux/platform_device.h>
> +
> +#ifdef CONFIG_ARM64
> +#include <asm/rsi_cmds.h>
> +void __init register_rsi_device(struct platform_device *pdev);
> +#else
> +
> +static void __init register_rsi_device(struct platform_device *pdev)
> +{
> +
> +}
> +#endif
> +#endif
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index bdee057db2fd..eb077b9aa6da 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -12,6 +12,8 @@
>   #include <linux/platform_device.h>
>   #include <asm/archrandom.h>
>   
> +#include "rmm.h"
> +
>   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>   static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>   
> @@ -85,6 +87,21 @@ static int __init smccc_devices_init(void)
>   {
>   	struct platform_device *pdev;
>   
> +	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +		return 0;
> +
> +	pdev = platform_device_register_simple("arm-smccc",
> +					PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(pdev)) {
> +		pr_err("arm-smccc: could not register device: %ld\n", PTR_ERR(pdev));
> +	} else {
> +		/*
> +		 * Register the RMI and RSI devices only when firmware exposes
> +		 * the required SMCCC function IDs at a supported revision.
> +		 */
> +		register_rsi_device(pdev);
> +	}
> +
>   	if (smccc_trng_available) {
>   		pdev = platform_device_register_simple("smccc_trng", -1,
>   						       NULL, 0);
> diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> index 3f0f013f03f1..a42359a90558 100644
> --- a/drivers/virt/coco/arm-cca-guest/Kconfig
> +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> @@ -2,6 +2,7 @@ config ARM_CCA_GUEST
>   	tristate "Arm CCA Guest driver"
>   	depends on ARM64
>   	select TSM_REPORTS
> +	select AUXILIARY_BUS
>   	help
>   	  The driver provides userspace interface to request and
>   	  attestation report from the Realm Management Monitor(RMM).
> diff --git a/drivers/virt/coco/arm-cca-guest/Makefile b/drivers/virt/coco/arm-cca-guest/Makefile
> index 69eeba08e98a..75a120e24fda 100644
> --- a/drivers/virt/coco/arm-cca-guest/Makefile
> +++ b/drivers/virt/coco/arm-cca-guest/Makefile
> @@ -1,2 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-$(CONFIG_ARM_CCA_GUEST) += arm-cca-guest.o
> +
> +arm-cca-guest-y +=  arm-cca.o
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> similarity index 84%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
> index 0c9ea24a200c..7daada072cc0 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2023 ARM Ltd.
>    */
>   
> +#include <linux/auxiliary_bus.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/cc_platform.h>
>   #include <linux/kernel.h>
> @@ -181,52 +182,50 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   	return ret;
>   }
>   
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>   	.name = KBUILD_MODNAME,
>   	.report_new = arm_cca_report_new,
>   };
>   
> -/**
> - * arm_cca_guest_init - Register with the Trusted Security Module (TSM)
> - * interface.
> - *
> - * Return:
> - * * %0        - Registered successfully with the TSM interface.
> - * * %-ENODEV  - The execution context is not an Arm Realm.
> - * * %-EBUSY   - Already registered.
> - */
> -static int __init arm_cca_guest_init(void)
> +static void unregister_cca_tsm_report(void *data)
> +{
> +	tsm_report_unregister(&arm_cca_tsm_report_ops);
> +}
> +
> +static int cca_devsec_tsm_probe(struct auxiliary_device *adev,

super minor nit: While I understand you plan to use this for DEV SEC TSM
in the future, could we retain the generic TSM name usage ?

> +		const struct auxiliary_device_id *id)
>   {
>   	int ret;
>   
>   	if (!is_realm_world())
>   		return -ENODEV;
>   
> -	ret = tsm_report_register(&arm_cca_tsm_ops, NULL);
> -	if (ret < 0)
> -		pr_err("Error %d registering with TSM\n", ret);
> +	ret = tsm_report_register(&arm_cca_tsm_report_ops, NULL);
> +	if (ret < 0) {
> +		dev_err_probe(&adev->dev, ret, "Error registering with TSM\n");
> +		return ret;
> +	}
>   
> -	return ret;
> -}
> -module_init(arm_cca_guest_init);
> +	ret = devm_add_action_or_reset(&adev->dev, unregister_cca_tsm_report, NULL);
> +	if (ret < 0) {
> +		dev_err_probe(&adev->dev, ret, "Error registering devm action\n");
> +		return ret;
> +	}
>   
> -/**
> - * arm_cca_guest_exit - unregister with the Trusted Security Module (TSM)
> - * interface.
> - */
> -static void __exit arm_cca_guest_exit(void)
> -{
> -	tsm_report_unregister(&arm_cca_tsm_ops);
> +	return 0;
>   }
> -module_exit(arm_cca_guest_exit);
>   
> -/* modalias, so userspace can autoload this module when RSI is available */
> -static const struct platform_device_id arm_cca_match[] __maybe_unused = {
> -	{ RSI_PDEV_NAME, 0},
> -	{ }
> +static const struct auxiliary_device_id cca_devsec_tsm_id_table[] = {

same as above, s/devsec_// ?

Suzuki


> +	{ .name =  KBUILD_MODNAME "." RSI_DEV_NAME },
> +	{}
>   };
> +MODULE_DEVICE_TABLE(auxiliary, cca_devsec_tsm_id_table);
>   
> -MODULE_DEVICE_TABLE(platform, arm_cca_match);
> +static struct auxiliary_driver cca_devsec_tsm_driver = {
> +	.probe = cca_devsec_tsm_probe,
> +	.id_table = cca_devsec_tsm_id_table,
> +};
> +module_auxiliary_driver(cca_devsec_tsm_driver);
>   MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>   MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>   MODULE_LICENSE("GPL");

