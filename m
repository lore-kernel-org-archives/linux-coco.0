Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697EB3BED7D
	for <linux-coco@lists.linux.dev>; Wed, 22 Apr 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776848295; cv=fail; b=cVc5VyZ0oyCwMOstTCp6Y0vXXZz0lziln+Eq7oaidYfuIFHT28+vrN/KX2fVsTNYeELd5QsL2m2NHmeKsp4ll06AwUfqey70m73QFUtY6M6VcX0ceYuWC3xMk4W16FZ2wAPhcW7mn37qcUUlDonxA6Ig8JF+6IQ9sFfzKSzrKc0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776848295; c=relaxed/simple;
	bh=s9Qmkm1JzRx3haJS5YRrhU/l5zoeOWIGqh4zrDN6+kw=;
	h=From:To:CC:Subject:Date:Message-ID:References:Content-Type:
	 MIME-Version; b=V5ldGNUCoHZTss+RQv92hwBRg9pZZJyujqKKzq4ljw8i/pDSf1xpOEckoSZoPhAVu6RAtAdpFL4L+LdEGmnio7fGeRw/hrZU1f7jHQkZixkJY7eKXo0QuxRVaLozsxoO8heTo/GRDfgFxCozDs3srLqLdZAnIpsOrG1Qp8SUwFo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kotfe10Y; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kotfe10Y; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kotfe10Y";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kotfe10Y"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZqF8b036ojqcLsDJ318tdovoqMQRX82sDidWpsEFyvyrvYQ/l+oN1zf1f9IiUnVaLDSjCwBxcy+2KmuAp13dQP88GbFpzzyr1dySbkgG8zK0l+oXQmTnOGBhqnWNbw3EOy29A9txm57FEZaETN0mXi97xEur2THE5n1kERyKVJ05QAufjnB8uzbai1uMDX6nOUrb6LFpllxi6XldjRUdXVga1p1sJ9YuorKDDYYiUv7/pYodTbaG0/vJ9EJiwgm9z2YiwthcKQMRVChl+EojzjRPm34pS6hkG/LGEf6N2OLM2X7Pb3xQCMlmHtysQKnx6/+7acjWgJpBVnhpPyFw9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9Qmkm1JzRx3haJS5YRrhU/l5zoeOWIGqh4zrDN6+kw=;
 b=uisUirBVufiDspORKvyObUP2VCvxsQi4WEPB04EYTIKgf7Im9Zi5fZ2AEi/ob0zUxZquiR7zZICIvHSEjwIFdaLUr87NTZwJgcoF1qhIMn31C5Niv4BoWEoMAmHVvAoRhr1OZN5ZqLlm3w7FBY2WDs4wi4vH9eJ4dx1IWkbd7idUPk4HWNENRJ5UmUJnqy9gpMaFTxgIA66nKzZgS4D/odn/VBqx3sRz9IbRIeKdeXtMdFNSl+2Yu8xy7KfksYmtTvupgZmPNbj6zdBah4RMmEoMN9PvY2waKN6SpjPUprsZo0QbaZixSAHHSD4bHnx1epIyRJqntdytjgaEh7SDbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ziepe.ca smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9Qmkm1JzRx3haJS5YRrhU/l5zoeOWIGqh4zrDN6+kw=;
 b=kotfe10YIaVkuLhjetb6VN4WOTEkPpdSVqHRqn/b/J02w4BigqLziOpAbuLQfos1kw6/mKU6Bd0jsrcDo94XGC6wj5g8Sx3RYfUQjoI13wh3cfTPxrbOTYtbWs5u+s7SmMrnfYLUCq+ccfy8nF9f8zjV2fJWupC8FQjsDD4tDRA=
Received: from DUZPR01CA0222.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::29) by PR3PR08MB5755.eurprd08.prod.outlook.com
 (2603:10a6:102:86::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.17; Wed, 22 Apr
 2026 08:58:06 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::8e) by DUZPR01CA0222.outlook.office365.com
 (2603:10a6:10:4b4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 08:58:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18 via
 Frontend Transport; Wed, 22 Apr 2026 08:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hp68f41Ge1HxZoSBJ0nISg6KlMbUVYSTUN0edR0vr7JElBZRRnAeWL2LMvLCUs9pDdwGDOIlJH1VQjBuf5eotMe2vuACjapbGZqqn+otySbMzGckxheyLwrnVfHxQj7eBkJxcUw/aSZeVn2kPBxipjMbwB9NgxCf55Ogh6MChqlkhFSa9JpAY+9EURpdEM8C5wRS4Fo+3ihwqwhaLJa3ymR4nczUKPqQ+NeVTUIKea3Cplf35Qn/NbBVgFbgAqMUxxP/+6OYxVc6FTxXG8/ziB/RPLZ1OTpXjmQMTCLqA8GUGt9MERfZrNW5ru1HwHOYbowcMDN2O9j/96afK+QN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9Qmkm1JzRx3haJS5YRrhU/l5zoeOWIGqh4zrDN6+kw=;
 b=EO2720+wPQXOd6MVcstsJhJNhCvEhAxzm3r5aj3Pt1ogEMg413r7Url1KJwDfchJWekgtGhfBew3Z+8/cGdO2vVCfSk2bfxP9k4yeR2bnJJUy9fQtMzsmGHZT1NjxvIIyqMWLMkYqoD4CA7Wli5qkp7yh2QBvSdgIBSH8xC3bJvKEHQldXUtxbHHwhz/NTJkTZFdYRQo7biXQRI0KiM+pl/HUexsgzK9OOIPvUMrGKhMPvVaZoH5ni8W3zfQEen4dNttfAO+o1v7haxDetue+aKKiQ8sMY1v4Ukg0JKcEp1Dg78YbtM3CkAUGLzCh77S5rEKUjUDEsWYzqwYEuonRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9Qmkm1JzRx3haJS5YRrhU/l5zoeOWIGqh4zrDN6+kw=;
 b=kotfe10YIaVkuLhjetb6VN4WOTEkPpdSVqHRqn/b/J02w4BigqLziOpAbuLQfos1kw6/mKU6Bd0jsrcDo94XGC6wj5g8Sx3RYfUQjoI13wh3cfTPxrbOTYtbWs5u+s7SmMrnfYLUCq+ccfy8nF9f8zjV2fJWupC8FQjsDD4tDRA=
Received: from AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 by DU0PR08MB9226.eurprd08.prod.outlook.com (2603:10a6:10:419::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Wed, 22 Apr
 2026 08:57:01 +0000
Received: from AS8PR08MB6806.eurprd08.prod.outlook.com
 ([fe80::1b53:334a:169c:55d1]) by AS8PR08MB6806.eurprd08.prod.outlook.com
 ([fe80::1b53:334a:169c:55d1%4]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 08:57:01 +0000
From: Sami Mujawar <Sami.Mujawar@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Suzuki Poulose <Suzuki.Poulose@arm.com>
CC: Dan Williams <djbw@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	Steven Price <Steven.Price@arm.com>, "gshan@redhat.com" <gshan@redhat.com>,
	Yeoreum Yun <YeoReum.Yun@arm.com>, "cedric.xing@intel.com"
	<cedric.xing@intel.com>, Dan Williams <dan.j.williams@intel.com>, Dionna
 Glaze <dionnaglaze@google.com>, "Aneesh Kumar K . V"
	<aneesh.kumar@kernel.org>, Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Thread-Topic: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Thread-Index:
 AQHcyyK0b+dWjL1o8EaR3xrqT149srXc9HCAgAFjPICAACbUAIAAD/cAgAACXICACTPseQ==
Date: Wed, 22 Apr 2026 08:57:00 +0000
Message-ID:
 <AS8PR08MB680669CBFA9654BC12179D5E842F2@AS8PR08MB6806.eurprd08.prod.outlook.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
 <20260414133525.GA2577880@ziepe.ca>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Microsoft-MacOutlook/16.107.26040410
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB6806:EE_|DU0PR08MB9226:EE_|DU6PEPF00009528:EE_|PR3PR08MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d9b4c0-b47f-479c-ea04-08dea04d44dc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 Ist+t96875+b/wAJA2oRgmRogn4inK+TfXCHmfIYAqoniFpchfv08mcpXBTrLCPMQ4ly2SkfJ4nYPBku8ojMqmg2JmpeZTTnyddZNB8jvsIF+r96tEc8/aEFrgSun+XSbv4hXTkXHzSJcIu2Xk3n0R9e8nzFxU7JRzt3zF4UXrhuQf4P2+4ddRsmmExBl062JJK7ZitRnEY8MByvEYX0piqzublK+IXt7Inq++f6DIuo81rPgHRyxYDhPy41Mo7eMljZPNVQEH/Xqg/u/XQgaV06ciLN4scyTXHFePicMXw32kaZpGXVXDcRXgjqB828VMb0Xk8WuRTqayVMVqSO4xFe1i63s7VuhHnGJ30F+E9I5nI0sp77uYdlnScElOw72wXo/dscEm4ElzmOiC79H1l/7wtBDuwt2NAp3rADRUd15M3N8WcaONJ7V9WtPsGprxDDVOqfbfhQKg99LdgfZSFI//f4dTuzIYWiVKhane5YOEs1vmjsdzYHgJl2cCm6nxO9K00+f1rPbpGxjAfP3idLVhnaewPJNMqNegd/kG3ZMsIQmneEyvA+Vk9hnaoS0nletUfI8VCCuIlYOpxu60nYZklUv+o1LeRMZ9VGEnNHaplUfG+90CEINsR1Lq5Os1h+2lLllg5cYLKwzUm3s6SWOqFREqA1ExGsAKdp2JVdVU9g5WENxixtmpUJXlKHoBAfdUff4aEAn8CcOvwj5V0ja1Kx52hZb3+Ubq0jzUSCJNcqi0UKoTj8UH6QrM5951vk48msbNeyGIIH9RNxbPvend44CWVXGNHDI5NB4WQNlNJaTYSvTZMCh0+dMulI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6806.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021)(18002099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9B3C6FB3BF60941A34AA3104D128600@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 BmCq5Ib3lLap0kUOC4I3Z+qCQxGEL7ZJJDi+vxzo3bsNOSEhNDjAo0ZSwN9VYVqI8hZYDOw5CcFcC5BlDT370K8UhE2libA4xHDnoxscf2eb6L4nFKvZb62+EqwXxlx0vCkS8UpmEvKKkBb4mSYHUk1eNiGMeKkIUh1tOwyL809P1C7WDPQA4BNsAYnLi88VhlGhCnuqh58DR+OWUH0VjsrhNMDXf0fBo3I1tTMKG6xhgRzEa6L4LcqnxEaJZTJzUW4HAEZEitS2IKqvzVAjw9m9BqQnFH2EzUHv7xpjh/HCUEr+dc/rjeDryH85yot0yrlTZHrJbqH49tUQgKjEiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9226
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1881e1cd-f02a-456b-a8f7-08dea04d1e14
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|14060799003|35042699022|82310400026|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7H2vDNfHDWHcBlqiNKGxqzbwiDGME1VdVzP11FcwAMwBcjFBuHOfasNUQsIeE/b7D2S4HiBH7XMxhJvEbHleb1vn3aAAgTQOPSh5sjjxpJFYnq4in2NCYwA214ndYpx2J/Z99O8fTCOYSFGqMueOYGidCKV11/8370qRzpkw+2SU7aOvFD4fcwcErjWFApHkUEnIHZZd9ZUF14mP0sxHvxTBnEll3eJlEGhrTQvHL2x0VeoRK9AB2xzNzisOlgtRO0WgdsU8wYBE2gZ+NdI9nCQBbG5Nkb8c4dmB3AKzlUOqMypExt8k9qjTlkl2AV9O0b0b10PhsaxzYYyN2QGwWYKKIx2BDsl9s4LbfM/1x7TeQ9wNTYiGZM5cF2ek/tXueiOW7wQPg27xabmx+TH95a9JjCDaW78fU8FzFM4MtyYQWQPij/Q1ovVdwiQK5d4aI8Cu7vUNFxyRGkIJdcA7ea3iS9urheCBv7zKtVOxRzjO42PwUbSNfXCpEK/zfKR8Q3DuCCrdYySQGqF8TAD3jsuaZ53DjdXBBVLhnEmEad+gr5oz9E8bOUnH88obv6nt9xXQoLytasVgtXR3Kp/bwjYjt3B1w5OgaC/v1a+XpVYpcufJWtcscG0dvtzsoLsLpF4+c+iKwmFmKMahSoSQSoBMS1lAP440gn6fAWd+xSP7TU5lrowu95q8uHLgp9tCKENAANIFZtT7v/W6bLuW6WNaABQ5RC0b3Dg68uZcTaEYF4WRbiXMeLghk7wkA9umUzRTJto6PtikxbIpbe98HqKWIfRjKpfiWIjLUYrIQQ0=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(14060799003)(35042699022)(82310400026)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fQkuqWIISp/oOy394dSqq7j4OAq0lhgawtsp8QgOwFK90FjqvW8NMHxW7woYaqw+xQZQcFbgpPE5DZZ2eFIdRnocEBIYN5WJfudYeRf8aPP0pLtpuoDmI5RByULclZYc1RPqlSkx3KSuBTLwGCwuNs1eF5MP9923/6YadOTuk3+VjbBWbSvmnzajVSJFFBUUgdeXgCyK2jrUZ5Z4hCDdJSN7IoXbQDKL4xlnfwImCC00sVkZvoWvXORyQrPHq67WV0QqDmoRCKQ4DQRqi3TveDmRadEfsCeO2OZtbZBhedA+MU7pH4yNCKxNO4St0RzXQFLVE26ofioY+xT02BxqHffU83t4BdhPaVFX7pKf+aO3rgOtVF7hIZrKSV/R31aEv5SV4Q9g237QSrVozUPNz0K5h+1IFEarWDQCZpH4Eq7EY/cFx2MTno6W3p92slQH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 08:58:06.0418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d9b4c0-b47f-479c-ea04-08dea04d44dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5755

SGkgSmFzb24sDQoNCj4gT24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgMDI6MjY6NThQTSArMDEwMCwg
U3V6dWtpIEsgUG91bG9zZSB3cm90ZToNCj4gPiBPbiAxNC8wNC8yMDI2IDEzOjI5LCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6DQo+ID4gPiBPbiBUdWUsIEFwciAxNCwgMjAyNiBhdCAxMToxMDo1MUFN
ICswMTAwLCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOg0KPiA+ID4NCj4gPiA+ID4gPiBJc24ndCB0
aGlzIGFsc28gc29ydCBvZiBpbmNvbXBsZXRlPyAgRG9lc24ndCBhbnl0aGluZyBzZXJpb3VzIG5l
ZWQNCj4gPiA+ID4gPiBzaWduZWQgbWVhc3VyZW1lbnRzPyBJc250J3QgdGhlcmUgYWxvdCBtb3Jl
IGRhdGEgdGhhdCBjb21lcyBvdXQgb2YgUk1NDQo+ID4gPiA+ID4gdGhhbiBqdXN0IGEgZmV3IG1l
YXN1cmVtZW50IHJlZ2lzdGVycz8NCj4gPiA+ID4gQXMgbWVudGlvbmVkIGFib3ZlLCB0aGlzIHNl
cmllcyBhZGRzIHRoZSBzdXBwb3J0IGZvciBSdW50aW1lIEV4dGVuZGlibGUNCj4gPiA+ID4gTWVh
c3VyZW1lbnRzIChSRU0gaW4gQ0NBLCBSVE1SIG9uIFREWCkuIFRoZSBSSU0rUGxhdGZvcm0gQXR0
ZXN0YXRpb24gaXMNCj4gPiA+ID4gYWxyZWFkeSBwcm92aWRlZCB2aWEgdGhlIFRTTV9SRVBPUlQN
Cj4gPiA+DQo+ID4gPiBPa2F5LCBidXQgd2hhdCBhY3R1YWwgdXNlIGlzIHRoaXM/DQo+ID4gPg0K
PiA+DQo+ID4gR29vZCBwb2ludC4gVGhpcyBSRU1zIGFyZSBwbGFubmVkIHRvIGJlIHVzZWQgZm9y
IEVGSV9DQ19NRUFTVVJFTUVOVF9QUk9UT0NPTA0KPiA+IGFzIGRlc2NyaWJlZCBiZWxvdzoNCj4g
Pg0KPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9pc3N1ZXMvMTEzODMNCj4g
DQo+IFNvIHRoaXMgaXMgdHlpbmcgaXQgdG8gdGhlIHNhbWUgRlcgZXZlbnQgbG9nIHRoYXQgVFBN
IHVzZXMuDQo+IA0KPiBJIHRoaW5rIHRoYXQgc3RyZW5ndGhlbnMgbXkgcG9pbnQgdGhpcyBzaG91
bGQgYWxsIGJlIHVuaW5mb3JtLiBUUE0NCj4gZHJpdmVycyBhcmUgZGlyZWN0bHkgZXhwb3Npbmcg
dGhlIGV2ZW50IGxvZyB0b2RheSwgYnV0IEkgZ3Vlc3MgdGhhdA0KPiBuZWVkcyBnZW5lcmFsaXph
dGlvbiBpZiBub24tVFBNIGRyaXZlcnMgYXJlIGdvaW5nIHRvIHByZXNlbnQgaXQgYXMNCj4gd2Vs
bC4NCj4gDQo+IEhvdyBkbyB5b3UgaW1hZ2luZSBnZXR0aW5nIGFuZCBtYW5pcHVsYXRpbmcgdGhl
IEVGSSBldmVudCBsb2cgdG8gdXNlDQo+IHdpdGggdGhpcz8NCg0KVGhlIGV2ZW50IGxvZ3MgZnJv
bSBVRUZJIHdpbGwgYmUgaGFuZGVkIG9mZiB0byB0aGUgT1MgdXNpbmcgQ0NFTCBBQ1BJIHRhYmxl
LiBUaGUgQ0NFTCB0YWJsZSBzcGVjIHVwZGF0ZSBjYW4gYmUgc2VlbiBhdCAgaHR0cHM6Ly9naXRo
dWIuY29tL3RpYW5vY29yZS9lZGsyL2lzc3Vlcy8xMTM4NCANCg0KUmVnYXJkcywNCg0KU2FtaSBN
dWphd2FyDQo+IEphc29uDQo+DQoNCg0K
