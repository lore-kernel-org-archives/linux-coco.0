Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950103B8959
	for <linux-coco@lists.linux.dev>; Tue,  2 Jun 2026 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390602; cv=fail; b=tz2lCEMpD15JvrFqCSxVeQxm3PfDUbaojeLCzrqXfZI5exkJ9rHxYbyvo42Q6V8wXd8hAAZoK4GVDYZUTrWshr23l1YoIoQ37ItukFsg7Of4nxid32OabVKyxjFAd3ZKH37s1EyRi9wgCV+3MlfJ+9gkM3X/DvhX9N0aEOtQT5A=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390602; c=relaxed/simple;
	bh=SHTLCrQW7uv6/pSqLU0r16GEcNXj+oG/K9NW7p08ebA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tdfWmQ+k5cSBc90PVu8Uyq/2Hl57r4s0hxbjpf63Xka2U7ZIIY3hpGcQpWJzcPqXkUiKkhs+neLURpERn5ZUadN2Lq0xVfn5Isub3eofMNQQvirG3TKR45xGqIP5mEOfxRlyHNN/H6ALyw/ccXs7ygDIoY6iXq0BEazASw+BCqE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCBP7/P9; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCBP7/P9; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCBP7/P9";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCBP7/P9"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ELgcyO03UR4uIYVbywSSxZTxeJrCmd7kkn96Y6vKt3RQueJVVm0/LnX9CrT98KBGFa5AFB7FuWGJYV2ryJDXtp9mcZ6zgHBIevI4EX2/ShXYmuSRqsxnZ7XNmHLi7o8fUdAPpEVR+upthBHj8rJXBHyM8rJN6YBWYFm2ousQoWlzJyyhbk//4cbHC6hVVbN22xLPQZyPM2RotG8nRAoe78QTQV2Y/6IOE9pv8x8x4QlRhBrbtWBzHO9UvTwNWiQ3+E3taKlx9UxEJZJwSy5kPH0uyyXF3iXSxb/usytR1uKtJw+8yevrPAjazCB2doZQxSC9Ddf1O6sgNUD0Y8DlwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVwClNW1C28VWmcLqOPYP3dNcsalNIEvmji0moK6wFQ=;
 b=iuYSeRdKoOVCnV9WL3HGGxJlZ6eacvJHN130lfbwkzLUc24PKsMCgiD2eBR/cFCgDhtgUY679biCQHoDd6HFG9MnnE4z/1tNS+6+64TbbILpE8GRw6H5Vt2N1HweyCWKlY/yUhMqAerBYWdoaD85M/eWwC9KoV6nn94zf8ZdQQd84O/YfHAhck8BWViHM1SQgLlzSnXULP+FTqRn/oFUx2GeX9ht4bl93xM2hIVknaj0XZlFED39x69K0uQiaQJOrAlcXVq/QQSyPGjcQe+nnut/ulICC6T4xmhVmAa0T5fJ9dLljv8i0uHKOm3tycUapZ/Sm6TFtnC8laQqii2CwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVwClNW1C28VWmcLqOPYP3dNcsalNIEvmji0moK6wFQ=;
 b=fCBP7/P9JBiWxn2Ow0lMXElILKVU7P0OKTYpukXcozapDVUjVkBM3sefZ7MobdsfUHqiZ7RoOjrZZ4/YH/gZaRAnwFEzWEPrl8j+1tlar5jlMJOFp2+tGeYYp7Qqr+HspF4WikVizPYpFnLYUnQs05TplnoSSybRQGHXkyRF2cc=
Received: from AM4PR0302CA0035.eurprd03.prod.outlook.com (2603:10a6:205:2::48)
 by PA4PR08MB6176.eurprd08.prod.outlook.com (2603:10a6:102:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:56:35 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:205:2:cafe::30) by AM4PR0302CA0035.outlook.office365.com
 (2603:10a6:205:2::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 08:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 08:56:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQR5RYTqRu/iEVCDiLVM3CUoRVDfbz+xfTell7jAUqOb5QAhfhr2Oo6fbY0XunuQ1gZnPMTBK8/Vyt6E3B6ekE8dN57qcn9ExD4rGf+nGXNQTyIHHrSG+O6ESwqXBt3jIJG19Is2Vt9uP6+ZdxR+kQctizrljwKYiu2G3Lj+MOB4Y5gKKHtQVziiYnxaTI9HXtNxQCA5ZZhZm2ewsLfAPBXey7XFqXc2z3xL0ZXz0ZHcLgEj7n/EuJXI3QF4kOTF6oOzhgiPKR9gy/Ute4K4Hrq17nlb3DqWmfu14IFGaTc6kpM0G12YnR0ASrpDIj7xspBgrK+ZLkP4y99tA5utmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVwClNW1C28VWmcLqOPYP3dNcsalNIEvmji0moK6wFQ=;
 b=DO84yBwzs1VE7D1qC9BMHqa8jVykTJoIc9SB7QfFtYl++7OSHLAdMTQ8gF9jrVqqZ+e0O7VmKx3GUuiqSAqbeBycEtrugjqTX7psiW2+z6t5GTGvaUlHShA7IYDSSYWMi6lXqekeA8NWrsnNEXCA1n9Go5zUkoX1VPAyKtb0XueHVA7xrJB6s6DlfhmVb66PVnNEKeo2RkgN6lbi9qBL81Q2GOJDlDi77WLxbWvuCbDEIZgahIy+qltGIvz4z3mR2eE8kU/hFLZu0HTj2E6aQ8aUU7Xk3feopGWDmCCxUgUVsI7Y24Vg7AoB43a7WkTumWx+Ia7hhmD0MXI+LGlfVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVwClNW1C28VWmcLqOPYP3dNcsalNIEvmji0moK6wFQ=;
 b=fCBP7/P9JBiWxn2Ow0lMXElILKVU7P0OKTYpukXcozapDVUjVkBM3sefZ7MobdsfUHqiZ7RoOjrZZ4/YH/gZaRAnwFEzWEPrl8j+1tlar5jlMJOFp2+tGeYYp7Qqr+HspF4WikVizPYpFnLYUnQs05TplnoSSybRQGHXkyRF2cc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by MRWPR08MB11233.eurprd08.prod.outlook.com (2603:10a6:501:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 08:55:23 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 08:55:23 +0000
Message-ID: <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Date: Tue, 2 Jun 2026 09:55:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
To: ackerleytng@google.com, aik@amd.com, andrew.jones@linux.dev,
 binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com,
 david@kernel.org, ira.weiny@intel.com, jmattson@google.com,
 jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org,
 pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com,
 rientjes@google.com, shivankg@amd.com, steven.price@arm.com,
 tabba@google.com, willy@infradead.org, wyihan@google.com,
 yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org,
 aneesh.kumar@kernel.org, liam@infradead.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>,
 Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>,
 Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
 Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260522-gmem-inplace-conversion-v7-0-2f0fae496530@google.com>
 <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260522-gmem-inplace-conversion-v7-7-2f0fae496530@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|MRWPR08MB11233:EE_|AMS0EPF000001A3:EE_|PA4PR08MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b3772e-0d03-41f3-1d07-08dec084d9b0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|18002099003|22082099003|921020|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 v6/0WQ1SY7DeVMI4I+EJffATgPHldttYpxXsN6mQw6I912HTijslXGnz3yupVZZAplfwNmFzRpUW8zn5E/SFETfbCXVAxPBjh35C9Ue1Saud3vKLwr4AdvfEWXSuE/8S8PBiSnmea78bX4/LmMhaAVonow7lFHI5ACiwRMbSfinIYVjV2u/lHbFRYKMn6ut6aydSXFSG0dGrK5XwmB8KUwgsybQ3hAjjp5psDEN5vVhNEN30wOzq4zZdZafJzXfMTqjfUtqcxaT6xVBcrGfAF/A4TvWHaTlGHuuxQZSkf3DX9ZQ9YWIDY+8RYFPzxHSZNVdoroPLjyaLMOfgMIpIYiPjVKk6x+YrqIeIp95t8u+6fe1t35U6WbhV+UsVg+p1406H59tbJVnVxKs/lIS72wLCV20+ei0JG3JngdSoR8+FtYQS06riFAV1FiHcF81exs+gcpeceFmq3ihIZGp2Cbqs/OnZN7jfyeaE+Lcbk9pqvkL3cEHMICMeSQT5eQ/7dTlKl8YaeF9SxxiHVwm+b0dC4lpN/y1mUZ81nfPr2UocNRkwj1GzabvhcpARWmTITqbX4iQek2ZRf/rdz6zRygP4U4xvhUMuo47z2LBAd/OQ7nSNfM+GKlxi1K1/WS1lygWWv60e7Qvht7UN+UBarHsg8CRIrlE+AUtFUiwq9+QfVJX0oWM/ugOZeqPKlj/gmuRJAsZUC0dwzC7M+e5usTlrne9T71IDMkFAIG2mPu4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(22082099003)(921020)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 GByEX+eaNY4Q3Al2OokcgbQT1ysLTTzFdZ3NthqXj1eiKk6Jz2XpO3WF4LjNSy5zMVHso25AwRXJP0bK8mQo+ejItzJ044LmIV/IsNQ3T7EetDkRzDxYmBck8UVkOzSKcHcvOVgrnt4aYlxBiCRkCoJ/+ikqHgiyn4oafCY52e7D8dZwcO8czC8wNyN/flIzHkK8njaq9qTmi9tXQlJf5Q5FUNx4mTc2wsxuinAq/dWY+4JsibdwlWBmKWtjffDljLDA3rL8Y8RQYjkZlY228hP61QOMOjrLKf9kmJrEBt3sAy8p8I5i+R/3gKPqBFPJfH5qanBi8N2XUIiGXhQv7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11233
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46102edf-a740-46f7-cd03-08dec084ae70
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|36860700016|1800799024|14060799003|376014|7416014|921020|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	gBL+U0SLqt7kVKjwYFe6JSST1MV/Ym2U0sFpX8Pt8hFJRpbLbedUrN0rWuOq8Ur+AEErrBLWJM6w2TMFqmC+EZ+xsheGbRYzHo5nxNmfcXmZQhzU3UPsqml4MfhgPPmHqe2Eo/NCNlzO6jEof1vh8roYwTwkBS69mYGE4ANB3iabdiKsX9UYvVBMVuNFe9HjGf/NVSOi0qX+Lcl79HzFat0K5AaMzTg+8+ZK/f2x9wdXGFzIsJk6EHJN8t+rCE4EiHTReIOp1pa/8i7+JyuroQiVZcUZfwBS07rEWN57OHyKpjciO7MwwEMgr87o4UNvP0S/xVZLuKqqkBXKTxe/+KnsMvclz55u1/3umnOk1Fbb+s1HkuS0mixhgxwL8o0huZmaOJmqlwon1wx00Q6wUHTgioGMGYxqNm0G7IQW79SzSajxUoeHidNOgPMEu0Ws6k+T7R+4is30kVTbk5xIzijJvBvaAYn0THAhKdTBJWE91RHIQuGWt5HMkyssPg76LiUkmB9pIShvagyLKc44gRsJXQXbM3GYtzXfUqwhWHpUkwboyZouDYPhzajCSq38A+7Pe9v3IctjyQBtSJvHD7UFpUaJJxAD/UFt0bvNEzZYRHZ5R863kV62pWJqiAGSC+SE4ENZbVmyR3I0FVyJznL8zcgPPTHoZlWiK9Zx0qFvnWwhIZnUmoL3OoHVuTtgQZVBF186toyCXSGEWky89cVspqHi47Lk3z4X3CrrFAJybDBG1ADG13pOwqBhAqWNVV9xljIyymUZgtZVnmZ4aA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(36860700016)(1800799024)(14060799003)(376014)(7416014)(921020)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zORDNZmhed211Y+L01Fae+C7g6XvowfQY7FS+Vo7C/CttBzR8toCRy8dMfzCal/xWiN0pQVxImbVUDOsAbS8LkXR6kIFZJISnr+GQLDcpJ/Zq4PBQRPWJcqkXJz00/7m5NnM7dawOuDuNiMWtd5imp8TvYal6tnfYLa+GddKKpRQcO7NYOIdd7wlPmP22h+nDpFKrXmL4LV4zm4jpeVkH7Oz0jvjRycueF67ptx95icsPeJ46/e1Q5aU1Lctk5RO0Fq/hHvcS4ArTKNfZcdfbJuyQACJfExUWebYrg+1e1C/RmZuGzWYiJ8ihEiFqflqTQqhIdIqbC8NreNnQkCuq4TUnMfyLrCmBgjEYkQlt+Frm4biB4bQgDguN3O0MQWJ/JJh49qVFwgAsnV3jhElLiEHCXljTn+yywRGcfEvfKU6YyYg5a2rDNXfg7OKSygn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 08:56:35.2708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b3772e-0d03-41f3-1d07-08dec084d9b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6176

On 23/05/2026 01:17, Ackerley Tng via B4 Relay wrote:
> From: Ackerley Tng <ackerleytng@google.com>
> 
> All-shared guest_memfd used to be only supported for non-CoCo VMs where
> preparation doesn't apply. INIT_SHARED is about to be supported for
> non-CoCo VMs in a later patch in this series.

nit: s/non-CoCo/CoCo ?

> 
> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
> guest_memfd in a later patch in this series.
> 
> This means that the kvm fault handler may now call kvm_gmem_get_pfn() on a
> shared folio for a CoCo VM where preparation applies.
> 
> Add a check to make sure that preparation is only performed for private
> folios.
> 
> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
> conversion to shared.
> 
> Signed-off-by: Michael Roth <michael.roth@amd.com>

nit: Missing Co-Developed-by: ?

> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>   virt/kvm/guest_memfd.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 78e5435967341..adf57a3a1f5dd 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -894,6 +894,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   		     int *max_order)
>   {
>   	pgoff_t index = kvm_gmem_get_index(slot, gfn);
> +	struct inode *inode;
>   	struct folio *folio;
>   	int r = 0;
>   
> @@ -901,7 +902,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   	if (!file)
>   		return -EFAULT;
>   
> -	filemap_invalidate_lock_shared(file_inode(file)->i_mapping);
> +	inode = file_inode(file);
> +	filemap_invalidate_lock_shared(inode->i_mapping);
>   
>   	folio = __kvm_gmem_get_pfn(file, slot, index, pfn, max_order);
>   	if (IS_ERR(folio)) {
> @@ -914,7 +916,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   		folio_mark_uptodate(folio);
>   	}
>   
> -	r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
> +	if (kvm_gmem_is_private_mem(inode, index))

Don't we need to make sure the entire folio is private ? Not just the 
page at the index ?
	if (kvm_gmem_range_is_private(, index, folio_nr_pages(folio)) ?

Suzuki

> +		r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>   
>   	folio_unlock(folio);
>   
> @@ -924,7 +927,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>   		folio_put(folio);
>   
>   out:
> -	filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
> +	filemap_invalidate_unlock_shared(inode->i_mapping);
>   	return r;
>   }
>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
> 

