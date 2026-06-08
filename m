Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012068.outbound.protection.outlook.com [52.101.66.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A843B42D7
	for <linux-coco@lists.linux.dev>; Mon,  8 Jun 2026 09:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.68
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909498; cv=fail; b=rnqvmPKEU+EzNwCYpovNOgfPtCj9gM5QK0v5TyGJNIcWHT2DIg7KR0xPeNPVZz7VqrKTYmoVYHDRybaMbhHzSYYZxFEDy2ZoVYYRH0JbA97OsabfT8t7+xsOE4cPAcP/dLHImUdybneGVTReMpv1z+b/OViq6YlYmFcCal5mGhs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909498; c=relaxed/simple;
	bh=JziUwPDPeRhojo4Z2mWQw7fcnAFhWELYO0X/C08pcXM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G0zhLnBwoV2TE/V39CsePRplWt1blAS1rJEyWUPgMC39Vai3iJQoIBxYOdlFh41cZfIXn0/k8GzcS7O5Oz2qgXBELh6VymmzEVIPqrQ5YYhg/LCkw14FqLleOwWBuvFg0qWr3CF61STcgaJSrrdgEDueG1Dl+aORPumccXJex10=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YoLCMAaP; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YoLCMAaP; arc=fail smtp.client-ip=52.101.66.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YoLCMAaP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YoLCMAaP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VPnG9i1LzoBJzuTB9KP9X8WDy+3cl9+ndKI6P5y+MmxFXuqs9nMfguNyU+rn0Dk/Qbl0k6icwV13zm6qXzxFiarpjmE495jeSII/9MCxjf4bUtJZrUqPUnWMjd7QxiKjMPqV16PSWkbGsa0aG/DRDjTo7k0mgtVkBs2ZjxAqJgqkQDca1jIo0s6xDfApb/TtkTZZnN1CM/xa6DgvSNttXGt2BwWEm8FEqXFLU4Sju/+YHWykORx14/HxrJ1QFU+irdlU2zbsCH/yzuNr+IShj/KhhiuLR/cgVp8QCHQBCNAra8Yp0cNIffbdlBXtW41pmMpTT/HiJuXf0PSfX+wB5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgbXUKZtdOtmAqIAg4VVIgk5JB0y/D2dz64WCKaIx28=;
 b=We4dfOXIHMgiU62HsKtCZhmYz6HsnUgIRLy5ymVKI8qo3cXYuknrSUDuulH9Y6hPaInko7rvyRPlxiQlHzecpQYA11DE6cXrTpcWt5c7RtTr7XkWGqBvnGPsgAJqSrfzF7LsJUz7b6y/h2ijosvdH7RPie0z9cj5Qq/jz/q9ICijVu9AxQHg/dha0RKKhg1hIuaRVCGcNNAmLtKub2B+L9O+98nZy0gYfbhoqwRthRkTIJLdANeQRIYq9BmlXRkpPb/cOdbv9NcpN4HDHHH2FdkNR9gqNzYyAPADTzgU9+QUg1FWhpZs4Ct61WIShhi/ElQN14K97vM79eCXAxDMvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgbXUKZtdOtmAqIAg4VVIgk5JB0y/D2dz64WCKaIx28=;
 b=YoLCMAaPkwI/uQt9jtb+jjqtC0g8C0xHBS1nU14kTMOLTIkjKMsNOv82Fh5DjBEZ8dstDvzz7J5Mgn6JI0WagnBj4hW4bcPptFuLGI7O7b14dS+q7ZLMShNOLo1msSeuaNAmb5cIB307jdti8hCiUI4OMu/dEz+93BtEgr3lym0=
Received: from DU2PR04CA0081.eurprd04.prod.outlook.com (2603:10a6:10:232::26)
 by PA4PR08MB5981.eurprd08.prod.outlook.com (2603:10a6:102:e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 09:04:50 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::86) by DU2PR04CA0081.outlook.office365.com
 (2603:10a6:10:232::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Mon, 8
 Jun 2026 09:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Mon, 8 Jun 2026 09:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYyoJa7NQaoT/gS0PJy4jSCWgNwKSJPiMURCGxZb64ptnfnejbv8ktJ3peYFkSGnFMsCddS+yd1YRpdQVnE4dtlPE/4GxaNZspEmkcJrPEsUAPfux3tl0SYgI5Ye8B9REjPplRYLnRw1+C3JV//m/gSBeJwGogeInirJVXMCDOdoeUaJ5pKR/acF3ljVbEG4KkQfWdja5BDVw8OCC4kz2kVmoT2/qbu3hWKMF2Rp30Ap1/LRn+ZEylLB3jUX2CuNPkRTYOwTL9pMmlw7pOtERMRWGXfYhn9MNIUmNQKLqxTHDRhLykDvlHpxqWQBkKsZYDueJk/pKeQYSvu6nbt6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgbXUKZtdOtmAqIAg4VVIgk5JB0y/D2dz64WCKaIx28=;
 b=UA4jWpwt1+U5hhY/AbGfMoLPuzYD1EthhrM5CLzkja8zK/CqJvVmPUqHTTpR52wTRgGDpiRGltE45lF+I3kTMlkHCkrWMvT0PBtO7VoJhDvp18riIlly8V7AQoF1vZCmt1MVEO9OgG+FD19qHoZ8KkV05ray9TkH2Yr2yOm3O6OryU6gLLZLjv2h1NlrX4qDL5V0tszFbVMG4wXQLKOpdbofCa0l3R8DL5NIHqpEeVoF88YVmVxsJ4swJSGZI+ZH6mqPy83peztxqG4joUwpWq6zJaMUfSkVq30kc7Lmky/0CuqpcjuSv/YJkwzcAZOCTtjD92IOFxY06Rhz4T/Hxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgbXUKZtdOtmAqIAg4VVIgk5JB0y/D2dz64WCKaIx28=;
 b=YoLCMAaPkwI/uQt9jtb+jjqtC0g8C0xHBS1nU14kTMOLTIkjKMsNOv82Fh5DjBEZ8dstDvzz7J5Mgn6JI0WagnBj4hW4bcPptFuLGI7O7b14dS+q7ZLMShNOLo1msSeuaNAmb5cIB307jdti8hCiUI4OMu/dEz+93BtEgr3lym0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by GV1PR08MB8081.eurprd08.prod.outlook.com (2603:10a6:150:97::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 09:03:47 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 09:03:47 +0000
Message-ID: <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
Date: Mon, 8 Jun 2026 10:03:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <yq5ao6hlzbpa.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|GV1PR08MB8081:EE_|DU2PEPF00028D0D:EE_|PA4PR08MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: da01b14c-d877-4a65-891a-08dec53cff42
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|3023799007|4143699003|5023799004|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 p0tk+1pe0NSfZI2bLuZ0Mg2+lH+nDjWWteQIVMZJ+ypWUj5bgvI+Sh8oa0xV6jA8viFec7kOqyA/U0h20F0qPPKCKdo9RfnqkpmhtHfDmZSL5ivxYDrG3F9SDDIYUCXUromYQaTSqH1TksucsUs3EgXmnkBA6P8j1134XHUu81s3Bpf+oSl1W+MCxfm9sNLoknwkOPuR4pfX53KfwO48Qvu4Tz2+uH+V1FX+kckDJ43P0xiiiN7Pcyb5RkRHqgc1h3Ge1E/ILyyKw5yvnxDTXzjbsKr4W8a4ZhgYeVDRvNUDXvsKcyZaqGk/unW0mTd7VEwgepd80kTtX5hBHUFvFA7RB5l3orrmSPhHtuab5HT1wBxLEtza+3SwW8s6rpyDCC6q5dQ0e721M7nAHK9K/0+R6RvObZDsXcZ1v/ukXNGJiaS/Xp/K4iBuL1oXiT4uBWrESbQPbReRdVjP7JTx127fMxh/IefNuJmlYNTm8XbmoODa/dx1heDVdr1NzWIvRDOvQFjPZuDsTqkx38E+LB+xp3y7i854GDy3a4yCQLItCsNXy6POfizOjt/DONL7XM2a2mheVPcRqmpa0EaP4Imu+nJ4I4/iGZB4/N/4D1ZQNWSxyACypYzBtl5dNdjmUzLqDFu17yYgHP4SlxekBl3DVdojW4rYfiW4B86bZj9K8/dwfJKYFc2ievj6Dtq9b1qJyRCCOgIzmpcKdf92PA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(3023799007)(4143699003)(5023799004)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 qTa7nl++ByNjYeK1I3ysu+dQlf0ueQyCYzw4pYeSj6jzBsHH2ydzutEnohcJI7uCy13Ytl0ZhdJ17rbBLp6aJrcnsG2ZJ1NHd/tnzRZHbzWyLQo5yim3PoRtGr/5iGjDSfEiFOfN7EPQSrcrpTeg957R//MHRquL5iT1Qk6+1jUJ9vOZtg8qdbmNE0c5CGv1Gc6am82ye5odv9p32J9RVmcv/hZLP2QTGKBnQvEO9i+tZoHLYLdzg2ylTxclb1h1U1h3Te1+Y/wiZBi2zcHzj8eP5wdSN/82furHywXwunI2FaPrk/symIPVyKlsfwWhO3cBvS7XmnEbKWdje9+oKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8081
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3abb3bd6-da67-477f-51ad-08dec53cd982
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|1800799024|82310400026|376014|11063799006|5023799004|4143699003|3023799007|56012099006|6133799003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	EmUOS3FpZI3pdXj9Zk/uw/935mfEVlsVXy7KX7+JlHQhgcMD7H+D9aw1HDGc5QfxuyIDvJlZ1r5q2ovvPilGYIoq/DAnrpgVnO4He2lucs2Re0hDzUN9Vzf8uI+MyM/TvuqywGXbaYb+ujEeeOWASlYqQYOhm/BwFESA5sa+NNat/xmbZpgvVkuLduV6EuS1JXbzML4OteOVxFhMHk5N6pebLaY/Ox6+Ve/yrUPfo5KxxujigRRSZ0BXVBnvyaZJLEQN1CpGggkF/ywVH+UXCVDetIyKghsxEfqs2fS4l/xQEV9ixMy9HxVn0cgLXESiYQB+BXuYqtIbVSTKHB9oRux0tdHID0/hPyGGj48UBpAFK6bQi1hkjHLQjUX5AwSsGk6nObhV2nS4ZIGQ65Kq0/IFYQVoMOfxSFEBIVg+t4rPlhlv2gvs1p8c/mTj5385HI2QMGTzcyFk2m0Of1q2O7URgDBgmU8XZGBoBEseGlOEy3pEpyAWtd4ZQG2hxGpHRS9mLNPu3nEFHiUsvdnJ0i0nHn1fCMgAJ5iYsmkdfegkGkx0rwmwcJXWfIUeWY3qyjxdKicH6hQ7lLk7L1PZ5/yJ6dBJV1qT3VM0pkiZ28iXssxSiZlbmtMrNcyCEiP30FniqTXt89Tx5MCzmLHpI6a1bspsGxKfNtETvcAHgWo/fdkVd1b/9I8mYa9haqW1PJP4kPEgS+unY1BMs49r9BVPnnlQ9D4aThV7H7iOfkg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(1800799024)(82310400026)(376014)(11063799006)(5023799004)(4143699003)(3023799007)(56012099006)(6133799003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r/qzmH9ApVxMAK4IF52m7skodZNGUi8NIu/i9t2h/iw16TRU9JEJrmWzyt6awq52hRjlpjUakBbXKxfL14qOM9W89P49v7ckaJVu8b584swE2PFpoO+Hp3kkaKjaKH3Fm1CBQeoGT6R9JQP7qoismsriRXL7XtM9Lit4zKc385QOvzA8Ig/hA3YdCVPbe1LPWKIF5U96RijyiiQkXK8MQJveIhF2d7YTlmlUmNbarBoWb/5Kea3qkkZfH53jmom5rK9HiwddFvFdn1+W0gbShNleDoAqb55pOIm/zCmCM5UUiXgWzh7pcopUallX78ed+G4PFF4xSS5DLpdeYn80YkH2Dxp91va0d+EKiMb4dVCXgYw8kuCzngAIut6z+OBtOhUmmyoZ8D8qoe46z6ezzOlml9Rgk2mzBZYI9DdLKB5A++XiqkQLVyhd0Jwvpgqo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 09:04:50.3374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da01b14c-d877-4a65-891a-08dec53cff42
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5981

On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>
>>> ...
>>>
>>>> +static const struct smccc_device_info smccc_devices[] __initconst = {
>>>> +       {
>>>> +               .func_id        = ARM_SMCCC_TRNG_VERSION,
>>>> +               .requires_smc   = false,
>>>> +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
>>>> +               .device_name    = "arm-smccc-trng",
>>>> +       },
>>>> +};
>>>> +
>>>> +static bool __init
>>>> +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
>>>> +{
>>>> +       struct arm_smccc_res res;
>>>> +       unsigned long ret;
>>>> +
>>>> +       if (!IS_ENABLED(CONFIG_ARM64))
>>>> +               return false;
>>>> +
>>>> +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
>>>> +               return false;
>>>> +
>>>> +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
>>>> +               return false;
>>>> +
>>>> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
>>>> +       ret = res.a0;
>>>> +
>>>> +       if ((s32)ret < 0)
>>>> +               return false;
>>>> +
>>>> +       return ret >= smccc_dev->min_return;
>>>> +}
>>>> +
>>>>
>>>
>>> I am not sure we want the check to be as simple as ret < 0. Some
>>> function IDs may return input errors based on the supplied arguments
>>> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
>>> this to be handled via a callback.
>>>
>>
>> As I mentioned in response to Suzuki, we can defer that to probe of
>> that device. If *_VERSION, succeeds SMCCC core can add that device and
>> leave the rest to the core keeping the core and bus layer simple IMO.
>>
>>> We also want to use conditional compilation for some function IDs.
>>> Given the callback approach and the #ifdefs, I wonder whether what we
>>> currently have is actually simpler and more flexible.”
>>>
>>
>> I was trying to avoid conditional compilation altogether and hence the
>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
>> in above snippet must come as some condition to this generic probe.
>>
>> Adding any more logic or callback defeats the bus idea here if we need
>> to rely/depend on multiple conditional compilation or callbacks IMO.
>>
>> Let's find see if it can work with what we are adding now and may add in
>> near future and then decide.
>>
> 
> If we move all the conditional checks to the driver probe path, then I
> think this can work. Something like the below:
> 
> struct smccc_device_info {
> 	u32 func_id;
> 	bool requires_smc;
> 	const char *device_name;
> };
> 
> static const struct smccc_device_info smccc_devices[] __initconst = {
> 	{
> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
> 		.requires_smc   = false,
> 		.device_name    = "arm-smccc-trng",
> 	},
> 
> 	{
> 		.func_id        = RSI_ABI_VERSION,

Don't we need parameters passed to this (Requested Interface version for 
e.g.) ? See more below.


> 		.requires_smc   = true,
> 		.device_name    = RSI_DEV_NAME,
> 	},
> };
> 
> static bool __init smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> {
> 	unsigned long ret;
> 	struct arm_smccc_res res;
> 
> 	if (smccc_conduit == SMCCC_CONDUIT_NONE)
> 		return false;
> 
> 	if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> 		return false;
> 
> 	arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> 	ret = res.a0;
> 
> 	if ((s32)ret == SMCCC_RET_NOT_SUPPORTED)

Is this a reliable check for all possible SMCCC services ? i.e., Are we 
expected to get RET_NOT_SUPPORTED for any service for which the backend
is not available ?

Also, as pointed out RSI_ABI_VERSION may return other errors based on 
the input (requested version, e.g., RSI_ERROR_INPUT) and we may still go
ahead and register the device ?

> 		return false;
> 
> 	return true;
> }
> 
> static int __init smccc_devices_init(void)
> {
> 	struct arm_smccc_device *sdev;
> 	const struct smccc_device_info *smccc_dev;
> 
> 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> 		smccc_dev = &smccc_devices[i];
> 
> 		if (!smccc_probe_smccc_device(smccc_dev))
> 			continue;
> 
>                 sdev = arm_smccc_device_register(smccc_dev->device_name);
>                 if (IS_ERR(sdev))
>                         pr_err("%s: could not register device: %ld\n",
>                                smccc_dev->device_name, PTR_ERR(sdev));
> 
> 	}
> 
> 	return 0;
> }
> device_initcall(smccc_devices_init);
> 
> with the diff to hw_random/smccc_trng
> 
> modified   arch/arm64/include/asm/archrandom.h
> @@ -12,7 +12,7 @@
>   
>   extern bool smccc_trng_available;
>   
> -static inline bool __init smccc_probe_trng(void)
> +static inline bool smccc_probe_trng(void)
>   {
>   	struct arm_smccc_res res;
>   
> modified   drivers/char/hw_random/arm_smccc_trng.c
> @@ -19,6 +19,8 @@
>   #include <linux/arm-smccc.h>
>   #include <linux/arm-smccc-bus.h>
>   
> +#include <asm/archrandom.h>
> +
>   #ifdef CONFIG_ARM64
>   #define ARM_SMCCC_TRNG_RND	ARM_SMCCC_TRNG_RND64
>   #define MAX_BITS_PER_CALL	(3 * 64UL)
> @@ -98,6 +100,10 @@ static int smccc_trng_probe(struct arm_smccc_device *sdev)
>   {
>   	struct hwrng *trng;
>   
> +	/* validate the minimum version requirement */
> +	if (!smccc_probe_trng())
> +		return -ENODEV;
> +
>   	trng = devm_kzalloc(&sdev->dev, sizeof(*trng), GFP_KERNEL);
>   	if (!trng)
>   		return -ENOMEM;
> 
> We can also move arch/arm64/include/asm/rsi_smc.h to
> include/linux/arm-rsi-smccc.h. There was a suggestion to move these

super minor nit: arm-smccc-rsi.h ?

Cheers
Suzuki


> firmware interfaces out of architecture-specific code:
> 
> https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
> 
> This will also avoid the #ifdef CONFIG_ARM64
> 
> -aneesh

