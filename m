Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011033.outbound.protection.outlook.com [52.101.62.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC7331AAB1
	for <linux-coco@lists.linux.dev>; Fri, 12 Dec 2025 15:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765553829; cv=fail; b=j26r/VDlG2jGLRYK2yLGBCBsYSDvZZkWQcAaLQ6NCKjMOpZpYgQ2S+4ZSylD4kwhLA5o1ipgDlhOLg+U/XAFwerAgpEmTM7TNe4DiJQ1TBgvGXt/dKcWlql+gncvpZSS8BAGg4Wr5gQJiTbarLh/Px7pfHoF6W/CVqxFA3UGIfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765553829; c=relaxed/simple;
	bh=2G5INsMoVyHxhjam1pjCys3kKbIFmx9Ps50pIC7NeAY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PSjnrSjK9vfCF1EQwuHM7NBHwT2zSjXRxkbkIl0oeoQJyx8Wqi0t4fc8X/tjmEha9OWDUOihgGw7ROzzdcvWJx0jW7Y9qn4WOEw0GU+saukLxRxo3C+RyJF/rE6yat5vbUiMbEH51qLvOHKcYzcqUjBs4Q4OUthn5ny+Ob/9Oq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a8W2NvPq; arc=fail smtp.client-ip=52.101.62.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a8W2NvPq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4AzM/R61nC5z/Rm/vzpqY0BRjtdp+2duTBDjgGgAYZOdx880BeAXmUASNXvRJZgAOjNIYN+8b9TE43ESN6h2fDzEwWn7XNCZaOlZ9jlNu8riML+QqgLES0EnOOcXT/wISh50F/lZ6sI1QLPCOwty3jCx13Q28f15Q/R4GNZGHzNNp7kWicE7aIhW/KfX7+1I7kzMpfBC8OMYIsYD2T8UDpNLDZdRs85mSzdNP6lmqNogbocmHeOxZHmLW+90dWM8/Z7tzaPUwbSYpNrviVkrg1OE/3TZRWPeqJbWDtlNXbA9YIv3/SfCXhQjRXXuSpu7DOlbSszSzJy/7iJbOw6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2G5INsMoVyHxhjam1pjCys3kKbIFmx9Ps50pIC7NeAY=;
 b=Kzkwxw8ooryRykUDnvu/c2FS/C92VRCebUoYgeExJR+ygAYsVqqOBubcVylX8qlffTT1DNLXoHVZE9lf1f40p8h9zsdj15aawrkdcMf+PMd3cfubHgxQ/vMVtP8BsNMcshLZr0hNGYHNruZlI5Hfr5YvJgE7zXH8+JHSyOdhy/+wCaf68++Eny6ZROUwMxfmZFsBmE9syy6SeoWFr7N1Jgbqo8KseLbMic+YZGlrawPvQ6FiyPYmDDnbeenJjUpVR1ENewgwWOXnbJGxWKde4+nKG0/qS4GNa7aXnxZA6j59EHWMlTU4uYNCF4jDyhusk5Z6rTsG1UB3ULS6wUyoRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2G5INsMoVyHxhjam1pjCys3kKbIFmx9Ps50pIC7NeAY=;
 b=a8W2NvPqrEGZNhtawHkYFSX4YX7EKEyyNUOG7y9u631fsttubc0t2ZAwWy0qzDL7YsmRus0W0DqOAOKSx2Y9jHeNtcrANco48EMZjtG3tVHI3xzSolZQFho8I6ZuYbRcJFs3qHbk4L5dUR7Nz2VJvD+6keol6apkKvBG5K+SmylERh/5UkcAU9BjPpXcYN07hD6bbOcu675V33oVB44HaNMex8TcnrLCGn3z70c6QDSVYeA23zFdhWfmC7/U/tWMkOIhgjtU1qtzbGipyO0nGZy4x+8tgTEkZvgqH4uXqKLe/LngTKWXmOmfYBZ4ZbCz2bNSz+bkwSSnDUkYyzifXQ==
Received: from MW6PR12MB8897.namprd12.prod.outlook.com (2603:10b6:303:24a::19)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 15:37:00 +0000
Received: from MW6PR12MB8897.namprd12.prod.outlook.com
 ([fe80::7c55:5a45:be80:e971]) by MW6PR12MB8897.namprd12.prod.outlook.com
 ([fe80::7c55:5a45:be80:e971%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:37:00 +0000
From: Matt Ochs <mochs@nvidia.com>
To: Vedashree Vidwans <vvidwans@nvidia.com>
CC: "salman.nabi@arm.com" <salman.nabi@arm.com>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Varun Wadekar <vwadekar@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "ardb@kernel.org"
	<ardb@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "chao.gao@intel.com"
	<chao.gao@intel.com>
Subject: Re: [RFC PATCH 5/5] firmware: smccc: lfa: refresh fw details
Thread-Topic: [RFC PATCH 5/5] firmware: smccc: lfa: refresh fw details
Thread-Index: AQHcaJARwhoMzjp940+UgYqPFbocrbUeKSKA
Date: Fri, 12 Dec 2025 15:37:00 +0000
Message-ID: <44635975-326C-4DD2-BCEC-EB04188E954A@nvidia.com>
References: <20251208221319.1524888-1-vvidwans@nvidia.com>
 <20251208221319.1524888-6-vvidwans@nvidia.com>
In-Reply-To: <20251208221319.1524888-6-vvidwans@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW6PR12MB8897:EE_|IA0PR12MB7652:EE_
x-ms-office365-filtering-correlation-id: f0d23409-1bb5-4aa3-c485-08de39944a9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWZQZDlaNFlpSnZDcDY2cWNFSGY5Vmx0eE1DREpjT3J6N2UyaTQ3NVMwS3lP?=
 =?utf-8?B?U1JtTGtvekNiR1Y2TzhOb0NSNFBkSldlWExKQXBSZUxiMUZUSTh2M0l6T3l3?=
 =?utf-8?B?VjBkcFpXcFRXVUhtN0gyd20yOEUyME42YzRJWW1hOVpCVmRDUkxCdGIxODZB?=
 =?utf-8?B?ZkRQK204NXFpNG1GdnpOQ2NIYkoyU3NRdFhTeHNoTHhzNUdrcWJHVkRsbVNR?=
 =?utf-8?B?a0prVXZTMmVHZUNUMmVqcnZ3QjE3MENQOHFkRENGY2E3cHhMejVvQTV0ZTBR?=
 =?utf-8?B?NDh4US9PZlRNUVgzNVZNNUMwYkpBTElHQUEybGw0ZXpVS1NhQmFYRmhuYkV0?=
 =?utf-8?B?d2trb0VNQnlFQm9aSWgvSTBpVS9ORU9ySmpZS3YyZ0Z5SytCSjlCbzNEUXVY?=
 =?utf-8?B?ZVZRVloyTUNSTDBpWXVzNGVQVXZ0RFpodHVHY0UyWVBwMFhXQzR2KzJjcnFD?=
 =?utf-8?B?Zy9xcVAyRVhYT0crODAyZ044eklySmZHTlBnOWJXZE0yNjk3Zk5lV29Pd0Zj?=
 =?utf-8?B?UTltRmRLUUV6Mzc1a1VrdXpZR0NkaFJuQTQrWllOczdSMGtQa2Z6TGFqRVNa?=
 =?utf-8?B?UlZHUVJsN2ZZT0xYaURkcld2blNwWVBBSzl0bzhrZ3BqV1d3bnNtdnRTTWVS?=
 =?utf-8?B?KzdyTk85d0FIMXRIQndJYVpPSUo0MWYyZ3QwR3J0eHNYVU5yQ2htVlJKeVg2?=
 =?utf-8?B?MlkvdGtHb1kzSWl6d3F3QVdtRVhRZEZVRE9jSW9DbEs2N1BtdXZ5Wk12NXdV?=
 =?utf-8?B?MnZDVmxFeVd5OVpoeDVhWjdIZW5ESTE0OENDditTeitEb3dpSG1kN3NSK0gv?=
 =?utf-8?B?VGNlS3dFQTQzQXNUYkl5bGZOVTdKZVk1ckJ6ZEg3WWhObC9HNWNXS3ZBV2VG?=
 =?utf-8?B?QjdVMVNFNzZvT2ZoejFKNUZnUWV1WGdnTEVYckVuK3hUTk94RXBJTWxSWlRV?=
 =?utf-8?B?L1M0V0p0WU1GaWptMUh0YWhmSVNsR0JEZG40T1R4YnllUVc1Yy9UM3I1aGdR?=
 =?utf-8?B?Uk9yT2ZBMzgwUHljU01oRWdsU2FxdGxqRG1VUVQ4ZFF6cWExTWt1ZFpiSHdS?=
 =?utf-8?B?S1RUYTEwRjE2MmdUZEJ2djRwRVJuVWd0Z2x6Q0ZJaWNPQXJEUkhwU09oRlgz?=
 =?utf-8?B?THRrVTYvaSs4bG15ZnBkdkpkZ0VaRXRLYnUzK282OXBMV3hoVy8yTVE3TXNP?=
 =?utf-8?B?dGhvTTBpeFdjL3QyMFcwektoZjRxQmtqSU5YbjRsNUtnS2hOSmN0U3M4NzdY?=
 =?utf-8?B?cUFwa0hKajBtclRFSm9rNHpsUU1ReVcyZXBUTURnS2NrdGVMRzl3QnJadkhP?=
 =?utf-8?B?UU1aaGo3dk1SNUhOTkdSNUI2R0RnbHNMNjFRdGI0UUswa3Y0eWtFRDA4NHVI?=
 =?utf-8?B?b2VrVG02NnhrS1crdzhjTnpqcU8wUVU3dFc3TjRqc3R1MEhPMlZnY2dkaXhj?=
 =?utf-8?B?NGc1Y3ZXWW9GOEtRNlBtVEFvQ3N2eGR1dUIvNXcyWG9qOGwvY3l3N0I4VldD?=
 =?utf-8?B?NTZXQ1NSMnpnTTBiZjBvcUNNRUpMc05UVjB5Q01hcWxjVHppcWVvUFVRTXNZ?=
 =?utf-8?B?QUhjMnphZHZzbVlnY21WTVZ4WXliRnB2WnYvUVZMOTV6YnpOTWxaVFBnUlcv?=
 =?utf-8?B?eFlML0pSVXM4eUlNbTc3NXAycmlwbU05bmxFbFJTZTEvU0lEaWtSWVJLNy9n?=
 =?utf-8?B?anR5Q3U0bVl6Y2FJRlB4Y3VCSzl5YmNraEs3bmZFMCtXdER3UXdFUEhTYVAv?=
 =?utf-8?B?SGlWY1d3WnMzN0NybUxPeXFwYXdXaTM5V3ZwbTJTckJSUGttWE8yMVVPZ3M4?=
 =?utf-8?B?UUpHNEdINDEwbHVuOUdPM3dmczRMdm8ydDQ0QktBRnc3dmhDVEtFckZJSjFn?=
 =?utf-8?B?K1NYNWlTbTUrLzZRSWpkVTBDeXhEYTg3aUhHclhiNlVWa3NZNE51bTFXcGZX?=
 =?utf-8?B?OTNwYWx1enVMU0NUWlZhdE5vVmIyc0NkTFlsTk02ckxDZWhFRFowSmlwVVIz?=
 =?utf-8?B?WGEwZFJzSzU3QmxjSUNJS3FvZVl3aFA3b1BNcEg2NzJoaUNNaFVqTTEyMjda?=
 =?utf-8?Q?dvhYjl?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR12MB8897.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZDNFOGMzQVFGcXlFR1dZem1QR3JqQ2lsYkY2UEVWa2JUZmxGTE9rUWZCRHBh?=
 =?utf-8?B?ajdNeTNCajZYQXpVb1h3dWZERzFpb2pTdjZUdVRKUEUrSEdIbGtKUUc4ZTFB?=
 =?utf-8?B?OC9vL042NzNJY1NzVUFVenkyK3FUM1l1TlhqTGZNeWFSSk9MbjVFTTdzZWtR?=
 =?utf-8?B?MnhLVDVpRThoeEd4YjRFaDUvK1duRzJQZ2JMSDlQaHhUTFFjYXZLZFhpeFdH?=
 =?utf-8?B?bTJubVdIa0lWTVpETDRXUkJweU9ibHB0UUVVNGdLdkRsY1h4aFUwcVFKZm9B?=
 =?utf-8?B?aWNxM3d1Qkd3YVpYUGNPQlVYRXp4dTc2ZlNCT2RZdkZJakhmTkkvc2ZxMGtC?=
 =?utf-8?B?Vi9zQVE1YXNFVU9YUkk1aHhUQ2FpeFFJdGFqaE9qa0FEdDBOcUNoU2h6VzA1?=
 =?utf-8?B?OFdjemxkZjFzbEN3cVEvY2xZYWZpU2JmQUR5a2ExS04wdUFLNGZQY294RllX?=
 =?utf-8?B?anhtZHZEcTZQUFpxeWszZlNlbUpSckdrSzZxeWxtbHV2QlVvditUeUtNS1FZ?=
 =?utf-8?B?cFg5cUVKUkUyejd1UDhjM1QxbHBGVitZdW9xNm5xK0g2cHdNY1Q3N2RXeDNl?=
 =?utf-8?B?MHlHZlg4bVZDUjkyRTFNYkpjcEdBajFFcUJvV2gwbnVuSUhCbi9iNm1yc0RH?=
 =?utf-8?B?UG5sOXlyRW5XQ0Q2OGp4UGI0enJ4MEZWZU4yR2tFWkNVRTBkL0VNREp2elRv?=
 =?utf-8?B?czIxVHRZMWNKQ1dLRW40MmpRM0IxSWtUd0VjZmhadjVrV3ByZUt3SVlTMU5o?=
 =?utf-8?B?TDFSYnBxODMvNElvNUFCdEh1dVNUN2FrSUNGTC9saWRlRURYcURBTXEzSjZF?=
 =?utf-8?B?UnE4eml5dzVMMElNeXVJZFpXckFJTWFBczc0dzRRWE42dTV4Szlwd0lOckh5?=
 =?utf-8?B?T0pybkFIRUFiMkY2VjQzbU15SE5CamVUNHF3QXlkeHJGdmRLc3Q2RG1vOE5i?=
 =?utf-8?B?d3J0L1dxb2dJNlVLMytzcVY2NWVma1V5aWlqZ1M4cGwzT1k4WlFtdVlDbnhJ?=
 =?utf-8?B?dmxwN25Na3BmaEFVcWM2eHZydUI4QnBrODkzV0Z6Q1NMT29XRWpGNWxBNXRQ?=
 =?utf-8?B?N0N0a2VBUzMzcUlXZlhDRzdqS2NpVFUrckVuRVdlZGcrVjRtNHhRK25rYnBZ?=
 =?utf-8?B?VWlJV3RmWDlvaTF0WXdaNTVFNUI5YzQxY0NZVFFUaFp5YmZORGgza0tBbTE4?=
 =?utf-8?B?ZkY0ajREenpEaldENnU5QmtzclBxZnAxTGRwdXBzRDFHTkRYRkZ3NDJsOTV0?=
 =?utf-8?B?NUJaZ3AwRlFJTUVBejFQTkhhTDkwZC9wa2lGZDNNK05BcDZBZFREMk94OTVB?=
 =?utf-8?B?dFE2YWdKTUlUakZuMnZpUU5tM3lPV3JjSnBRUGFXQmp3dCtBUDFET2ZTVnpj?=
 =?utf-8?B?NG9GVHY3NTFwQjM5Wkw4b1ZmNkNiZEx0NTNxOXUxaHpMa0VvSnNCVmZ2MGJp?=
 =?utf-8?B?YVUyZ2pTSERaQjBpUm1lQmtqU2xaNlVRNDZJcEFOd1dacnBNejQ1TlVySjho?=
 =?utf-8?B?VGJ6Ukh2dXE3Vm9uZTZoUnNXaFBtbC9GZFkwQVlhbS9mUlVnZFJ5YWdKSGNU?=
 =?utf-8?B?R2pJVHJ2MkxSNWtROHduakRyczllYXp4MlpZM3FtMXg5T3JBcnAzb1FJVkZV?=
 =?utf-8?B?TzlTdk0vYXlldDhPQzNNcXoxRW4wVnlJMUpGL0ZQbERWZzF2ZnRsdTdWczZD?=
 =?utf-8?B?WGoxb3hKamV3OVNVSlJrN1BvRk8wdTh3SHYzS1RneWFBTlBOdEdVc3V3Q2h1?=
 =?utf-8?B?OEtQTXdKWXBmdmpPZmpUb3RZVGR4dTdlQzNQNkJtV0dUUHU0K0ZtWGp1M0t3?=
 =?utf-8?B?UDh6Y2xlS1B6eXZVOHpCSHRQUXNJTk42V1NJM3Zxb2o2bjU4UnkycGZ6YUly?=
 =?utf-8?B?eVhORUR4bDZTcEExYjlxVGc4MEZyNDZhbVRVNXNtS0lXeTVPRG90bFhDNDky?=
 =?utf-8?B?M3ovcXhHa2w5NE5sUTRxVkMrbm55MGsxZHJkaGpqTjgxbVo2Q2ZqTFVnK0NZ?=
 =?utf-8?B?eVdNbXRDaUhWRFp2U1Bib0U2Y056Y3MxZzhhRmdyUEVFUWd2bjBhUENROGNl?=
 =?utf-8?B?TlU3OEU5a0VudXcyMk5QRWdnSnUyaHdHZm8wWmF6YUVOUTlldTJlRS9TTWZF?=
 =?utf-8?Q?ftJisV3KsRsNsM/dgMPS28PzZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1131638A372814B9C71D9621F0243B9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d23409-1bb5-4aa3-c485-08de39944a9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 15:37:00.2495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prAajynDa+MhfdNrxZR0y//tlOFe8AXcsYiNJEnHbFml+8/2F4/wddSbXDZ0lqmeM7zj/SjsRpKyZP782eY81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

PiBPbiBEZWMgOCwgMjAyNSwgYXQgMTY6MTMsIFZlZGFzaHJlZSBWaWR3YW5zIDx2dmlkd2Fuc0Bu
dmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Zpcm13YXJlL3Nt
Y2NjL2xmYV9mdy5jIGIvZHJpdmVycy9maXJtd2FyZS9zbWNjYy9sZmFfZncuYw0KPiBpbmRleCAy
NDkxNmZjNTM0MjAuLjMzNDA5MDcwODQwNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9maXJtd2Fy
ZS9zbWNjYy9sZmFfZncuYw0KPiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3NtY2NjL2xmYV9mdy5j
DQouLi4NCj4gKyAvKg0KPiArICogUGFzcyAyOg0KPiArICogICAgSWYgY3VycmVudCBGVyBjb21w
b25lbnRzIG51bWJlciBpcyBtb3JlIHRoYW4gcHJldmlvdXMgbGlzdCwgYWRkIG5ldyBjb21wb25l
bnQgbm9kZXMuDQo+ICsgKi8NCj4gKyBmb3IgKG5vZGVfaWR4OyBub2RlX2lkeCA8IG51bV9vZl9j
b21wb25lbnRzOyBub2RlX2lkeCsrKSB7DQoNCmRyaXZlcnMvZmlybXdhcmUvc21jY2MvbGZhX2Z3
LmM6IEluIGZ1bmN0aW9uIOKAmHVwZGF0ZV9md19pbWFnZXNfdHJlZeKAmToNCmRyaXZlcnMvZmly
bXdhcmUvc21jY2MvbGZhX2Z3LmM6NTU0Ojk6IHdhcm5pbmc6IHN0YXRlbWVudCB3aXRoIG5vIGVm
ZmVjdCBbLVd1bnVzZWQtdmFsdWVdDQogIDU1NCB8ICAgICAgICAgZm9yIChub2RlX2lkeDsgbm9k
ZV9pZHggPCBudW1fb2ZfY29tcG9uZW50czsgbm9kZV9pZHgrKykgew0KICAgICAgfCAgICAgICAg
IF5+fg0KDQpQbGVhc2UgZHJvcCDigJxub2RlX2lkeOKAnSBmcm9tIHRoZSBpbml0aWFsaXplciBz
dGF0ZW1lbnQuDQoNCg==
