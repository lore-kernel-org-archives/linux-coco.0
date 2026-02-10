Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E88832FA30
	for <linux-coco@lists.linux.dev>; Tue, 10 Feb 2026 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770762044; cv=fail; b=t2GKlYrllCkf7ik3TXUYMYuQ9ZSapc+TwYwk0jtf5tyUHhJVeonRAxbHX/tAWq6fXq8MGjeAQJTf8V6cFS38SbSiR+Rd0Jgi33lkqGh+JO9IyVVQnggLjKqQQfpO60I3dhu2n9bjeppRU1DvZT4UAcO/h/Gp4D22hwuzmxw3FJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770762044; c=relaxed/simple;
	bh=/OhX4N9pR17wErzqVtcI1HooW9zcEf7G0NIUp0nleB0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mQ9eFC5ncRz/ED1SK9lRBDfHsIMQg3TUA9IqnaezFxmV1/Hh0rUGWPlv2C+uuhruLnUSh3/txRTpoJU/g30OOX22aQiFPNX2soRo0/TJpZJSGE2EqDZlXOwq3FNoumapnJBB3xw/ekeuNq2bG+8hWj4MGyd/ifAXKKITN36+Ju8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dsi+m8gh; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dsi+m8gh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSRP/8ELfBT+t6KZB/NOjAUecnQqNJ4xVd4WoD1ZoXQK58bjg5PxohnhPAFupGTZ4E31EbDthneZL1FVZLQwOzyXFkn7LivdqauXC4P9R4QTtqZgUClcDRIWpw1toe3KDYxHDAqrhqU5VxNZFOBGOUmYjT9eDb7QxGUvjvCLTdimye0M7limRMnY8e4GidR+MrFMYe4c2GyKUnBjwDZI5/2mkGrk/9hWK3ch7iDgi9UQBAuex2uX8Cg6RdgHJdMt9OJM/WnXu6cn0dqhMyKukbdfCshC7Tp0/7po/1nxShnhJCeSZquF0iLJOVvzEo46K3k/AiAkdpx5zoQ4vqVeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+We1u/32LAXY76F1pHFLUHgdyKtNKunBuZcRBVekP8=;
 b=MbnW10eCwA4sw7tg8mooO+6rLEEJlAbp0OKEhjR7HbKGfsxMJw7ShoXTl66VTw16UAcRIVYEHb/ljaXD2jmw2M1hPmzHjaWv3qY5Hrdu7xwBvfZTDMh1r0yrCaGtBa2CrmUoWhMjpPU2vqZWqpJvHnIq6S8akBbXnJ0tyeOV2+BU40UcQ/fYQpRaz5b05GwCpPATrl4YcwDzSaLFkMjFbMx8mgbETd5Ld5N2c5IDipoJMZ9UAVHcaXwOO6jdYn+s6fBTeHb2l1Jh91LppKHWQp/9S9YxOA/t+e+mqgiFSO0xef6+NA/wPG82GAEVDwkD6o9AuWUijYmg8YeP0z1Fhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+We1u/32LAXY76F1pHFLUHgdyKtNKunBuZcRBVekP8=;
 b=dsi+m8ghyvFBZkSZoR8OFqv/iMZWjUGLw73RJtjBRZzkyf9LdqVmQXdMrAWmbBqt4D+lABC18P6Mn/RnB53yvMeXFsbpn1yjfmSKSsAJM9HT+6gfC0huCArjnilTM2Y38oq4VtA5ER5PVTgQar+l7MFFYklyrs/0YRGprvf9mCw1QNhXyGUtrkda5378/FQs/CTDpaEc5wX9QMBy2lTxpD6G4V0gFsNyUHxjqel7jZLEoLuHBkPXh3sSR6yU/SRmG4z/sCB+e9TUG2SPY8vVta2j/V9x4jWbCGzhaMji7KyrWh9OObtud41wDbXDOWo9XtbAhe45hmTFnqZm7S7tcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9652.namprd12.prod.outlook.com (2603:10b6:930:106::20)
 by DM6PR12MB4330.namprd12.prod.outlook.com (2603:10b6:5:21d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 22:20:34 +0000
Received: from CY1PR12MB9652.namprd12.prod.outlook.com
 ([fe80::6061:16aa:2e32:5de4]) by CY1PR12MB9652.namprd12.prod.outlook.com
 ([fe80::6061:16aa:2e32:5de4%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:20:33 +0000
Message-ID: <d2d22606-ba94-44b1-93a5-b58ac156501e@nvidia.com>
Date: Tue, 10 Feb 2026 14:20:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Content-Language: en-US
To: Salman Nabi <salman.nabi@arm.com>, andre.przywara@arm.com,
 sudeep.holla@arm.com, mark.rutland@arm.com, lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::13) To CY1PR12MB9652.namprd12.prod.outlook.com
 (2603:10b6:930:106::20)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9652:EE_|DM6PR12MB4330:EE_
X-MS-Office365-Filtering-Correlation-Id: 618aea8e-abc5-48d9-c581-08de68f29ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm9ORGZzTnV4Y3VLS25JRGduTEVoQWdaNWxqd2s5ejZDTDk1cWlqS3A4YWg2?=
 =?utf-8?B?a3d6VktlZmo5OTZVeWlsNkc4NmN4VmhSbWF5blJvZTY5aFIwTzRLUU9lZ0Iw?=
 =?utf-8?B?NVMxclIwVytPMVFBN2wvSEsxbGdGWVpOandxV1JGM2M3amJKK2VCK0x4WTVK?=
 =?utf-8?B?amVKbXplMmZiSWhIVmdyR2FTNFh2RDNXaml2dXl6SUFWZ3JKU3Y4VWcxWGM3?=
 =?utf-8?B?b29ZVUtsdFRMd1NYMjBUV0hrSTNpdzBzanlOQVN3QStPdGRSSWwxVFo2RVd2?=
 =?utf-8?B?a0FrazVYeHY0WW9obWdYZFNPczlhWWRFWml5b2xuSWZEMmFzeERlbUxmdTN1?=
 =?utf-8?B?dTZlMkFnQ3NrWEhhdVI1UXYxQWhlU2xJdGN0eEh5cmNsTlk4bjZJOHU1UXVp?=
 =?utf-8?B?TFZDd2JuVFNYN0Z4NmdYTzdlVTVPQ3d2bU9DUnY3UWNMMFBBT2tFc0htNTB0?=
 =?utf-8?B?cTZnUFZoL1FISjc2eDBPOXZ3cmxPY2paTm4rMUFudGpKOFdvelJXQkc2enFa?=
 =?utf-8?B?L1BsclBXMTBYTm1VTzluMlQzTlJNYVpodE5rQVlodEhrSyt0WjdTbkZTNWRF?=
 =?utf-8?B?RkJhY0pMVDdZQzJVOE9HaEdCSGhwejBNQXBVVkJQVXdHNG11MEJpRXJtQlNl?=
 =?utf-8?B?ZEVYcDZuYW9peVpOdXUyc1RybVE4eEE0WHRPYlJLekt0R1FQQkNLMDBhejFx?=
 =?utf-8?B?QmdZMDhxRnhUK1c1VXF3VEh5QnFRZHBhdW5qOXA0S0Z4bEhRMmFsdE5oNFZM?=
 =?utf-8?B?UGhQNldPRlp3WWx5Vk5YbVNBbVVJNnBQUVdiZjczZW5tWHA1YlBCNW1oZnk4?=
 =?utf-8?B?eFF4NEhzUGFxYjcyTzJhc3IzUnphRDYwcUdqU1NEM3oxRHJWQjk2djIwS2gv?=
 =?utf-8?B?ZWFLbHdxSFVFb0lKV2pmVTkyeVQ1N2tMeUZFNXVWOWFkR2RUamExeEtNc0ps?=
 =?utf-8?B?dG5LeXF6L0FGTUkzWFhHVDl5eG5remYwNEdxYjg5bjZzcjc1d1hkWkdkYTE5?=
 =?utf-8?B?UXRWTG1sZXlaemxZVXVCZzFBTnN6STRkZlFoeUFxdFZOQWIvZjVnV2xUNXlm?=
 =?utf-8?B?bElFU2ZZUFpjejFQdFB4V1FOcUc4R1JHangzSlYxUGpuT2pGNTMzeGRSaStp?=
 =?utf-8?B?OHFaa2lJTGV3WUd1eWZrSUs4WDBBZ3dvY2FyTXA2SkxzaW1DdUFiQVhHK09k?=
 =?utf-8?B?YlRKQW4yTDlGSHV6aHRWbCtXc1NnQWNBTUp2NnMxa3F6d3hZQkZsWEVNNnZF?=
 =?utf-8?B?dUx3K29ENjYwbUIrckR4aWhsSmNLMXNGT0ZWdlpUbzk3R1pRbkFvN2w2R205?=
 =?utf-8?B?dEhUeVU0bU9oSC83M3NveXFHbEFBM0FLMml4YW5TV0NrRlJJYWVhNHVZTUcr?=
 =?utf-8?B?OG9XQ3FOMHZPcjhpeDVkeVkvNWQ3V0hOK3ZGaWs2a0xtME83dThRdlB2WGV4?=
 =?utf-8?B?N3ZLdFBtTklxT0o4SVN1d09uMUNaRWhYckZ3Und4eFlsdmY0d0t3UUFGa2Zv?=
 =?utf-8?B?a0RWMW9pL3M4RERuZkJvZEJudTNhemlIcjNuMElab1RJajFXL1BwcUlSTXA3?=
 =?utf-8?B?Y3V4L2FBdFdkSDAzT2w1TjFBL3ZYMFpHcTBsalg1TEROR2RuSEhHamtJTnlE?=
 =?utf-8?B?eFlmTmxPODZjR2I3OER4azFVMzg5cW1Ob2NCNWlMVVZYM0NzK0d3SFNEdHE5?=
 =?utf-8?B?TTBsbitGc2MrWTdYaUg5OXpNZU1SS05VdVVFTkNxQ3lNeEV4ZlJtTW85K1hS?=
 =?utf-8?B?Y2RFNEtSUUg2c0tBNDRXUDZXR1BRQUVBd1FSQzUzSTF0OTArbFIyWkZQbVZl?=
 =?utf-8?B?TWMwRnhaRWRFckEybTg2Q3BUZXM2UTFGVmVoaEJXQmhJYmQwWEpVaHFoNG5E?=
 =?utf-8?B?MExqMTk1bklzdG52ZGZQc25JK0N4aVlBZWxJUnpMMFNxMVpaYWNhWXFWSmFH?=
 =?utf-8?B?MzNIVXpqSk13WXRhUm0weklNWVFhLzdYbDZ3dCtOemdmbVV5TitaVHlqZzFz?=
 =?utf-8?B?NExUSjVaS2dCQ251M2dPK3BWU2R1YmVnK0FieWU1YnM3c1J3Z2JJekRlVVhw?=
 =?utf-8?B?bnlmcHV4ajI2MS9nRS9SMzlIYVZ3UXAyMXBlQm4zTkxJQXpwMFhPMk9tZnRO?=
 =?utf-8?Q?YwlY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9652.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm4rUWM3bVdPRG4yaXRrS3JZSDliSEI0QXlUYjlwK0o2TG5kd0YrT1IzYllI?=
 =?utf-8?B?UmNzdnZ3Q3IvSUJjREFseVRHc3czR2ZGKytwOFRXQis1L29iako2cDVjS3I1?=
 =?utf-8?B?UmFkNFIzODF1dERUNjRVME12TEVvckx2ZVVpUUI0Nmt3NzJaMytoUHNLSGtN?=
 =?utf-8?B?aU9zMERwTkFuczNVendBcWc0L29kZ1UweUpraEVWVFBRM0p5ci9sU2w1VUVN?=
 =?utf-8?B?Z3IxN3huL2NaUktQSjZrNytqRWUzdmJPMDFDWloyc1l4dTlmMzAvTC8zc21E?=
 =?utf-8?B?djNiU3l6VkRGWWJGNlhzVXkvbHhJNVQ4enBCamF4enVBWkpEVGJ2K2pEbDFB?=
 =?utf-8?B?Yi9RTmhkWDBvbUx3VUZzc1RFVDlCZzlqcmJ4U0wxQ0xkU0theHJYWG5EZVRi?=
 =?utf-8?B?YXNwZExYQlZEb2wvTzNRTkUzVjBLWjd4UkFsa1lIVzhpR3ZYOGxkeFFqVUZC?=
 =?utf-8?B?R2hmSkpyczY4REhRYkJMVzBBM2YyOFZmMUMxdzc2TlZNU0daYWxZR0RTSG94?=
 =?utf-8?B?QkUyS1QxaUppL29qd29zY2ZvSE8xbGsyRVFGUVo4MGpXVHpWTnBxK0ZISzd1?=
 =?utf-8?B?UWoyMHdhbG01YzhJbjREOEUva3prQjVwSnhDYThDUjdhYk9ZTEwrRUkzdlN4?=
 =?utf-8?B?UzJielpKSmc5KzJ1cnBVRzZtR3hoMDVieDA5aERUU2tyRFNKR1padGJ3VlR3?=
 =?utf-8?B?VGNwbHFOcitEZ1dZN0VOVDNtdklndmJyWTF0blU3aDRwVzczV1A1c1JBUS9C?=
 =?utf-8?B?bGZ3UkRYem9EMFd6aUtHa0ZFbnFrVFY4dHR4REhRUlZXZjBhQVBJaXNxT25o?=
 =?utf-8?B?MHVTMnRzb3lyWnAyQ1FqTkhFcW9lL1dXSXZrTWNaVkpjOVBjakExVjVRKzl1?=
 =?utf-8?B?c0p0S2txMzFBVEFmajVYR2ZkRTl2RzVkQ2dGRG5rTnBZZCtPNklEQWkxWmUr?=
 =?utf-8?B?Ynh5ZTdNZzNLcGdJZEh3SWIwSXVBS2daR04wZ3lRZnpKdVNnRGVkbHpKeThu?=
 =?utf-8?B?L1NVOVVEcE9POFh5b0dNTDBiOFREQ2xxUXIzd3ZyK0ZwOW92bFkrdmNQaFdm?=
 =?utf-8?B?eWlLQ0dnSzlUVFU3eFMxZExtN1FuUTBlRERORkE1Z1VQeGRoNm1wOGJnamFS?=
 =?utf-8?B?N2F4ZHhBZi9mUG5mNnNyOXdwWGNjRHFGeTYwbjdZWUVha05mOTl1Vysrbk8r?=
 =?utf-8?B?eGg1NE0xRVZjaFVnaFd3Zmx1VE5DQ1NLZWNlZTRXQjFuMG01KzlZNVplV29w?=
 =?utf-8?B?dFVCMTBhSzZ6d0xkWHd0TG01UmpMdU1GY0tzQ01JMFZXTmVqM2VuWVUySTZz?=
 =?utf-8?B?cnd4WGZRcGVETFFiZjRRL1JXMlFWa2ROVHg1YjZSQXRrdkJZQTlVaGVZcmY1?=
 =?utf-8?B?VWJNd0p2aTVIcG5ETVI2alFNK3VXTytCQ1lVK2ZmdWtiaDc4TEZwUmgrMmpm?=
 =?utf-8?B?ZEZFK05Gc1VGdnJoUWhVUEd0Mi9KcG8rYVMvM08xNU4xSmN1aUV1SVBGenVF?=
 =?utf-8?B?aXJ4TEJ3anI3OXNYMDV6SVRKZ0UzVVE4QS9Od3ZxYjBsSUdQL3d6TzQwUUQ3?=
 =?utf-8?B?Q1hnbGpRYVdwVmZsZ2NLTjlVQ0cvSWgwdGtZQ0dTRzNtd3RaOUxHL2NGQ2lS?=
 =?utf-8?B?K0ZzOE80TXM3cjRpcitERWtBdXp3azlsOEhiS1cyeUVpQURwZkRHQVVWOGZr?=
 =?utf-8?B?Rld1Y0xGQjU1T0g0NWxGQUdnQnAvRTlQWGZWMnFnT2VCc2d2WjNsaUh3aTVq?=
 =?utf-8?B?bjZMNmF3UExJNTlLcFFxOS9UcjhHYnZGbklUN0tqalhkN2cwYmMyejFSd05i?=
 =?utf-8?B?U0UrZzhTb3dvSkxnR2tTeTNoNFNnZWdSTnd5bmxML1RRTFFhY1Y0bWE5NjZW?=
 =?utf-8?B?alhsWU9IK2wrcFBZa09zZkh6SysyTlVpMkM4RlJuUWQrT1U0bUpucnl5NVJ0?=
 =?utf-8?B?RHVzL2MreEZLaXBWRnd0V0xURGE0L0dVaC9ocXllM0dZN3ZpNVVyM0dnMFF3?=
 =?utf-8?B?bjlmTGVjRFNLUmo0TXdsVzN6d1I2Z3E3TjhZUTRDMk1iYy9zUG1TTC9WWi9j?=
 =?utf-8?B?R1NvV3grbTlYYmdqZFY2OURUM0JLbFVMQVNpWXYxL2w1V0M1R05OUEtUNlp2?=
 =?utf-8?B?ZldNMmozQzZtWGVoc2tmZWZGSlQyTDYrUjFWSWpsSTNXeHhPSkZ1QS9hazRq?=
 =?utf-8?B?SWpSbUwxLzlndTRSYVQ2NG02MlU2VnB5aDhVMncvUERaKysvYXdlb3hnTXVi?=
 =?utf-8?B?aU9mVHJ4d3V1Nmx1QUlYdjgzMWFWL2IreGx5eEQzNC8zRWJNS25Cd2JRcWZ3?=
 =?utf-8?B?N29Jb2hEb1FEM2lkbGI3YkdBSzFnWFJ1MWlPYTNjNFhRRitHWXY5QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618aea8e-abc5-48d9-c581-08de68f29ba2
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9652.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:20:33.8807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Phk71cdVgTleifIdgXC6Ltt1SGXT/DY6qmVMAw+uJ6r2VzYK5xg0B96BoiXrucdaeSkeW4MVPUgwliv0fgFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4330

Hello,

I have tested this change on Nvidia server platform using Linux kernel 
6.16. My testing was done on the final integrated version, which 
includes a platform driver interface built on top of this patch. I will 
be posting the platform driver patch to LKML separately.
The final driver has been validated on target platform, except for the 
sysfs interface which was not excercised during testing.

Tested-by: Vedashree Vidwans <vvidwans@nvidia.com>

Best,
Veda

On 1/19/26 04:27, Salman Nabi wrote:
> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
> activating firmware components without a reboot. Those components
> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
> usual way: via fwupd, FF-A or other secure storage methods, or via some
> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
> at system runtime, without requiring a reboot.
> The specification covers the SMCCC interface to list and query available
> components and eventually trigger the activation.
> 
> Add a new directory under /sys/firmware to present firmware components
> capable of live activation. Each of them is a directory under lfa/,
> and is identified via its GUID. The activation will be triggered by echoing
> "1" into the "activate" file:
> ==========================================
> /sys/firmware/lfa # ls -l . 6c*
> .:
> total 0
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
> 
> 6c0762a6-12f2-4b56-92cb-ba8f633606d9:
> total 0
> --w-------    1 0        0             4096 Jan 19 11:33 activate
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_capable
> -r--r--r--    1 0        0             4096 Jan 19 11:33 activation_pending
> --w-------    1 0        0             4096 Jan 19 11:33 cancel
> -r--r--r--    1 0        0             4096 Jan 19 11:33 cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 current_version
> -rw-r--r--    1 0        0             4096 Jan 19 11:33 force_cpu_rendezvous
> -r--r--r--    1 0        0             4096 Jan 19 11:33 may_reset_cpu
> -r--r--r--    1 0        0             4096 Jan 19 11:33 name
> -r--r--r--    1 0        0             4096 Jan 19 11:33 pending_version
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # grep . *
> grep: activate: Permission denied
> activation_capable:1
> activation_pending:1
> grep: cancel: Permission denied
> cpu_rendezvous:1
> current_version:0.0
> force_cpu_rendezvous:1
> may_reset_cpu:0
> name:TF-RMM
> pending_version:0.0
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 # echo 1 > activate
> [ 2825.797871] Arm LFA: firmware activation succeeded.
> /sys/firmware/lfa/6c0762a6-12f2-4b56-92cb-ba8f633606d9 #
> ==========================================
> 
> [1] https://developer.arm.com/documentation/den0147/latest/
> 
> Signed-off-by: Salman Nabi <salman.nabi@arm.com>
> ---
>   drivers/firmware/smccc/Kconfig  |   8 +
>   drivers/firmware/smccc/Makefile |   1 +
>   drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>   3 files changed, 677 insertions(+)
>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..ff7ca49486b0 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -23,3 +23,11 @@ config ARM_SMCCC_SOC_ID
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +
> +config ARM_LFA
> +	tristate "Arm Live Firmware activation support"
> +	depends on HAVE_ARM_SMCCC_DISCOVERY
> +	default y
> +	help
> +	  Include support for triggering Live Firmware Activation, which
> +	  allows to upgrade certain firmware components without a reboot.
> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
> index 40d19144a860..a6dd01558a94 100644
> --- a/drivers/firmware/smccc/Makefile
> +++ b/drivers/firmware/smccc/Makefile
> @@ -2,3 +2,4 @@
>   #
>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
> +obj-$(CONFIG_ARM_LFA) += lfa_fw.o
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> new file mode 100644
> index 000000000000..ce54049b7190
> --- /dev/null
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -0,0 +1,668 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Arm Limited
> + */
> +
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/stop_machine.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/psci.h>
> +#include <uapi/linux/psci.h>
> +#include <linux/uuid.h>
> +#include <linux/array_size.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +
> +#undef pr_fmt
> +#define pr_fmt(fmt) "Arm LFA: " fmt
> +
> +/* LFA v1.0b0 specification */
> +#define LFA_1_0_FN_BASE			0xc40002e0
> +#define LFA_1_0_FN(n)			(LFA_1_0_FN_BASE + (n))
> +
> +#define LFA_1_0_FN_GET_VERSION		LFA_1_0_FN(0)
> +#define LFA_1_0_FN_CHECK_FEATURE	LFA_1_0_FN(1)
> +#define LFA_1_0_FN_GET_INFO		LFA_1_0_FN(2)
> +#define LFA_1_0_FN_GET_INVENTORY	LFA_1_0_FN(3)
> +#define LFA_1_0_FN_PRIME		LFA_1_0_FN(4)
> +#define LFA_1_0_FN_ACTIVATE		LFA_1_0_FN(5)
> +#define LFA_1_0_FN_CANCEL		LFA_1_0_FN(6)
> +
> +/* CALL_AGAIN flags (returned by SMC) */
> +#define LFA_PRIME_CALL_AGAIN		BIT(0)
> +#define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
> +
> +/* LFA return values */
> +#define LFA_SUCCESS			0
> +#define LFA_NOT_SUPPORTED		1
> +#define LFA_BUSY			2
> +#define LFA_AUTH_ERROR			3
> +#define LFA_NO_MEMORY			4
> +#define LFA_CRITICAL_ERROR		5
> +#define LFA_DEVICE_ERROR		6
> +#define LFA_WRONG_STATE			7
> +#define LFA_INVALID_PARAMETERS		8
> +#define LFA_COMPONENT_WRONG_STATE	9
> +#define LFA_INVALID_ADDRESS		10
> +#define LFA_ACTIVATION_FAILED		11
> +
> +#define LFA_ERROR_STRING(name) \
> +	[name] = #name
> +
> +static const char * const lfa_error_strings[] = {
> +	LFA_ERROR_STRING(LFA_SUCCESS),
> +	LFA_ERROR_STRING(LFA_NOT_SUPPORTED),
> +	LFA_ERROR_STRING(LFA_BUSY),
> +	LFA_ERROR_STRING(LFA_AUTH_ERROR),
> +	LFA_ERROR_STRING(LFA_NO_MEMORY),
> +	LFA_ERROR_STRING(LFA_CRITICAL_ERROR),
> +	LFA_ERROR_STRING(LFA_DEVICE_ERROR),
> +	LFA_ERROR_STRING(LFA_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_PARAMETERS),
> +	LFA_ERROR_STRING(LFA_COMPONENT_WRONG_STATE),
> +	LFA_ERROR_STRING(LFA_INVALID_ADDRESS),
> +	LFA_ERROR_STRING(LFA_ACTIVATION_FAILED)
> +};
> +
> +enum image_attr_names {
> +	LFA_ATTR_NAME,
> +	LFA_ATTR_CURRENT_VERSION,
> +	LFA_ATTR_PENDING_VERSION,
> +	LFA_ATTR_ACT_CAPABLE,
> +	LFA_ATTR_ACT_PENDING,
> +	LFA_ATTR_MAY_RESET_CPU,
> +	LFA_ATTR_CPU_RENDEZVOUS,
> +	LFA_ATTR_FORCE_CPU_RENDEZVOUS,
> +	LFA_ATTR_ACTIVATE,
> +	LFA_ATTR_CANCEL,
> +	LFA_ATTR_NR_IMAGES
> +};
> +
> +struct image_props {
> +	struct list_head image_node;
> +	const char *image_name;
> +	int fw_seq_id;
> +	u64 current_version;
> +	u64 pending_version;
> +	bool activation_capable;
> +	bool activation_pending;
> +	bool may_reset_cpu;
> +	bool cpu_rendezvous;
> +	bool cpu_rendezvous_forced;
> +	struct kobject *image_dir;
> +	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
> +};
> +static LIST_HEAD(lfa_fw_images);
> +
> +/* A UUID split over two 64-bit registers */
> +struct uuid_regs {
> +	u64 uuid_lo;
> +	u64 uuid_hi;
> +};
> +
> +static const struct fw_image_uuid {
> +	const char *name;
> +	const char *uuid;
> +} fw_images_uuids[] = {
> +	{
> +		.name = "TF-A BL31 runtime",
> +		.uuid = "47d4086d-4cfe-9846-9b95-2950cbbd5a00",
> +	},
> +	{
> +		.name = "BL33 non-secure payload",
> +		.uuid = "d6d0eea7-fcea-d54b-9782-9934f234b6e4",
> +	},
> +	{
> +		.name = "TF-RMM",
> +		.uuid = "6c0762a6-12f2-4b56-92cb-ba8f633606d9",
> +	},
> +};
> +
> +static struct kobject *lfa_dir;
> +static DEFINE_MUTEX(lfa_lock);
> +static struct workqueue_struct *fw_images_update_wq;
> +static struct work_struct fw_images_update_work;
> +
> +static int update_fw_images_tree(void);
> +
> +static void delete_fw_image_node(struct image_props *attrs)
> +{
> +	int i;
> +
> +	for (i = 0; i < LFA_ATTR_NR_IMAGES; i++)
> +		sysfs_remove_file(attrs->image_dir, &attrs->image_attrs[i].attr);
> +
> +	kobject_put(attrs->image_dir);
> +	list_del(&attrs->image_node);
> +	kfree(attrs);
> +}
> +
> +static void remove_invalid_fw_images(struct work_struct *work)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	mutex_lock(&lfa_lock);
> +
> +	/*
> +	 * Remove firmware images including directories that are no longer
> +	 * present in the LFA agent after updating the existing ones.
> +	 */
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node) {
> +		if (attrs->fw_seq_id == -1)
> +			delete_fw_image_node(attrs);
> +	}
> +
> +	mutex_unlock(&lfa_lock);
> +}
> +
> +static void set_image_flags(struct image_props *attrs, int seq_id,
> +			    u32 image_flags, u64 reg_current_ver,
> +			    u64 reg_pending_ver)
> +{
> +	attrs->fw_seq_id = seq_id;
> +	attrs->current_version = reg_current_ver;
> +	attrs->pending_version = reg_pending_ver;
> +	attrs->activation_capable = !!(image_flags & BIT(0));
> +	attrs->activation_pending = !!(image_flags & BIT(1));
> +	attrs->may_reset_cpu = !!(image_flags & BIT(2));
> +	/* cpu_rendezvous_optional bit has inverse logic in the spec */
> +	attrs->cpu_rendezvous = !(image_flags & BIT(3));
> +}
> +
> +static unsigned long get_nr_lfa_components(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_GET_INFO;
> +	reg.a1 = 0; /* lfa_info_selector = 0 */
> +
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 != LFA_SUCCESS)
> +		return reg.a0;
> +
> +	return reg.a1;
> +}
> +
> +static int lfa_cancel(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_CANCEL;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +
> +	/*
> +	 * When firmware activation is called with "skip_cpu_rendezvous=1",
> +	 * LFA_CANCEL can fail with LFA_BUSY if the activation could not be
> +	 * cancelled.
> +	 */
> +	if (reg.a0 == LFA_SUCCESS) {
> +		pr_info("Activation cancelled for image %s\n",
> +			attrs->image_name);
> +	} else {
> +		pr_err("Firmware activation could not be cancelled: %s\n",
> +		       lfa_error_strings[-reg.a0]);
> +		return -EINVAL;
> +	}
> +
> +	return reg.a0;
> +}
> +
> +static int call_lfa_activate(void *data)
> +{
> +	struct image_props *attrs = data;
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	reg.a0 = LFA_1_0_FN_ACTIVATE;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	/*
> +	 * As we do not support updates requiring a CPU reset (yet),
> +	 * we pass 0 in reg.a3 and reg.a4, holding the entry point and context
> +	 * ID respectively.
> +	 * cpu_rendezvous_forced is set by the administrator, via sysfs,
> +	 * cpu_rendezvous is dictated by each firmware component.
> +	 */
> +	reg.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
> +
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("ACTIVATE for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_ACTIVATE_CALL_AGAIN))
> +			break; /* ACTIVATE successful */
> +	}
> +
> +	return reg.a0;
> +}
> +
> +static int activate_fw_image(struct image_props *attrs)
> +{
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
> +		ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
> +	else
> +		ret = call_lfa_activate(attrs);
> +
> +	if (ret != 0) {
> +		mutex_unlock(&lfa_lock);
> +		return lfa_cancel(attrs);
> +	}
> +
> +	/*
> +	 * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
> +	 * number of firmware images in the LFA agent may change after a
> +	 * successful activation attempt. Negate all image flags as well.
> +	 */
> +	attrs = NULL;
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		set_image_flags(attrs, -1, 0b1000, 0, 0);
> +	}
> +
> +	update_fw_images_tree();
> +
> +	/*
> +	 * Removing non-valid image directories at the end of an activation.
> +	 * We can't remove the sysfs attributes while in the respective
> +	 * _store() handler, so have to postpone the list removal to a
> +	 * workqueue.
> +	 */
> +	INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
> +	queue_work(fw_images_update_wq, &fw_images_update_work);
> +	mutex_unlock(&lfa_lock);
> +
> +	return ret;
> +}
> +
> +static int prime_fw_image(struct image_props *attrs)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int ret;
> +
> +	mutex_lock(&lfa_lock);
> +	/* Avoid SMC calls on invalid firmware images */
> +	if (attrs->fw_seq_id == -1) {
> +		pr_err("Arm LFA: Invalid firmware sequence id\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -ENODEV;
> +	}
> +
> +	if (attrs->may_reset_cpu) {
> +		pr_err("CPU reset not supported by kernel driver\n");
> +		mutex_unlock(&lfa_lock);
> +
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * LFA_PRIME/ACTIVATE will return 1 in reg.a1 if the firmware
> +	 * priming/activation is still in progress. In that case
> +	 * LFA_PRIME/ACTIVATE will need to be called again.
> +	 * reg.a1 will become 0 once the prime/activate process completes.
> +	 */
> +	reg.a0 = LFA_1_0_FN_PRIME;
> +	reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> +	for (;;) {
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +
> +		if ((long)reg.a0 < 0) {
> +			pr_err("LFA_PRIME for image %s failed: %s\n",
> +				attrs->image_name, lfa_error_strings[-reg.a0]);
> +			mutex_unlock(&lfa_lock);
> +
> +			return reg.a0;
> +		}
> +		if (!(reg.a1 & LFA_PRIME_CALL_AGAIN)) {
> +			ret = 0;
> +			break; /* PRIME successful */
> +		}
> +	}
> +
> +	mutex_unlock(&lfa_lock);
> +	return ret;
> +}
> +
> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_NAME]);
> +
> +	return sysfs_emit(buf, "%s\n", attrs->image_name);
> +}
> +
> +static ssize_t activation_capable_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_CAPABLE]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_capable);
> +}
> +
> +static ssize_t activation_pending_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +
> +	/*
> +	 * Activation pending status can change anytime thus we need to update
> +	 * and return its current value
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS)
> +		attrs->activation_pending = !!(reg.a3 & BIT(1));
> +
> +	return sysfs_emit(buf, "%d\n", attrs->activation_pending);
> +}
> +
> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_MAY_RESET_CPU]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
> +}
> +
> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
> +				   struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
> +}
> +
> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
> +					  struct kobj_attribute *attr,
> +					  const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +	int ret;
> +
> +	ret = kstrtobool(buf, &attrs->cpu_rendezvous_forced);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
> +					 struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
> +
> +	return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous_forced);
> +}
> +
> +static ssize_t current_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +				image_attrs[LFA_ATTR_CURRENT_VERSION]);
> +	u32 maj, min;
> +
> +	maj = attrs->current_version >> 32;
> +	min = attrs->current_version & 0xffffffff;
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t pending_version_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACT_PENDING]);
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	u32 maj, min;
> +
> +	/*
> +	 * Similar to activation pending, this value can change following an
> +	 * update, we need to retrieve fresh info instead of stale information.
> +	 */
> +	reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +	reg.a1 = attrs->fw_seq_id;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == LFA_SUCCESS) {
> +		if (reg.a5 != 0 && attrs->activation_pending)
> +		{
> +			attrs->pending_version = reg.a5;
> +			maj = reg.a5 >> 32;
> +			min = reg.a5 & 0xffffffff;
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%u.%u\n", maj, min);
> +}
> +
> +static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +					 image_attrs[LFA_ATTR_ACTIVATE]);
> +	int ret;
> +
> +	ret = prime_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware prime failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	ret = activate_fw_image(attrs);
> +	if (ret) {
> +		pr_err("Firmware activation failed: %s\n",
> +			lfa_error_strings[-ret]);
> +		return -ECANCELED;
> +	}
> +
> +	pr_info("Firmware activation succeeded\n");
> +
> +	return count;
> +}
> +
> +static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			    const char *buf, size_t count)
> +{
> +	struct image_props *attrs = container_of(attr, struct image_props,
> +						 image_attrs[LFA_ATTR_CANCEL]);
> +	int ret;
> +
> +	ret = lfa_cancel(attrs);
> +	if (ret != 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
> +	[LFA_ATTR_NAME]			= __ATTR_RO(name),
> +	[LFA_ATTR_CURRENT_VERSION]	= __ATTR_RO(current_version),
> +	[LFA_ATTR_PENDING_VERSION]	= __ATTR_RO(pending_version),
> +	[LFA_ATTR_ACT_CAPABLE]		= __ATTR_RO(activation_capable),
> +	[LFA_ATTR_ACT_PENDING]		= __ATTR_RO(activation_pending),
> +	[LFA_ATTR_MAY_RESET_CPU]	= __ATTR_RO(may_reset_cpu),
> +	[LFA_ATTR_CPU_RENDEZVOUS]	= __ATTR_RO(cpu_rendezvous),
> +	[LFA_ATTR_FORCE_CPU_RENDEZVOUS]	= __ATTR_RW(force_cpu_rendezvous),
> +	[LFA_ATTR_ACTIVATE]		= __ATTR_WO(activate),
> +	[LFA_ATTR_CANCEL]		= __ATTR_WO(cancel)
> +};
> +
> +static void clean_fw_images_tree(void)
> +{
> +	struct image_props *attrs, *tmp;
> +
> +	list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
> +		delete_fw_image_node(attrs);
> +}
> +
> +static int update_fw_image_node(char *fw_uuid, int seq_id,
> +					  u32 image_flags, u64 reg_current_ver,
> +					  u64 reg_pending_ver)
> +{
> +	const char *image_name = "(unknown)";
> +	struct image_props *attrs;
> +	int ret;
> +
> +	/*
> +	 * If a fw_image is already in the images list then we just update
> +	 * its flags and seq_id instead of trying to recreate it.
> +	 */
> +	list_for_each_entry(attrs, &lfa_fw_images, image_node) {
> +		if (!strcmp(attrs->image_dir->name, fw_uuid)) {
> +			set_image_flags(attrs, seq_id, image_flags,
> +					reg_current_ver, reg_pending_ver);
> +			return 0;
> +		}
> +	}
> +
> +	attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
> +		if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
> +			image_name = fw_images_uuids[i].name;
> +	}
> +
> +	attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
> +	if (!attrs->image_dir)
> +		return -ENOMEM;
> +
> +	INIT_LIST_HEAD(&attrs->image_node);
> +	attrs->image_name = image_name;
> +	attrs->cpu_rendezvous_forced = 1;
> +	set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
> +			reg_pending_ver);
> +
> +	/*
> +	 * The attributes for each sysfs file are constant (handler functions,
> +	 * name and permissions are the same within each directory), but we
> +	 * need a per-directory copy regardless, to get a unique handle
> +	 * for each directory, so that container_of can do its magic.
> +	 * Also this requires an explicit sysfs_attr_init(), since it's a new
> +	 * copy, to make LOCKDEP happy.
> +	 */
> +	memcpy(attrs->image_attrs, image_attrs_group,
> +	       sizeof(attrs->image_attrs));
> +	for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
> +		struct attribute *attr = &attrs->image_attrs[i].attr;
> +
> +		sysfs_attr_init(attr);
> +		ret = sysfs_create_file(attrs->image_dir, attr);
> +		if (ret) {
> +			pr_err("creating sysfs file for uuid %s: %d\n",
> +			       fw_uuid, ret);
> +			clean_fw_images_tree();
> +
> +			return ret;
> +		}
> +	}
> +	list_add(&attrs->image_node, &lfa_fw_images);
> +
> +	return ret;
> +}
> +
> +static int update_fw_images_tree(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	struct uuid_regs image_uuid;
> +	char image_id_str[40];
> +	int ret, num_of_components;
> +
> +	num_of_components = get_nr_lfa_components();
> +	if (num_of_components <= 0) {
> +		pr_err("Error getting number of LFA components\n");
> +		return -ENODEV;
> +	}
> +
> +	for (int i = 0; i < num_of_components; i++) {
> +		reg.a0 = LFA_1_0_FN_GET_INVENTORY;
> +		reg.a1 = i; /* fw_seq_id under consideration */
> +		arm_smccc_1_2_invoke(&reg, &reg);
> +		if (reg.a0 == LFA_SUCCESS) {
> +			image_uuid.uuid_lo = reg.a1;
> +			image_uuid.uuid_hi = reg.a2;
> +
> +			snprintf(image_id_str, sizeof(image_id_str), "%pUb",
> +				 &image_uuid);
> +			ret = update_fw_image_node(image_id_str, i,
> +							reg.a3, reg.a4, reg.a5);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init lfa_init(void)
> +{
> +	struct arm_smccc_1_2_regs reg = { 0 };
> +	int err;
> +
> +	reg.a0 = LFA_1_0_FN_GET_VERSION;
> +	arm_smccc_1_2_invoke(&reg, &reg);
> +	if (reg.a0 == -LFA_NOT_SUPPORTED) {
> +		pr_info("Live Firmware activation: no firmware agent found\n");
> +		return -ENODEV;
> +	}
> +
> +	fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
> +					     WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
> +	if (!fw_images_update_wq) {
> +		pr_err("Live Firmware Activation: Failed to allocate workqueue.\n");
> +
> +		return -ENOMEM;
> +	}
> +
> +	pr_info("Live Firmware Activation: detected v%ld.%ld\n",
> +		reg.a0 >> 16, reg.a0 & 0xffff);
> +
> +	lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
> +	if (!lfa_dir)
> +		return -ENOMEM;
> +
> +	mutex_lock(&lfa_lock);
> +	err = update_fw_images_tree();
> +	if (err != 0)
> +		kobject_put(lfa_dir);
> +
> +	mutex_unlock(&lfa_lock);
> +	return err;
> +}
> +module_init(lfa_init);
> +
> +static void __exit lfa_exit(void)
> +{
> +	flush_workqueue(fw_images_update_wq);
> +	destroy_workqueue(fw_images_update_wq);
> +
> +	mutex_lock(&lfa_lock);
> +	clean_fw_images_tree();
> +	mutex_unlock(&lfa_lock);
> +
> +	kobject_put(lfa_dir);
> +}
> +module_exit(lfa_exit);
> +
> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
> +MODULE_LICENSE("GPL");

