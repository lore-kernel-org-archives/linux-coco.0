Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E999A199944
	for <linux-coco@lists.linux.dev>; Wed, 16 Oct 2024 09:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071086; cv=fail; b=iRhBXfA8HH3On9MyvTIDwZN9S4/Us6b7/lGk6Qbh74ZXRXbZgWBfkgrthYPP7Vtr+CFTdr0pF5jR/59AYDZDfPDyPYJRa817Go//W6i1MQNgeCcLRVfGzz3iLP3EVkprmn/tHqe/a+Xwi8TuAmVLn7QYroj1H414UCadsSAkZ2c=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071086; c=relaxed/simple;
	bh=datKsOwxQjVawagrp5eONgffrQmJXX/LNMdL2CG7IM8=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ke9kcIMK+Y952yIqPdQpesTNyj3ios5OGMx23RLDDFgeZccnUEfMP1+bLlenY/rMxSW19khLuxthmtQmgJfq5l5Jk9R17ciz3war2WibAU1kIUxi+LT7QY8fGUo2rIVFDTGdu8t3/nVZW4zQZLoNMtd7UrOea1IwKejyYYKlPLE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vp4SKZRr; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Vp4SKZRr; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vp4SKZRr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vp4SKZRr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xUtvYuSAuJ8mGw9/dXNH0Jc52vvLmCIDgTFqoPf4+qB1v6WkzIuH8hz+JumhzZIEVyRkMIDj89YfwHCMe7k9saxoX0xA3lDNQOODmjHM6PCWGNOOQVvKtZPoR5n3jCiecOTqKHcgxNoGdrBjm0fzx2KRkOx6ZK4A5mxwHL6KLnbmbIj3YzPE0KOt/lgL7a9xL6iGVUyNtVLlzPwflzowh4Im+y1yGp0FZ15AgtldVCVZT5w3tqXyh3hV7Z6rDan8qv+afcakK/t5OAmPBDqLam/5LHuc+outS7co9c+9EQA7jkSZR80FcT11q143QxwlEwU7fGzUaDBDglwaFQ90kQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6Szv2xoOEddn+RwV6HQCMYxAK9q9tLZ7Vnx2dz/ASA=;
 b=n3f+IXEuuMpOaLOH/OUwHyhpIASFZwZkSbJxVKXHOT2aLx1jLU1sXwqTWM9g6ipRyGz3dj3xvclW/+ET0NEuCq3seQiD65HT6Xm1G7G0VIuApRw/C/o7p5XPk0K93YsNdYIGUdHeaWGhqcqrkVTQt7QJsEwjaqiXOi46AMZYFfWCwXlaxslxhZWV/xzeKfgA9oqejGLTITZE5siIgtBt/MjxN7ZRkLuc/AKd1hpA6C5itORPFIZCw5A5oFq04r8MDSNpyNF14OikBI8Skn6uyO5nkFKBgQiJ/LHnZ9HPlzCDaypLhOs6yVb19QTHDIaIx3TWoV8w8DACpRt3vVq6wA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6Szv2xoOEddn+RwV6HQCMYxAK9q9tLZ7Vnx2dz/ASA=;
 b=Vp4SKZRr0OLsFbSGaTtkCQncNcEuiTNn57mY+BbRGe/kG/NiQOHM+tCTORDS5fT5IqClYF4yfH9rx4Akb2yEMEYR6vYVWOAStMFmcb6afSfub9kpxvlifwM7IEBJ9Kl7bY2L3+FmOqM4m60QqS+cNLlbsBdS+zF2sjWudxdBQIw=
Received: from AM0PR02CA0207.eurprd02.prod.outlook.com (2603:10a6:20b:28f::14)
 by DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Wed, 16 Oct
 2024 09:31:17 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::1e) by AM0PR02CA0207.outlook.office365.com
 (2603:10a6:20b:28f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18 via Frontend
 Transport; Wed, 16 Oct 2024 09:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 16 Oct 2024 09:31:17 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473"); Wed, 16 Oct 2024 09:31:17 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7d3f10eb382dabf
X-TessianGatewayMetadata: 3/rWgQ8bnKOFO3n7mQOXwpR7myjpqhPSITauvoq7f/cWCkl/0X71Iwfo86nk4Kp5dPye+uZX/+QSnAJcDVVXdkdBtaaue/TZbjrZxLGL4cWb2yKiAYDP5ldXB8uVcDYrSN8ClxQqo00L+dUbfcSweDky7qUSVycBJxvqBHTkUzU=
X-CR-MTA-TID: 64aa7808
Received: from L8fff0ac55deb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2F8444A7-25E2-4351-B9C3-BFBC602439A6.1;
	Wed, 16 Oct 2024 09:31:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8fff0ac55deb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 16 Oct 2024 09:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjwmnddTB/MtGKmHcFFb6/Qvduhu40QX55uhxd2z1FVb8H9ngiWv0gEwmb5J0TXa7wvsSFVBoUZeFb3Po/Be2r42d55I9SiORlsgWOuDDXcF9kinyfvhAN9hHdbIlcZ+Xx8e3Eyi5bdwBPzwHPcgOlu+qeXEwN01JgcDZ9lhbp66b8RZDqWxdmwngv/FFk5XW3eKTkFRabA81LvFJj0zzAf5k7U2ZFGmDaOR9LdqHFYBTb4P+7MalJvj3EM6G5r0jp6chtsTJp5Ivvx44cKDXkseqvFrsPS7oGQbf/jLvAq4L1+MgrZgyctocFE9Uc4WjXogIu8gkGmMN3xX4Dzl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6Szv2xoOEddn+RwV6HQCMYxAK9q9tLZ7Vnx2dz/ASA=;
 b=cnoH1/LRrSS/veqQDyfJYhDcHn11mbrTVSXxXJJDDzJnPQ4eLOkkePxWq6MeuAxBNkHRs8aSyp13b21bxhgJrMMfKEwjBPIHpDS56Ux9ZpBk2wlji5FfwwNb6UQ2KCYIRQe1pAri7znOcJ0c4o1dy0PiV+N3HkAlloZoAT5Rb2rvrsWCoJ+yLjOVtaniaV3dBcSMU5Toc8TwXHRjzgtuNv+WZc9B6ZsSLj+RT9b9S9LWX8SbuB8EY8Cww9askKXT6EQBylelludAmuu5GiePvXDNkD2bL6d/es9GruGlqs0lRiJhcT571rTu2Fx1zkd9RKgZHWHwZdLNyS8i6HrcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6Szv2xoOEddn+RwV6HQCMYxAK9q9tLZ7Vnx2dz/ASA=;
 b=Vp4SKZRr0OLsFbSGaTtkCQncNcEuiTNn57mY+BbRGe/kG/NiQOHM+tCTORDS5fT5IqClYF4yfH9rx4Akb2yEMEYR6vYVWOAStMFmcb6afSfub9kpxvlifwM7IEBJ9Kl7bY2L3+FmOqM4m60QqS+cNLlbsBdS+zF2sjWudxdBQIw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com (2603:10a6:150:6b::6)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Wed, 16 Oct
 2024 09:31:07 +0000
Received: from GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469]) by GVXPR08MB7727.eurprd08.prod.outlook.com
 ([fe80::9672:63f7:61b8:5469%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 09:31:07 +0000
Message-ID: <a56cae74-c5ba-4a83-b77e-2ab522ef3113@arm.com>
Date: Wed, 16 Oct 2024 10:31:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal: bi-weekly guest_memfd upstream call
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-coco@lists.linux.dev,
 KVM <kvm@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <4b49248b-1cf1-44dc-9b50-ee551e1671ac@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To GVXPR08MB7727.eurprd08.prod.outlook.com
 (2603:10a6:150:6b::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR08MB7727:EE_|PAVPR08MB9860:EE_|AMS0EPF000001B1:EE_|DU4PR08MB11149:EE_
X-MS-Office365-Filtering-Correlation-Id: b71010c5-3ea6-4c28-b01e-08dcedc54995
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|3613699012;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N2lGdTM4cVQ3SFFnTGdJNGtXaWZERUNTUFNRaDRLUE8ycDBnQXZ5ajRodVNu?=
 =?utf-8?B?czFsS01hRldVZ1E5R0IvbmpxamVmTXVkWlF0MXIralBJUVlUd1g4M3B2azZG?=
 =?utf-8?B?T2pYVFgxTXBCVHV6dmlubUxkaHlOaE1DbHBNWlVaOW9rZUkvOGhFQkl0NjlH?=
 =?utf-8?B?Vk9TbjZzN0xwRCtuTnhQWlNUUlJ6c1hvUDJsMFFjRVM2blFSWGZ3VlQ5N2JL?=
 =?utf-8?B?YUN0TU1FNkE3MW9kMVAwcnZocEpMeXVUSGxpQlhSa0JNdTFqWHUrMTdnU0Qz?=
 =?utf-8?B?NDZZT2k5d1Fqd2hYcU5pc2dMZndSYnplaWtVZVNoTVJIRElLWjY5TFRGQlBO?=
 =?utf-8?B?WmRsNGRsUzhaMnh4dS9mNzh3aWoxMVpBcDdIVWc0MHpxc0FYVWxLUEZRSWVQ?=
 =?utf-8?B?Q1R6cmQzQ3pKUEJVU2xpdlRVNXdhRTVkSHZKS3FzZ29OYWY2WkFCL0kvU0Nk?=
 =?utf-8?B?aDVPU0dDd05Pd01hY3B1OHZ5MmlGWTVYTmZnWGQ4VWdqd1J6eSt2ZHZmTEIv?=
 =?utf-8?B?MUd2Y1BzdW4zWGFIdUxxNEM2L3Jibm5jUy8vVFlSOXRtbmV3ZlZ4bDBCYmV6?=
 =?utf-8?B?SHhacHlTWG1KZm53RGJ3Tm94OTgvUzdKNUtTTEpOZGszT1BvNzFXWDBwbFU4?=
 =?utf-8?B?VlF4VkRUb1RvZGtMVjV2Y3F4WFo5cmREVG9VTTRxTmJOdm13bG5vMG5rY0R6?=
 =?utf-8?B?Vnl2VGc5WXhhMWt3aXp4Ti9pWEo5d2Y1eFhReUtKQTFKN25IVUpYVmVQSUxj?=
 =?utf-8?B?S01LWGZKMURjeFNLaGpCNnUyVHdRbW9OWFlMdGVpL2ZoZmpoT3JZSzQ4OTF3?=
 =?utf-8?B?bFNqNVdBNG9BcTdzWE5ad1NNQ2JHUGRONkJEUWp5T1VKd3ZLTHN6UDFzU0FC?=
 =?utf-8?B?Nm9OelgxRzRVNVc4VUxXUDVjVlR2eTFORzlGbytMaDJUeFovVzNvTTJpbzRP?=
 =?utf-8?B?Ym9YNGppZ1hsS1hJRXpTbDc3bjRpaUdnR2F0eVk3bC9OZTRMM1dxekpnWVZw?=
 =?utf-8?B?Ryt5RTFjYXdsbHVaeUFDN01zSWJaUjNzVW94UDNuRlUrSlFTVVp5aU4yWXlU?=
 =?utf-8?B?eUdPWGtyU3BBVGFibGk3dXhuWjNmZUlmWlJBU0lsSnBCRmZEUVB0WDVCYzJI?=
 =?utf-8?B?dnNNb0VvaldXUWduR3B6QkdOM2lLaVYyb1FzM0RqOTJLYkdVaXlFUzF5Y1RQ?=
 =?utf-8?B?WVROaEt0b0RlVkQ4M2tTOHJiMmU4NU10WWtCVWJ2TnRmdUt6ZWt0cURaS0Fw?=
 =?utf-8?B?K1pvaHFPYS9STW1Wbnd3dTNGMFNta29qaWx4QldIeWhsSkV5TW9MUks0eGRH?=
 =?utf-8?B?Q1FEVW5QbllVTjhYcTA2OElTV3J1eERJYWdVMS8yWlhYTjR5ZVFNcmpieWx1?=
 =?utf-8?B?U3M3ZEpWTVVDQlE4VUpjSmlKQTNQaVFjdFRpd2NzVFgwbXBjb2o2MFl1bUwx?=
 =?utf-8?B?ZndBUm1lZU1tV1FVczZYbklSSG1ISjIvcE0wOUdJM1kweDZ2SkFQQTFDQlRl?=
 =?utf-8?B?aStQb3ArL1RzQlh0RGk4M0Q1SlBWejY2UzBXL01SV2p4SEY0TnZkWHg2anBm?=
 =?utf-8?B?eHlncmtibmFkY2pvbnpaNjdCR2d1b09nWjJpaDhPMmROVmFtVEV0aDV1WmhN?=
 =?utf-8?B?aUk2WDd6S1Zqc1dMcTFNUE93a0VObFNQZCs4dVNsS2k3anF0RFZubzZBVVZX?=
 =?utf-8?B?bUtzZ3JBNVpHSytLeUVQOXFRemJjcUxzL0ZMWklGQ2ZrcDRmNEFycHpWUVFG?=
 =?utf-8?B?S3YwM3NORUhPb3E0RWNKOGJ1VDA5M2tucSs0YW85cHJBK2EzYWUzQlppM0tz?=
 =?utf-8?B?ajR3MVJZeW9sV2JFZUxVQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB7727.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:150:6b::6];domain=GVXPR08MB7727.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93daae88-e134-441e-4eb8-08dcedc54307
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|35042699022|82310400026|3613699012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTUrVkFwOVQ1R3RzSGJVdTNqYWpZTWFYMDFnVWcwYmxCYlJONzBuLzBCS2Ur?=
 =?utf-8?B?Q3FvM2NYd3h5alBpUWtuWG5melpqQm1jNHJBZTJsMkxoME1USzN2ZTFReXdG?=
 =?utf-8?B?eWNVR0xJR0xoSXpnQ1dqUElCWWEyeEMxaERXV1V1b2kyT3pWOXR3bjRxS01P?=
 =?utf-8?B?N1F1RVN6dHVwT0plMEc3c0Z4WVF3aldlM1NQalBtcTh4NnJHdnJGcXFUOEQy?=
 =?utf-8?B?alphSWxzMkNKMFBCNGk4SnRZQlhlNktSWWt0YkhXRURVMjlNaVZxRm9JdXp4?=
 =?utf-8?B?TlBYczE2ZkM0MnV6S1EzaThMSlNkcDNhZjZTZ3k2WFBXMmNCQkhlRTlIZmJq?=
 =?utf-8?B?OFBKWkMxRk1DQ3IvM1U3MERzU3oySzZqMnNoTnEzd1dxMEVBcGt0emVLUXpv?=
 =?utf-8?B?UzV2Yy9Hd08zMXl0cVV2UXRjQ0pVTElabndnQjF6VExYZXR3eHBKeEhwYTdJ?=
 =?utf-8?B?YW1JNk1RNmVSUm5Na0dub1ViaUVFT29UcUI3MUN2d2pDZG96MDkxMHJlbVhF?=
 =?utf-8?B?NEFSdElyQ3ZxYitINkE0WWdVNVdXWXIyNTNsdnQ4LzJxa1ZKU2RWdDhSV0tn?=
 =?utf-8?B?ZUtCTlpGNjVJYmh2TnVqbUlUZW9kSzlESXM1UmJlaWF2SmR3eWh0alZPZzBF?=
 =?utf-8?B?a1hOWFAvRW1uMmR4bHhaUm1nUWpjZUp0VkJEUUxJNkdhamZpMGxKUUZiejBu?=
 =?utf-8?B?TS9BQUhNYWlxN3hYRk00UGFoTGtCWDA4RmFLSEpVWnFySWZWTlJPMGJJSW5t?=
 =?utf-8?B?dXZTTVg1eURWTmFRbzEyUWtxak96NnUzK0x5Ykh1WEMrblppUHgzSlJaUG5Z?=
 =?utf-8?B?czBiMS9UZUkrMEh1cHRFcGlockRJM2x4UldibHlNOTVHbXBGWW44WlBWK1dl?=
 =?utf-8?B?SkNpQ3U1SVBMckdYMEY3RGUxYTh3Y1VFZXhSREpDdzh4WldPU3c4WGc1STlG?=
 =?utf-8?B?V25UQ0RVQ3ZXU0JtYUZHeTIzd25MNFBiY3F2L2UrTG1jeGtrRHVHQzY5enVB?=
 =?utf-8?B?MjFhL0piNjFTZkppZHNBVmk3SUZpTHRDN21nZ1lJbkhtOU5WVTNjZ0Vaam5l?=
 =?utf-8?B?QzhUQ1ljZXdUL1NWYWhlU0EzYldtSnVkS3d0OFlDNVFMMnlHR2t3Nm1qc3hM?=
 =?utf-8?B?N0VIY1pQdmcvS1N5OG41UWh3ZktncXZnVE8vN3p2NnZobU0ycHRYUWQrcmlE?=
 =?utf-8?B?T1VnNXFnM0pmdko5dG9vdFEvMlB0M1FkYXlMUHpaN1ZTRzBQZTVXeHdtSENU?=
 =?utf-8?B?ekhPTTNmOGltM0h0OGcrcXdCaU5PakpSN2VYdXo4c2NOVi9waXlrTm9vOVpL?=
 =?utf-8?B?THl1YjBHUkQ1QmszUnJRbUhmRkpSQUVuVkxzT2xKZ1J5V3NLazYvOUlaK1li?=
 =?utf-8?B?cGRlK0FldXorMXlrV0ZuZVJqd0VoUDFFWkczV3Vha1JTTlN4NkdCOTE2SjNu?=
 =?utf-8?B?VEdtWnRSYnhhZ29VYjlLYTh6SEtFRnhJRFYxSUhQWU1YSFV4ODBhN1ZJZVg0?=
 =?utf-8?B?WDlINWFjSmQyTkxJWmpBT2dEN2hSb1IzUG85djJGc0dmSlE3Wk5jcERkTmIz?=
 =?utf-8?B?MGM0MHpJMk41WU1KQVY0RGRrZzMrZjBGTzFkWmllY2o5UkEyTVp2Z1o2NWdj?=
 =?utf-8?B?eGd3VjJnTkNOMWtCdnROMy9IK3FnODBNM1BiSVVJbEQvVXZxcWRqNHdmVzVm?=
 =?utf-8?B?M3N2OEJPVmlwUHQ3UnVaSGxXNHIyRER6NmkvcndjU0I1VG11MTlWY1BQQVlu?=
 =?utf-8?B?YTNsTi96Ni84QlZYMzRDR0lBbDNHd0VBWXpsQkt4dlBwSEdrYm1wY05jbDZE?=
 =?utf-8?B?bzdjZGIvbGRINlMrR2IrOCtvS3ZZaFdLUzhTTStDOHpIVERBSGQ5U2pwTjFN?=
 =?utf-8?Q?z9z5tlfLQ21uV?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(35042699022)(82310400026)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:31:17.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b71010c5-3ea6-4c28-b01e-08dcedc54995
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11149

Hi David,


On 10/10/2024 14:39, David Hildenbrand wrote:
> Ahoihoi,
>
> while talking to a bunch of folks at LPC about guest_memfd, it was
> raised that there isn't really a place for people to discuss the
> development of guest_memfd on a regular basis.
>
> There is a KVM upstream call, but guest_memfd is on its way of not being
> guest_memfd specific ("library") and there is the bi-weekly MM alignment
> call, but we're not going to hijack that meeting completely + a lot of
> guest_memfd stuff doesn't need all the MM experts ;)
>
> So my proposal would be to have a bi-weekly meeting, to discuss ongoing
> development of guest_memfd, in particular:
>
> (1) Organize development: (do we need 3 different implementation
>      of mmap() support ? ;) )
> (2) Discuss current progress and challenges
> (3) Cover future ideas and directions
> (4) Whatever else makes sense
>
> Topic-wise it's relatively clear: guest_memfd extensions were one of the
> hot topics at LPC ;)
>
> I would suggest every second Thursdays from 9:00 - 10:00am PDT (GMT-7),
> starting Thursday next week (2024-10-17).
>
> We would be using Google Meet.

Thanks for setting this up, please could you count me in ?


Suzuki

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
