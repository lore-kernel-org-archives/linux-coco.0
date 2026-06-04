Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58044291864
	for <linux-coco@lists.linux.dev>; Thu,  4 Jun 2026 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564759; cv=fail; b=rhTC6H1a9tmAJOflV4N8IZ8kmgU9bnOyHTDGDvzCrk1dJQd/WD4JDQByHLjIg5J7FRnuiwButA+0qIIsetb0VKUgYG1tZQBG5iIG8OrlA7Pe5k9LBcZectswXXTb+HjhkaaboiIJZmxUpViSuislFqpRGGIIdvHaKhzhsuqf39Y=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564759; c=relaxed/simple;
	bh=N8iokHR0mFFkuwuVJt+VNKh/R5c+XF0ImfpLprg+iTY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G1rNVSUFQ7BhEoUbhJteo+czclG8JyUgIMS/Bric7PmphuI6YBPuYlXRKytuKmE75afIDN6wTN/QoSzg0GyfMizpsBPwjwgzwObluw6G7rVf0KAN/dIaSCL4ESm1BneYmYE7k+cHKU9Q5bxecP22LKGgdi1Wv0kv9jRM3voUlTM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KR6Wfj5a; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=KR6Wfj5a; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KR6Wfj5a";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KR6Wfj5a"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=idzmHLvPRi1oYTusO1bTt+6jqInjVvZJaoUPv5rV4Kd2y8iSDuydqB5jsoxj01+ip/JheTnx9OdvBra7Sao+4Hx4g2ogJ2Muf4fzOklnc6udm2VjQTfA1P01DLK0kmx1uIjrV5PiSkS7yKkYHDR0W2R5CpIPJrG1LqEMYemaaSMZQwZdMzv/0YxKnh/zaFENe5BxtWEDaRamMtissd5hyBmcrw57OPtQyBEINph0SAph1k8PEwb2m6bryGmLWcaTVayq0A/g66OBhvYhHYoDhHtP0H32tDsIml0BZNrjhOuhJA2Ca878bTsSy5z4gtMvERp9ziclocr+AHmeb+vS9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W64wrl8JXzDsBHhaf2CgpnKsHR42LXs3l5egFVwkoOI=;
 b=S3VY8mcc+DvOiPVpwqo4Woz9gChNe8mvSIVFpCqnTR+9pt/5Y9DNP9S1I51le9WlORVL8bqJlJTc1bqtgqlCKKED+TCjeZeVdZ96CzIuTRtMAJntb0dPu3hfkCWFXI+3hCn3x7PdeGCSLnQ+Vcub1lZPqlI4R3BbUG3HRwXT7202SC5rUhsYSajQCVshIo5ODeTXBHfzHllg5zf3xmRepCRaI4xYZ1yi3E42A+y/M8EF+ojUlQ+qT0209u7/vYlXEquRwm8kqKTYK8XS8DdpCJzvYrOPaqIujkAnghpR0vrinJMx6ZVRwwzvMWUG4CCw+xwnE9fsS2yeNknqMkQdOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W64wrl8JXzDsBHhaf2CgpnKsHR42LXs3l5egFVwkoOI=;
 b=KR6Wfj5aZ2C+/SW5NOKTwU2zikRDef828l3wuBX0hLDIggfVYoLuUK+nNXTIa8qOCGDvc6854s6OdScG4FUIPWpb1u+QFUxbDBJtLxz7tMBf6/d4Ubt6JNB0ZYHyQeVejUCWunt7a/H8NLoLcO/t6twO3rrrZkLC0itdjYTneOU=
Received: from DB8PR06CA0040.eurprd06.prod.outlook.com (2603:10a6:10:120::14)
 by DB9PR08MB11923.eurprd08.prod.outlook.com (2603:10a6:10:601::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:19:11 +0000
Received: from DB1PEPF000509FE.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::a) by DB8PR06CA0040.outlook.office365.com
 (2603:10a6:10:120::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 09:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FE.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 4 Jun 2026 09:19:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Soto6+ozflbZ4cCZrOH0eqjtQqbbsbIr8x4fdCgUQ9aiwWi563tG5AfMWJ+a5t1xcTkK2mOHs+iZjd32/d69VN6iYnPJqf6Qlb2Kp8nDUy+gjoqO2M9o5BFaRK/sz62trE9VEtpIZbp3fqDPZ/gZ1O0Lo4lv/u7nqT6x4zFys5WJzeiMNY0nK39KPeF/I21hWzAixnDjjjYtRXNgzNQfzDrPNzWavzk/aurc1Zh08Usbe/tcuqTIqUwXp5xU9b5CshT4xXabJjN3M0LhRF03CWxGGK63TF1VRqfRSO+hZqHrFKIUyFF/E+3nsD1RDIJ18ur+Z52R8dTVxtHZcAmiFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W64wrl8JXzDsBHhaf2CgpnKsHR42LXs3l5egFVwkoOI=;
 b=gtkKdqd2fQQQllmDlrJU8L2CNE9QbN6p8n3T0XH3T4H/drJa81GmDg7gZW3KkEjkhNLJdMQT97JfnZOQtGyG5m6Y3z+K1HVyswb9IM06LfAFgfvehHdq2s/reeU4XjW4M+hUA0kIruSQ9vCFVpF6jt+FN7pVV4mZBW3HPIIlykI9uS0kHftBBVeUQ7T8IQvDlFJ+yBSCaQqG9CNQsAhk+3wjEXT+Eum9ZE9UiFGwAxC0inXMaE6quYRcGw87nnTy0hMrJlUkbG1Uwml4cVUXVDbCMfOBBzZUYR3lgCVplRRn15/KO0X+NSKNjE4RJfEK9unKXSRVadptMVGVkCx93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W64wrl8JXzDsBHhaf2CgpnKsHR42LXs3l5egFVwkoOI=;
 b=KR6Wfj5aZ2C+/SW5NOKTwU2zikRDef828l3wuBX0hLDIggfVYoLuUK+nNXTIa8qOCGDvc6854s6OdScG4FUIPWpb1u+QFUxbDBJtLxz7tMBf6/d4Ubt6JNB0ZYHyQeVejUCWunt7a/H8NLoLcO/t6twO3rrrZkLC0itdjYTneOU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:18:09 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 09:18:09 +0000
Message-ID: <fa2c189a-33f6-4e54-bcfb-2c56768e45db@arm.com>
Date: Thu, 4 Jun 2026 10:18:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260527100233.428018-4-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0394.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:399::28) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|DU0PR08MB9582:EE_|DB1PEPF000509FE:EE_|DB9PR08MB11923:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f84e75-34fe-455d-1c91-08dec21a56e3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|22082099003|18002099003|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 WA1U2DRTrWcWwxPdfNzWi+lCrp/tSi3FSt9NgZtc2M7Koi5ion26UC9RokJr02mCHZsQgdaCflcMTLzOpb1dfuZkrXvQCmR8yUUqpFhOtnePWHk1CmPpONmh7m9uonp+QRQryY9+6+A6wu5cmXlzNZfhiete03lTDU/BqaOUz1Xi7x2vvetUF3u0yScrVZf4iIImVx4MZSC+5dNXj8sfo822drBTt/A5mGw0AVXKzdJAN8MRsshRHJLCeVCwbIysKmlL7y5aQ3Y6GVe9zRrFOJmJiv4Mev0c3izC13AZrTF3KkYdbr23kAGF9YjlNpDOZUXJYXXiSDaRywvtAMfooG3vB8NgQfC0u35lYTAGCkM7HHxxBrnoZoyHABiAalHFNo9EWkiL30iHesIosPCLGw8Po7LaG3MRkguwB9/Wyde8ziLmMUh9NKUaVlkrVxDsTcXINBqr8gRK8UiQZ67FtTR11Wb/uC1K942dAx62l2JuZcaDxSi7iqZSnpljNhFz9HOWoIVehKllx9QQZeFNZ1g9X2k2xAkV8C23Kjqhzhexi2exhtG3rOAmFjNON8BILqwtaUN4UgN7V9VvCwRfO0Rd6URbYwRP4uDVrQpc1z9VfogUriwQjptSI3gyzRNj9iAbqXZxOyO2gKcNY9ZYNUalMfTV+eUz5Dct2GmYjQiJr0d66hnSaUGgb4MpW30B
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 UHJjzi61tjVENW+0GRwJ2V87yO0W8+S0UGJckne7EOhzxx9WXSeCKSsV4rpBM3wgZJomu7nwYw285xMD77qDkxUQ9s6Br6ubiOVjFtTDyTGbFzkWguyhY/GB2lPN1px7Ec+PPTbSX76HcLQu0gLnZ5BJB4byBSoRJYhDgwjKPGj0LndRozTcdBd0ljw0y5F5chuIxz8VJkVL9cVS1VJxBISyhb22xubToYBcfygIcdSObzy9GJZA9c3rDGYBxWkQH9FVJc08qd9cG2AlASma9LuX/lFdDVjjK3Q1B/uNmOB0xl7LIVv6PVuHHr6DbNuwoWboqHowoSO29ye3mjfEBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	863b4aed-2580-42a9-7f26-08dec21a3171
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|82310400026|1800799024|14060799003|376014|56012099006|4143699003|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7uCcSglhGcaCqBVWX7C1UnYjdTZl3o7owe7M9GOmu3HPUEaCx7Kq1CsC/bReINu9RJ0F+EC4gPPPSPlY0sNJpEY+Is8RiZKbG5nCjp4aQJ2PYCjl/1DqCHPIwmhoHzVMoWF0GqP3o1V7b/K4HbQZq+KadFkP4EQLJsCv95Ft/QvnvU3XXPHsefOWBEYquXKzfgge61N8+OaRHyfbTBvoPqnZASvvTuDzO1r5L8+K+USP3j+1+IpYkXW1ESWS64kxUqyO53iPCoFIKFyKDtgHMvpoN9Wme+eILCgvBoAq8bmfEdvR4uMSd0I7vEsrW+V16wWf/PReWWUub9w9X5Nm67CzXsoNS7CfrG1+MzxKBi9Pc5nBEZSjs/vjTavDU1jZAsdskoA+iggTjjLQCzGYNuNS6O2S7e39XHmOOZw3ysMEq+kBvVZbbB5Xl7MdLPLYFLUYn25NSHGCINzhfPTuzhwLVu7HIRxA30nZccandtae58jKQ4IeL8MaNtMIP4gAS6glm+XyaJ4GLhhv4M4OXCejVZ1giSVz2cdKg1I6aRa+kH2m6aN0uVxPs3Za6gBEWhqPCNsl5ZZoo3vozlhyhj6Tn3XjTO3mXNRrCr3Yg6tLoCaXFn6bqhQxm6uAy14lwAHVuTJHbmWCp2dwhzAASfq9CBYg5D6JNqiVzToZCPIJuiqEypBcMs7PviPqvi2g1dWFQzKZxiwECe1I0wCn9x12lp/ewehS4kHFcXEGrdg=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(82310400026)(1800799024)(14060799003)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JIWBki9i7G7cL9S4E0nsYRE5OU7eiRyNm9pt4IYomQyQX9bk7Y/jZru+85+mNZ4SgDncUmSa7oKqKsVpwOWl8sevWc+1RX0j/mHpWJM8zmWAeISED8avbBH/InAvDPQ9LbbeiMBMU3PUg7ZRQcQBWUqcmTkFa/jkogzr7wFz2PDb2CsJQpufa9O614sNo0FY4UG18xzrfAwKuaWZZD7LpeyKnvyqcKHHVX7P12SVKA4x3O1oxYo3znMjMPPrUbMm7m+0FKlU91VbUzZbtv2UC8MMoMoMLw9U7WMURosPZIPQiaVwnKhy7HE8cECwu0A/oYXLBC4XMGTvDpGZlrm1Y6cwaILsxGSl7DGy/NWFRHo9qg8jnpX/NSLF+LJjkN6JXYjuw3EUDnqg6VgIzWK2xa0VwqPwGp5f1AuTascYN4c705Jb5DqFjzeJQNu6NQL7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:19:11.4768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f84e75-34fe-455d-1c91-08dec21a56e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11923

On 27/05/2026 11:02, Aneesh Kumar K.V (Arm) wrote:
> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
> platform device. Like arm-smccc-trng, this device is not an independent
> platform resource; it is a software representation of the RSI firmware
> service discovered through SMCCC.
> 
> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
> is SMC and the RSI ABI version check succeeds, create an arm-rsi-dev SMCCC
> device. Convert the Arm CCA guest TSM provider to an SMCCC driver so it
> binds to that discovered RSI service and keeps module autoloading through
> the SMCCC device id table.
> 
> Keep the old arm-cca-dev platform-device registration for now. Userspace
> has used that device as a Realm-guest indicator, so removing it is left to
> a follow-up patch that adds a replacement sysfs ABI.
> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/include/asm/rsi.h                  |  2 +-
>   arch/arm64/kernel/rsi.c                       |  2 +-
>   drivers/firmware/smccc/Makefile               |  4 ++
>   drivers/firmware/smccc/rmm.c                  | 25 ++++++++
>   drivers/firmware/smccc/rmm.h                  | 17 ++++++
>   drivers/firmware/smccc/smccc.c                |  8 +++
>   drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>   drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>   .../{arm-cca-guest.c => arm-cca.c}            | 60 +++++++++----------
>   9 files changed, 89 insertions(+), 32 deletions(-)
>   create mode 100644 drivers/firmware/smccc/rmm.c
>   create mode 100644 drivers/firmware/smccc/rmm.h
>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
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
> index 92160f2e57ff..da440f71bb64 100644
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
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..33c850aaff4d 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,7 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +
> +ifeq ($(CONFIG_HAVE_ARM_SMCCC_DISCOVERY),y)
> +obj-$(CONFIG_ARM64) += rmm.o
> +endif
> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
> new file mode 100644
> index 000000000000..d572f47e955c
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Arm Limited
> + */
> +
> +#include <linux/arm-smccc-bus.h>
> +#include <linux/err.h>
> +#include <linux/printk.h>
> +
> +#include "rmm.h"
> +
> +void __init register_rsi_device(void)

minor nit: Could we rename this global symbol to scope it under rmm ?
perhaps, rmm_register_rsi_device()?

> +{
> +	unsigned long ret;
> +
> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
> +		return;
> +
> +	ret = rsi_request_version(RSI_ABI_VERSION, NULL, NULL);
> +	if (ret != RSI_SUCCESS)
> +		return;
> +
> +	if (IS_ERR(arm_smccc_device_register(RSI_DEV_NAME)))
> +		pr_err("%s: could not register device\n", RSI_DEV_NAME);
> +}
> diff --git a/drivers/firmware/smccc/rmm.h b/drivers/firmware/smccc/rmm.h
> new file mode 100644
> index 000000000000..627098e2ae1f
> --- /dev/null
> +++ b/drivers/firmware/smccc/rmm.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _SMCCC_RMM_H
> +#define _SMCCC_RMM_H
> +
> +#include <linux/init.h>
> +
> +#ifdef CONFIG_ARM64
> +#include <linux/arm-smccc-bus.h>
> +#include <asm/rsi_cmds.h>

minor nit: Could the header files be moved to rmm.c ?

> +void __init register_rsi_device(void);
> +#else


> +
> +static inline void __init register_rsi_device(void)
> +{
> +}
> +#endif


> +#endif
> diff --git a/drivers/firmware/smccc/smccc.c b/drivers/firmware/smccc/smccc.c
> index 6d260354d0f9..888e7f1d6f86 100644
> --- a/drivers/firmware/smccc/smccc.c
> +++ b/drivers/firmware/smccc/smccc.c
> @@ -15,6 +15,8 @@
>   
>   #include <asm/archrandom.h>
>   
> +#include "rmm.h"
> +
>   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>   static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>   static DEFINE_IDA(arm_smccc_bus_id);
> @@ -240,6 +242,12 @@ subsys_initcall(arm_smccc_bus_init);
>   
>   static int __init smccc_devices_init(void)
>   {
> +	/*
> +	 * Register the RMI and RSI devices only when firmware exposes
> +	 * the required SMCCC function IDs at a supported revision.
> +	 */
> +	register_rsi_device();

nit: We don't have RMI devices yet ? Do we want to make it

rmm_register_devices();

instead ?



> +
>   	if (smccc_trng_available) {
>   		struct arm_smccc_device *sdev;
>   
> diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> index 3f0f013f03f1..ad7538750c5a 100644
> --- a/drivers/virt/coco/arm-cca-guest/Kconfig
> +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> @@ -1,6 +1,7 @@
>   config ARM_CCA_GUEST
>   	tristate "Arm CCA Guest driver"
>   	depends on ARM64
> +	depends on HAVE_ARM_SMCCC_DISCOVERY
>   	select TSM_REPORTS
>   	help
>   	  The driver provides userspace interface to request and
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
> similarity index 85%
> rename from drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> rename to drivers/virt/coco/arm-cca-guest/arm-cca.c
> index 66d00b6ceb78..8d5a09bd772a 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/arm-smccc.h>
> +#include <linux/arm-smccc-bus.h>
>   #include <linux/cc_platform.h>
>   #include <linux/kernel.h>
>   #include <linux/mod_devicetable.h>
> @@ -182,52 +183,51 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
>   	return ret;
>   }
>   
> -static const struct tsm_report_ops arm_cca_tsm_ops = {
> +static const struct tsm_report_ops arm_cca_tsm_report_ops = {
>   	.name = KBUILD_MODNAME,
>   	.report_new = arm_cca_report_new,
>   };
>   

Would you like to either :

1) Call out renaming the existing cca_tsm to reflect cca_tsm_report
in the commit description ?

OR

2) Split the renaming of the "report" stuff in a follow up patch ?

Rest looks fine by me.

Suzuki


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
> +static int cca_tsm_probe(struct arm_smccc_device *sdev)
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
> +		dev_err_probe(&sdev->dev, ret, "Error registering with TSM\n");
> +		return ret;
> +	}
>   
> -	return ret;
> -}
> -module_init(arm_cca_guest_init);
> +	ret = devm_add_action_or_reset(&sdev->dev, unregister_cca_tsm_report,
> +				       NULL);
> +	if (ret < 0) {
> +		dev_err_probe(&sdev->dev, ret, "Error registering devm action\n");
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
> +static const struct arm_smccc_device_id cca_tsm_id_table[] = {
> +	{ .name = RSI_DEV_NAME },
> +	{}
>   };
> +MODULE_DEVICE_TABLE(arm_smccc, cca_tsm_id_table);
>   
> -MODULE_DEVICE_TABLE(platform, arm_cca_match);
> +static struct arm_smccc_driver cca_tsm_driver = {
> +	.name = KBUILD_MODNAME,
> +	.probe = cca_tsm_probe,
> +	.id_table = cca_tsm_id_table,
> +};
> +module_arm_smccc_driver(cca_tsm_driver);
>   MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>   MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>   MODULE_LICENSE("GPL");

