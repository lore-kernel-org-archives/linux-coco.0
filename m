Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A839288CA6
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766132802; cv=fail; b=RA73y/XEw0Bpmq4j+mPx335uhHkTsBfeuK46wd6jLmHHiItmuTUYlg52iOYYVkO6XanqLbPbQHc+ygr3REp7BFB0XYWYYLEP0NQ6rBvaDH3opZSeN2N20l37ZNw+0vSqg1cNvj4RVPxq4xf0Kwn6kIeAKJZth7+R2Jsqc9Im6iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766132802; c=relaxed/simple;
	bh=eX1Lola/WqAjN8qt25T5dA0dnJq30NewnLuXH0ppZ2Y=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UEt9kuBIAkx53bAy9iefYSGU0qBum46gfOOjVqr5lZGb/dyLLHjPoFrIlmbzgdK2+eXVlFZa+1nCKLMih0v5z7ON1kXLehLS6/DOjyZ0Dijml2NJwqzUQt6CSmC3iXyMwAbqiMnehoPXrCynd7LshFQFTaduWMx+cfDsJgb3j8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h0RbOvN6; arc=fail smtp.client-ip=40.107.209.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h0RbOvN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tu7VJvLJGwyQd+0ZuBzWLGI2eWlUt9Z+Ix91Idd1SoJygAcUfQHT8KCvnjAL4CXMGRsMpNP2g/UUnzvL2oUS1Q0/aXo/pi1EucznnROcj3tDzMWEW1q5J2TeJE+5bXzQCPV56Kzue+WwRAr1ux8MeOScTXHtGxDMnI3rGCSLXwRUS0E1Xk2mZ5VO95ucd7Vqj9ZEmHT1eoQE8t2NWmIUmg5ygzMTAgWQCR0eicDVDdndnjJkQ4H7VvhTJQc3gx7u5XbTgKDLEEN9ThQsKRDFFFNdXEs+FiHNBKnnIVrHpLVtlHnL0+CNUVnT6O59voChGVr+kOHgnIfw9hAXfnH0Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRdW48lemKZkMn/t6StDRmk4p4GE4a1YagyAsZaDMmY=;
 b=IrTSUTk7YMzlrqOduWNrKXbJWpnO02z6YauskZhfAfYKzoSoycE8NQTWLJKgKSiyq6RuqtRDCukh+qcdyPkuRV+cB2a+Vi8OXV2GUx5wfO4funRzsvmDLV1QstNiaurdlDnmh/acPLQltX/SylSZ7VLDGXrs0OwlGDUtW0dBao6ZURluw9MBTBM3QL58fbxdeHNxUD9BFZTMtm9zxw/Es+vwradoun6bd+3ze0W/AuAzvmtyUJGKJAUQ5r28l3yZpCH0m8cGiYTQKA3eg59BO2LQw4V/j0hQMmdVBkQzSJomNtU0qwMpxUvSX5JroWVzFfemuhXQDxlOqVzs7op6Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRdW48lemKZkMn/t6StDRmk4p4GE4a1YagyAsZaDMmY=;
 b=h0RbOvN6+cbroaVvp1NPs1oHLe5dwgohNyWTcwKBk0oWI4AfHFbX1pLyMKF65KMSBCqCkuNitc3YCv/2E9F8rPMAQ02UVvxBFOtB0pdQpXdWhJFvHisPOKm0r6x/IiwGieK49ChUMrv8QMMB50yHbBfMzAvItIiayFrGWtk+WPo0Xn37Qtl+3NdsrleE+692HJoQln4a8/RJzuqCTyqHfGab4Zy4FlzsPVLcmiBgSHPrJ0qz0J6B2uExdPGT5Ueu5ZWDOwteDNaTMhra3LoqsI3LNVSOXVjcOYxyIefeOzKF2dcH7uSA8WaKBHU1sWIbVYr65qYv4cv7gVU5MJqL7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 CYYPR12MB8749.namprd12.prod.outlook.com (2603:10b6:930:c6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.9; Fri, 19 Dec 2025 08:26:36 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:26:36 +0000
Message-ID: <29248f8c-b57d-4818-851c-7905dc9f8317@nvidia.com>
Date: Fri, 19 Dec 2025 00:26:30 -0800
User-Agent: Mozilla Thunderbird
From: Vedashree Vidwans <vvidwans@nvidia.com>
Subject: Re: [RFC PATCH 4/5] firmware: smccc: register as platform driver
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: salman.nabi@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org,
 mark.rutland@arm.com, ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-5-vvidwans@nvidia.com>
 <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
Content-Language: en-US
In-Reply-To: <20251209-hysterical-cobalt-viper-54433c@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0200.namprd05.prod.outlook.com
 (2603:10b6:a03:330::25) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|CYYPR12MB8749:EE_
X-MS-Office365-Filtering-Correlation-Id: 3404ee18-c9e2-41bc-039f-08de3ed85329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czdiZU13NUVxS1hBa2NKT0pqVUZDa0ZiRkNZbk5uUW5wbnF0bHRScTlncDhh?=
 =?utf-8?B?UUNBVCtlZjIxazRoaysxTHM5aFVWbG1idE9QMTJFTlpBQVp4eDlETTcyQUtZ?=
 =?utf-8?B?VkMxY0JvbWV4by83NFFLRC93ZWlUR3J1SWtvNWp1cG83OW04R1ViTThQYS91?=
 =?utf-8?B?azFpWEI2MFJHenJtZHI4WGNzQzlWMXgzaU5UcWZ6NEdsc2RFOEw0TTBWRmY5?=
 =?utf-8?B?WUVSNWx3dGJvQm1raTl0VkkxQkdSZVhXTW9zYnlBQVNpQjYwaUg4YStwT3dt?=
 =?utf-8?B?RkRqNnJKc25FcG9Gc0Q5STZDZk1yeURjYTFVVTdjcnRMcDNFWHE5WnVYVjZl?=
 =?utf-8?B?cFpBNVRHdDJVcFZPZmJVMjlqdnV1V3h4eVBhNHgvbUN4ZU9KRlVHbWhtZkhm?=
 =?utf-8?B?K0hiT0IreUovZ2Z5NjJXcEFzRUF5d3ViUDlPNDZWRWpvRWQwK1Q4NTFVZ0hZ?=
 =?utf-8?B?MG5nb2dqNkM4eDRINEJuQ3g2OGxtZnhKWVE1RTh0ZDJ1V3hEWmRFOTRCZ1Q3?=
 =?utf-8?B?NGhFWHdoZE5zY0tqV3UzNDdMTUtvTTMvZVEvV1FRUVRYajZIMUNhVjhIZnlr?=
 =?utf-8?B?SWxzRU9nUU8zNG8vVHlaQ1FPMDhhOHQwNGI1NDdMYzcxUVZ5UDRxUW45clAy?=
 =?utf-8?B?UWlwMmZKZ0tmUDljZll2Q3VNSjYxT2M2cExOWWxHbzBTb2JoaFV5aXZxQWI4?=
 =?utf-8?B?WlFaNXVhTFVvWmdoOGNNbVpKQVRuNTJYKzkzS0NxQjFFbUVGMUlLRjBCYU1o?=
 =?utf-8?B?UWRCSUZWajl6R3p3a0hialJzMmZuK2k3T1BQbVYzNWUrTlJ4Um1paWh5alhB?=
 =?utf-8?B?ek5tejNCbnRsbTZiODd2eEhqTGkzVGdLYmFZWHl6LzNHZU9ldzlxNVFocVRa?=
 =?utf-8?B?MEM2QjhVTzNDcFV5dlJsaDZTYzBlclB2RFBKMERpcXVPS29ma0VUTFIyV3lY?=
 =?utf-8?B?Y2I4MGVVc1dSZ0hKSnZiakdJQnoyQ09NRjdmaDFOSHY3UWRrbCtPczg5VEcw?=
 =?utf-8?B?eU5MSXdKOTBwTXk0REJIQjZZWFNHdWloOVQwNTVESHFYVEtJeHVzK0hXRm94?=
 =?utf-8?B?dlhpd1hWamhkNWtyOXY0SjYzWk5uaGVVczNMR25RM3h4eHBmUWVKbEc1N1Az?=
 =?utf-8?B?bFdzaWp4cVdXYTVzOGJDRWQxcXhXQ2p0NUhHSHNpcFFSNytXeXFGZEVhMyt2?=
 =?utf-8?B?L2NRU1V3aWh1UlVXNHRZUnpTUnhsMzFpOVBkVmpoZW94RVVEdFd5UnFjZ0kz?=
 =?utf-8?B?OVltbHVpUm1PTU1mb1B1K2orOXZPTHZyRisvZmNvb0FEVTlrUUpRdHh3SnZm?=
 =?utf-8?B?NG9tT0lIeFRDS01QY1d3UkIxd0RRTnJsQUl1eG9ZZXE5MmpKS0VzOUlSWkhz?=
 =?utf-8?B?VWhjWk5RUzJkMjJTbUN6clZqWVFyWFdUM3Z5YVd4NzdRSnJuaW00cXFwTS9S?=
 =?utf-8?B?SEFoR3JyeGNMRDcwejUxdERsaituMUtQbkxVc3R5MFdydFZxdy9UazEwOW1E?=
 =?utf-8?B?OXpQSHNlMG1mY2VOZUZpRU5JWFhickR0T0gwRVJEcGI2Yk5acjVCc0hocVIr?=
 =?utf-8?B?ZnkvS2paSVFwUXUybUVXcFJ6SFljck53ZTh5TWJSSUp1b0Y4YWM4cytuMDJI?=
 =?utf-8?B?MDlBQ2RNSVA0WXhEcW5wUnpFVERING1POWdLeTVwdE9RQ3d2STNzNDBJOWhz?=
 =?utf-8?B?QzErM0cyYWhQdkcxUWMrV08rOE5xaGZPQ3NrR3lvVEZobGxmQlhoRkNjL2Nl?=
 =?utf-8?B?WXdzVDErWWZQWVBhTWZubW5jRlBWWEp6L0JiVHNpTlJRNkFES0E3M0w4RWZU?=
 =?utf-8?B?Q1RjWUFiR1NRK29NcGZLOXhKeXVkVHFvM2UwL3VJdzNpc2ZUL2ZCRVNMcXdG?=
 =?utf-8?B?L3ZHaTc3Y3BxdmV6ZzF1T0doUFUzMmdoS0dKZWtDUkJ4QXUxQS8xbHVLYTFV?=
 =?utf-8?B?SHhZZFhwMi93UUdMeVBaQ3pnWDd4c1VEU2YyQlJHZHpBc2l5RlVhNy9kL2ZH?=
 =?utf-8?B?WnhldVZheWdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFpwZFh4dWVGSUs4NGdLVmpBL1dSNmRSTWcxWmJOd0UzaEtrQ0kxeDRIUDJD?=
 =?utf-8?B?ZWwySUMzNmZrblNjb2VWOUhGRkhXYUJyNUVnMnRHb0FpVmVPLzY0YjZwcjBt?=
 =?utf-8?B?dllyN3FIaEFKNHk4aDV0ZVBFTXVmQ2g0aVo4Yjh5UXNQaExEMlNQd05menJU?=
 =?utf-8?B?WG4rTE8rOXl5bTU1bGtiYXYwTUk0Mms4cTVDdExlUmgvc0EvRE9GcWFTMmpw?=
 =?utf-8?B?aU5lcnVzc2JhdHJsVThHS1pjNHJ6bnZ3Zk5TQWdsUDhHNERhQVRRaEpOSXJ0?=
 =?utf-8?B?L0tRUEZtdStZYU9DeGZpL2ZnVEFnY0xXWjBDQzNMSzB6WUF0UFNlYS9RNFlQ?=
 =?utf-8?B?d29MY3M2R3V5aXU5TEFoazNESmNUcDcvcHo5M2VTQlU5LzBDTm1zYUJsaEov?=
 =?utf-8?B?WUkvUm5keEtqVzg4TERJU0tMbnhDRFk5bzFLT3MxZ3dwYTkvYUkwQ3YydUZC?=
 =?utf-8?B?WFh1TGJWdFhSbDczekJaOFlKR3FCbGxPQ20yWlJMVmdPbEs1SUJ2L0VCZVN6?=
 =?utf-8?B?b1hLNHp5Q1dLOWFSSUlhL1l5YkE3bXozNFFMRXdYOEplczVSUTJOMzJEVVdL?=
 =?utf-8?B?bzFKcDlVZHMyQk1BSm5HQjBsWWsxU2NlbVpSWXErOGk5MHBBU1B0RGdMMk9O?=
 =?utf-8?B?NFdFaWl5TUpKUkY3QU5vdlU1Ump6RGRQOFdjaGtxUyszNWMwdlFSL1YrUTEx?=
 =?utf-8?B?T1VDZm5lNkdYalRkSmFqSmhSUzV4eTBQY2U5WEl1Y09uditNKzNoalFrSUQ3?=
 =?utf-8?B?ZmEzMWdocmxQU3RzSmNBelY5cjFuWDdjVFQ0VmJSVmVzenBxOHR3VzJ3UFdv?=
 =?utf-8?B?cTE4RXZHUDhtQzBzRnMwMzlzTnZTa1AzOWNOMVorTzQrYUNwOHJZcWYxR3FU?=
 =?utf-8?B?aHJWRnovcVFpY3R1RUlQL1ZRTXE2dm9URUJkTThCd3FsSnI3Skxwbit4NzRx?=
 =?utf-8?B?RHpyNlhrYlJ5dlljeE5ldFh4R0s3Q1pHeWljN3FHQmRyb0hYL0xtaEpjZzdB?=
 =?utf-8?B?S2tWTnJ0Yno0MVBoZGlGQTVpMExjTDl1SkRGeUhOWjdLdDBBZnB2OFdBYkkx?=
 =?utf-8?B?Z0NaSUVwSXl0c09yYXZXRXdqbUxobUZtc1lmdkhuRy83amMzcTk1bGxtekhY?=
 =?utf-8?B?ZmplMXR2SmgwYjNKN0ZXbDYvTjJUY1NzUnozeU9NeVQ1Z1VmVmFNTnRFZVp3?=
 =?utf-8?B?UXo5Z1lHbmVFRE1icWVrMzVDWloxWW5SYjZhcUFoS0M5UU5BbzZTalZsQ2Zs?=
 =?utf-8?B?N0NEb3doOThGZzVQT0NrUFRPQzdjdXRjVzlPTTN6TjdPTStPR2xZK0srNjAy?=
 =?utf-8?B?ZVNOaGQ5MjBaZkY5clRoaVZIbGZORm9sYkZ3SEV5Z0NQN05LTTR1REdPUUxJ?=
 =?utf-8?B?b1QrSk1QQmhldG1pSzFUZGI4ekt1WThrWHB6UUNwQWN0NlR4ZEJvK1JzOUpR?=
 =?utf-8?B?MndpYS9BSFRUdmtHYUw0MjFtek5obXFvdEQwamdKK1psOGw4TW5rMWFjUThH?=
 =?utf-8?B?dlhRMUZPemlqM3R6UWFDS3orT1JNS08zUWRHQzJ6dGV3b2Nya3ZYL2MvT1ZP?=
 =?utf-8?B?TW9EbHJDa1oyeWhKWk54QXBzL3dLaXRTa0s2U2Riam8zc08wWkdSWFNkQ2M3?=
 =?utf-8?B?am1EeTVzVExXa2lRUkM4VHd1QXM1K1NJYXNMd2hVdVdzcGxENnNQdmVoSFcx?=
 =?utf-8?B?UFNhTStuU3hjRWJVR2ZST0M5TWYwNHArb0JJU2ErL0Z4aWFJcDFOMVdndVlh?=
 =?utf-8?B?aEZWb2lDTFVFSmdNNU9tL01ZS2RmaitIRm9NRDVQOWU2Y1dETmpsbkRHWWFh?=
 =?utf-8?B?NTY0SVpYcHhPYlM3VXQwK2tTUytkQTlRNGVTcmFHUTlRYlBnbFNXU3VaNkNL?=
 =?utf-8?B?RlBudWd2WVpjekI4WjgzMklpUXJ4NStaRm5IdVNZaDFidkQwdTQrTDBpREVz?=
 =?utf-8?B?TWE5UHF2YXlqOTJyRmo4dnh5VHZoUWNuZFRTSksySUd0clBnUTlxNFk1Nllr?=
 =?utf-8?B?YytDSEMxak82a1MvcXdsSHBvdFdjWmNsUEdZL0IxSkpVZGJLNVV4bFpBZ1My?=
 =?utf-8?B?eTV1M3RzdjRaWEl0cUhvSE1qamREcE9nYnoyY29rSXBTY0s1ZXlidTQwbFU5?=
 =?utf-8?Q?m0DTleaFWESrAqyV8XE8LPfrp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3404ee18-c9e2-41bc-039f-08de3ed85329
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:26:36.3906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cKI1nP5RVfPF5vodIL0YvU+8anWx4H34ZRCsx7OJG+PQkOZeHmVv9K2ppnoCmsTT1vruhEuCX9lQzbehxX+ZyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8749



On 12/9/25 03:47, Sudeep Holla wrote:
> On Mon, Dec 08, 2025 at 10:13:14PM +0000, Vedashree Vidwans wrote:
>> - Update driver to be in-built kernel module. This will ensure driver is
>> installed in kernel and would not require any user intervention.
>> - Register the LFA driver as a platform driver corresponding to
>> 'armhf000' device. The driver will be invoked when the device is
>> detected on a platform.
>> - Add functionality to register LFA interrupt in the driver probe().
>> This LFA IRQ number will be retrived from the LFA device node.
>> - On IRQ, driver will query FW component details and trigger activation
>> of capable and pending FW component. The driver will loop to update FW
>> component details after every successful FW component activation.
>> - Mutex synchronization is implemented to avoid concurrent LFA updates
>> through interrupt and sysfs interfaces.
>>
>> Device node snippet from LFA spec[1]:
>> fwu0 {
>>      compatible = "arm,armhf000";
>>      memory-region = <&fwu_payload>;
>>      interrupt-parent = <&ic>;
>>      interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
>> };
>>
> 
> This will be gone in the latest beta of LFA, so please discuss and get
> an agreement for the LFA device tree bindings.
> 
> We don't just use ACPI HID as devicetree compatibles. There are more
> aligned with ACPI CID IIUC but I don't expect you to use ACPI CID just to
> match DT compatible as ACPI HID will be defined for LFA.
> 
Thank you for your comment.
Sorry I haven't completely understood the concern here. I am using the 
ACPI HID and device node compatible string provided by the LFA spec.
Please find below ACPI and device tree node from the spec for reference.
In case the LFA spec is updated, I will revise the driver implementation.

LFA spec: https://developer.arm.com/documentation/den0147/latest/

ACPI node:
DefinitionBlock ("", "SSDT", 2, "XXXXXX", "XXXXXXXX", 1) {
     Scope (\_SB)
     {
         Device (FWU0) {
             Name (_HID, "ARMHF000") // Arm HAFW DSDT table identifier.
             Name (_CRS, ResourceTemplate () {

                 // Payload buffer description.
                 QWordMemory (,
                     ,
                     MinFixed,
                     MaxFixed,
                     NonCacheable,
                     ReadWrite,
                     0x0,
                     0x2000, // base PA of payload buffer
                     0x2FFF, // top PA of payload buffer
                     0,
                     0x1000, // payload buffer length
                     ,
                     ,
                 )

                 // Interrupt signaling the updated Live Activation Store.
                 Interrupt(,
                     Edge, // Interrupt type (or interrupt mode)
                     ActiveHigh, // Interrupt level
                     ,
                     ,
                     ,
                 ) {100} // Note that this is an example interrupt.
                     // The interrupt ID is defined per-platform.
             })

             // _DSD -- Holds map between field names and objects within 
the _CRS
             Name (_DSD, Package () {
                 ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa30") ,
                 Package() {
                     // Contains a set of packages of 2 entries each,
                     // the second entry is an index into the _CRS.
                     Package (2) {"payload-buffer", 1},
                     Package (2) {"fw-store-updated-interrupt", 2},
                 },
             })
         }
     }
}

Device Tree node:
/dts-v1/;
/ {
     #address-cells = <2>;
     #size-cells = <2>;
     ic: interrupt-controller@2f000000 {
         compatible = "arm,gic-v3";
         #interrupt-cells = <3>;
         #address-cells = <2>;
         #size-cells = <2>;
         interrupt-controller;
         reg = <0x0 0x2f000000 0x0 0x10000>,
               <0x0 0x2f100000 0x0 0x200000>;
     };

     reserved-memory {
         #address-cells = <2>;
         #size-cells = <2>;
         ranges;
         fwu_payload: fwu_payload@2000 {
             reg = <0x0 0x2000 0x0 0x1000>;
             no-map;
         };
     };

     soc {
         #address-cells = <2>;
         #size-cells = <2>;
         ranges;
         fwu0 {
             compatible = "arm,armhf000";
             memory-region = <&fwu_payload>;
             interrupt-parent = <&ic>;
             interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
         };
     };
};

>> [1] https://developer.arm.com/documentation/den0147/latest/
>>
>> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
>> ---
>>   drivers/firmware/smccc/Kconfig  |   3 +-
>>   drivers/firmware/smccc/lfa_fw.c | 124 +++++++++++++++++++++++++++++++-
>>   2 files changed, 125 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
>> index 48b98c14f770..c21be43fbfed 100644
>> --- a/drivers/firmware/smccc/Kconfig
>> +++ b/drivers/firmware/smccc/Kconfig
>> @@ -25,8 +25,9 @@ config ARM_SMCCC_SOC_ID
>>   	  platforms providing some sysfs information about the SoC variant.
>>   
>>   config ARM_LFA
>> -	tristate "Arm Live Firmware activation support"
>> +	bool "Arm Live Firmware activation support"
>>   	depends on HAVE_ARM_SMCCC_DISCOVERY
>> +	default y
>>   	help
>>   	  Include support for triggering Live Firmware Activation, which
>>   	  allows to upgrade certain firmware components without a reboot.
>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
>> index 0e420cefa260..24916fc53420 100644
>> --- a/drivers/firmware/smccc/lfa_fw.c
>> +++ b/drivers/firmware/smccc/lfa_fw.c
>> @@ -19,7 +19,12 @@
>>   #include <linux/nmi.h>
>>   #include <linux/ktime.h>
>>   #include <linux/delay.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/acpi.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/mutex.h>
>>   
>> +#define DRIVER_NAME	"ARM_LFA"
>>   #define LFA_ERROR_STRING(name) \
>>   	[name] = #name
>>   #undef pr_fmt
>> @@ -129,6 +134,7 @@ static const struct fw_image_uuid {
>>   };
>>   
>>   static struct kobject *lfa_dir;
>> +static DEFINE_MUTEX(lfa_lock);
>>   
>>   static int get_nr_lfa_components(void)
>>   {
>> @@ -374,17 +380,23 @@ static ssize_t activate_store(struct kobject *kobj, struct kobj_attribute *attr,
>>   					 image_attrs[LFA_ATTR_ACTIVATE]);
>>   	int ret;
>>   
>> +	if (!mutex_trylock(&lfa_lock)) {
>> +		pr_err("Mutex locked, try again");
>> +		return -EAGAIN;
>> +	}
>> +
>>   	ret = activate_fw_image(attrs);
>>   	if (ret) {
>>   		pr_err("Firmware activation failed: %s\n",
>>   			lfa_error_strings[-ret]);
>> -
>> +		mutex_unlock(&lfa_lock);
>>   		return -ECANCELED;
>>   	}
>>   
>>   	pr_info("Firmware activation succeeded\n");
>>   
>>   	/* TODO: refresh image flags here*/
>> +	mutex_unlock(&lfa_lock);
>>   	return count;
>>   }
>>   
>> @@ -510,6 +522,106 @@ static int create_fw_images_tree(void)
>>   	return 0;
>>   }
>>   
>> +static irqreturn_t lfa_irq_thread(int irq, void *data)
>> +{
>> +	struct image_props *attrs = NULL;
>> +	int ret;
>> +	int num_of_components, curr_component;
>> +
>> +	mutex_lock(&lfa_lock);
>> +
>> +	/*
>> +	 * As per LFA spec, after activation of a component, the caller
>> +	 * is expected to re-enumerate the component states (using
>> +	 * LFA_GET_INFO then LFA_GET_INVENTORY).
>> +	 * Hence we need an unconditional loop.
>> +	 */
>> +
>> +	do {
>> +		/* TODO: refresh image flags here */
>> +		/* If refresh fails goto exit_unlock */
>> +
>> +		/* Initialize counters to track list traversal  */
>> +		num_of_components = get_nr_lfa_components();
>> +		curr_component = 0;
>> +
>> +		/* Execute PRIME and ACTIVATE for activable FW component */
>> +		list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>> +			curr_component++;
>> +			if ((!attrs->activation_capable) || (!attrs->activation_pending)) {
>> +				/* LFA not applicable for this FW component */
>> +				continue;
>> +			}
>> +
>> +			ret = activate_fw_image(attrs);
>> +			if (ret) {
>> +				pr_err("Firmware %s activation failed: %s\n",
>> +					attrs->image_name, lfa_error_strings[-ret]);
>> +				goto exit_unlock;
>> +			}
>> +
>> +			pr_info("Firmware %s activation succeeded", attrs->image_name);
>> +			/* Refresh FW component details */
>> +			break;
>> +		}
>> +	} while (curr_component < num_of_components);
>> +
>> +	/* TODO: refresh image flags here */
>> +	/* If refresh fails goto exit_unlock */
>> +
>> +exit_unlock:
>> +	mutex_unlock(&lfa_lock);
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int __init lfa_probe(struct platform_device *pdev)
>> +{
>> +	int err;
>> +	unsigned int irq;
>> +
>> +	err = platform_get_irq_byname_optional(pdev, "fw-store-updated-interrupt");
> 
> Nice, "fw-store-updated-interrupt" is not even mentioned in the example DT
> node above, let alone proper DT bindings.
> 
Thank you for pointing this out. The DT binding would have to be updated 
to below or the driver will fall back to platform_get_irq().

fwu0 {
     compatible = "arm,armhf000";
     memory-region = <&fwu_payload>;
     interrupt-parent = <&ic>;
     interrupts = <0 100 1>; // SPI, Interrupt #100, Edge Rising
     interrupt-names = "fw-store-updated-interrupt";
};

Regards,
Veda
