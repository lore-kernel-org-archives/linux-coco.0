Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728823717F
	for <linux-coco@lists.linux.dev>; Mon,  2 Feb 2026 15:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047598; cv=fail; b=dJb/y/jwLIxA50o2TjR1uo6MZcpWGwD3zDO3DcF3yIZ7ZEOGFMo7SRLHRsu6E5pEbtRYU11H5INgiT21FwxlFio+lSJxnElisYejBMwyR2BVBy/FdpOpTRq2l6tZcG7FJ7ULYQyGVZWOSsyr/SobL4Pl4GaPPmpDdDzUv25fawE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047598; c=relaxed/simple;
	bh=aDKRRemOjq2CzhHEa292nE1GFsCZj/QJPLJJZynQ0Y0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fbl+2T8pt72QPmYOltBp8RM/v5avTA3Vcn+0yU0djdKh4Yln0QgzdFGD6VObvKkQysA6Dcw2gKvx9Duhl49T8+JtjWHgCTQP/V+oR/TWUBZFgVTCXcYpxWmfK7mom9kqzIKaJpvE7jQ1PH9LGGJgx2rieZN3+viuDl/xo9pxjlg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GuFxjLLK; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GuFxjLLK; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GuFxjLLK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GuFxjLLK"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fIxolXVfEcutdOj4dCITsIMCBllJF36ZIXoeSSCw4884AGvySaayQvb6NQU1yOu6cg69FOAKhojrYGqI/Z0RgNE9rrBAAZlkRbJ7sJim3pdwCGfg5Pewj1aluy5UwVj1hFEyqn6kET2xHz+yG/654qZJShrC5PSGc0nolZxkomn/P3vIOdX2aclCQ5/TifmZpUt5ZzAvHqt9AExk25B56mzeF/oOtUAr85++6irMy/9KvtYqpvhBt+e/f5ZaVxzYiPq3wRC76j3j459VaW6vSkDXisqQX8It1EzScbFSQ4W72hQyAzAVuZ1gxPY8l5r1WqNxf7dLZvgURDdJPf13sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmHQY/0MP6NeQ6NAobTXI0FbRy533tIwu5i4VhdFEtY=;
 b=XDfy6FwMZTM2y0B8k+rUD9kJLOqqAOfIZG6i6npBKjqOhNyAfPnZcA0uUpp7Fp/rfLh6014OpdwUJp0im0YJ3u9aPIzeoUlfmr+ttwB2Rm7hnap8O3Fh52Th5nbqy3WzMzK0v3wX0z++NvQvh4WR1uKH7zweFOrXgmY6wWL2OrYs5imMSA2KkglPXuoQNcXuH0s/uyiUEMFJPZhyjoQWVUbNV4wXEjvjfYn6iFhkC7fO6XCm7X3NccXQcBB+e3hIxtVdouXx0qeQngCOKcxJrFwiLmUtdFt9k73eDxeP2Ej2g/YeVJ9pAcKixjNFvHQdc2VyMceB//M7Csz2yLrILA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmHQY/0MP6NeQ6NAobTXI0FbRy533tIwu5i4VhdFEtY=;
 b=GuFxjLLKyskKzoH/tMIRs8ScRKpsZ/hggdktn2rEBP3PFxu0n4/oXotX1ZUPzyKf20LZSgoHoX2XdoZvbraDawYVH8AJGgIiL/GJoo3gh4ayCacqUZl6XmuJaiLxhwNkwXSlmJoe+GSWo2gO049MXFflQNqw1ZyOPg1vGEyg00o=
Received: from AS4P192CA0048.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::23)
 by DU4PR08MB11079.eurprd08.prod.outlook.com (2603:10a6:10:577::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:53:11 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::b0) by AS4P192CA0048.outlook.office365.com
 (2603:10a6:20b:658::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 15:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 2 Feb 2026 15:53:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paqFnq9LX5m1Jq+ujMdHCxOx1a+aurP7rH8rjEcwvwEsKLBzG4a3LJcesBxzVv3uqbnAE1Dta6WJB257TzbtQciZYHpkcR08NoIGiXglSQLb6BM1bUBu3cyXiBEFh5wNKBZ1WZ6ZXFNqmm2a9PhHZQINGJcgAYqz3ywxG7qt6bIBIh+XHnuuuhR9SWLl8GUFfzeo8Zxs+rOuHzHAAtIOmGWYLFsO3HCrvhsnCuR2vid14sHb12KX7s0kvRjPTu8im2aTatULOodqYgpYYr1fkdW6bgT73HwdN4gRhhk58rYN4NOn5d40vjqrF10zG+mWcW2E3U34z9nTHGNM58EsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmHQY/0MP6NeQ6NAobTXI0FbRy533tIwu5i4VhdFEtY=;
 b=owKYRJUYiu2Ipv39pkUImKFoG1VZhJFds56Kd75QP9bD1GTIST25zAXqld30CVDxwe/oIQZFyDe/FYtcZpNcTitoU7Q1efV+Vf0mCtf3thHoz8/IypNjxqoxpjxiFmUA9EKqFGDLHQSbqWHnnsIi0+FrHQ1f/w7gawyNoEN00VJxEgq9ZjZyZe54D0GqaFxyrluMhfn2fiKgbOcqZW+gjDXO7JZnGAOVwCTXnqkxOpxBt+1+uLzZ/NvAcoB334ELhV968G+6BVTr40JnC86X8cytEAdbrfcZ1aTPef7ymWA7LJMY6gX5TwExusFUXKFrmY+E08Vj/36c5o0rf9wRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmHQY/0MP6NeQ6NAobTXI0FbRy533tIwu5i4VhdFEtY=;
 b=GuFxjLLKyskKzoH/tMIRs8ScRKpsZ/hggdktn2rEBP3PFxu0n4/oXotX1ZUPzyKf20LZSgoHoX2XdoZvbraDawYVH8AJGgIiL/GJoo3gh4ayCacqUZl6XmuJaiLxhwNkwXSlmJoe+GSWo2gO049MXFflQNqw1ZyOPg1vGEyg00o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com (2603:10a6:10:3fa::12)
 by DU5PR08MB10677.eurprd08.prod.outlook.com (2603:10a6:10:529::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Mon, 2 Feb
 2026 15:52:08 +0000
Received: from DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921]) by DB4PR08MB9214.eurprd08.prod.outlook.com
 ([fe80::92b8:ca99:9d64:9921%7]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:52:07 +0000
Message-ID: <c29f4a15-1753-42ca-a4a4-ca429053163f@arm.com>
Date: Mon, 2 Feb 2026 15:52:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, vvidwans@nvidia.com,
 andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
Content-Language: en-US
From: Salman Nabi <salman.nabi@arm.com>
In-Reply-To: <b5fd72fa-fcde-4f7a-bfad-17465d7e3841@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0013.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::20) To DB4PR08MB9214.eurprd08.prod.outlook.com
 (2603:10a6:10:3fa::12)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB4PR08MB9214:EE_|DU5PR08MB10677:EE_|AMS1EPF0000004A:EE_|DU4PR08MB11079:EE_
X-MS-Office365-Filtering-Correlation-Id: c08734ce-ae90-48d8-8c8f-08de62732a89
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c0NwOE96U0toMTFYc0tmZDltUjYzSFdIbGpUdjkxd0IxYWpRTm9iUUN6VHRL?=
 =?utf-8?B?OXRtQ0t3K3IvVUpJSTIrbEZwekxqcjVyZUFUd2cxaU0vUWN2NVM4YU1DSEtG?=
 =?utf-8?B?MDdRT3crZlFMWmhxZ3ZueHN1cVZqSVc3eC9VZml3MDhpcUhWUlFnb2tuMWlm?=
 =?utf-8?B?dlM1NW9vRVFKSWhQU0M0SnNYQVFZM3V4eFZ2YXdjeVgwVWxIWmo4QWQxaG9s?=
 =?utf-8?B?bWZEckFwbTgwblR0cnFjQ0l1aUZaY0NVVkpBKzBOVTdXQmZFL24yOTFHVEhX?=
 =?utf-8?B?Y05MUHpXbzQzMmpNU1k2cEZZeGNFMjhWK1J3NG16TGNIVEp1SXNTV1A4clRs?=
 =?utf-8?B?VmVtYjlDeThyTXBacytJc2V4RWFuOG9TM214TlUwUE51VUxheC9UOSt5OXZM?=
 =?utf-8?B?bWFRSUxCdmlaRlI2RDB2OHlYME1TWkc1ZlU0L3BxaGdVZ1RuOVdPRUVsSVNj?=
 =?utf-8?B?TXFrN2hZbkZoVm9yR0F5OHVZVFQxQU9aRjhGRlZIQ0ZaZVJsbG82djc3Q3pa?=
 =?utf-8?B?SzRnS0tIRTA4MlZldlEwRmZXVkdaaHB2bGFiblgzWlViSHg3VkloRTJKUGtT?=
 =?utf-8?B?YVY2Sm1aQWNiZUFlYzhQOU84ZVJCVzFSQklZbkNQUEpPdGZWL244WktMT2Uz?=
 =?utf-8?B?Qkw0ZDlNb1czRm9qYU5sV3JUcU56ODdTTmdjNncwQXYzSkxaRXhUNUtqdTFa?=
 =?utf-8?B?a01mc3FOQTBGdUZOVGVwZk5kaGErMmtHQmFLTUEzTEZqWC9MblFMN05KYUF3?=
 =?utf-8?B?dUFVM0JoRHgzWTdSYlZXLy9lZnFRTUIySWU0c2lOWTVTL3U4S2JTck9qZFU4?=
 =?utf-8?B?blRMV3JDWEx5K2I5ZVhIQ2RKQXYzcE5WUHhnZHJQRUhGaUU3SHdNS2dMbHh2?=
 =?utf-8?B?YUFLaVpwa2pFOXVNa2hxZU1lWktwVGVxVmZ1MWZEVmxTeWFLZHpQanZaM1I0?=
 =?utf-8?B?RTM5RDcyTFQ1OHBlYWlXdk1ZRDRSZFZnYndrbEthN0wrRUpMOWNCblVpYUdt?=
 =?utf-8?B?UXdKcUhydHZDN2ZUZU9kRGdKcGlPZ04xemx1YjNtaWZpMytkUlVqM2hZVlc2?=
 =?utf-8?B?d1hqMFZ1SXdjODRIMVpWSis3Yzl2bmVsUEhBeEtESFdNWnRuN3NkdWpWNFVY?=
 =?utf-8?B?Zks1NXFDTjdWbWxXejYwVmVTN1ZwV3p5SDFHRXV0UHVnazVwbFlxSHdZWC9t?=
 =?utf-8?B?N0RlTmcwS3Blb2Q2VzhaNWtHcStSdFE5WlhXbmVCWXV4V2FLT2FYNmRBblp0?=
 =?utf-8?B?THdlY09WMEUxS1IwRklVekRNRjlvMjRmN2tYOXhDZnMxQ3JOSWN0ek9YQmVm?=
 =?utf-8?B?TE4vR0NyMXFRZ0tiU1ZXSmtMbklDQlFOVExOeVVHQ2x1TzN0SkQwVGlucGsy?=
 =?utf-8?B?YTkvempRbWg5S1pLSGJSUzZGTFFhN2dZUDcyVDFiQXEyb0F3bGlrOTRWemx6?=
 =?utf-8?B?RWtGWHo4Zml2L2FVNXBHRi84UDRHdHBjdW5yZmxoTllsa1dxK094bWt1RC94?=
 =?utf-8?B?clNPRm80OWQ1Vi9XaEkxSXdwRU5iSmNOUXAvMG13NExPbHh0KzMzT1FEOVVZ?=
 =?utf-8?B?c2hhOVNyRy9mcVF0U3dlUjNQaDZ0MUVoVU4rVHpJZkJhMEVOVG9wYTdCZzdj?=
 =?utf-8?B?UmtCeVBPa3cvTHp4K21FVzdVN0Y4N0crZXBYN3VFV2NDQTV4MTB5U0syc0tp?=
 =?utf-8?B?RmVVTy9Ma3VxZGhJYVlWak9aUGpiV1Ewendmay95MTRyMmd5dzc0NnR1RkRG?=
 =?utf-8?B?bU9aMm9ZSnFqSnpNUmswbzZLby9pUlp4aHlmcnlVVm9JTnptRjBRc1BjSHRN?=
 =?utf-8?B?ams3N3doOEpXanNiSjkzZlBzWW9wT0ZIbVJqWlJ0dUNkMHZSWmtOVmJ5bmFR?=
 =?utf-8?B?dGoyc2dFaEppQklhZDBCVGkzbjFxRGFCd3NFblJhNnp3bFZJd0cvMWF6K1l3?=
 =?utf-8?B?OTlXeHFsYW0wcDZKT1pSUUw0eG1NVDZUalQ0M2RxMmd3OXNQNStreGFjb0FW?=
 =?utf-8?B?enlhUjV6OHNMY1ZGTVRoT3I1Nnl3bnl6S0kvaWhFeTZKdVBqaml2TGxsNlM4?=
 =?utf-8?B?eVlPbThyNHc4UW5GYW43RGNSNWs3MFhvZGxVRUZveWVxQlhmR0VyWGVXVm5Q?=
 =?utf-8?Q?F/lc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9214.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10677
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b9b146b4-2a21-42b6-a732-08de627304f9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXorVFhwU0swY05rMkNhbTloOExFZzhTN1I4ZmZ0ZGNSSHNOc1hvTXVlTTRV?=
 =?utf-8?B?cXZncjZRNE51K2sxSC9KU0hWcWN4SytiSjdZZG5Ddk42bjZBNDM0OHdXZVAv?=
 =?utf-8?B?SGdlQkl1ODlNbkZOVWdnN3BzczNYL1lJT1RxVmRSaDVWdXpuY3dWdWlScDh1?=
 =?utf-8?B?L2lKRHFzWHhhdlNRSzBYT3BuQVNRbXNYR2lrV2J3eU4rcnB4UHdTV29BQkFo?=
 =?utf-8?B?WjFxU0ZKSllsMUo2aGxNdTB4N29leTdUNnNob0VnUGE2Q2JRWXZ3MnFWVVdj?=
 =?utf-8?B?VHVFZktybTd0YlNGangzbEl4U252dEk3Q0x4M0JpL3MyWHJ5Y21ZM1o3dklP?=
 =?utf-8?B?Qy8xQmx6U2pZcFd2S0N0ZU1uWGduc0pEa3BkWE91MDJOWnBMMGdWdVNqdUpB?=
 =?utf-8?B?a0Z2U3hiVmM5VDFQTWFXd0o3Q2tRbERKTWZoNFBnajRnRzYvK240QVFFQlZS?=
 =?utf-8?B?ZW1aOWNOQ3lQZkxHZGxvQWp4WnJMb2k3aGJoYkZhVVdSWWpsaUtjcjB2eGts?=
 =?utf-8?B?dXJYZXdCbzY0cXBQeXAvblNLN24vVHBKTUtMbTZrM2wyR0EzdElSQUhsLzcy?=
 =?utf-8?B?TVFsRDkvRmtjL0VOSjlZTkNtaGNxYTllU2MyVG94RGJzQmlMNnAvOG8rRXJ6?=
 =?utf-8?B?ZnRaR0NVUERkSlFZVzNKYlR4OHZNcUszVXlFUUlsb3o0TkdmRFhhbFFaeThn?=
 =?utf-8?B?VmJmRFNPTVZNbUdxNkxJY01Gd2FuM1Rqd2xpN0M4eDZIUkdpTWV6RzVLb3Nj?=
 =?utf-8?B?Wnp2QXJ1d3NVeDZqSlhlWE5ib0xUWENTQzIreXBYZEphMnlBL21MYk8vNVFU?=
 =?utf-8?B?d0NlclFEOFFVbzk4VnhERmtmMFUzL1ExSzdFN2h1RVpmd1NHcE1sU0ZXT2Nr?=
 =?utf-8?B?UkJYVE1UaW5vbURlbWYzeUxzMWpDZWFzbEtPYnZJTWpGT1VvaEJVdWpoYVpu?=
 =?utf-8?B?aTMxRGNubDV1amc5THlsRmFHZmtJYk9JeWpwbmVhOEpXaEYydlRHSGx5eCtz?=
 =?utf-8?B?cXpaUnozYmpxcWd5Y2Vma2xtendtK0dYeE1TR2IxZWRUdHh4a1dkcTBBUWlq?=
 =?utf-8?B?cE43d205cTZFbllMb24vUkNpVTNSazJUR01nUlZmMExnUTlEc3E2Z01WMEhS?=
 =?utf-8?B?V1dCR2szNFVNWEV0Nkh0K0Z5YUJkb1V6YjA5emUweGJpS2NJWkk2ZFBIakl3?=
 =?utf-8?B?TElzTE1wbG83Zm9hYmFmT1pUc0Yva3lwUlBGMFplV0RKMnNCV0pBVy9iVm1h?=
 =?utf-8?B?Qis3Wit6cTVJM1FseTVYTVJlajkwcG9PLytFOTNLL0V2KzErYlhKUXoxVlVt?=
 =?utf-8?B?N2dwT2YzK3UzL0ErSFhHSWlqSVdpZ2hkL1h4NjBsRnpMT01IOGl5Ym1wSVVQ?=
 =?utf-8?B?emozblZRQTB4T3VLaEIrNHhQR2ZDK3BxRWtRelAyaFlsbnd0SC9BTUR1WXk4?=
 =?utf-8?B?c3BvRXcrRFB2YW9HU2RxcW13TXRZU05RUlBvV1VvZXIydmI0c21mMzIwMUNz?=
 =?utf-8?B?Q2JOSWdkTDhHdGFWWWl6RUpxNHo5a2Vnb2UxaDhTTFpjR0NqTWhteHdNK2FI?=
 =?utf-8?B?Z2kzdGJJQlB3LzAvc1JQOFd2Nm1zQTJ6SnJFbFF4SDJPWUxMbGU4Lzl4STc4?=
 =?utf-8?B?aXBSODV6bmk0cmg2ZDFMdi9uSzAyRmNGcEkyYS9FSjM3ZHVLY2FoVHdTSkYy?=
 =?utf-8?B?UUtEZFJZdmJjSTVvelE1WGhLdlZUbzkyVURJS0RmR00wVEJ3Ty85aXVpS1Uv?=
 =?utf-8?B?ZlIxSW05MG9aMkpqTTgzaXJUVklFbit5QW4zc2xNMHUvVUNLN28xNkNSbXdD?=
 =?utf-8?B?OUtqSFo2THUwc3NpbVUzQXR1c2tZRGh2YjZrbTNyWWtXUTBUSGdDVExoTHBP?=
 =?utf-8?B?cUZpVUVmQ2ZOVllrd1dvMmlRV0RxUXd3TTBocStBNGlXQnlvMEdKTlJ1eHNk?=
 =?utf-8?B?M01Ca2E5U0NHZkVpTWFuNC82SWladFRWYVA0aElqWUxOamFBOUg3WTdsTEVj?=
 =?utf-8?B?eFo2NmQvSmpsUzYySVNrOTc0YjlxREV2YkJGNGRGWURlRGVsTm1JUkVobVVr?=
 =?utf-8?B?RWtIWnVwQUg2ekRqVGxlcm9adEUzTkhocmN2Vk9ScGE4QXgxWXRibnZFYUo5?=
 =?utf-8?B?N0V6MnFGRVBBQ3ZpUnR3OUU4TWRscUM0QXNvTUo2eHlPQ0tnd01ya2dFMjd3?=
 =?utf-8?B?N0VLZFViT216dHdVcnBZdzZpMzd2S3UwT1pOaHlJcmZRY3QzamJDQUl4TFAr?=
 =?utf-8?B?TnVmY2J3aGtveTFtcTZhTysyUTFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AWCtfrsWr25gOWBG0RRMc0eHDNTsmw7BHN3OjhL/Gq3aVSf1F1q05wJGUxAE34A1ju+vCEA8kHlboDh4cZcyugsI+mbDbdD6RYZ9AB5byruzy1OihaRl9Mso6zo/JgEnX0d6yqduaISGSWxp6plwEOAaoF4J9nGe2TlOCnL3fIFEwt81DU2Vyr2itgit21fEXtr1nTutpfdJaKJZHakuUjTN9JHEDQdmdyi/R3FMVujWZVc1brOLMCqWEyKAeMcRc7Se6Sig+DDmuOK418smgRpbsaRuNZ0vTdrU5GC5GHV1aFEWuYkyswPxSIk5NWPg5+w+GZ9++A+mjeS4ww1zEOJfpShCzfzJHMjr+SgFeAs2esO4FWhftwYSQGB/0yX0AcHu62eIJiawqermVdvwyXhBKvyHK2NM3CmoElRL3vOIEQdUsWqnvvnWzQUl0gVY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:53:10.6575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c08734ce-ae90-48d8-8c8f-08de62732a89
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11079

Hi Trilok,

On 1/31/26 01:35, Trilok Soni wrote:
> On 1/19/2026 4:27 AM, Salman Nabi wrote:
>> The Arm Live Firmware Activation (LFA) is a specification [1] to describe
>> activating firmware components without a reboot. Those components
>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>> usual way: via fwupd, FF-A or other secure storage methods, or via some
>> IMPDEF Out-Of-Bound method. The user can then activate this new firmware,
>> at system runtime, without requiring a reboot.
>> The specification covers the SMCCC interface to list and query available
>> components and eventually trigger the activation.
>>
>> Add a new directory under /sys/firmware to present firmware components
>> capable of live activation. Each of them is a directory under lfa/,
>> and is identified via its GUID. The activation will be triggered by echoing
>> "1" into the "activate" file:
>> ==========================================
>> /sys/firmware/lfa # ls -l . 6c*
>> .:
>> total 0
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 47d4086d-4cfe-9846-9b95-2950cbbd5a00
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 6c0762a6-12f2-4b56-92cb-ba8f633606d9
>> drwxr-xr-x    2 0 0         0 Jan 19 11:33 d6d0eea7-fcea-d54b-9782-9934f234b6e4
> Can you please explain or add a note on why we don't have name of the firmware
> as the directory name and why you have selected GUID as top-level
> directory name? 


We obtain the GUIDs of firmware components from the LFA agent in TF-A, which does not provide their names. For convenience, we have added a C structure in the driver to associate each firmware GUID with its corresponding name. Because new firmware components may be supported in the LFA agent before their GUID-to-name mapping is added to the driver, we avoid using the firmware name as the directory (kobject) name.

Additionally, sysfs requires directory names to be unique among siblings. Since GUIDs are inherently unique, they provide a convenient, collision-free choice for directory names.


>
> ---Trilok Soni


Many thanks,

Salman

