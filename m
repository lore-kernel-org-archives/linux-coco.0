Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010011.outbound.protection.outlook.com [52.101.193.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894FD2DCBE3
	for <linux-coco@lists.linux.dev>; Fri, 19 Dec 2025 08:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766133557; cv=fail; b=Ir2WnLMu6uz2UfuWOBPfmoLgfRC8Og9Z6xG8LVqeZgd4LIcg3EJ7D9Gbt3c0B6dUWy0ZELCig5D166Q6Gn8gAGg2tHtPqsxBQu7gXGo07htraQJj5UYEDUHuq+wjeSv4022LuwQX1r2MvcHEs6wyICedZ2qFihhz5Nc119z441I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766133557; c=relaxed/simple;
	bh=aVgmcT7FIgB3WVy5Pp5TSbvejSRvSoLj9r6EWNirX58=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EwGtCb97Z4szcEwRxf+XQes+2WQkMJpauWWAfZQ5/IJhtou+BEvKNminSqFeJ6lrgOEX4dqjvEd6I/326pZnYrK06l+epUL4PPXnrDu3BupSwEVtSwv2r4WtsZ7Dw/I2lm6DrI495MmaV69Pg9H6OHs/exiJW7g7KsgIZqLh9dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RQJPyzmy; arc=fail smtp.client-ip=52.101.193.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RQJPyzmy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tBJry07qGkUMCrHMZbRiSFjV3t5EBwOiA6s8fkV7uLgymStWjsfogu6ofIBjhmTkSxXumpmnpA2q8zqoke/7tHIY5zq3oTMr1Z9+b74IVIdGCeUbosUCUbjbRb8suOhFuBKNwcrW/nfCY0pJ8STT/MnUtTBHOfLlCUvcS92c/x+eiyPjwRCClDzkpXHaC2UEfZZKAUUjVMNNLmj6eWR7vyt3cHp8q1Ngnvk4ZoOnVHEagYNRrfV5NbCQTqBs4EPBrtsoSV3yz+OfDFIquxYi8UyJ/sAkdQKewFr93VABXl5dwio652p66Xns37BYBDk90oLT4vPH2cT9dv3r8svsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e71/CbbAEhKj20iKc35Ne1BoiJDI9vD/Ux68lbfh17c=;
 b=Yt5JcrM/eD3DMN+XCz1l/lzFBLbC8XxoVSS0pSOMS1fHWWZ+CiUpEzsEmR7YtQypx8aCx8ptrP51qxGSnJTvAi8aAX4D21Kb9WMjxTLiTAxoyoDbc9ALIHfySWI8CboEODyCX4tcs7qqwcMXzVUylp1/vX0LrUAxLjCVaPNkTXrzZ8DduQ3hKYxZT5L90Tdf4e7pB3O3TgRFNhuGLZ5lnYAWKSAX5lAdlsfW07Mv9+rJg7/JWPPvC/jui7q9Zo+Q/KdUHCmRxdEqJVFsswsFK42lcTo9WPpfVxp5ZAC6rqFNevrm6fd1PqCKJjddQvZGsPjCcpWKrFQ7o7+b3XSQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e71/CbbAEhKj20iKc35Ne1BoiJDI9vD/Ux68lbfh17c=;
 b=RQJPyzmyS5IsM6l04AKh20z6O3rCu9EUjUfD8ehEPikVLKLC0MM7TcE9Dpz04txCqkow3gkgcvEgx87xpI6EBcJasgWDVgHVn45OiCIloG+x7r6QRy9Ba5hzunHeCL3zXLGyrMTbx2rYBKjTrdiHrFSwa3w9VJwU1MLBF05i+A5iCHChhj6RTriXnGhz7NMiEe4S4ltgP3RG8pzMNiO1f3dRUohEj1yLfb3tuYSGDfETvQyRlcyUUNSJj7irV39HnkHqNUQTcCzVmehIff7u9RGaHHOH1ZP0hZIkrnzZO0T2qhG+tdvMgD9G64PhcCfoNez9IxohofyYq56D2TUTNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 SJ1PR12MB6219.namprd12.prod.outlook.com (2603:10b6:a03:456::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 08:39:11 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 08:39:11 +0000
Message-ID: <8bca8c4b-52b8-4a1d-9f21-176c994a58bb@nvidia.com>
Date: Fri, 19 Dec 2025 00:38:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] Arm LFA: Improvements and interrupt support
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: salman.nabi@arm.com, andre.przywara@arm.com, lpieralisi@kernel.org,
 mark.rutland@arm.com, ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <20251209-miniature-curassow-of-energy-b6a303@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::47) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|SJ1PR12MB6219:EE_
X-MS-Office365-Filtering-Correlation-Id: 1582c347-2bac-431a-7c39-08de3eda14ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c293UTJpMjNJeHlIekFEaEtwNUR2VHU1TGN0SWllNWV4R3J0T2oyYk16dnFG?=
 =?utf-8?B?Rk96NTl6WmttWVZ3U3BQZmxmS0VDN1U2OVM1Y1BwY2dLYis2dWJKNk94UHN0?=
 =?utf-8?B?UTJnaHRHd2dMTzVkTnhWb3RGMDE3MGZEajFBMnlwK1Axd09CTUNQWWdaZzBw?=
 =?utf-8?B?VmtaSzZiZ05aM0JnUXJzVmlrcWN1a2dncnNFTTVDMUxXZWgyK0puaFNaWENs?=
 =?utf-8?B?RngyMjAwRU41dGx6Ylc5bDUxaFR5OHIxUjJucE5yZXBTSEJzcERLWlNCQVVl?=
 =?utf-8?B?S0p3R2YxNFVvalNHTHF3WUx2dHVhUTNsY0pGVU5oQnFyMmtRdTRieVo0UzRv?=
 =?utf-8?B?WU9Ldlo5NG1Vd21jZjFXN1ZOTTlZVDVDUDlGb0pNbjZBWGcrQU1lYURtR0dJ?=
 =?utf-8?B?dmJPTUJGeDJDK0dkUkNTdjVJUC9aK296VktoM2UzRjJxOTFJckpHV2Z3eTFE?=
 =?utf-8?B?ZFVTVW43TUhEYnF0b3NnK1FvWkQrVlpRYjArK2NnSlEyQ1dsZlEzODNMZkVW?=
 =?utf-8?B?SGo0dWpBVVlXTXhackhHOTNrdHd0dFBxNlFkN083NHdSeDNQWk90c21MUmVw?=
 =?utf-8?B?eUMvdExwY0FvMXN1WVM5UFdXaE1MalRDbVJRVTlQa1l1aUl0a3lrdk9pZUF2?=
 =?utf-8?B?bnF0SThKOVNkZUhNRUpYdW1sd3J1SlZpeVRoaXFEeG0vQW84MVQzMEt3T0l3?=
 =?utf-8?B?am10SnczbU9nQ1RsZmV1bjVRa0pZNms2aUt3TUJwazBKYlRTQzNyb25Qb0hZ?=
 =?utf-8?B?NTNaUHl0YmtLZFh3UlBLSVl1RTg2dTVqZjJMSmFOTUl2N1JMMFhxQ2RmZUhm?=
 =?utf-8?B?K0hEeS8wSXFDd0grREVOeTE2MGF3R0lPdmcyTTJobmR1N1NPbU9vdzJRcU5L?=
 =?utf-8?B?MmFoNHN3cjZkUi9VUjBhNmlRQVowbjJWV3Y0WXBsZUJqc2kyQzFPN1MxYUV2?=
 =?utf-8?B?ZVYxZFpZVXNTN3hqUllDRWUwanRMT1J3NlNpN2NOWTFBOUVZY2R3S3c5SHEr?=
 =?utf-8?B?WjMvNUlpNFg0NFpwSlhTNzhqRDFPSDk4RnBvSEM5d2E0Z3hoRE83T1FLTGRL?=
 =?utf-8?B?dzBOV1VEazJnanJ5U2p2bDRnRTdqRmNHR2Fid3lVa2Y2ZWFzbURVTERydGtz?=
 =?utf-8?B?VTdIYWRnYWFMMndaUC9BV2sxMDFvYkpaNWpmWXZVT3ZCRUw5WDJhYzVEMWEy?=
 =?utf-8?B?TFdLekRpaEtiZXRGRUI5b3o2ZEs5RlRSOFVpZ21ibGZjenpzR1VJVVYrRi9a?=
 =?utf-8?B?T3NmUHhXNkJBNTZUNnp2a3VHa1NRSzdWa3dMbVg1Qmo1SUJYWjQzaS91SmlG?=
 =?utf-8?B?T1drM01aVk5GQ2hRRmxBRmtxWXkwcWNZZ1YxejZYRTdWWktuZ1RVUDF1WEtD?=
 =?utf-8?B?bkQrWEhHWUlZVzU2dStFMGprWnoxa3E4dEdlWUV5MXEyV0FyQTYzQ0RJSW83?=
 =?utf-8?B?YWpsVWVFOFRPak1NTXgxOXRTeWdacTVoUVN0OWhNTFdLWkxsR3VQd0VHL1BY?=
 =?utf-8?B?UW04YkFHeUVIZm9TbWpmMjdsUFcrL283VHpZS09TNWNQU01XV3pYb3I0VTMr?=
 =?utf-8?B?SlNZYmtWcU5RWXFIeXZvejVHSmY2Z1pOU1hNb1NLZjJnNi9KVDdBbTBOYjFE?=
 =?utf-8?B?c2tOeHJQeEhWeEorSnFpVHd4dWh2aU5KSjZ1NUMrY2FZK0tDbms3SVVVL242?=
 =?utf-8?B?cEQzQ21mNGNjOXhhanRVdGNqb0lkNE9ndEU4L0tSZ0c3ZDZORVhFdGprUDhs?=
 =?utf-8?B?NE9TN3hadkFKNjUyVkJmWFpTd0hZVTZER2lBMDVQd252blJjNmN1SEhkUVJl?=
 =?utf-8?B?SnVFeUROenZzYUNicG04cDZ5a3lEL3dTVTUxdFE3YVZRQ2lYQVNSc2ViVTVK?=
 =?utf-8?B?S3o2MnNiTlB4ZVNEM2xTeXRHRmRNbE5aSmFIMnlzUkhYY0E3UU44UXAyeGF3?=
 =?utf-8?B?a1cxbjYxTG9WNjV3dXQwRHhEaUlhbTc4d1REeC9sQ0RSUC93MWZucnZWUVVo?=
 =?utf-8?B?by9uSWlDRXFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1BlTlg3R1c0a2VlSFpmQmRkWnJiT1U1ejhtTWJ1dlVjRlIrVlJBaGY0TTFH?=
 =?utf-8?B?UXBXZnFCdlpmeElCK0VvVmFLQ2dZSThaKzBxdnR2cnRFVUgwVHFOR1ljbHgz?=
 =?utf-8?B?bm1PMkJDSXVTbThoaXlPUXYvUVJKME42VmZLd21McUQ4VVFzK0l0QUlod1Uz?=
 =?utf-8?B?NGVUT2dkQ3FZbG1KbzVFQzZDWGxCbGZCVzRWRjJrRkN4RWRMZTMxVmhLSmFz?=
 =?utf-8?B?alpOTzJwZmRBWmo5bExFTys3VFI4cHhwenZuaFh6MktGVjZvSkhGRlVWc3RX?=
 =?utf-8?B?OVZ4UjJOTVJjQ25LNUFvYzZoRnlVM0dKallVMFJxVjdsRjRyUHNESnA2a1Yr?=
 =?utf-8?B?SW1IcExxZFoyVUs2QmVlVWJFQTZQUHV2ODdVQzM3N1BLYk9vUnFyNG1sQTF4?=
 =?utf-8?B?TmxTV0RMMzlheklwNVlmRUJjOWdDV0t3VjgzVHVUQ0hqUHgwUjZrMUM2OGhM?=
 =?utf-8?B?aFAzNXJnZ2NlU3JTRFA0MGlDWlJlRWJ2cURneGNncE9LUHdwOFRuR1JLaEda?=
 =?utf-8?B?aGNIUytTUHBvS2ZnaHFJSnlPdUxIbnRxNGdBYnl2aDZsb3h0Vnp3M1BUMUJi?=
 =?utf-8?B?SENwczl2V1l2R0VtZzVLQW0wS1lJeVJDbHdHTGZQMlV1N01FZ3JCdElWaGJi?=
 =?utf-8?B?V2ZqYXFvUXNSK2IvUlNFMWppY2o2WW1xQ0cwSk5rdFJIY09rOFl0TDgzdFZ0?=
 =?utf-8?B?NGEwZWJHY1ZVYUgxS3ptb21iSUF3R3lHU2dJMkhPMWtRZWVCNEtQWmtzeXdn?=
 =?utf-8?B?VklPL1RNbGI2clpEdXJsT3Q1ZGJncEVHZE45a0FNR1lFa2RJaU9VbnZVYk9i?=
 =?utf-8?B?TnpNQWNZVGhiSDVqbVlLcFM4b0V0Q0lOc3h2dWh0RU5BK2JuQUc2a3ZpT0VZ?=
 =?utf-8?B?Ynp5N0ZKUGQzbWVvUHh5eDJSZUpIVzNpUWF1MXVEdURBWTFoazFvTXR5cjVV?=
 =?utf-8?B?bjYrbUJ0QjZNb3l0RlNUSGFHZlN0OTdIdnNPYUdFTFY1NWQzM0JUK1JDUmdS?=
 =?utf-8?B?QU9NalptS1FzRTNHcWNxbnVkQmlYTWJ6amlvVmhyMUVPYnQ2SFNDZ1JKRW5T?=
 =?utf-8?B?WFl4WnNQV2ZtVW5NRjhCRVJ2ZVh0cmFBYk1GWVVOSTlQOWJDVzdLbU5KSW44?=
 =?utf-8?B?Nm5HWWlIbFEva2NmU292ZmJaQjJNRmV1dTczdTlpdkgzTFZrblNCVWtlVUF6?=
 =?utf-8?B?Z3FtN1Z2M2ZCaExHY1g1SFR0T05hbjhIWlN4dFBUR29Qa1FNNU1ZK1NIMkJC?=
 =?utf-8?B?ajl4MVJ2MllmOGlCaENPNXRWYVVTUTJjY1dXTEFxSUd2ZENCWE4rbHlxVERK?=
 =?utf-8?B?c01uRDBjbHByYzlad2FEWGJiQ3d4RXltSE52MUNoN0NjeHlqcjFGblBCTXZx?=
 =?utf-8?B?cFV3SE1NT01sanRTbGc4QW1sVDl1dTQ3QnFydFN1M3Nubi8vbHcyNDBKNThW?=
 =?utf-8?B?c2JWNzhYTk5iekx2a3JaUjJrWUtPcjFReTNYMDg4K2pmT2ZFc0pzWlFabGcz?=
 =?utf-8?B?YWRxR0J4YTdFV0d6Ujk0Z0FqUHB3bDVTT1poYkYvQnp2dVJFTlhZMWJyUlNn?=
 =?utf-8?B?MGFRUFg2b1ZlK09jS0tZS2ZWRGVHV1J3L1NCT1FZb1pSUnRncWNMUzFrVjVi?=
 =?utf-8?B?Y3RjaDRNcHkyQy9oaTFKc0tkdU0vYU5sdTBRSm9zbDAxdDR5ZUxDNDRMUUVq?=
 =?utf-8?B?RFRkMjNXc2E2b1VsSnpxV1ZoSVNnUkRHb2poRS83RFgwUkQrZ3dzb1RiLy9F?=
 =?utf-8?B?RlYyc2dmNloxQ2hQcitNeVo4T3hYTXp1RjJrbW8zTjN4MUVYdU9WNnFuL3N2?=
 =?utf-8?B?ZzQ5Sm92NGw4VG1IVlJoc2kwbk5zZU9WWlBuWlA1OWxUVWRSWHV3ZkF0RzFL?=
 =?utf-8?B?UG1NODdJaWhNRTFjLzVWQmJSb0hDRm55V3FWNXpwSUlPSHJkNm02SCtCOWpa?=
 =?utf-8?B?Z29kM2EvVjBLM0w2M09VMUdsckF0QVBiQkNFcnZxV1YySEl0NXR0bDFRSVBx?=
 =?utf-8?B?czcyd1NxZzBtc3JtNVZzb1RQeUxLbXNsc3h1UFJXUmxiNzlSK1praC9JeDNR?=
 =?utf-8?B?ZDZESUJGTlhVTUdrbTJOT3IvUU51RnMrL2hIRjVqUEhFS0l0MzNRQVBFRkF4?=
 =?utf-8?Q?1PKlZBnu8zZPUkhtHmAdQTHbe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1582c347-2bac-431a-7c39-08de3eda14ed
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:39:11.0062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC7Yae1T10mi4CeeuO5UAO6ZiXVlAC69O07r3nFQg09G/dGU2Fd9L2DgYdXdRemj2k8//5wNufngmeLzya0bIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6219



On 12/9/25 03:39, Sudeep Holla wrote:
> On Mon, Dec 08, 2025 at 10:13:10PM +0000, Vedashree Vidwans wrote:
>> Hello,
>>
>> The patches update the proposed Arm Live Firmware Activation (LFA)
>> kernel driver [1] to incorporate review feedback [2] and refine the
>> activation flow while remaining aligned with the LFA specification
>> DEN0147 [3] and the SMCCC 1.2 calling convention. The series keeps
>> the existing functionality but restructures and extends it to improve
>> robustness, reviewability, and future extensibility.​
>>
>> The SMCCC usage in the driver is updated to consistently use the
>> SMCCC 1.2 register-based calling convention, consolidating arguments
>> and results into a single struct to reduce stack usage and simplify
>> the SMC interface. The patches also split the original changes into
>> focused pieces and document the device node bindings in the commit
>> messages, making it easier to follow and validate the implementation
>> against the specification.​
>>
>> The kernel driver is registered as a platform driver in accordence to
>> the LFA device defined by the specification [3]. The driver now extends
>> interface for interrupt-based enablement of LFA. During LFA, the
>> interrupt
>> thread refreshes firmware component details after each activation step
>> and iterates over all activable components until no further activation
>> is pending, matching the spec’s allowance for component detail changes
>> after activation. This ensures that sysfs exposure of LFA components
>> remains consistent with the authoritative information provided by the
>> secure firmware.​
>>
>> The handling of CPU rendezvous is adjusted so that the kernel now
>> honors the rendezvous policy chosen by the firmware, instead of
>> unconditionally forcing a rendezvous. This reflects experience with
>> existing firmware deployments where mandatory rendezvous is not
>> required, while still allowing the firmware to request it when
>> needed.​
>>
>> Thank you,
>> Veda
>>
>> [1] https://lore.kernel.org/lkml/20250926123145.268728-1-salman.nabi@arm.com/
>> [2] https://lkml.org/lkml/2025/10/8/980
>> [3] https://developer.arm.com/documentation/den0147/latest/
>>
>> Vedashree Vidwans (5):
>>    firmware: smccc: LFA: use smcc 1.2
>>    firmware: smccc: LFA: refactor
>>    firmware: smccc: add timeout, touch wdt
>>    firmware: smccc: register as platform driver
>>    firmware: smccc: lfa: refresh fw details
>>
>>   drivers/firmware/smccc/Kconfig  |   3 +-
>>   drivers/firmware/smccc/lfa_fw.c | 478 +++++++++++++++++++++++++-------
> 
> Same comment as before[1], looks like the feedback got ignored or missed.
> 
> -- 
> Regards,
> Sudeep
> 
> [1]https://lore.kernel.org/all/20251009-calculating-glorious-oriole- 
> ceccf6@sudeepholla

Thank you for your comment.
I did include DT binding in commit message of the patch. Please let me 
know if there's anything else I can elaborate.

Regards,
Veda
