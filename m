Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093F3101B8
	for <linux-coco@lists.linux.dev>; Tue,  2 Dec 2025 23:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764719573; cv=fail; b=XA495OXzwwi2Q/JZKvvDcCkK4AQHBbhfymzRJRaCPQjsHmTBOFqWNviNF++JPmGNi+Ii5Isq0Z4tRjlFGjIjwMkxfgSMz7lAcyhNhB3dLfdKGAqvQxscwW+75ZOWJ43fnVxblIZ/mHkFJlMLIE0jU/CM55JWCuxDUWpT+IDXdyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764719573; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=H5PMjSZDA77AUR+B4M2nZDj/Yu3sUbIg7ibhqLw0aijFmDekDPSRypk8nzinl4ht7NouHskOczcTR1a8Fq5vpeG6fb1Yfse+POxZtqjjL/wIJpuYxDBV2psgIrmcFt938nb/7LCd1g0WJvGS0HTXbtMjKUNlwpJ/vibWgpzKN1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKPqnK/n; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKPqnK/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764719572; x=1796255572;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
  b=SKPqnK/nSk1kCpJaYjIHQ7Mv1lbzHSzHxYIS8PD7+v7xDp8uj9ofhX9C
   /N+wx/CUJzLy2LO24aMDidL2MWXiJfTQz85unVe+1pNOj4ZOVvlcPSj4K
   UMrNTRbvPc8ytZbP3QWM60NL3cw+AM46JqF8AI1lRsi7rVGpel9A2vfV8
   KpUY1Seh1kLSySyjJprA7vsuN8X4fVTsDYyPIF3tY3I8L4oewQapCvnny
   CjTeZ+GPrvcpfrsOlSBaS9+eHAXXVQ7mkZ8ok3HycdeD8e9h5GoBYw6JD
   be2QLyvlVyQrrUPzc1vYhzNKPJWc9aStrWenKERmUMaUObdmtz4Jh9GhT
   g==;
X-CSE-ConnectionGUID: FMQeEC6jR+ujqkcj/3iLAw==
X-CSE-MsgGUID: X/eO2nD4QZ2vmmPgr6OFzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70558095"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70558095"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:52:51 -0800
X-CSE-ConnectionGUID: /cw6rb2iQLigVnA8zb+M8w==
X-CSE-MsgGUID: 2MEdTNeTQK2bM+3DVjfIGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194400400"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 15:52:47 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:52:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 15:52:45 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:52:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeXH4Cqv5pbN5rIjbBkffdYV65lsawWO10UY16LDaBt9aPC/1yWRYQ7nv3yN4AxVAGP5rKWz+KAh22jcYozDJEsDb0cpyJtnQYw2rdPwUiv2gPxXQ2KlIG6d/XkIo09R3pYmecX4VdQRHWLdSVktRzNE1GRDITr1LIpCzUPSQrtIInPWNJ+DmUYJX4B7FYwtmqzkl5t73q/OCUfyM2/5btxoiP1IUwbQXs4fG1mlwdbQCX359JoWuSDx8h173Wu7Oeemq9R+OmadDEi+VZ1AeC/GbnX/2fJsYsViy4VL8Cxw5H1+X1az1+pv2eb5Ccpv+Ay4QBKGWXaK/P6FEnaW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=PbnKLVuQcr/SuOy349+dhGAH00xi0N23FrVtHvYC7B8v75FSXpnLTRXepnnEflLvKV9dOJnePxwotU6pgL21D7v19e1w2NpwfZuqb6BObKkj7j/9OIIb/xhgwjhfZAYyisJqMZri2NZxnfwDHSRLYm3iouCZTH/6ZHFKgYFqqhiF9Izwj+7Qi8NdBGr9BTjC1iledzPB3ReaV5vI4CN7BpAE5nsTcgi2GIL07gedGfc1mC4FQXxZRzLKHuVy+ztRsxG0MvEwPZAVXdMPe9RuYob1Hc+B9tE+rf2kPhjPJjAV0mvUMlJkMJJUkEKg2WExFINYF02lm6oPzfU/BHIlYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:52:43 +0000
Received: from MW4PR11MB6764.namprd11.prod.outlook.com
 ([fe80::248e:f206:c039:d7a1]) by MW4PR11MB6764.namprd11.prod.outlook.com
 ([fe80::248e:f206:c039:d7a1%3]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 23:52:43 +0000
Message-ID: <c781e2f4-44b5-4234-a55e-d52e29e543c8@intel.com>
Date: Tue, 2 Dec 2025 15:52:42 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: <linux-coco@lists.linux.dev>
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
Subject: Subscribe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:a03:54::31) To MW4PR11MB6764.namprd11.prod.outlook.com
 (2603:10b6:303:209::15)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6764:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d0bf1f-b5b2-483b-ef85-08de31fde29c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEF2L1htMDNJQ0M5M2hadjkvV1VXbWdhdFY4Rkx6cU1zNjFGV0c2TnVlV2tR?=
 =?utf-8?B?b3NESU1WSnR1Z2JxVlhYMTFraFlmZUJBMmM2M0ZxZFA2bEdadklGYXArSzV0?=
 =?utf-8?B?VHQxSUFzRWlQK1VLaVMwWHhxSFYyNk9wSUlka1FsSnNqeWlHdWY1dWhmbzlU?=
 =?utf-8?B?Yys2YlQrcXRySGJuZTJ5eWFKcHZTU1hMSXhVQlNHa25FVXVNQSs0cG0xSm4r?=
 =?utf-8?B?d2kycyt6K3RteUFudkVDeDg2RHRGOHVINExCMURXa1lKN3lodWV2SEM3ZlRy?=
 =?utf-8?B?WlFrVWRoaWViSkZlZm8zY0JiWTZpamRZK1EyVzExa29ZZ2NZZnNrenZwQTRD?=
 =?utf-8?B?NUtxQ28zaWRxK2NPdXB1cnY1UzR5MEwwdWE1T1FvdExwQVNpb3FySUJ0Nytz?=
 =?utf-8?B?UG1VdnhpVUVZUjlOazFiSFQ1Nk1oVDBjdURnZVhtNnVZM25OMU44OTJNaXMw?=
 =?utf-8?B?V0pJdCtGdmNSZXR5SnhRNjM1VXRNUFZUTXF4T1FuQ0dPcytRem5MdStWbXBp?=
 =?utf-8?B?dkovTnpMSE5TUEFGUXUxR0dvemtpZGsrZUpVQ05KS2JlZXp1bzJkd3MrL3Vo?=
 =?utf-8?B?R0VoeVdJVzd3S3llSVdqaDZ1VFNBN0NMVkdvSVM3TldrcEtqNjI4VDR2SlZq?=
 =?utf-8?B?RlY3RWcvL3lldklZOWlWTSthVDhIL0ZTUUoxM24yTStiSEtXZEk3WExDNUdV?=
 =?utf-8?B?blVwa0RDaS9ZNTlWang1SUdSRUU2YjZ3aXFBekdKY0dTVlc0cXJaN0NJUGMv?=
 =?utf-8?B?NnplWmZzQWFsTGdkREU4UjRCUkNNUU1kUFFTQVRpLy9uQjBhRVZENldyTkxz?=
 =?utf-8?B?ZU5jTW1rMGtYVEwvb2krTW1tdng3OEw5SVYxNHc1MXZRWE9mcWZxdmlQa2Vo?=
 =?utf-8?B?UVllMDhaMjRBdWRxS0RMZVhJNUprazEybDdXUWFEbmZIbDgzZ1BqTVVsalJx?=
 =?utf-8?B?NEdyNDBNWHRqcEl2YzB2RkNYZGkzbnlmaHp2MVY1YjQzdHBDSWdGVXpzbGRa?=
 =?utf-8?B?UkpEMzY3clhFaU52QUJrSDFEOFZqL0FWSDFxRUlpV1FMZFlHSmcwU2IvVGR6?=
 =?utf-8?B?bVd3ZFZrNkJ2djVwNnlwTEJObTNFM3l0SURTb0tiT1RCN1B6blVsUmFDNjdm?=
 =?utf-8?B?UG1tWTcrbGU1RDRETVNVVlNLSGFBb3VNb1hIZy9IclF3ZXNoZWQyTjZhcHJR?=
 =?utf-8?B?QTc5VTIvaWVKdm4weXBDK1hmRjRMWkh5WVZXQ0RLc1lydENtYjE5c0E0N2Vs?=
 =?utf-8?B?c1hhT2E4SUdFUEU0c0ttOE5XeXl5aDAzZXpxUERJQlVteHNlUDhiSGZvcWlE?=
 =?utf-8?B?di9jRkJRZ3IzQjN0eDFURDdyUFJqaEovZXRoK1dWbjkrY2hicXRETkczNG4x?=
 =?utf-8?B?cyttUWlQV3VCaUZnKzVHc3pnTHJwV3NaUU5wYS92TGF1NGlORDRpcFJuL0ZR?=
 =?utf-8?B?cmV1RXJscDk3V2VwWmdERlBBL1NsWUVYNWtVRnkzWDlFZ2xuVitoN1dOSWtP?=
 =?utf-8?B?alNkYmVFMDF1bG9LWDFrMC9SZVg4UUwwelRtcXVRQ0lZNFFCZXJOWWt1ejZx?=
 =?utf-8?Q?yY+jWJMKf0QuVRqrhCBfzdvrqWRYS3h1I6y4Sw+Mj91U/f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFh0Y3B0TEpScUlodld5MGFqUVJrWWE5R21DZEk5eDdGSHpjaTZYQi9GNzFV?=
 =?utf-8?B?cmRsVFRHQTFmQ3FiTWFMQml5UEg0VHNlNTgwaHNQS2Q2U2hhcEhtZFc1OE1O?=
 =?utf-8?B?b1FDOGM5aGY0c0g0UVZRRnV0UlE2dEdtSXVZQjMySnhUYzgxdFJsb2doZVFh?=
 =?utf-8?B?SkdWYUVEQlEvYkhLZ1V0NkNJNWxyb0s4cE5HbFpMZDdiKzIxaWhNdmZOdkpi?=
 =?utf-8?B?SlVDVVN1ZDV5MWlodkJmK21ReGRsTFFwendIZnNuZmVzQkJvOWhFWDFYVnRv?=
 =?utf-8?B?K0ZISURwdTM1bm9GN0ZjUUg1eEhnL295TXA0cGVzT2FnTHF1eTQ1dTMzSEZF?=
 =?utf-8?B?OFNNZmtVVDJqcDZ1U1A3ZEFydTVzbEYzdGV6aDVza3VUeU5QYkErU05uYUp4?=
 =?utf-8?B?Y0ZiMDNONitsS1Y0cXR4c0VzZ3pHclVDQU9ESWRtaG9VMG1PbHg1V3pHd0ND?=
 =?utf-8?B?ZlI4enRUcXM5NWxINlNxZ0tpYWdJZFJIbGtZcnp4OEI5aWxMZTFxeXRLRFZK?=
 =?utf-8?B?L0VkZndNWCtGL1psS25ybjZTc0Y4MytsOEdYbTZhVnE0Nkl1dFVFeHBrS3FE?=
 =?utf-8?B?MTJDRXBDOGpsYWFoYjBsTkwxTTVrVkJqemFHaGZGVXhhbmFpT2x4RS9XTVND?=
 =?utf-8?B?SzNCSGcrQUxWOEdhRWFuczl6SmtjUE5tR3dxMjBYcERZUCtCSm5pWmd3elgr?=
 =?utf-8?B?dHV6dnRWNU1IZ3MvUEhQdXFGOEJ3THhZMlJocnhaZ1hrK3FLczJtUy81dFZl?=
 =?utf-8?B?QlNlZWliUmtRWnFsU3lhT0F2LzNtKy9taXlCOEc1OTA0TFlWcXE1V3g2WEhk?=
 =?utf-8?B?dXJnY2hRMXJKQmlnbEVuem5tczNZT3YrME9QZVB3eFB5TnBLUGZiam5kLzdu?=
 =?utf-8?B?aTVkZ0pQa3Z2dktmYmNyUlEwRS82VldlVzJpamdjRWo0MHBNS2lLcnB3amdX?=
 =?utf-8?B?ZThtNk50KzNKQUNRR3Flb3JaelNTTm9xUUZLUUkxRnQ2SnQ4T1ZMcFk4WkJF?=
 =?utf-8?B?akVWMmpPYkYwQjZzcDE3REZqYjlvR3Mzb2xYQjZ4c1h1ZTkzRGdSeEczdkhP?=
 =?utf-8?B?MFhOZURWUS8xTFo2cGZvcXE2K3dXSVJVU3VoZXl1RFZzc0U5TzQ0SGIzQ3Rw?=
 =?utf-8?B?UE11ai9EWEErczVhU3cvMXlWMVdiM3JZTkJrNHR0Qkg1REdLT2JvZlp4aEJk?=
 =?utf-8?B?d1owTEtTK0FCL250eWs5djN2OTdCNkVMQjJGd0VWZEExVGovRG5SRUhDd3lB?=
 =?utf-8?B?dWdEcEJhZTR5cmJUdHFDQUxwYkdyYldjOEd3L05IaTBQS1N5Yzh2WGpKVzB0?=
 =?utf-8?B?bDNzM05SNDFzc3l2STQ3bDhjVk1YYk1pZm94c0QzMzRlNytaVDZCb3JYVlVP?=
 =?utf-8?B?REU3WW5CQUpGemJYR1BuOHBFOU9YeWJKOGJUbTE4eFU1bkxvcFRwVG02T0Fj?=
 =?utf-8?B?SVhXZ1V0S25VWlV1VzY5c2VhR3I1L2NEVXg0ZnIrTk0xUVZqRG91dUhLNS9E?=
 =?utf-8?B?cVVoL1ZWNUU2Wk13NnNTU1VZYjZCWlZtYnAvVW4zeHpPT3ZUTUY2ckxKZ0Jy?=
 =?utf-8?B?cXgzTDdTOUZyam82SmhsMjJCVFhteTlRb2ltNHEycVZhSDhkM2RFQ0RQZ1p3?=
 =?utf-8?B?WVBXcFdLNmdOK1RCQ2tYd3dTVlYxYnVtYm5KeFBUYVFjcWNxRmhyUktDMm82?=
 =?utf-8?B?T0hjaTdBbWRFUVkrUU1oWFd2YWwxMDkxWWtDWnd5Ym9wdDhyc0grUjBKdTZk?=
 =?utf-8?B?OFcvMjJhbGY4OTV1VzFoMVZreklXUjNwOWV3TmtvTEk0NjhGVTRDQk9leUhE?=
 =?utf-8?B?ODlXZzZaSUlvcWhObkthUHVNaEdkM2cyWlZFTThmckUxSStqVEdiNFYzZVJu?=
 =?utf-8?B?eklFMWJjUEZRWXBjWDNZeVloeDZOZnZhYWZCNSthZFRHVk42ZnZpU3J2bnZ0?=
 =?utf-8?B?MHFlRTFuZmFtN0NoMHg0OUJPajBpWUlPYnBubVhNTC84ck5Ic0h6WXQ2QzBt?=
 =?utf-8?B?bEEvK0sxdnczS1UrdVBBNkdwcyt3eUFtWHpLNUNiTlE2SE9UemJnREtjZmlV?=
 =?utf-8?B?WGdmTituaFFOeTR5Qm4yVWFNWlZaUnBySXUvV3VXdkt3WCtPRzVBVE9oY3hr?=
 =?utf-8?B?cHV4L01abVl0MUliQlJveGNaZThuUnhDWHVEaTB2Zm53ODhVWW9Hb2h4VmNR?=
 =?utf-8?Q?9l/xkzQ4QfBrSt6GVFLu3mM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d0bf1f-b5b2-483b-ef85-08de31fde29c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 23:52:43.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xr00FqSotNdgC3QexOCyf+UTHi+ofQQlg51LXklIKcVeeSaB0Yn0uQ74JahWauBe96fUeIjeyRvahB8Uoqbzlum/J4Exduw2WNFPXcYsci5PycLRIWUk1yOqrX3oiYJB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com


