Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11020081.outbound.protection.outlook.com [52.101.193.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37604246BC7
	for <linux-coco@lists.linux.dev>; Wed,  7 Jan 2026 02:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767754124; cv=fail; b=rjDVmXb9BkexEJbKp4K/IjhRrNMb4ffz6B9TetdzmPPtOrGHkDFjtQHy1Ss3+9X7Q/HL5cRWI/YuRzGIJJN24eCGsS7Ume6qwLwLN0gCg5DYhHfUBrHLNfVD+rIqA6be7YmMzwTN1ptq8EyvcwqHTHItH+/zwdmf4FfUFTEF+Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767754124; c=relaxed/simple;
	bh=sYnpbZPtf+ipZYIp+H9V4T3AfWGDsIKasyqu1csQuU0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nf19ryTVojm3A5j8xtP3PRKqX3G8ShCMki7v6TL8sy0Nhctqk7No8He5PB/OkkrtndbXTk5gq15bwnxSLkZBoua0GI3eu641Nqd1VNjqAL4tYAUPZLBcaP8SsKd3b825owWkUum49Iizuf/HSvckuHu++JWPVKFBXaLQTQEbPho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com; spf=pass smtp.mailfrom=microsoft.com; dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b=Im6BP01T; arc=fail smtp.client-ip=52.101.193.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=microsoft.com header.i=@microsoft.com header.b="Im6BP01T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGSpfngKvJzqgLwHlaw+VPjVY/C2KaqEq3Xxb6oW7AGZz4YOuzlCpz381HDFAYud9loKjCiK7MLGJukjwOqgy5WuvgktOhBFQFCDebHrTKqFd5AirlpMoATpc49RSeTSvg+h/qYhDusZB5m/PksWSYxoGIwJdQBsSSlhJtTJyKfRl3sqw0X4eiqKDSitskBrrcAiFonIcAtMBDIERf2vDUw8pehfwRJpeVQRhwF6M47BFgfQAcWIdjyVblZoLp5Xgj6sjcLpvpgo8bHL4QwIt3X4TtfskQAUaSX3G+tMogVpQr4AWthpxD8WT7+yO8Uz752eu1sGJBJGRiejGRySlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYnpbZPtf+ipZYIp+H9V4T3AfWGDsIKasyqu1csQuU0=;
 b=WwHXCZfbEAq1R9eQEYMuhgG8ufWrofGWTlgwWzCVLsngAtbzSqdYNePjtUYOG75rUuIZuyTRZdeZe+pKX4o65ZfwflMDO9joUxEXG9oeYBtjNfCdueB6/wghqJeNB2k5wK1IDVL69RAhzRcmUOU/gvvgje6zKKG1yefcRQmYc7evusmMe/mzHlLMHoe0CUeA6UH5RekViLgKKBtjpFloxL/rxfA3e5VipcPdeF3WvDRdfTWdvzIZ26nIZfLAOmEZbGblqjoB1EJOFe3Hi0L4tnxHRyvGgBtBb7Q+uxUABX0/vF+qSZsAfn9gvW1dM8LydBT/XrG6msD2F8c3vrWSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYnpbZPtf+ipZYIp+H9V4T3AfWGDsIKasyqu1csQuU0=;
 b=Im6BP01T0Fpg1RecIcAASM/a5Dq85josS8kdYQ8dvwhmeYPq5eDqoaR7hAX02Q0n2VtMoePh9qoarlxyPsNSniUhRH20hFBovNWCGqEzgD5aDlzBeyraT+K7WCGklZDkr1qaf8BFdVQBbSAHqZKrU9TC44uePrR6lKzw0xkx4JM=
Received: from CH8PR21MB5222.namprd21.prod.outlook.com (2603:10b6:610:262::21)
 by CH8PR21MB5124.namprd21.prod.outlook.com (2603:10b6:610:261::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Wed, 7 Jan
 2026 02:48:40 +0000
Received: from CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d]) by CH8PR21MB5222.namprd21.prod.outlook.com
 ([fe80::ac59:5722:f945:8e7d%5]) with mapi id 15.20.9520.000; Wed, 7 Jan 2026
 02:48:40 +0000
From: Jon Lange <jlange@microsoft.com>
To: "dan.j.williams@intel.com" <dan.j.williams@intel.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Dave Hansen <dave.hansen@intel.com>
CC: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
	<pbonzini@redhat.com>, John Starks <John.Starks@microsoft.com>, Will Deacon
	<will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, LKML
	<linux-kernel@vger.kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>
Subject: RE: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Topic: [EXTERNAL] Re: "Paravisor" Feature Enumeration
Thread-Index: AQHcfq4XYhO/KJhX7E6XCcTuSBNvm7VEYYSAgAFbqQCAAAGO8IAANhmAgAALZ/A=
Date: Wed, 7 Jan 2026 02:48:40 +0000
Message-ID:
 <CH8PR21MB5222DB4477497784FC170791CA84A@CH8PR21MB5222.namprd21.prod.outlook.com>
References: <c4ef08a6-5600-4604-9e40-bd3263a0dcd3@intel.com>
 <4f3e1701-3ccd-4ee8-a45e-3872d71ef548@citrix.com>
 <CH8PR21MB522275E86FF5D33B04CE7A75CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <43ae1b15-c911-4ecd-aaaa-15bc23ec6192@citrix.com>
 <CH8PR21MB5222D4771880715FC8104835CA87A@CH8PR21MB5222.namprd21.prod.outlook.com>
 <695dbdbb37d41_4b7a1003@dwillia2-mobl4.notmuch>
In-Reply-To: <695dbdbb37d41_4b7a1003@dwillia2-mobl4.notmuch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d758f294-2c5c-49ff-8b53-fc414f05df8f;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2026-01-07T02:39:07Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR21MB5222:EE_|CH8PR21MB5124:EE_
x-ms-office365-filtering-correlation-id: 5d4e63c9-48a0-4679-b666-08de4d9743b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?b2dyUXppOExXa0NtYUNqLzZwWmFQZ3JuRWlrcWJWdVErbFlXNkNuc3pGUk00?=
 =?utf-8?B?bU9XaFR4RWNBWks4WVhSblI1eG1GaUU5TkdGRmJsZG1LNng5Tm5pTG04QzdG?=
 =?utf-8?B?OHJKaWJ0MzA2cmJ5REs5eEpRaFdvemlzTXc2TFdXRzlzUnpQZy9TdkRxOVY5?=
 =?utf-8?B?QnY3a0FRekZYSE9aSDlHYU9ScnhTYmpNbElyRThsRDRmdDB5aDBIdE96R212?=
 =?utf-8?B?c1czUmV1T2dRSUFlYUJEZ0xsUUxvbjdmU3ZRMHZ0TnI5Q2ErMnd0YmNKSjB0?=
 =?utf-8?B?TUZpWlR0bWlGaWhsRi94R1k5ZGxyWGY1SzVIVmJ2SmhLdkhEWnlRdkFrTGN0?=
 =?utf-8?B?MXNYWnE4aHVER0YydlprUjlVeEFhTTY0UFFkSVRwNlovZ0JqSEN0YWVDd3Z1?=
 =?utf-8?B?NmhwRldZMmhMdTRheXFYWkpuYUoyTDZtVjk0QllBQ0hCWUdPZGN6ZWNtV2tI?=
 =?utf-8?B?Q3lUSml0QnhJNm8wNWUxaUJORHVsVVFKNlhvYVJjNityNko4bzFyZ3ZuZVVs?=
 =?utf-8?B?ZTRCeW0yaDRFak5aalNzMm9LMDVrdnpHMXNTUlEybjMzdkwxWGoxWWJGMlFy?=
 =?utf-8?B?Rk5ya0tIcmc2bmE4dlQyRWVZb2YzUzFTTUFmRWNBYytUSmVSTWxMOVFKRmNO?=
 =?utf-8?B?Mis5SjlKMHVvVjY1TW5GTjMrN1FSNE5PdTVaV0twOXJWMExYWmd3TWhscjVS?=
 =?utf-8?B?OTNHSVJkQk96QTQ5UEg5OG1aTVN0ZktkZTVmS0k4UDZDSHh6T1VzdDhZM3pB?=
 =?utf-8?B?QmozWUI3alZXUThXckJyNVdNWHcrVHBVRVZvTHhlN1M2MHFlL2VSZFdHQ0FM?=
 =?utf-8?B?STlNYU5VcEh0ekg2dXRnUmhlb0NnRUtUVy9NaStmUWRuMHBodGN1bHNuTG80?=
 =?utf-8?B?aXJEUDRxaWtCMlRHK2F0d0QveVFLMzJBM2RLMVZxd2pFVThTUTR1cFJmZHFE?=
 =?utf-8?B?NXcwalFCZHhaQ1RFbWx2bFYrMnptNVlJeXQ1bXFwbHk3alBmbWl4S1oxVE8y?=
 =?utf-8?B?MlhMT3dsdmtFeHhKQ243aTZVNzNUNHVscVlUWnJyaTJzeXhwYSs4azZBVWtu?=
 =?utf-8?B?TWllby9idlZlL0hHNGI4dnZTcXNGSWgyZ0pzNUhlZEZLUmJtU2ZOYnhMWmFZ?=
 =?utf-8?B?eURtOWVYNzR2bk15c1p5QW55MDFjU3QzZUx4VkVKNWw5a3o1cWpxc1JpcGFj?=
 =?utf-8?B?VWthUWxGRVQxSXVEeXhqQ0pXNGN5QTc3N0llWVVhUU1JcVk4UzRkekV1YjV6?=
 =?utf-8?B?emcxOTd2Mm1YVEVMOTBqajZPTjJ6VkRyeWFqTlBTcTQzYUY3cXNzWmdlQjdW?=
 =?utf-8?B?bURtODF6UFZBZ3hTbWEzY0lnZVZoS3lMdXBOcGs5amRDSGtzeHpLNzFVWUJ3?=
 =?utf-8?B?NmZYTFdValVaakNQZkgxNnZFWDRMMFBYUzFybFk3OGxpdnd0LzFKNGZMRWNq?=
 =?utf-8?B?WUpiMWJ5ZGVaaWR6bHRzVnF0RmtVNU81VW9ieE11TXFvTHRrOWkzanpDbjRN?=
 =?utf-8?B?cnNqTkdGTjZhbUF4UkFEKzJJSGZwTUczTWFEb00rZnFrOUswQklONGtqS1Zm?=
 =?utf-8?B?YjNMalZxaXFHOWVrZ1M4OGd4QzZ1Q0xTT3NSSE8zU0hLeENQdEJVbDBuTjNV?=
 =?utf-8?B?OThQaGtyUFdURFhDOUtueDVxU1pCSGE0ck1FQTRzaS8wcXlwNHQ1NzVZUjZq?=
 =?utf-8?B?UHU2ZGpXc1Y4UXl5YUNXU3EybXpqWFNNV2hNVnRaa2REUVR1Z21qY2lxMVps?=
 =?utf-8?B?OFVTL09LYjk2QXRUQmwwZHZyUFV6amc4TnpQSk9IZmhKSTE3akM5ZkpWb2l1?=
 =?utf-8?B?emVOVEhWaG9MMk1ORk1KOENjREF0d2Zld2JVTVA0aGl4T3lZd0FoR3ZwYlB5?=
 =?utf-8?B?aElyWWUrQTV4YldIaXdmUFRNUUI2cE9RYklJRUZaV0p6U0svTis2eGNSaEhz?=
 =?utf-8?B?Z1c0ZUxYOGpKZlh5ZE1wVUxJdm41UTFvZUZlVm50R1Bzb2F2L25mQ0Jrem1T?=
 =?utf-8?B?eWNPQXcyV0pnb0lPWWRQeEFMSmhGcUVZNDh6UE9mTy9aWHU4MTl0b1YwOUVx?=
 =?utf-8?Q?WQAttv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR21MB5222.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bG13UFBucGJmVU5XSnh4NmtnT1F3TnphZ3dqeXNhMzhvRDZkTFprN0xleGRR?=
 =?utf-8?B?SmFocnBwTHdERnlMaGkzSWYxbHUxZUo3SlpIWitJTHlsemt5a1lvRGkrZlRM?=
 =?utf-8?B?L2IxeW5KY05IR21tV2tNd1hsZVFZRzUvUnZzQldKODBxakF2ZTZVK3NuRS9D?=
 =?utf-8?B?QzJ4M2RkUXl1YWh2SGtCbGxKWnRKbWtZY09mcVBwR21VTHpyN0RBUm1qWklw?=
 =?utf-8?B?Y3pJakt1L1ZZWG04cHc4V1c2R0lWRmU1T3VkNFRKTG1OL3pjODFGSEVhOXZH?=
 =?utf-8?B?TCt6UVhvNVZVamh3ak85QkVtT3JONjh3TGgrUkJNUHJHbVBYdFZYcGpKdTY5?=
 =?utf-8?B?QVZOanJjZ0NpWnF0NGtRYmlROTZ5YzlqNTNPQ3A2aDVXaEQvMVVlQm1aRzJ6?=
 =?utf-8?B?ZUxueVJHTmVwQUlVS2Y2dWVmY05sYit1QnNjYnNSWFAzbUV5QzRud0Fhb1dW?=
 =?utf-8?B?NE50UTZzQlorTlRlR1V3ZDA2c2xzWng0U3BJREhjdEdMTndRTWdIWE5uSys3?=
 =?utf-8?B?QWl5TWVER0grR1FUaW1PSExWSGdYR2lHeStnZC8wSEcxY09DUHZuazNWTTA5?=
 =?utf-8?B?L3BONndPRDEzRmNjeVZNMGpPZGJYUHZ3Y2ZFY24xZ3ArYURTeEw1YVExK21N?=
 =?utf-8?B?b2oyMzVuRkRDaTk5SEJheWlIWGJ6b2d6UGFlNVg5VHhJREQ3TjN2aVpxeEs0?=
 =?utf-8?B?eHM1S1UzbDlSWlBuQzFuRlZUZnRxTzRsalRBNTVnbUN2MFE3TWlST0FjMFhS?=
 =?utf-8?B?UytmWjdueXlpc1FiZVhkektpQk5vNzZLU2REUTJWdll5VjdXeXhFanV2aitF?=
 =?utf-8?B?bXduZ05MQXNXeCs0bzJ5OGgvWFRoQ1dQVVVOaXFqai8rMWtHL0huVkFBL3ha?=
 =?utf-8?B?bVBqbEV3d3pHTGRFM1F1emxWVHNKc0xCZW53RzJOUnlZelo4b2c4VHJHRmJ5?=
 =?utf-8?B?dEQvN214cnlqNkU3T2ZoMmxNZVJIcS90WVNoQjJTRFM4SUJRYWoxK0NITnBE?=
 =?utf-8?B?WHMvTlREc0pJaWw5c1ZPZkVmREw3aFB0N3ArQjlOUytkNUlsYURqaVBPandx?=
 =?utf-8?B?MHFHb21RSW9KVHNhYlNJalN4NG92aUhINms0UlRwMzJYMnZsTjRBeDEva0Q3?=
 =?utf-8?B?YktzVUltbFNVYWdsSWdDVGlCSkh6c3NXVWdITlN6d0hhb0JTR0JvQjdFREJt?=
 =?utf-8?B?dDArYjlBSnM5OE5Wdy9CbzRrbGZ4eFlXQ1lSb2lTSmpJczU0MFFQSVFoQXpN?=
 =?utf-8?B?U2MxYll0WEpPRzVpcDU1R3luMWppVVM5ZEZmN1V5Z3RBMmtFNmIxcjZnTXlm?=
 =?utf-8?B?N1IvdDJVN3JkY25FN0tNa2MwYlk4OW9OeFN5eVpxTm1Ualp2SE5uRDVDdm8z?=
 =?utf-8?B?Ui9kbjZTR2YwTmNVVlEvcnRzR2pSdUdSRE9Iejl3S1ByRFNsYWdFNm0zejRa?=
 =?utf-8?B?SDBpVVl6TndXczYySFk3Z1lQUXE3MmszbXdrSEl3ZWs3WXdqdi9TTGw4UkFy?=
 =?utf-8?B?aDcxYjZrWFdhL0EwL0J0OStySU1naU9WeDBLR3h0cnVnZGJEdUxRUkdVa2Zz?=
 =?utf-8?B?M3RIcXBSQkxXek1RaEI5UThscDdkMDFpektCS1NMNUMrUGtOdUROT1hncEFt?=
 =?utf-8?B?NG9Qd0hObGJ4dGQ5RXpDL2xmR2x2NllZNmVaRWx1VEpXVDdRYWRUOWFBcm5h?=
 =?utf-8?B?a2tpZzZFRVYvWjZycHI4VmlPcW45QkRGQW0ySEFYOW1WdjQ5ZzVKc1FXbWIv?=
 =?utf-8?B?VUZJM2dOekkrRWNGUHVsRDl3VUJDaHl5Y0grT1ZacHJ4dUFKbk16cGJhZUho?=
 =?utf-8?B?UCszdWNiTktJOGR0UUhzdEhINzVuUzlTbnB4YjZmYnlVaDlKY2FjaUxSZHla?=
 =?utf-8?B?UWdMc0M1WEovaFh1VS9BT1AvOUZsclJva0x3eVVnRnh6NVZMUmRlL3k5Qmx2?=
 =?utf-8?B?dzd0RE1pYkk2ZXNDVFdybTBZdDlaM09NOUhrbit0YjZabGZ1WlZNUVNGd0l5?=
 =?utf-8?B?Ymtxb0gyRjROQXJXei9LZFRmbmE5c0pTcEFnNWdLNmU0OWZsUFl0OXhmdTRy?=
 =?utf-8?B?VkZ1Yy9kQ25qM3JMMnFWdmEzL1E0d1NXMm9EMXp2dEN1VStsWEhGSzhOQzg0?=
 =?utf-8?B?d2JKMGk5RjVlbXp1MVhCL0ppdmVRdmhwYXRheGRKM2QzbmQ3cGVBRWVDNUZL?=
 =?utf-8?B?cVFJN2wwbkxHSjNYVTB5Vmx4UnZ6UnE0aXdOWU9LbFZHL21MS1AxVVNQQTdN?=
 =?utf-8?B?Z1JlWGk2REJZcS84WDFNZTZuakJxb05OVWJhdXd0cmJrR2pORVFFZTJNaTli?=
 =?utf-8?B?Q0huQzBOWWRQdVdUTEdpYW5OeEdYWUdWR0lJWDhXcHAwdGtGK2lOeGQ4L214?=
 =?utf-8?Q?CSDrh5bhOAs8DrdEZjI+XVXXOIF/xp8KKiEOdrMQ+7mDl?=
x-ms-exchange-antispam-messagedata-1: GNIc2z2rGb9R3A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR21MB5222.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4e63c9-48a0-4679-b666-08de4d9743b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 02:48:40.4434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjnG3R5W5q/iLfurpYB+ROy9DvJb8su8vZXW0fbzIdwn0ouCssaOrQ64W/SjYEpKaRxS3PL7GzR4tTirgRWVGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR21MB5124

RGFuIFcgd3JvdGU6DQoNCj4gSXQgc291bmRzIGxpa2UgdGhlIHBhcmF2aXNvciBpcyBnb2luZyB0
byBoaWRlIGNvbmZpZGVudGlhbCBtZW1vcnkNCj4gbWFuYWdlbWVudCBkZXRhaWxzIGxpa2UgcGFn
ZS1hY2NlcHRhbmNlLCBidXQgaXQgaXMgZ29pbmcgdG8gYWR2ZXJ0aXNlDQo+IGFuZCBpbnRlcmNl
cHQgaGlnaGVyIG9yZGVyIG9wZXJhdGlvbnMgbGlrZSBnZW5lcmF0ZSBsYXVuY2ggYXR0ZXN0YXRp
b24NCj4gcmVwb3J0IGFuZCBURElTUCBwYXRocyBsaWtlIGxvY2sgZGV2aWNlLCBnZXQgZGV2aWNl
IHJlcG9ydCwgYWNjZXB0L3J1bg0KPiBkZXZpY2UuDQoNCkkgdGhpbmsgdGhhdCdzIHJvdWdobHkg
dGhlIHJpZ2h0IG1lbnRhbCBtb2RlbC4gIFRoZSBwYXJhdmlzb3Igd2lsbCBhZGRpdGlvbmFsbHkg
aGlkZSBjb25maWRlbnRpYWwgZGV0YWlscyBsaWtlIE1TUiB2aXJ0dWFsaXphdGlvbiwgSS9PIGFu
ZCBNTUlPIGhhbmRsaW5nLCBDUFVJRCB2aXJ0dWFsaXphdGlvbiAtIGFsbCBvZiB0aGUgc29ydHMg
b2YgdGhpbmdzIHRoYXQgd291bGQgZ2VuZXJhdGUgI1ZFLyNWQyBleGNlcHRpb25zIGluIGEgZnVs
bHkgZW5saWdodGVuZWQgZ3Vlc3Qgc28gdGhhdCB0aGUgZ3Vlc3QgZG9lc24ndCBoYXZlIHRvIHdv
cnJ5IGFib3V0IHRob3NlLCBhbmQgdGhlIHBhcmF2aXNvciBjYW4gcHJvdmlkZSB1c2VmdWwgZnVu
Y3Rpb25hbGl0eSAobGlrZSBkZXZpY2UgZW11bGF0aW9uIG9yIGh5cGVydmlzb3ItdHlwZSBmdW5j
dGlvbmFsaXR5KSB0aHJvdWdoIHRob3NlIHByaW1pdGl2ZXMuDQoNCj4gU28gZG9lcyB0aGlzIHBh
cmF2aXNvciBuZWVkIGxvdyBsZXZlbCBpbnRlcmNlcHRzIHZpYSBwdl9vcHMgYW5kIGENCj4gY29u
ZmlkZW50aWFsIG1lbW9yeS1tYW5hZ2VtZW50IG1vZGVsIGluZGVwZW5kZW50IG9mIFREWC9TTlAg
ZXRjPyBPciwNCj4gZG9lcyBpdCBvbmx5IG5lZWQgdGhlIGhpZ2hlciBvcmRlciBjb21tb24gInNl
cnZpY2VzIiBsaWtlIGF0dGVzdGF0aW9uDQo+IGFuZCBURElTUC4NCg0KSSdtIG5vdCBmb2xsb3dp
bmcgeW91ciBxdWVzdGlvbiAtIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHlvdSdyZSBlbnZpc2lv
bmluZyB3aGVuIHlvdSBkZXNjcmliZSBjb25maWRlbnRpYWwgbWVtb3J5IG1hbmFnZW1lbnQgaW5k
ZXBlbmRlbnQgb2YgVERYL1NOUC4gIEl0IGlzIHRoZSBjYXNlIHRoYXQgdGhlIHBhcmF2aXNvciBp
cyByZXNwb25zaWJsZSBmb3IgdGhlIGNvbmZpZGVudGlhbGl0eSBzdGF0ZSBvZiBhbGwgbWVtb3J5
LCBhbmQgdGhlcmVmb3JlIGl0IHdpbGwgaGF2ZSBzb21lIGltcGxlbWVudGF0aW9uIHRvIGZ1bGZp
bGwgdGhpcyByZXNwb25zaWJpbGl0eS4gIEl0J3MgbmF0dXJhbCBmb3IgaXQgdG8gZG8gc28gYmVj
YXVzZSBpdHMgb3duIG9wZXJhdGlvbiBoYXMgdG8gaW50ZWdyYXRlIHdpdGggdGhlIHN0YXRlIG9m
IG1lbW9yeS4gIEZvbGxvd2luZyBteSBlYXJsaWVyIGFuYWxvZ3kgdGhhdCB0aGUgcGFyYXZpc29y
IGFjdHMgbGlrZSBhIG5lc3RlZCBoeXBlcnZpc29yIGZvciBhIHNpbmdsZSAoY29uZmlkZW50aWFs
KSBndWVzdCwgdGhlIHBhcmF2aXNvciBpdHNlbGYgd2lsbCBoYXZlIHRvIGltcGxlbWVudCBhbGwg
b2YgdGhlIHNlcnZpY2VzIG5lY2Vzc2FyeSB0byBzYXRpc2Z5IHRoZSB2aXJ0dWFsaXphdGlvbiBy
ZXF1aXJlbWVudHMgb2YgYW4gdW5lbmxpZ2h0ZW5lZCBndWVzdCwgd2hpY2ggaXMgZmFyIG1vcmUg
dGhhbiB0aGUgImNvbW1vbiBzZXJ2aWNlcyIgdGhhdCB5b3UgbWVudGlvbi4gIENhbiB5b3UgZ2l2
ZSBzb21lIG90aGVyIGV4YW1wbGVzIG9mIHRoZSBzb3J0IG9mIGRpc3RpbmN0aW9uIHlvdSdyZSB0
cnlpbmcgdG8gaGlnaGxpZ2h0Pw0KDQotSm9uDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQpGcm9tOiBkYW4uai53aWxsaWFtc0BpbnRlbC5jb20gPGRhbi5qLndpbGxpYW1zQGludGVsLmNv
bT4gDQpTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDYsIDIwMjYgNTo1OCBQTQ0KVG86IEpvbiBMYW5n
ZSA8amxhbmdlQG1pY3Jvc29mdC5jb20+OyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPjsgRGF2ZSBIYW5zZW4gPGRhdmUuaGFuc2VuQGludGVsLmNvbT4NCkNjOiBXaWxs
aWFtcywgRGFuIEogPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT47IFNlYW4gQ2hyaXN0b3BoZXJz
b24gPHNlYW5qY0Bnb29nbGUuY29tPjsgUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNv
bT47IEpvaG4gU3RhcmtzIDxKb2huLlN0YXJrc0BtaWNyb3NvZnQuY29tPjsgV2lsbCBEZWFjb24g
PHdpbGxAa2VybmVsLm9yZz47IE1hcmsgUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+OyBs
aW51eC1jb2NvQGxpc3RzLmxpbnV4LmRldjsgTEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZz47IEVkZ2Vjb21iZSwgUmljayBQIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNvbT4NClN1
YmplY3Q6IFJFOiBbRVhURVJOQUxdIFJlOiAiUGFyYXZpc29yIiBGZWF0dXJlIEVudW1lcmF0aW9u
DQoNCkpvbiBMYW5nZSB3cm90ZToNClsuLl0NCj4gPiBEbyB5b3UgZm9yZXNlZSBhIG5lZWQgdG8g
cGFzcyBhbnl0aGluZyBvdGhlciB0aGFuICJoZXJlJ3MgYSBoYW5kZnVsIG9mDQo+ID4gc2Vydmlj
ZXMgdGhhdCBhcmUgYXZhaWxhYmxlIHRvIHlvdSI/DQo+IA0KPiBBc3N1bWluZyB3ZSBtb3ZlIHBh
c3QgdGhlIHF1ZXN0aW9uIG9mICJhcmUgd2UgaW4gcGFyYXZpc29yIG1vZGUiLA0KPiBzb21ldGhp
bmcgdGhhdCBpcyBsZXNzIGNsZWFyIHRvIG1lIGlzIGhvdyBjb21wb25lbnRzIGxpa2UgdGhlDQo+
IGF0dGVzdGF0aW9uIGRyaXZlciBrbm93IGhvdyB0byBjb25zdW1lIHRoZSBjb25maWRlbnRpYWwg
c2VydmljZXMgdGhhdA0KPiBleGlzdC4gIEEgZnVsbHkgZW5saWdodGVuZWQgT1MgdGhhdCBrbm93
cyB0aGF0IGl0IGlzIGluIGNoYXJnZSBhbHNvDQo+IGtub3dzIHRoYXQgaXQgaGFzIGRpcmVjdCBh
Y2Nlc3MgdG8gYWxsIG9mIHRoZSBwbGF0Zm9ybSBzZXJ2aWNlcyB0aGF0DQo+IHN1cHBvcnQgY29u
ZmlkZW50aWFsaXR5ICh3aGV0aGVyIGl0J3Mgc3BlY2lmaWMgU05QIEFCSSBjYWxscywgb3IgVERH
LioNCj4gVERDQUxMIGxlYXZlcywgb3IgR0hDQi9HSENJIGludGVyYWN0aW9uLCBvciB3aGF0ZXZl
cikuICBCdXQgd2hlbg0KPiBydW5uaW5nIGJlaGluZCBhIHBhcmF2aXNvciwgc29tZSBvZiB0aGF0
IGFjY2VzcyBtaWdodCBiZSByZXN0cmljdGVkLA0KPiBhbmQgaXQgbWlnaHQgbm90IGJlIHBvc3Np
YmxlIGZvciB0aGUgZXhpc3RpbmcgZHJpdmVycyB0byB3b3JrIHdpdGhvdXQNCj4gbW9kaWZpY2F0
aW9uLiAgU2luY2Ugbm9uZSBvZiB0aGVzZSBwYXJhdmlzb3Igc3VwcG9ydCBzZXJ2aWNlcyBoYXZl
DQo+IGJlZW4gYnVpbHQgeWV0LCBpdCdzIGhhcmQgZm9yIG1lIHRvIHByZWRpY3Qgd2hhdCBraW5k
cyBvZiBkaWZmZXJlbmNlcw0KPiBuZWVkIHRvIGV4aXN0IGluIHRoZXNlIGRyaXZlcnMgYmV0d2Vl
biBwYXJhdmlzb3IgbW9kZSBhbmQgZnVsbHkNCj4gZW5saWdodGVuZWQgbW9kZSAtIGl0IG1pZ2h0
IHR1cm4gb3V0IHRvIGJlIG5vbmUgYXQgYWxsLiAgSSBzdXNwZWN0DQo+IHRoYXQgd2UncmUgZ29p
bmcgdG8gaGF2ZSB0byBqdXN0IHRyeSB0byBidWlsZCBzb21ldGhpbmcgYW5kIHNlZSB3aGVyZQ0K
PiB0aGUgcHJvYmxlbXMgbGllIGluIHByYWN0aWNlLCBhbmQgdGhhdCB3aWxsIGluZm9ybWF0aW9u
IGhvdyBtdWNoDQo+IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24gbWlnaHQgbmVlZCB0byBmbG93ICh3
aGljaCBtaWdodCBnbyBiZXlvbmQNCj4gInRoZXNlIHNlcnZpY2VzIGFyZSBhdmFpbGFibGUiIHRv
ICJoZXJlJ3MgaG93IHlvdSBhY2Nlc3MgdGhlbSIpLiAgSQ0KPiBkb24ndCB0aGluayBpdCdzIHRv
byBwcm9kdWN0aXZlIHRvIGNvbmplY3R1cmUgYW55IHNwZWNpZmljcyBub3cgdW50aWwNCj4gd2Ug
aGF2ZSBjb2RlIHRvIHBvaW50IHRvLCBidXQgdGhpcyBpcyBhIHBvdGVudGlhbCBwcm9ibGVtIHdv
cnRoDQo+IGFja25vd2xlZGdpbmcuDQoNCldoZXJlIEkgZ2V0IGxvc3QgaW4gdGhpcyBkaXNjdXNz
aW9uIGlzIGluIHRoZSB0cmFuc2l0aW9uIGJldHdlZW4gd2FudGluZw0KdG8gaW50ZXJjZXB0IG9w
ZXJhdGlvbnMgbGlrZSAicHJpdmF0ZSBwYWdlIGFjY2VwdGFuY2UiIHZzIG9wZXJhdGlvbnMNCmxp
a2UgImd1ZXN0IE9TIGlzIGFza2luZyBmb3IgYW4gYXR0ZXN0YXRpb24gcmVwb3J0Ii4NCg0KSXQg
c291bmRzIGxpa2UgdGhlIHBhcmF2aXNvciBpcyBnb2luZyB0byBoaWRlIGNvbmZpZGVudGlhbCBt
ZW1vcnkNCm1hbmFnZW1lbnQgZGV0YWlscyBsaWtlIHBhZ2UtYWNjZXB0YW5jZSwgYnV0IGl0IGlz
IGdvaW5nIHRvIGFkdmVydGlzZQ0KYW5kIGludGVyY2VwdCBoaWdoZXIgb3JkZXIgb3BlcmF0aW9u
cyBsaWtlIGdlbmVyYXRlIGxhdW5jaCBhdHRlc3RhdGlvbg0KcmVwb3J0IGFuZCBURElTUCBwYXRo
cyBsaWtlIGxvY2sgZGV2aWNlLCBnZXQgZGV2aWNlIHJlcG9ydCwgYWNjZXB0L3J1bg0KZGV2aWNl
Lg0KDQpTbyBkb2VzIHRoaXMgcGFyYXZpc29yIG5lZWQgbG93IGxldmVsIGludGVyY2VwdHMgdmlh
IHB2X29wcyBhbmQgYQ0KY29uZmlkZW50aWFsIG1lbW9yeS1tYW5hZ2VtZW50IG1vZGVsIGluZGVw
ZW5kZW50IG9mIFREWC9TTlAgZXRjPyBPciwNCmRvZXMgaXQgb25seSBuZWVkIHRoZSBoaWdoZXIg
b3JkZXIgY29tbW9uICJzZXJ2aWNlcyIgbGlrZSBhdHRlc3RhdGlvbg0KYW5kIFRESVNQLg0K
