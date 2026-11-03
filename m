Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728800;
	b=mXmB3hL5ayWbmP5+YSw5/q9/cjEGKOThOlZZimHQiu+q08RAlPtBFPlAK9S8HUj9FrnV
	 eJ9dg0z1rQ7qImE7SivY2hQJDFDVvSxBOs2z0Az7PUbjfy5jnaM7k5o2VHcT8efWrOfoh
	 HiI78r4s8wwV/Ut/8o6yPEzdM0Grv0Fki+3K/sZTMWD4xcJ20eF1e9sZr9zFNrZ84Zc/J
	 +xYG2CQt5UnUSElZedcoi+0HHtZOc42NiDXbTUzS4tG8iL3xKVZPdzIGY7KE/gkSNIjAT
	 313h+mix6294lWtKccKoEhIe/jwsVkd+kc9p6BOuQ2WaXAev4V1r6C1FeMHAWLqDfCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728800;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
	 CC:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XSd/kZHOTMUu8JepUTuGmlqbSevS1EhVWuLV8ybmGWQ=;
	b=U4LGkh4A/I8BXdMULO+FKZlsFx0lwEG1XDjA3u3PuBhnpg8ye/pjwCiO/aVJgXuTDNb4
	 P8Jb1i/vpiGoL3mVh91BEvQ5oY4v89I4MBDA9UiD6L+AV9k5H5Ohe15/VmK2aWFlFrpC9
	 6vsat7CwvDVidZEPwbaqG2Mn26eKkB7qvMqnlnVSKDtdB3xO/pZxAgN65Z5er6kFVL+Pa
	 Qm3+jtqePt/wyM7RPirUjg34G4gjbIeSNRXZncqh7lZYO5DqhZZVOESXqjlFrmDns5B+Y
	 9hz5Qz64gDx4m1obT72RYGUIqzc0h2WheD6gK1HC4rif4+HO17BxHXjLUcwkt1H/MQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p1oO8PdC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.54
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57E606A33F
	for <linux-coco@lists.linux.dev>; Tue,  3 Nov 2026 17:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F57E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p1oO8PdC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa5mXNupT8QnwB8A18T+VkxK51dbxhX+bW3flJ+XPAGb3NRTKqQnI+2SEFP8Of9ifMDoJLfN6VvaZrWSW0Wxd8WqIXMrij1MLWND0iECQHcjObrsll1IBdTvK+7EOSG0Vfa1wZ97bpX61JbNTtKcHV22iirZS8QsBjJzpszohPyxZQk8Ow8AWv/7R/98gxXklmsgBn9VoAzlYv7FQCIyExN9pyJq5jgfDNtJfwM3aEaltMTJVwC5EQktdCpkmsXVJFHi7+dwgo3/xuXHVouMf2hJ+hRdbL+Y2dc7fcXRuot70quEMFA8d0lJxP8mpDOBgYFCcAwe33AyICvE2K6egw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSd/kZHOTMUu8JepUTuGmlqbSevS1EhVWuLV8ybmGWQ=;
 b=l563pwx3YElt2/1qlXHdvpAkqg3mEUM2fpQTJh77oKgIoICl2Eqdm+SXEcmcai1X5dfpbtkeBN9obeq75zohNyL4eqHtofyHmCjnTHhWPAr4DdrDXVDEOr2AdKMfi101kdULniIS9hOs3SsUOC65hyphhphU3f2HLXGKC3jKyHEmLaeYJbHW1m62ACh9DGJM97DEXnb8c64A4LQCH+JxwKPeDjtekXeiOesGsGTFmwTN1k2f/6hmPifbwM0FOy7V/NqjAH5Ne4li4iEK5IJynhwoP3QCXcAzvJEBDBxO/ofN3R/NJ+8QE0F24arQ7fd24VVJzcu/Ru03TZT6sOmxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSd/kZHOTMUu8JepUTuGmlqbSevS1EhVWuLV8ybmGWQ=;
 b=p1oO8PdCIfh/AjtAIzo4R3qpAWgeNPCXruJ1Si0xaFhnjp/T9gZohqNARTlHlLTs4zDegOtGfVetsT5Z2cLLFiZuEwzn80STvwUAqresOAKP8QhQ864V+HVItTDL2DcBe12duHnb62dsdZMWhzr0AmQJNLTrSYaHVd3q0qfwOek=
Received: from BL1PR13CA0240.namprd13.prod.outlook.com (2603:10b6:208:2bf::35)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 17:59:47 +0000
Received: from BN1PEPF00018073.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::a1) by BL1PR13CA0240.outlook.office365.com
 (2603:10b6:208:2bf::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 17:59:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018073.mail.protection.outlook.com (10.167.245.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 17:59:47 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 11:59:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 3 Nov
 2026 11:59:46 -0600
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 3 Nov 2026 11:59:38 -0600
Message-ID: <e95e438b-8806-4c58-a176-57dc53861066@amd.com>
Date: Tue, 3 Nov 2026 23:29:31 +0530
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Post: <mailto:linux-coco@lists.linux.dev>
List-Help: <mailto:linux-coco+help@lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-coco+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] x86/sev: Clear RMPOPT when segmented RMP is
 disabled by firmware
To: "Kalra, Ashish" <ashish.kalra@amd.com>, Borislav Petkov <bp@alien8.de>
CC: Tom Lendacky <thomas.lendacky@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <seanjc@google.com>, <peterz@infradead.org>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <ardb@kernel.org>,
	<pbonzini@redhat.com>, <aik@amd.com>, <Michael.Roth@amd.com>,
	<Tycho.Andersen@amd.com>, <Nathan.Fontenot@amd.com>,
	<ackerleytng@google.com>, <jackyli@google.com>, <pgonda@google.com>,
	<rientjes@google.com>, <jacobhxu@google.com>, <xin@zytor.com>,
	<pawan.kumar.gupta@linux.intel.com>, <babu.moger@amd.com>,
	<dyoung@redhat.com>, <nikunj@amd.com>, <darwi@linutronix.de>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<kvm@vger.kernel.org>, <linux-coco@lists.linux.dev>
References: <56da047d63b22f03a7e709fc172a5543da894d67.1793216372.git.ashish.kalra@amd.com>
 <20261102052841.GBaugfibOXxGorZKgq@fat_crate.local>
 <69ed0d93-f96d-4baa-a587-fade5a0a3262@amd.com>
 <414b2fc2-a55a-4b2d-ac70-4def101c4aee@amd.com>
 <20261102144805.GCauiipTaEXcg6Lr59@fat_crate.local>
 <d81f6807-26ac-49b9-a205-c89c394ec1d4@amd.com>
 <20261102193116.GDaujlBJc3XjG3xzLj@fat_crate.local>
 <9ebcb83a-1c0e-423a-8730-eff6b710634b@amd.com>
 <20261102214343.GFaukED8ep3EMmQxfx@fat_crate.local>
 <30947e17-bffc-4c70-b19c-56504771c9fa@amd.com>
 <20261103004531.GEaukuq9sXbCs_PjfL@fat_crate.local>
 <4543f87c-cd29-4d5c-be8f-eb6b5477f4a1@amd.com>
 <be98c0de-e104-4c4c-8346-12f8b9e847f6@amd.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <be98c0de-e104-4c4c-8346-12f8b9e847f6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018073:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3287ca-fac7-4e09-f84f-08df39d43f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|23010399003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|261026140227099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	3ruPqunNJZLNfPPU0ibJIcwKFnShw2mDXQSgU6wQmcdEImLaoKlqRzSB70L0JP6l6sPiaqeMz6T90eLlsg6RY8gVk/01ro0DGkHMtQgyMGuP7K/pL+VJj/N5l/HRz2bNB7kcroadqrAF5pzXCRM9kIJPugbmHVAXm197DtupvOAbfN+yrQPeu6xGZwMTjBgR2UndfK4gvfFRvo8zR7FDVvrGDebsjc4wt9iv/pAYQSIoWMjzIhkalf7PLgC2M+tDwIG49BMK5yMQZSVqiO4oDW69UHHqX5xY0BI9oSVwuXzaMZ6IAfgLRlaUoQjCZpXm+1gk/XagevTQS6yrZtXkVJyoJ5436yXwvXmXQ4tRrdSFq9OxwIsoiUjw/k6Qxdx/hxC7UOXnrPYmCOBor21yIUbCunicZrTGDmvU5NAiiHApr1bl4PJtTIOV4F33VIfjMs37L0QbJ/W3Zq6HR5StnXfIQElZqdo/qlniK8S6LFUTg46BLGJdaxwTSKU5DQBbSBe9O6jfmbqH4wES/mun2r0SomDE4ou9GPi84cNKqD4K/Mg+bycTjK0N/4Cg7WK+9Z7GU+4ECwLIalgy9X6pRYEIrL9urqJ7VzA+HlkjxqsKKFBLzNcnUYinUQd16uF0H/YkHTmpeWeW2a/W/K77WXFzvFGxZ70YVF3CML0fpho8MDjgeGiumfxo+h5IwErZiqYXP2Bq6XYEVcpvUs5WhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0FaH22s9gMOu3RKrw0y9xrdjYHBDGYVbLTYCroT4AgIGEwM/VvupqcUl0wIUrii/Bdv51rZk7V+yKyOj88iHTHqmBT22WojBRbTK4q4Q5u2mK1D7bMqvWglqgSCJOjRaWFHbu24dQeu2eAoQ6w/EyZ1w7J4DXaPpXfkptsIAL9CyzhqMCiSiiPTz6V0ywpmp+aOHM58aomxKHtwQoxsBYkEVqdM4F/+deU+lUi0iC0newPj/J41WMHuejx6bB+KEK69UamTrzTgBINX6wnbC+kiW+7fr8Sa54Cpqrd/cat3gYiJlMU5MDGch8yr/YS0fn3kdzMoDZpIJyrsjWaSbVp2n2folDM6jB88iATkl0MuvoBpVuoil0hR+ZZFSM5/ono81COXSVL1hxJBcYMES+OZ70Mhsyi4/OuLuVnNWShBsaffbZwZ0RXsgtKPkXygU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 17:59:47.2050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3287ca-fac7-4e09-f84f-08df39d43f94
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895

Hello Ashish,

On 11/3/2026 8:10 PM, Kalra, Ashish wrote:
> On 11/2/2026 8:58 PM, K Prateek Nayak wrote:
>> On 11/3/2026 6:15 AM, Borislav Petkov wrote:
>>> diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
>>> index bd70c4d0b774..417e6a41ac60 100644
>>> --- a/arch/x86/virt/svm/sev.c
>>> +++ b/arch/x86/virt/svm/sev.c
>>> @@ -669,10 +669,10 @@ void snp_enable_rmpopt(void)
>>>  	u64 base;
>>>  	int cpu;
>>>  
>>> -	if (!cpu_feature_enabled(X86_FEATURE_RMPOPT))
>>> +	if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
>>>  		return;
>>
>> nit. We should check CC_ATTR_HOST_SEV_SNP in rmpopt_init() too
>> now to prevent an unnecessary workqueue allocation if
>> probe_segmented_rmptable_info() failed early.
> 
> As rmpopt_init() is now called from snp_rmptable_init() (in patch 2/2), and there is 
> already a CC_ATTR_HOST_SEV_SNP check in snp_rmptable_init(), there should be no need
> to check this in rmpopt_init().

True that! I forgot the second patch existed (facepalm).
Sorry for the noise.

-- 
Thanks and Regards,
Prateek

