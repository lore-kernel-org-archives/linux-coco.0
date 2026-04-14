Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF1238C2AA
	for <linux-coco@lists.linux.dev>; Tue, 14 Apr 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161525; cv=fail; b=Y3QZ5vGp8aACcMQbk0MDUo9MhaEHi59HTPMhbL0AHUOYIcTVvmQ8CUXVT2Q9jD9EI7DDJ9b6QGn94w6FGCYen00sZmljtR+fLff9JWc+oRDDqsr5i+VzJWIjs82gnl7ki+3CG1dAuVb+j5rq0wjT0yXn8s5M7BLW794spHMDr3g=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161525; c=relaxed/simple;
	bh=Bl7dNDIK9uaeK9+kAwjhWeawa0yLcEdrTmpQck16HCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VyNaZlHO/BtE+Uetrab/qzsigflUUWoMkw+xva4vqBHVO5oxSi/89qUNLY1BXcq06eDywLzsyZqp2F9qSEIAcq+u8QuDhIDJoSv4IaNCQZhl9OcbuF+uJY3OulnTeT3+x85Nxd2MpY70c2KeAMjCaTMAzL3PUBV+1SoKHVbXmxc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=itnu2l48; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=itnu2l48; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="itnu2l48";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="itnu2l48"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QqxhC4hZ5031haPPJZSRk5/m+1Nlo1uqbgHJ1b4EbnBUYd1DfwoHpbuGx7bNvSZ2Gm4SWV8DqlvoqpfpQsMHwAz7Kiff08VFnNwNfSDSn/HQGGu5Cc2+bfKVG2a3N5gItJWZfXziRisT00efk5oq/vTY7/MdTFbPxuFkroxmZuzOl7o3PX1EoBwkec/KbvlzezUiFWSFpLG6//9WjTk3lvtYf3UbTQB30gRxfS6PBPpgNlNjeextS6OUqWsHMFrrvPKb0KPEHB1M5XOUUCYnSZOrocBy+LinAbd9OtBl5KZFCQVg2b4Ip0NOJiDPtdVlpd3IdRIQvDihsBgy9G5hhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjTMrzfAMUbPahM9455teeqrCSrPly22FCyYCabM94k=;
 b=ad5XHb/W2M17DdiQXvE/BsOChwnu0ZIr6UmHRmDjYwQulpKXEhqIp8L/Vwa6Z8wXy3K1pMLi8akhRABhJD8FtUFvrlRVtG099XW4XlPCu6+VQvOUjMGnExQWmAj8oIu0yJqLb4J3MB1oSFlYjCmLYn6ggmo7fVzlcSHRMU/iBaWbVbUIiTMzb1G4UvNosAtt946kzuwFvQPEqzZvCxcFSIHwoItmzSnLUGO1f/crFiQ4J+tk17FCyTSMERRQboYFdweKJeLLHi22SmLQ1CdEeUpmH0WiaQRn9vaW5Kg3TmrOahJcNrikIp3/E17tVjRWiSFaC6/LM++BN9INWbX0tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjTMrzfAMUbPahM9455teeqrCSrPly22FCyYCabM94k=;
 b=itnu2l48xbA2mbP0jpTyN9AMpP8N08Q8WFcrH+stLAErbafDgWiNIvjqyBKa0q8wML7zx1WOEn+KYFky4F3eR5kDQI8jbXU3AzEaw5JIOquSGIzh19Htn0WlC/KfIXEnWYFCcPPRMH4JaA8sUXpzRwdsve2GO8DplqPTb17oy10=
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by VI0PR08MB11988.eurprd08.prod.outlook.com
 (2603:10a6:800:344::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:11:57 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::e8) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 10:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Tue, 14 Apr 2026 10:11:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXk6vg1HKEWla5M4tumlQDnD/etbGw3CB9DqizqPB3eWigVMK8o8uixuRf2KBJVcAGNMS1ZkjUdZurGPl9n875MwK8poRbRivx9NnIHoGb8GQp9MlOtwyZ9sAXmOtUBVykZ4zcwFnUEpI2pl1kfsGYAvXHWbKpdutq5EZqv6BjmzYQQFlIEu5P86Wqf1mdCI9ccopgasOed8WvwonTf+LgwgHkWdQuRNODQyL29mi0n+E5qRcfzW1EOU8t/bkK079bwmp3avpBKjpPMdIFocASqAK5u1h3Zsz3KT15jY6KV2IEmB0wRjUMgeYSHLueFxXwzRCx6loWdB97QU1VbLJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjTMrzfAMUbPahM9455teeqrCSrPly22FCyYCabM94k=;
 b=CJN66LEAkOBRH8mj8TJZs0UQT128yMC+eelH2pGa3isAEtsVaic+aiywOBFSalVH9qYrlMp7NutTnIiQB201c3QQ6NiSF/Ddzki530f7Ugy+L71oWM4/ef7QzoqkqSYrl0FWc38M6vId3zu3fxpwawfACuJw8GjsUW0ggiESt3ho6kxI1CPn6+PPT+7JAqhWJZPCO6Z6cNvsamxFRM1qNJGuShT+Gj39XESnhlfFMyPeGM3fpJ6vIn5GlPdypy0+X/guu7XgZGIMkIq4nskDqS5ugOK7c69mE8XqHdtlCWaDdiegqWiSDZugPSWN+Hc6Ap+RLsxTI3I9JmLR+5MKGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjTMrzfAMUbPahM9455teeqrCSrPly22FCyYCabM94k=;
 b=itnu2l48xbA2mbP0jpTyN9AMpP8N08Q8WFcrH+stLAErbafDgWiNIvjqyBKa0q8wML7zx1WOEn+KYFky4F3eR5kDQI8jbXU3AzEaw5JIOquSGIzh19Htn0WlC/KfIXEnWYFCcPPRMH4JaA8sUXpzRwdsve2GO8DplqPTb17oy10=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DU2PR08MB9962.eurprd08.prod.outlook.com (2603:10a6:10:498::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 10:10:53 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:10:53 +0000
Message-ID: <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
Date: Tue, 14 Apr 2026 11:10:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
To: Jason Gunthorpe <jgg@ziepe.ca>, Sami Mujawar <sami.mujawar@arm.com>,
 Dan Williams <djbw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, thuth@redhat.com,
 steven.price@arm.com, gshan@redhat.com, YeoReum.Yun@arm.com,
 cedric.xing@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Dionna Glaze <dionnaglaze@google.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Alexey Kardashevskiy <aik@amd.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260413125925.GK3694781@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0095.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::6) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU4PR08MB11769:EE_|DU2PR08MB9962:EE_|DU2PEPF00028D06:EE_|VI0PR08MB11988:EE_
X-MS-Office365-Filtering-Correlation-Id: a322bab2-7836-426c-bf65-08de9a0e4292
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 3imFHxRiIvF7HQWAKv9ncPnMxOxXXw2DwSExRKskI9K6pH+sDut2pt7QPADE6YLvtF6SHkfAObIdh2UsCZXoidkhJr2sPqXCrDDse8LnWlw3Qd+l1/psrzxYoiqAWGLVB3udwWubvBq/bDihDtP6DMSSty/iqO4K+saKvISHsPgEFtemDr9Jt3KzbIuLHmRv8n818DuSnCXb5kgzWKV6Ut3WvWtf/lA1AqPwtHokJB5fRuKkI6VRS6wyOAv1QTqj48Ib6E1dKlGCL/NxKGL0umMPhJ9Xo3ezglaFBVc3goTwjO9r3w2UlXgOBoUR/ubYXl9DxoRhEKRZiHfTA8tJZrtw7uLHErQD59m1WUNmHyaQCoQ52E/dLngIK96YHJhmX95ohvgb5bHK91hZKSEwNLtBT5SIMJH0la83ojWFGCxVmGFnJ+IJsSOJkVWNz7Cg/VVDGxvhi/+Z6LgBS5K066xxJmkzfmTB5yLuysL23sObFnbmQ4ji8KEYUdDcysdsu5LAfhHWtn3tPeg6GNIOplAvUj+0jqMGzwul3ok/7D/lTTof1WuYPUMyPz6v/NUz2VwAii9gVoPUE4HgXgz3BZH9rOd1t8uOb0AOknDy6XNTkJVC8l/6eP6Qy8PWeCca2P6L5m93R/tSCZ7bpkfcoNg2NScYS2HnZMD2/1WnMbB4Ho7CeiER/+cFONX0v9h+Zp6xojMiACU6dThAZZb5gHHG/Em9TS+kz4stc8/HT9M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 a1++B22PZNeBnKNbELjvWjpnslFSveNfohI3qp9pJ49mFDevdQtfuoUNHo/Qvr629Kh56S6qCjAk+dFZKeG7L0kFSCwLEXf4lafUjK90iOJvVezdzWsFBzkuxYKoAd6KxNeKjwMcng2XzU1ClURl8yeSFNYma1UogohoRuOS19ORMmh04EB90zyaHJOqvi/yAh6T8YUuwR2zgPVIt3pfNmWDtSseuQ1Lu8WWcp5g51qegdtpSjRrp6GiyFdDbWhK772wNZzNviSoo/a7KgwCX3XHaFvgGInAFaCUsgw6+Bd7uTGDtxTzLkaI/uh6zyljb12yvHftjYvLponl7qkTkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9962
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1059834-e128-4f2c-5d4d-08de9a0e1ca1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700016|7416014|14060799003|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VNu34kioQnrdkna3LA/at3cZuePXk5wl1H39Z+ckoGS7yHtGgw868d/xvpkphup3aCV3AMUmXWSNgITcfoGpMWxPwP1IGGG2wfEYqoQqwTdBHfHBSUyFo84AzCnMwcWPXiMH6pyrw0x/7CDAw5ztwodMWpJDGIePqajFZHx5iAQMo/VrCY5PKP8QKCyTULrN9JiZa/6S6+8NRyEAaAXQJSxpp0TePDWKr71H8VhLuUcG2z+IDXcl535ZFbotbCVNfdwWmHpIlCZxo2vaFob7uPKJEx5eiZOyrf8y1/XgrQEePjxIFOSLUkmvX7NMSzWcuqbfBPHbltodvvS9EgOxYjjuYDau88qdexPcmWm8PjcLvbpQpHzYlAkaVSFGsYg02FyQrTmjN9P89TkXZ7PwC3VOOoqliW6IjHgK+WybCMxRkNX+cV+PHqvh8gZUOtp/yoSGljX5/F9sL2LSb9HuNkpJHvspqGIkJG2uM8ZTSiAegzV6NfsNSt4xsiqUwRKfcKFauzXyh1S2svyhghTAdWCOQq6OrmuFi0tukKi4HEK7dn8AGIevYTCdbv6puE1OsklOVclpfCImLjpJMNEaeuBRy0IXln8kS4mP8Av6szdPYbGdGm9u76IMhyvVbhN2U94asJCcmqOB+SUY7LoRdrEUwB8icIZKTAFeWucZTxn1YnJ4QDMy9NWySwQnCV7nfrKKCv4dcnkX3hejuiMLGNWtn0VjBmMKKrlPkAwiJxWd6HBtAWVQBkfGSPKCBYbk19z/BohU8cPPexYKQAqKvw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700016)(7416014)(14060799003)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8qhBa9c4ZjC23aiUCbQe/U6RBfK8CEU45JOMgR9PTvQfPC+aHPgcaC0PDKDBe7010J7DuY7TD0JR0OFD1MjnQxmw69itJz4QdqhYD1qO4KXn7Mo6U8uPkLRPDXRNivks3ZwblcnkPK5dsuC4DCnHRipbZ1OKbFnoSmXq/IIi/YhL8kvxHBUa1DNqDisbpifmaaK7TcA3wGnMmdhT9z9ltSIPB2Qxy0ZMBCYJZDyDBD83YelPk2TzuX3NRXFz3ibXk+aihm/uiVvWGgpcoAkYF48upsNWa4wl/cpOl9i/RH7dww3kcLcgxLeY28sxWon5HKD3k0gIAFsJ3eAEeV/5268BrAxGAwpO2+VGPvuRA568nOt3R19FKoktf6Hwb1jyy1B7YtsHQwQvhR7kcpoNXHkxvllFk0HJvB2rZ8GHkHQmYarOxQgc1N0UVnGsOWAo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 10:11:56.9352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a322bab2-7836-426c-bf65-08de9a0e4292
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11988

Cc: Dan, Cedric, Dionna, Aneesh, Alexey. linux-coco

Hi Jason,

On 13/04/2026 13:59, Jason Gunthorpe wrote:
> On Mon, Apr 13, 2026 at 09:49:54AM +0100, Sami Mujawar wrote:
>> This series adds support for Arm Confidential Compute Architecture (CCA)
>> measurement registers in the Linux kernel, enabling guest Realms to
>> access, extend, and expose measurement values for attestation and runtime
>> integrity tracking.
>>
>> The Realm Management Monitor (RMM) defines a set of measurement registers
>> consisting of a Realm Initial Measurement (RIM) and a number of Realm
>> Extensible Measurements (REMs). This series introduces the necessary
>> infrastructure to interact with these registers via the RSI interface
>> and exposes them to userspace through the TSM measurement framework.
>>
>> At a high level, the series includes:
>>   - Helper interfaces for reading and extending measurement
>>     registers via RSI
>>   - Definitions for Realm hash algorithms as defined by the
>>     RMM specification
>>   - Integration with the TSM measurement subsystem and sysfs
>>     exposure for userspace visibility and interaction
>>
>> After applying this series, measurement registers are exposed under:
>>      /sys/devices/virtual/misc/arm_cca_guest/measurements/
> 
> I'm surprised we get some random sysfs files? How does some more
> generic userspace figure out to use this vs a TPM or some other
> platform's version of it?

That is true. This is the infrastructure for exposing Runtime
Measurement registers (R/W) for use by the OS, complementing the
TSM_REPORTS (Read Only Platform measurements+Attestation Reports, e.g.
on CCA Attestation Report from RMM). Unlike the TSM reports,
this doesn't have a generic interface for userspace.


> I also think exposing PCRs as was done for TPM in sysfs was something
> of a mistake.. Allowing extension without logging is too low level and
> is very hard to build an entire attestation system around.
> 
> I really think we are missing a subsystem here, TPM has sort of been
> filling this role in a non-generic way, but we should have a
> common uAPI for platform measurement & attestation:

Agreed, such a subsystem would solve the below.

>   - Discover available measurements
>   - Report signed measurements, with ingesting a nonce
>   - Report measurement logs
>   - Extend measurements and udpate logs
>   - Report certificates used in signing
>   - General reporting of various kinds of attestation evidence
> 
> And it would be nice for the PCI devices and others to plug into the
> general framework as well instead of building a parallel TSM framework
> for handling evidence.

That makes sense and AFAIU, there are efforts in progress to expose
the Device measurements+Certificates in a different form. May be a good
idea to intervene early enough to see if we can find a common ground.

> 
> Isn't this also sort of incomplete?  Doesn't anything serious need
> signed measurements? Isnt't there alot more data that comes out of RMM
> than just a few measurement registers?
As mentioned above, this series adds the support for Runtime Extendible
Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is 
already provided via the TSM_REPORT


Kind regards
Suzuki

> 
> Jason

