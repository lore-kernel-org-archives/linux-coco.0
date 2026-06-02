Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012039.outbound.protection.outlook.com [52.101.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEBF3D45EF
	for <linux-coco@lists.linux.dev>; Tue,  2 Jun 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.39
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780391512; cv=fail; b=hFVjBpH6Fn3OnspVRzItylwpm2e92bhrRnFrh3n+RJS/6rvItaxn3KefdaIEoFr3+T/wQ4Gjlp9DYg2QgWd5rsJ3CK2vVvQTLZILVos8yu5FUU022VAundyH3bI3NtetWm32CXmEd+YuFCA22f318qdQ32JxnfEe4EAnzZcVnys=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780391512; c=relaxed/simple;
	bh=wg7L5HwqsT1yV+1ojvpa9oa2xP1lCkVoNpuDpKrDG3s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g8Qx9yUudC0M0HVAf7GIoJfBYAcNIOs8BcFD22ksw6Zkpl9dOC3Ipndl0rPAzs0I8Uz25Q7zZNNoBPAZjfMjE+VpATcEogw3L69pbpyzec/VRdWBufLGp8dEhZ+8K8VPpvMQEvNzRVoES+2f7lhha1wzOsK3y49TJWV9VL9lEjs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lL6BezCO; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lL6BezCO; arc=fail smtp.client-ip=52.101.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lL6BezCO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lL6BezCO"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BqHvGLiIjt7UkdVON0e1pPflGlUvTRUkJm2mmEh1HR6pqJCYdwJ6CgcnIH3EftDzxGdObGTDIF3xsmT1Hq7+O10+pJ0R/pIkglsiP/4MeZKtt+73JSynydwC3rxCbHItDEABC8TLvKFo2fiz4++hP2coLWWQQ0rmgyOlPdttbCjiQKu7Sgkjc2V89vaMBg9B4dhKxyNqpQGc1NmeYccAxfyuI9JRs59+ePSbPSTeM6fmYm6CZxzszVz2Luj+Iqxdg+o10Uegkgr3Z6g3Z3jZ3HwFy6IA0EBdQdxGXx46GZ9R/VPbfAcU5AMD5JAeTbRZ0C3w4ymuvuMDpEDXSJF0KA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb0D0KrKGhNBxmEk5l3OPWmNyHDGDePPvR9YDZC7L8c=;
 b=OT3Q+GA+nJSEC/3CcZu6YVBY1GM+1We7XnbiMYh5Z9X3cgy8mJO51j22pwk82uv4ZiPCLkEoDttQ3grFFyP0ZV7PuQQvCZ9iHBeLPSZfAp9OXzMCjz0erbi9srqehcWE5XrfTWiqj6gjhJyB9bD2uEKcKfzt/JigLoeVDwvC8B8taOIAvpaLbndSak4HvxavJMrvBhIbzADGczJB+XgdnV52IAYtVo9gn6rdnO+wCZnD8Ud/YiCTCD3PrWB74JoAVttrAnvF4XpVCsIEcqLYXh14cHMzYBtdjjq3U7A8CNXiwB3SgX75rkqx+ID9EQT1pkDqbaQ44vlqZ7Fc53q5kA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb0D0KrKGhNBxmEk5l3OPWmNyHDGDePPvR9YDZC7L8c=;
 b=lL6BezCO3ZCXeTda9MbnIx/V8HgFKIXdYcUt95QGD5Qiv7jQ0tJt/DsCyHJjQ0NgyiOXChRL1daS4Cu1HA2r2FAucxpXkOg22n0fI6EP5QCVSqq5BVcyqkkGVL6qMp5g8xjtAkUja5KO7DyLAOWWauJvm+cSbIqZ8bdvzIdYeXk=
Received: from AS4P189CA0042.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::20)
 by FRWPR08MB11680.eurprd08.prod.outlook.com (2603:10a6:d10:1af::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 09:11:43 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::10) by AS4P189CA0042.outlook.office365.com
 (2603:10a6:20b:5dd::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 09:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Tue, 2 Jun 2026 09:11:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5t+QX80fOMhs+kEuHljheCPP6yx/5loeKM45JjTCLF12RaywnyL32/RGht7q4stpSpTQ7t+VmSvXXHLHSDEsJuwAcCnArrhnLIjbbB5QlJuBUfZDQodyXMYRh+eGNmR/gcFrGVOQvY7O/NlMYEsOPn7BXZ/PIWYpbB5GDfi2kQCvtRBDobZr9sa253uh33H2S4VKNt1ZXRRX4/tTcHG+cP2cLCNQupJ/svifCvjx+ENqxx5unNplHIxqskjzoX0HpPmJmJLf8o085SDxNsFamBhqFNMIQ8ktLchuTc0ylp09aror3MWOUV+NzX4N3H/let0AnkJYZ645xytEzbkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fb0D0KrKGhNBxmEk5l3OPWmNyHDGDePPvR9YDZC7L8c=;
 b=nUnhF2grMFybCVEPodSo74gUzDlU0xmA2E3TUhYYeKGd1jPUxJjI+c/DbLXW+G3VgcOsIiGQICAw+oYgBGi3kpnCNja4xsYrlYpDq3DRmfz6QhqRmKa5b/PerAPWu+vHagiveAYtTBghKbtw8qCMWXe3Bgfghe0UR4qmb7pm5roLwutaFN1Ow7P7nHVe1gKy1MAvocEJukUjLUOuEk0sXfTx3fPBhqUbVxFtBucZs7B1pJm2JLseUFchjfP5OUgaDJ18JSVYfn7EFajBD9A1kppXTuruQjCBSbX38pB8DtkvrI9NYtkdKYzlFtN7wi3aDQaHmW9cfMIm9nOMaUqS0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fb0D0KrKGhNBxmEk5l3OPWmNyHDGDePPvR9YDZC7L8c=;
 b=lL6BezCO3ZCXeTda9MbnIx/V8HgFKIXdYcUt95QGD5Qiv7jQ0tJt/DsCyHJjQ0NgyiOXChRL1daS4Cu1HA2r2FAucxpXkOg22n0fI6EP5QCVSqq5BVcyqkkGVL6qMp5g8xjtAkUja5KO7DyLAOWWauJvm+cSbIqZ8bdvzIdYeXk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by FRZPR08MB10999.eurprd08.prod.outlook.com (2603:10a6:d10:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 09:10:33 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 09:10:32 +0000
Message-ID: <144bbb9f-39a2-4c90-8903-51521e022da0@arm.com>
Date: Tue, 2 Jun 2026 10:10:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/42] KVM: guest_memfd: Only prepare folios for
 private pages
From: Suzuki K Poulose <suzuki.poulose@arm.com>
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
 <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Content-Language: en-US
In-Reply-To: <d01cf1ec-b85d-4af6-9810-8107c0e2a4ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0273.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::8) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|FRZPR08MB10999:EE_|AM3PEPF0000A79A:EE_|FRWPR08MB11680:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f156d3-442a-4963-a573-08dec086f67a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|4143699003|22082099003|18002099003|6133799003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info-Original:
 l8Rfs5PkFu4rGFjSRWn1dpEfnmPrtAtMnLcnbAdPrwF5XIU7zT91LRiQGSC6C9L8FL/bMrVNnU5ciSFdnNhzLGKCL0gJ8HymNmeiGBuu/0NUQ7T4asfCpLw0ZCYM6zMLM3WyEQyGVYlDrkRhqxs3AA3gSlJ2YBBBBzjp+3+sqARlKtW3zD+OnjhZOH4IY7gheh42vasD+K07vAJTb126uDXDmJLe9/8klQ7yLDSyxQQapeHkrVZCGHruKyMHslJly64Zb7lZWY8pLj3jpjLVEmZAOSiQjWu/1CFARfdCxbqj3WoZ7t2b3j/ImV35jPAeZPYpxf+IBCKrmYTAfMf3DQBgPnH5GrLOnZpKObjQVKEcsWzUftU93g8qTPMsbk93AVe8vc3cAQeI0JXJTG2mvRVPT6LMpNeHl0PbJa8VXg5cYE0GKhjN/Fv0XK5OWV4C+tT8KZZMG9dNAgOKBlMulOop5AcVXAktPAY/G5RZ7LvxBLhm0c5zt/otmbFF8SRa/yHc0qIr8Pf/kr7cai3Xc9LfSTrny1QSg/OBeIaxjDTebsHIABdegNkjU9OGx+te1Qc8kKQZ7wfbgoA/BambJpNrNCmBucAGr54oOCZtF4uQbdZOoinhUkY/Z6umBgVmmkpHx0MvJRxObfbivAMB8zOVTDCFPxXTA5mqPuf/rvIjh4bOG1OhV510pYQEkC5rNVFDE04GCyB8uipDRH2KVxpRBdlP+L4Pt8OPslhXexE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(4143699003)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Smh2c1FLMAKkYlCcWGkBMm50hsFfjZPUNbdMvb8pyK4Ze8fzd6T8I2cIV7hKyfXEeU8ZLBIkHRmU6XRbzy2y4CZgwPw3t/Y0nyqVetQ6dL9xlhPYJx1xZlJYudpwXPw0VmZ9M0r8TGx23dyxx6bCCB8WbVd+/kEXu0III9Zkemu3onmm+Yytksku2wPEXg20dRL7HfJK2PvG2D1fmO0MpIukVsAE1f6FuQaEZ+5CnjKmmq+t0KkymU6pffhZHjgAP45i5RHAtwHL/mtsw+rfuBGqLREfTz2oKt6cPo3Fk4yM+egwKVt/C/IiMY3KfyFUCdoQFcG7fLYT5eQfwFbK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10999
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4745e14f-aa23-4307-fc7b-08dec086cccd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|82310400026|35042699022|7416014|1800799024|376014|921020|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K7afR7H4HPemJqJAQRQttdKHyXhF8omwgnxuUe13/k/cSazuYQB7Po+kV2PmqoYsHi98hKOtN/w0xaNpi8L3QcFjWOUO27kxfesZYPHE1ebG8sAG+JM1hx7L40sqrnWFkOp8GrQ9xAxaB3o2NqKsK8TJYMr4N76BOQOo4rOrF+l/POJkWEKQLdvHR/lKuV8Gq9lyY3WIdUQj4J0hWRMXMNc3hNCxrnLnTYeQMXVzEBqScmGjZBmzOJwg8Ez39ea1K6C/S2if2y0W7VaSGXmjyf+P2X+FXP+oEPuMMX6PUv8MDeaTNBOXGPmgq2COpxV+0UNRiOa9/1Jop1+78FLY1ls/8zgUaRqKw9sklaPl5uBDhmePml7ULL0LliLqm2OjWZ7XSbUKxlxcWPo/neXNkY0Xn0/yJ1F+j90GRK1I8CQJSa69Gd1UCNLYUilX2lE0iqVd69OFuB/jfH90jSvX2ahdOOzunGkOgwOUPLlPYC9HFGUK3nKyFaMvnm8H9EzjAVxX9iQXcFp21Sw6cJNI8jnbDfTg2mdGDVY0e5s1M6bcohiUbu3O5qfAlLINmLdNrLqNAKsdYTmBvVqYZjpyrYRu/zwxMh+rwrMN3WGxuirLdijtcmJfMY0MS26S1wUMckTWG6J++R3VkXGrhjziim9B1udYSjUpYTMocYp9PrcpVDiu6VKi5tbYG3FhsF74WmorDOBGYD9RZiwvVMRGx82wM1SAaROVMr4SI+hNcykFbKZPsZN3Vo00IRy7Sj2/xZ9M46dSfE+YjiYCupN48Q==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(82310400026)(35042699022)(7416014)(1800799024)(376014)(921020)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TJ1WQ5LWY6Ykmf4Ryghh1iDfRMOiVPW7BCOtCAmZLNPKY7vRXWhb12EmExR4lmrCyQa6fWPFzVAbvdP3P80LLtco02BZ+Wvc8qa/8tK996EQ3JgjdKdSKBe61DS6M4ffQlkkBvmAfD9iWHer++pyQRTS4zBi1T1zhfyILnibhQBefNBiaAn97FdpI1YhHuZLZpMxfAXgzotTelxtqVZbC4/H3h6/8iPjPPZtHbKqZvxr/DuGR1n4lSY6BEZ3S3/1bF2ZM5/M+WBHSnW0VXYHE/bv7aOjwszopdPnLxVYdbcKxxogTp5oXHjiSPBZ4s3nvmKLbtcEPc8liOj5aCQoUgyNfTmd1sMBDzKYKW2CK7W+ot4uG0M9vwJ5OZOdgPxtZufbxXSuQza4gyKQZCRVmk4nZ6s2T/8TX4JVQ26AonJecVCyMg9rbpHl+RjhQiHP
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 09:11:42.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f156d3-442a-4963-a573-08dec086f67a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR08MB11680



On 02/06/2026 09:55, Suzuki K Poulose wrote:
> On 23/05/2026 01:17, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> All-shared guest_memfd used to be only supported for non-CoCo VMs where
>> preparation doesn't apply. INIT_SHARED is about to be supported for
>> non-CoCo VMs in a later patch in this series.
> 
> nit: s/non-CoCo/CoCo ?
> 
>>
>> In addition, KVM_SET_MEMORY_ATTRIBUTES2 is about to be supported in
>> guest_memfd in a later patch in this series.
>>
>> This means that the kvm fault handler may now call kvm_gmem_get_pfn() 
>> on a
>> shared folio for a CoCo VM where preparation applies.
>>
>> Add a check to make sure that preparation is only performed for private
>> folios.
>>
>> Preparation will be undone on freeing (see kvm_gmem_free_folio()) and on
>> conversion to shared.
>>
>> Signed-off-by: Michael Roth <michael.roth@amd.com>
> 
> nit: Missing Co-Developed-by: ?
> 
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>   virt/kvm/guest_memfd.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 78e5435967341..adf57a3a1f5dd 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -894,6 +894,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct 
>> kvm_memory_slot *slot,
>>                int *max_order)
>>   {
>>       pgoff_t index = kvm_gmem_get_index(slot, gfn);
>> +    struct inode *inode;
>>       struct folio *folio;
>>       int r = 0;
>> @@ -901,7 +902,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct 
>> kvm_memory_slot *slot,
>>       if (!file)
>>           return -EFAULT;
>> -    filemap_invalidate_lock_shared(file_inode(file)->i_mapping);
>> +    inode = file_inode(file);
>> +    filemap_invalidate_lock_shared(inode->i_mapping);
>>       folio = __kvm_gmem_get_pfn(file, slot, index, pfn, max_order);
>>       if (IS_ERR(folio)) {
>> @@ -914,7 +916,8 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct 
>> kvm_memory_slot *slot,
>>           folio_mark_uptodate(folio);
>>       }
>> -    r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>> +    if (kvm_gmem_is_private_mem(inode, index))
> 
> Don't we need to make sure the entire folio is private ? Not just the 
> page at the index ?
>      if (kvm_gmem_range_is_private(, index, folio_nr_pages(folio)) ?

Or rather, we should go through the individual pages and apply the
prepare for ones that are private ?

Suzuki

> 
> Suzuki
> 
>> +        r = kvm_gmem_prepare_folio(kvm, slot, gfn, folio);
>>       folio_unlock(folio);
>> @@ -924,7 +927,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct 
>> kvm_memory_slot *slot,
>>           folio_put(folio);
>>   out:
>> -    filemap_invalidate_unlock_shared(file_inode(file)->i_mapping);
>> +    filemap_invalidate_unlock_shared(inode->i_mapping);
>>       return r;
>>   }
>>   EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
> 

