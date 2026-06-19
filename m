Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ABE36A36B
	for <linux-coco@lists.linux.dev>; Fri, 19 Jun 2026 09:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863141; cv=fail; b=X2dpswQGh0AOvo81+WoCA5YWBQp8hOrf/zOLkqcsFsEePH2DrfRZtAxyC/O7fjXkN+ISour5A0YYgcFUit1smZS3EblCaEw+FEcnAattdUANSutgRaEJ8RGE8y6rYuZigaWeIRMeJbEbKRSZ46lQ+7qEDf7qumtt6oultDvaOWk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863141; c=relaxed/simple;
	bh=/DyawItpPQuRzEto3HD2Okfg5K+GHZgG4aIKPqR3m28=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EH38bBCyHTC0lvzyk+5oLATWT7LNEz9IsVpAP+JxeWb1ZYuigx/3O+uQy2ogjJ3hz+fIsnKlzgK6VCfDYzPO7saQ3GWp0/uiwpvmFeSC6b4M8g6ZWx9S+LTcCoQKf7bMsfeMGu80r6chEuw4CxabyVWqqwkb/IbTPvhX5eu6qyg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dudumu55; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dudumu55; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dudumu55";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dudumu55"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UWJ6DrSTLwxsLSZKQXiWKmn4ljBBtFPxnHO0G1E3v087h0JKSXKlMRfeN0H8U6QvHjxgxwgVMxXD+vxxe3bNUd0xuUHr3dJCroZwPz3AdIr5stf04R5taBP1f4vMMTYCrY9uGfu+TbC3EY72PLOmUnqdR+oXVJQy/+mAejfnOINuK5Uh+oAO6snVjSR0Q94vuEhGnynPrcxOR5y5y0jTyCSj5O8WSoj64PFgsuODGugpzr0Ql2XbwxEFhzVJStda/Cg5/OGiZ5rnSZgQUNdYPL3LR55NfC5rbOfqlPNvS9Nman/V2XyfflqqA5oPXk0TfM6DLTDKk/+k5iVaBq+6zg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOXd5q0cOZ2LLFsKgopDMU+oE04WeJ6OcHZqFCbvxDc=;
 b=gxTDCV9T7owWg7XV4SHXCGY9Km7nB2MxMHwsQiPpcnH3yQ8BlmuM+MSNVuNMxc+HhtL+B/X7JWmgzMkJAKMlWOpZGiC9XCHxijFUAOaA33Ql/HpSQgfVpJADkjMKz+/PMRs4Oc1B+5wEFDRz2jAsLvvcRmPn4sf2TLWObw1JpHkuBOjNLWbt2Zh1c89QI4oJMfTBjwPssW/nZMkDrXDCVmHGcUOIpYPNK32LKRhbgXywza4npUX6BzLZMrpb7wRH3A30UCWlTBk6eaiq5LTVqrMn116zLsnmwc8H2wWI4/9kQ13CTiN5PNjcsh9Y5XNLX+M8Lbgt/DnU+nuPktZTWA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=intel.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOXd5q0cOZ2LLFsKgopDMU+oE04WeJ6OcHZqFCbvxDc=;
 b=dudumu551XldHBKqBRaF9gButeOZ3fgj7Kp2hfQ2hQMTYeezZiNAEfKEUQbw98H8+vojqC6cH0TC7HtIEOwOmdWllt7XXqx9S9wuuGNIhOHfmsy5wEVjIBSxSJ1A0r0MJ10jkguoxTYFqveyZ4qRSjsNvFiWHMZyXuDbBsflN5o=
Received: from DU6P191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::15)
 by PAWPR08MB9097.eurprd08.prod.outlook.com (2603:10a6:102:330::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 09:58:47 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::81) by DU6P191CA0040.outlook.office365.com
 (2603:10a6:10:53f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.14 via Frontend Transport; Fri,
 19 Jun 2026 09:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Fri, 19 Jun 2026 09:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBoZeYI8lGvW09PisUm5pfKOl+ZsUEM3DjKQTJQhRheWpGmrLDqhfrSgB6oBk3jmwvjA02rYnAuzRcjjKO9OFLxwYcs6uS4dnfgdLkzKLfIrv+nfzVJpm7xW3V1QXFtm81N04dmMT15AGX6Sw59YKlWlva5a6DyLBuzzNgj1WiVYvp1GocsdtdlYOwJ615nLDGdx99Nk7NV/FtIzFTnH5CXAw7JZmktoBPicyTAqHaVM8dcssYuPdH7u9UjEipaS2u+JPDcvbm9I8U5sEZsLw65vNZ1YNOUbk2WN5Gd14KtkP+Yfu0YjrNUistfEMlJ2bYAlTXhctV6AFPbGwgKHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uOXd5q0cOZ2LLFsKgopDMU+oE04WeJ6OcHZqFCbvxDc=;
 b=sCPKb7s5W5GsKSqBULbJ5UOMkt2bsHVKpa/Mnnt3vdd9kybUjMbrvFOHKkivZYUfbo4S6GthahuRRB3hCkViKphor6Uxwk9mJfmzn5OXECD9CJbprmNIPmsRoUPvsdIzwLL6r7lpd8Zx+nZxqkvpUcZMXiQUZyjG0Ynx6Uuc3jH7nXsQrzLidrJyu/PmHTbseeiRML2OZPxzudMrM1Wz40UwbUlFMSsFyn1zyfLGghrVlORidiGtTePS57IqT2c+zRluyBOc8n6fuepyaMpwRwZl3XVXg0ZytDhTwOzit/rn60ZUKCvnDQ8gEotBi82HG8yUZxVgUJ0hftRpTmsUAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uOXd5q0cOZ2LLFsKgopDMU+oE04WeJ6OcHZqFCbvxDc=;
 b=dudumu551XldHBKqBRaF9gButeOZ3fgj7Kp2hfQ2hQMTYeezZiNAEfKEUQbw98H8+vojqC6cH0TC7HtIEOwOmdWllt7XXqx9S9wuuGNIhOHfmsy5wEVjIBSxSJ1A0r0MJ10jkguoxTYFqveyZ4qRSjsNvFiWHMZyXuDbBsflN5o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DBAPR08MB5718.eurprd08.prod.outlook.com (2603:10a6:10:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Fri, 19 Jun
 2026 09:57:35 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0139.009; Fri, 19 Jun 2026
 09:57:29 +0000
Message-ID: <3ec15992-2a29-434b-8c99-8b86bfcf007e@arm.com>
Date: Fri, 19 Jun 2026 10:57:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/46] KVM: Provide generic interface for checking
 memory private/shared status
To: Fuad Tabba <tabba@google.com>, ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com,
 brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org,
 jmattson@google.com, jthoughton@google.com, michael.roth@amd.com,
 oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com,
 rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com,
 steven.price@arm.com, willy@infradead.org, wyihan@google.com,
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
 Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>,
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
 linux-coco@lists.linux.dev
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-8-9d2959357853@google.com>
 <CA+EHjTw6x-mxDnJjnhE-6SV73tMrb0paKDTtOC2j6zJ1fXZDLA@mail.gmail.com>
 <CA+EHjTxu32nQ+vPV7Zmcw76_-V4g2_g=P_UzRnnO2dP1PFO2ww@mail.gmail.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CA+EHjTxu32nQ+vPV7Zmcw76_-V4g2_g=P_UzRnnO2dP1PFO2ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAWPR08MB10975:EE_|DBAPR08MB5718:EE_|DB1PEPF00039233:EE_|PAWPR08MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7edbd9-fe75-434a-bacd-08decde95a70
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original:
 0BarHkqB7oUdO/TPZn+CkBAWcqDOOI3OGPp7xS3tsksnEZ+kDpTW+AQNtAcZqakOWvMNMjfVdMwWqTvYTuY6Q6Xynu0UKGmBtw7raYoLQ1PAxYr1NmY7fOkGAR0Z3d41e3L/Bj/aqmfcwKyMAHV2NaQyoOsJcTCRpVNPNmbkWLm8Bcz7T7rcDZbCt+93V1GL4PhJSiEfFTtfHX5Lu6xMEaSnOVmeNvGKC5aZk858dMdnb/GXs+PYNrxpTTP08gAi5qXdZaPoKOcwmGiYAZeBdpolrzyDp1UYmfffcP7QBaUmsyntQT255/6+VyiaZQ1Pd0T5tgEQXn2OpT+GysTMDZk3uggPQz4smJYzMj12u7dOq2DZjZS6xdSkZcMILYwxvDhHrglRMC5Y6z1RHfa/6abmebNE28kzBu7bkdJK0Ei5dWmXxml+k24iHZh67QiZjaLsEjUu+KIHMYUZ4Z7rzzr+Q9x5vppTXzvBwa84Yz1jFwoNCkmQLfVPoXsftRx4UfQY1jK/KUfTvMN9d/JBZMp2X/c4YSb455goUntv/PzdilvbT9dda8iJIbcP4mBM05rFdfZRAv/MXh9WcTxxpy2500OXLLlTlH836CZd/pBtSqebzOciIDQUCAQbzwFCWcKywVqqHwDwUMwAwOIJA8ullli/yn0VCWSyBRTX8oE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 XiG73K0VTou2Q6upM9CVtC3NQJfszAsLN24pZXF/YSYxk30NzJdmmufE33ZaksGkGQuNYnr/2JbhQOnX8lgiSdSYsxme4k/qCV6dI7pUH+6eoF8y/SHUm8+XWvONVhLWIt3srfvbMrNsi+zyBBCB5JjU8I22DEPLFkbrzo90iQgzvq0MFU3WnxFX46zPiSOut4xWEDxIa1DJ31yWS0kylt39pitQEQN3V95oxUdqMKJgUxpLZ8jKi+70w5+LFU8lhj39hHmpR2kGGy+WmB44292OSmq7up9ItZ68KSokxDFzZkwPj0qGFVyemSbISzHPh7xDzz5xj+Nkua9+yihvug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5718
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53329b84-b658-4fd8-04b6-08decde92cd5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|23010399003|82310400026|7416014|35042699022|36860700016|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	xbfn+kXdz1R4lir/t13aVdYWUcIw4SPI2FGzUpukj1W3X1N1sFrl1ueS6+KUc/iWzb3D1Zf5+t67uxuq0vLpDwGF8pD+E4hmJ8viiVdHM/sU7TtFEUd0i2L5uQ7kpkVwh7OWYq/7La5DuaTRrf8Rc/DESzWLfNsp4nP1sA5dlyXOvXOZnQEkeBUdl7d5Di1jo+FQH3efgEfYbUpqQ5RDK3gMlHIauvtsgikt6H32Xtfnwoe3QPmbZUn8QZk9eU4NK14ZHf14eEKxDNDFhpeZaS0sUkesDNI35rZVpiIz4hSvVun1vnWrVx34xrRLVi8HCeJ9iWi2AJuj2mhwxwriguJ1SstFgaw5zhP/o8Q+4f2g1DT9Pifqp0wCNS/m2D8e0xhIv5gICF0W08H5KV2JQXjvU1BS9tgaIG9nUuoULnCagaAf8glS4G8nd4QFE0g2xepTB+ScwLRMrvhIc2JrdaPqwwCFYrqYRNNXT1HquaWspPAc+iwB5jGj4S5FLnskteA1/STAKtLbkaHPQo99RuHBp6YRcUzKbQumDF1roaisiIeBU+5OE638Su33dg/i4woGCnYYYFewFD1WhXg16DzJZOtC2EoKgDKUttMteC7mILNPBfpjpzM/m1bULJrzzy4xHZgdy3qx31CEhfT8WogHO9nvc0BM5QdLwwk16e3SZrs+CJle30PDSb9JnLmDYe1zrVJWzBPnkSvm6fTxXQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(23010399003)(82310400026)(7416014)(35042699022)(36860700016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AXF+j/boo1Pw5Z6NdNKGedTTmFPtoR8I1/AlWBUY2imK3lpwr9xA3WSLNjICGANgsHKwaR74T5iU7ohSpc8JZ6kip4MsFkCXtFKj7nC2KZFD4NYm3DJ13OtYHC7+QekhZpbWzKD9CDpIBTbpQo2aegz2/qlJ6X6/3mCo0Vz0dSvUyK0/EsywduhbbWvdN7h3mKrKTyRglKcs2IuSvWDzQm+WPE7gIVyMVW8cK3+QmRQYN5UZzrUvaZfE/d2xWvbmVLYwPZF4HLVdyyhbe9Swl3OTlTPitFQoI0vIgdx+uyLnGqshg6E+YPOrB0manUer3Kx2lAueFE/ie1v/CO7PQjKwdu10mgkdn+X2nNrvt3NuWbirIOiMBW8maVFZR2ai8znfFG00ujuKCa6wU0ozgrrbapkXGhAsLFw/WyNFgT/Q7pZ5M5p/V/jKkAr6Q9Kt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 09:58:46.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7edbd9-fe75-434a-bacd-08decde95a70
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9097

On 19/06/2026 09:21, Fuad Tabba wrote:
> On Fri, 19 Jun 2026 at 09:19, Fuad Tabba <tabba@google.com> wrote:
>>
>> On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
>> <devnull+ackerleytng.google.com@kernel.org> wrote:
>>>
>>> From: Sean Christopherson <seanjc@google.com>
>>>
>>> Introduce a generic kvm_mem_is_private() interface using a static call to
>>> determine if a GFN is private. This allows the implementation for checking
>>> a GFN's private/shared status to be set at runtime.
>>>
>>> In preparation for choosing implementations between a guest_memfd lookup
>>> and the existing VM attribute lookup, rename the existing
>>> VM-attribute-based check to kvm_vm_mem_is_private to emphasize that it
>>> looks up VM attributes.
>>>
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>
>> (SoB fix plz)
>>
>> Reviewed-by: Fuad Tabba <tabba@google.com>
>>
>> Cheers,
>> /fuad
>>> ---
>>>   include/linux/kvm_host.h | 12 +++++++++++-
>>>   virt/kvm/kvm_main.c      | 15 +++++++++++++++
>>>   2 files changed, 26 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
>>> index eb26d4ea8945a..3915da2a61778 100644
>>> --- a/include/linux/kvm_host.h
>>> +++ b/include/linux/kvm_host.h
>>> @@ -2546,7 +2546,7 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>>>   bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>>>                                           struct kvm_gfn_range *range);
>>>
>>> -static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>> +static inline bool kvm_vm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> 
> Should have read the Sashiko review first, but where is this used?
> It's not used at all in this series...

See below:

> 
> /fuad
> 
>>>   {
>>>          return kvm_get_vm_memory_attributes(kvm, gfn) & KVM_MEMORY_ATTRIBUTE_PRIVATE;
>>>   }
>>> @@ -2557,6 +2557,16 @@ static inline bool kvm_mem_range_is_private(struct kvm *kvm, gfn_t start,
>>>                                                    KVM_MEMORY_ATTRIBUTE_PRIVATE,
>>>                                                    KVM_MEMORY_ATTRIBUTE_PRIVATE);
>>>   }
>>> +#endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>>> +
>>> +#ifdef kvm_arch_has_private_mem
>>> +typedef bool (kvm_mem_is_private_t)(struct kvm *kvm, gfn_t gfn);
>>> +DECLARE_STATIC_CALL(__kvm_mem_is_private, kvm_mem_is_private_t);
>>> +
>>> +static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>> +{
>>> +       return static_call(__kvm_mem_is_private)(kvm, gfn);
>>> +}
>>>   #else
>>>   static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>>>   {
>>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>>> index 6669f1477013c..8b238e461b854 100644
>>> --- a/virt/kvm/kvm_main.c
>>> +++ b/virt/kvm/kvm_main.c
>>> @@ -2627,6 +2627,20 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
>>>   }
>>>   #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>>>
>>> +#ifdef kvm_arch_has_private_mem
>>> +DEFINE_STATIC_CALL_RET0(__kvm_mem_is_private, kvm_mem_is_private_t);
>>> +EXPORT_STATIC_CALL_GPL(__kvm_mem_is_private);
>>> +
>>> +static void kvm_init_memory_attributes(void)
>>> +{
>>> +#ifdef CONFIG_KVM_VM_MEMORY_ATTRIBUTES
>>> +       static_call_update(__kvm_mem_is_private, kvm_vm_mem_is_private);
>>> +#endif
>>> +}


Here ^^ as the static call update ?


Suzuki
