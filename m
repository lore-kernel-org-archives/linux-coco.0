Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010022.outbound.protection.outlook.com [52.101.193.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67204346AC8
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769810755; cv=fail; b=REtbD77u+XTBAsFcN2kSTipXOnpdmuHeGEcjzM9iZzdm/CLNL9itMzGlxSTRvWPa/D71yzp29sjzWCjdELprnD4dPzJCUCe7KTX7iTjLUcoWu8OlDA9w0R/tmAAzl45j9glmGYqaiElMyfqaGmq1Mt0IU+oACaeBmaBmuhK/93A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769810755; c=relaxed/simple;
	bh=qwA3O13ndlC5xY1q4NOhcaCFTf4M1OLNBx4H9431jtA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dSugrjJ+eg8nWrp+NzKEInAizah0YuNoS1IKjaGLZ+Zz4q2MbaLBo4mvSfh6VHvel62BVT+reHtazk20+I75JzD+4TW/8E2NXjUO2uVt1rgAArLyhP7GmMhrSHn/mgK4SA7tfMSAX23hGInugfQEL3I6ft/IBjdyv/AP1J8plh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Md//yuD+; arc=fail smtp.client-ip=52.101.193.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Md//yuD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLIevMnMZlerNiznH50gqQ5X1FZyvoZiapqqcpnbCKFRlEggop9bQ7EjSh4yFuJOZyQ8lrW8gZMTICDsHpkVTa930eaPjWUscAGuGQldYOHOBYRiAfUrYqT5DvCoGzRiiIrZawEyik+LaM2xQdypphKN+nZUYSBJxH/JPPSwSQAokwET0HVRmwxGlU+8Hp/Ldduq+PuZxMCyRcy05gcu6T6j52s/kEtFFP5IFd+X72bAABFqO+NbxifmT4N+k2DDsjvzdicaQ9CksMX+mjElg21GnDdmsO0p4cfT8H4I5gOq2um1eKi8Hf8Ol3I/GLIoVjxtBs4j9jqrhHHGin2+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKu/PMw8WdYLlFhbEP5T+Cp/F5gZl0dE5Leqe5vg5/Q=;
 b=aArYKVMCnGbtJU9fEkVnenXpIsSFmVC8U5xCl1CA7Buy4FsukErtpp0vejrbtMp14elY9xUw14VzRVkh6s+nR8V7teU7ZtHtSchMXvDgYCRp43YEyMI57q57qgLa4TDsEGvpOX5DDpW5MZenFKXiUGfCBIoX84SQwoSb/15uTxyeyjXJyySteNGkum1JsN/9CncSVqqt8RhEfGjMEwOJL4a+cZ51+c0kFU3Yy+ZPmhTLEIuREkdxv5aK0x4sBtprRdysNZwM3bnq4cCFzIrHTMmErKGexLd6thRSfRgTdxkTBkxk/uuu5YF1HiMu57OUm0/j7yDH7rxlmsmS8ozDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKu/PMw8WdYLlFhbEP5T+Cp/F5gZl0dE5Leqe5vg5/Q=;
 b=Md//yuD+0p8L+FLjaTwLPpxi5Um1ff7tQLz020UDTlAKG/6nj7h9rstwhDA7albpzMALAFBuEKyTOsSmHIb4ZlUc8zEv+AvoaBBgk8Vc/XjaznbQowl1AymS3cS71KaX35j5DbxGMXuEouGXl3Rrs4a8IXr7UYKgLN35KTWrHpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5062.namprd12.prod.outlook.com (2603:10b6:208:313::6)
 by PH7PR12MB7965.namprd12.prod.outlook.com (2603:10b6:510:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 22:05:50 +0000
Received: from BL1PR12MB5062.namprd12.prod.outlook.com
 ([fe80::5155:289a:c3ed:f959]) by BL1PR12MB5062.namprd12.prod.outlook.com
 ([fe80::5155:289a:c3ed:f959%3]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 22:05:50 +0000
Message-ID: <3dd58daf-6b7c-4887-b510-9c4fb7de0469@amd.com>
Date: Fri, 30 Jan 2026 16:05:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: 6.18 CVM guest kernel boot issues with non-UEFI bootloader
To: Ard Biesheuvel <ardb@kernel.org>, Kevin Hui <kevinhui@meta.com>,
 linux-coco@lists.linux.dev
Cc: youngjaelee@meta.com, hvolkmer@meta.com, chrisboltz@meta.com,
 tzn@google.com, andrisaar@google.com, grobler@google.com
References: <8d47d224-0ce0-417f-8c12-3ab9d6da8a59@meta.com>
 <6bb2c25f-e51b-4d90-a67e-100bff1af838@amd.com>
 <e634d3f1-a58b-4303-9066-0dabc96d825f@app.fastmail.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <e634d3f1-a58b-4303-9066-0dabc96d825f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:5:3af::28) To BL1PR12MB5062.namprd12.prod.outlook.com
 (2603:10b6:208:313::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5062:EE_|PH7PR12MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d64ed9-7276-4be0-959e-08de604bba8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emZleWpGRFo0aUh1VEVqbDBFUXFacnBCNGJ0SGcxMFR1WmlaQmlpK2FZN3h6?=
 =?utf-8?B?TkU5L21YR3hOWUJWTVJLd1MzeThkY3AxdTd5MS9IRXFYT25hdUZtQUxOa3J0?=
 =?utf-8?B?enV0YnRON1hCOVBVQVBzZ2x4UUxXWHQ1aEpDbjg1dFRCMTRTZ1RjNyszNkY1?=
 =?utf-8?B?YWI0K1Q5bGpXWWc3SmVLbTU1UlZmLzk5L0V6aTh3Q29URi8vYlpiTUdrbElp?=
 =?utf-8?B?azdLTkE0ZzBMUFltaGJTRjNTaU0xcWdRYmdNUzFMRkNWa2hvck9wL3FkUFZ2?=
 =?utf-8?B?cldpRUkxUUk2RTU2Y3Y5azZOK1ErTG9HaHdxUFNBYzlTNjNFS0VTNUFKN2hG?=
 =?utf-8?B?SThESVJMUW82YUVTMmV6SHRmUDJJWDBHRWQyWnZiTWNKTm16OXlTVlYvZVJ2?=
 =?utf-8?B?NjlKaS9tK2VibG0rNEl4UDIrTTc2VElITVRobnE3TWlneXUrcXA0T1lYN3Fp?=
 =?utf-8?B?NUhXd3ZUd2VPSlArUG03aGZpRjdNbWlscC9mMnJUQTlnMDRvK01oS1NNdGZo?=
 =?utf-8?B?SUdQbnhnT1VRVWlLd21qMUx1ZkJEcnFtOVBDeExraXk2dmxaMEZrSVcydzlv?=
 =?utf-8?B?Q0ZYNVZYVlBYL2lZdmFRckRFNzl0M1pDR1ZYL0NqUzhvSDlRY1R6WUxKOTJM?=
 =?utf-8?B?VGNxbGh0bjhqT3NEOTg2ZjhsdUkvRC9JMks3dEIzemRuRVIwSlFqM0lKNXdP?=
 =?utf-8?B?R0Q0TFI1N1FMajBpdXI3SUhJbDA1amozMGtLcDUveDBHRWp3RGpCOEUvSHRC?=
 =?utf-8?B?RkV6SXd3YzhRNHNENEU5bGo5QVFaUlZaSHRZNXNNWHFwR0g1cFpSU3p5UWJN?=
 =?utf-8?B?S2V5TEg5WTdEWlhNVEtuK0tBYXpmUmlJYW5nZWwxZ3d5ZHVHaTcwNkJlUitF?=
 =?utf-8?B?MXpkQ1plaFc1K01PeXYwUHgrckNEbkdQclpuejlSRnQyaTVlWDI1bFZhai9B?=
 =?utf-8?B?WmU0ZVZrcjkrdWFUNktheE9taEhiOVR3UFlma1dmait2azlLNmVKUUdkU1Bv?=
 =?utf-8?B?WGhFS0lXcmwxY2tVUWl1ditMLzRObzRtQVdHRzZ1b255TXhGbmxoNXQ0SHpl?=
 =?utf-8?B?V1FLK0t5bnlWYmZxQzNMTk42TEZFODQ3TUVOWExwTUh1VjZIeXI1TVc5YVZM?=
 =?utf-8?B?WjgvWmVua201aTMrK1UxdWNtR1JMQTdldko0L2JKa0s4UzhLL3c0ekdSSzRy?=
 =?utf-8?B?RUJaMmhLYkdITlg2Q1FrQVFOSmJIOGhmam12TjZONXpXNnBhcWxta005UGll?=
 =?utf-8?B?d0J1SXpLczV3WEcveC9yYnlBMU4zdUt3bUlnRWxneE5BNjBZV1c2Smk3YlhN?=
 =?utf-8?B?Y01iRlVEVlM4STBGOVhoUTU2c29HQ2Vkb1ljc2F1bTdoYmdDemFMOGRWQ25t?=
 =?utf-8?B?MUwzcW90MFZ0NXlUQTFWSlNQRmc4MHVLNU5LWjJaenl5MTdJcUdBNk9hUWlX?=
 =?utf-8?B?bWZrQ2swNXFzSlgvYXpmMG1OVGgreVhXTHdRWkpLZ2xZcWhKTFRwMGdFUE1Q?=
 =?utf-8?B?RWVNeDJENmxKUVlHN3NJWVpDWEtDdkNBWUw3aysvNmM5d1k2bm1zd1JaY0dh?=
 =?utf-8?B?Rmlpc3ZCU2lKQXM2dTNOVUJDeXVTdVhqdldJOFJMaGlySG1EdXZ4UldseGNH?=
 =?utf-8?B?SER0MU9wbVc5Uk9hbUZVdHFUcWRwdkRqcU12RnRWcldUdHNJc3RBYUtYRFhh?=
 =?utf-8?B?a0xlR2I1WW90MXFpWWo0clBmaDBVK1ZHVTFoVDRNSGVJTVJlQkNmUm4zbVEz?=
 =?utf-8?B?S2xoUWd6WG1INzdwUUhSQi9JTlhmdm02VkNkc1RKU0ZDZHF3ZVNBZVBaRWZF?=
 =?utf-8?B?amZnY0dMVS9SUjhUYkprWndyd29CeTk0d21QUmlHanhHbW0xaU8xcnFjOFVm?=
 =?utf-8?B?QUoyMGM2Q1o0V0lYaDZFaUhpOW84QXR6Ym00bVRJVDRqN0t0NDFVWUQzWkty?=
 =?utf-8?B?MGxDMmVqaU9naVZReVU3dDU4ODlYZnlrR29KOWsrWDFNSGJwc3h5SEpyMEow?=
 =?utf-8?B?NlR0aXZtUEJDNHRVQm5QaTd5d1RIQVBrc1Z1cTNJMGpaSWN4TFo5Sm1kNTRW?=
 =?utf-8?B?U3lJdEUzMFJubVErQW1yZU1vSjdzdTNScjJWVmxPV2VWWm5TNUcwUjF1bEtv?=
 =?utf-8?Q?vMCmhM/jD0l2f0mvmAJoj4SfU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5062.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhJRWZ2cXFoYTRpZWJGSnRJQmFQU2ZZNlR1WVJFYnJwZVRxSXFMaHhoY2Rx?=
 =?utf-8?B?eWpOQ3hNLzhqREZlU2MzRExzOHgrTnNuVVhQUDd4YjFZNXJrUXV5bjl0V2I5?=
 =?utf-8?B?RFJFb05hekFMdXFBZzRYcTAzVFlrQ1djNVR4Qk5TanZJODlXYTlOOW01aDZI?=
 =?utf-8?B?TnA4ZElZWk5FMFg2bk5zcG1uWlZmOS9hdzhCcHJWYnV0WjRRbjJrZVg5bzRw?=
 =?utf-8?B?Tk9laWE2L2U4TFB2M1gxSU9aems0dDU4S2owSHgzaFpIdmRydloyMW1NQllj?=
 =?utf-8?B?cm1DSW0ycHdmWXo1YnR4amRBTzhHcG5ueitVMGh6bEJaVitSbE5GdTdXaWIz?=
 =?utf-8?B?V29HQ2UzdTAva3puTVRyaGt6eXdBZGlVeEZUQitsQUVqK2l0UVVTZ0hkcTU0?=
 =?utf-8?B?dUZWcVVwcC9BTlAzZU5qc2YzRnJkd1BuYlYvd1o3T2tiVnpsT1BOYTJHSERw?=
 =?utf-8?B?Q0dOdXYydEFSd1Zqekx6N09HTldXVGRsU2N5eVVCV3FDa3lJRE9RM2RrVXVE?=
 =?utf-8?B?OGE1SjVML0ZOemoySTg2WHJrUFpVWHFqSlFYQXQwenlFS1ZrQXRvUWRqMjVB?=
 =?utf-8?B?MjlsVjhJQ1lrMzd4VnlzNGdNZzZnUnI4TDhVakFDcGZSUTBGKzJhZjJvZzNS?=
 =?utf-8?B?bEMxMUFCZGRoMmcwTjNicTBwWlFxa24zSTlPb2xjNVoxeWNOamVzajVhanRO?=
 =?utf-8?B?dFdMWEk3dUtRcFp0bExwa0grbTJaeFdNMFVFYTJ6NGxZenJNUnJqYzRvcG1w?=
 =?utf-8?B?a2NpUVZ4UGtuL21VY0d3STNJY2ZGR2FTR1dYbGM1Ui92eUVxS2U1ek0wVDhS?=
 =?utf-8?B?V29Rekt6N3lCbWliU2VmVXNNV1VmNlVwa2hjKytWekpRd0xydy82KzRtRTQ5?=
 =?utf-8?B?VDhDaDF3NFpVRFNPTlpBK0NFc1VQbnoxSjVDSjZrVGtINlk2V0EvaGNPWVlt?=
 =?utf-8?B?S21qdDJ6Z25JQVAzakhGb3FrMmxHRVhqbVcrVG9RdXJXbExSVEk1bjh6dWtU?=
 =?utf-8?B?SVIxTEhWRVpYVlZaNW5CQjdtc01mUitxbFZNS2ZKZ3NQbjA4bVJVOVVxWk9T?=
 =?utf-8?B?ZjNISWZRQ2xsbWpGTStjZVFzU3BBcGt0MEIxdzYwU0JKTHR1Y1M1V3U1ZkRC?=
 =?utf-8?B?Ti9SaXA2bzJXNG02a1pUUENvZi90ZTIyQWhkZTc1eHduNHZseHNtQmxQQ2dF?=
 =?utf-8?B?RUVDZk9Hc1pzaURaS3liQ0pTYTZ3S0hhNHhTaHRZZ3FTTno1YXl2RFE5ZHp1?=
 =?utf-8?B?UFRUWXdRVnl3U2FqUFJ1ci8rUTErcXpEMkEvTTVBNGRXRDMxcHBaQnJtWmdm?=
 =?utf-8?B?SzNFZGw3ZXN3dnJ4YXdpWHFnNmcrKy9td05EMDVBZFFCOE0rTG40aHZkWEFL?=
 =?utf-8?B?aFFJYVJwTVZuQWMxWFNqTTlVbzUzbjFBbEpYUlM2L2dJb0Zvd3lkcnB3eXRS?=
 =?utf-8?B?RGdvU1pCRFljUE9TUVZocE9Ga0t0L2dkOTlNRFdZWTFIdWZFV01YellTS0JO?=
 =?utf-8?B?QnhKbmxKK1c4UWQvWGYxeHBVVU44UkluYjkrdE5udUc5dVRuc0huL0xFaWpq?=
 =?utf-8?B?bHlPNGlFcDVzcU40eXZLVFlvaEFIOWdjOU1IbXE2eWFQZFNZNjBLaTQvcmV5?=
 =?utf-8?B?ODZlNDBTUzAvems2TXV0Y2w5M0pZMW1kZHdGa25JeUFseGNvU3dWaDRaenNG?=
 =?utf-8?B?YjEzampMZUg5SzNXTnpVSGNYTDFYTGdoM0hOUVZGRW5Ta1Jyb0R4Y3VZcXgx?=
 =?utf-8?B?UytvT3pWK2NKOHJrSzlJKzc2UENXaTk1S0N5TUpHU2wwQUlwZ0hHbXU4a21p?=
 =?utf-8?B?SHpVZS95QUFiNDhzaDF3eldHanNhOWRBZDAzZVZBTXA4SlFaNVFZK0VFZ2U5?=
 =?utf-8?B?aFc3SHp4aFM1dDdkZDZTUVFjTk92dk1IWjhCbXR1aDIrZnR6M0swRmdKK1lr?=
 =?utf-8?B?QzJwbDZ6aVh4SjBZdWxYc1I4TkNNeExMTzh0cDc1WWFTak5ybXpKYTltL0R5?=
 =?utf-8?B?WlZEbGE4aVlya2EreXNNUHRsUUlvNDd0ZWhsbGthZ0ZnRHpwalAyclArZ1hS?=
 =?utf-8?B?OTJFbFlpVlN1VEd3Q2liLzIycjk5Z3Zqc1Q0ZGJheVQzRDVWS09HbW1zTzl0?=
 =?utf-8?B?R3Eya1Z0RVJEc1o1OVM4VEtCN2w1WS9NUkJmZUxyKzU0eU51N1NIMER4SlRC?=
 =?utf-8?B?Wlo5QjQvbkh0ZWlndXBHeS9GdmRXcUFTMmN6Qmk0MjRtTlI5cSs4dURHUDR5?=
 =?utf-8?B?K0tUUmw1UDFBQ1lJd0tuQXp2TUExRkhDQTAvSlBLVW1Fb003TzYvcmphcC9C?=
 =?utf-8?Q?0RfayRo4JCgnXvOtdf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d64ed9-7276-4be0-959e-08de604bba8c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5062.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 22:05:50.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo3D88YlzvujTrmHY3J7gqDJtttdXODGgCUn4qYCfolo1umNln0gt5ehdqWyB7Agk7rSXQHPxK3iws8/jOTi7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7965

On 1/30/26 14:49, Ard Biesheuvel wrote:
> Hi Tom Kevin,
> 
> On Fri, 30 Jan 2026, at 19:49, Tom Lendacky wrote:
>> Adding Ard
>>
>> On 1/28/26 21:57, Kevin Hui wrote:
>>> Hello,
>>>
>>> We’ve been using a non-UEFI bootloader to launch SEV-SNP CVMs and noticed that
>>> there’s an issue with booting the newest 6.18 guest kernel with
>>> the stage0 bootloader (https://github.com/project-oak/oak/tree/main/stage0_bin).
>>> The guest kernel boots successfully with 6.17 and below, but fails with 6.18. We
>>> were able to reproduce this with host kernels 6.13.2 and 6.18.3 on Milan/Genoa
>>> hosts.
>>>
>>> We traced the commit that started causing boot issues to
>>> 68a501d7fd82454525797971c6a0005ceeb93153 and noticed that for some reason the
>>> variable snp_vmpl was non-zero, even though our stack doesn’t run SVSM. This
>>> triggers the sev_es_terminate() call and subsequently crashes the CVM. We
>>> noticed that the commit removes a supposedly redundant rmpadjust() check, but
>>> from our observations it seems that the failed rmpadjust() short-circuited the
>>> check and avoided the underlying issue.
>>>
>>> I was chatting with Tom about this, and taking a deeper look at the issue, we
>>> suspect that the BSS is cleared after the sev_enable() call in
>>> arch/x86/boot/compressed/head_64.S, and that because of this snp_vmpl contains
>>> random junk and is not zeroed. When coming through UEFI, it seems that the BSS
>>> is cleared via drivers/firmware/efi/libstub/x86-stub.c, but in a non-UEFI
>>> bootloader there is no call to startup_64 and so this path is never invoked,
>>> leaving whatever random data was in bss to remain.
>>>
> 
> If there is no call to startup_64(), where does the call to sev_enable() originate from?

There is a call to startup_64().

> 
>>> Perhaps the proper fix for this is to put the variables that are set as part of
>>> sev_enable() into .data so that both non-UEFI and UEFI bootloaders will have the
>>> same treatment from the kernel, but I would love to hear everyone’s thoughts on
>>> this.
>>>
> 
> AIUI, the root cause of the issue is that C code is being called (sev_enable()) before BSS has been cleared, right?

Right, but the issue also is that the BSS gets cleared after relocation,
too. So I don't think using BSS is correct, because it would have to be
cleared before the call to sev_enable(). But the call to clear the BSS
after relocation would have to stay because to, otherwise the guest crashes.

> 
> If so, I don't think moving variables around is the right solution here: instead, BSS should be cleared before calling C code. And by the looks of it, this is not even SEV-specific, given that load_stage1_idt() is also a C function.

Because of how things are called and because of the relocation, I think
putting the variables in .data is probably the right thing to do. I've
noticed a few other files under arch/x86/boot/compressed that have
variables defined with __section(".data") probably for the same reason.

The load_stage1_idt() function only works with variables on a stack or in
.data (boot_idt), which is probably why that works ok.

Thanks,
Tom

> 

