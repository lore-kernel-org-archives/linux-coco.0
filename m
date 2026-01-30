Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03202877DE
	for <linux-coco@lists.linux.dev>; Fri, 30 Jan 2026 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769801428; cv=fail; b=Aa3S1K8/tDvLXJhFsUsX+xm9wzqi1Uaf9OYX5KYbe4wMgqLxgxnvY9WU+8I/z6b25UtB1AFHsP43Asu4FrfIYT/kLIwt/fLfsoWADPaTOwsNQKpkQARif0DUmGW9Mk6vaFRCO/loLrZ4Fyw9OTeIYxFAVE+r1SjjRxUJTusWVU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769801428; c=relaxed/simple;
	bh=Cg81jIhACcqqs0cL+mRZzz0IRHCv7+WMTowT73rMCCA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pJu+6cgTLtdVK8doHuQTTFpUMuUf73Glm9/LZ3dTjr8HeXLN5xRM74ZW7qLFypZ0m9ACuM1f3agBHfpwXHUzY1+dzAVmnHrT0SVfOpOomXlPkC0uqdqBodJxuUFedQZKCtEAqmox9Mt4M1+z66QGPXWK88anmtJ0jnUkSopvVlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XaKZdLhf; arc=fail smtp.client-ip=52.101.46.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XaKZdLhf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+ybgeLCyC8sW+9NU+KXq563lv4OyuJqHH2LLEcKia+F8jxeI3Dx6uqlf03qieR0qRR3nqeMF33Ck0o1d3irpvSMEPSLQdxY68gSac7v1L8XnQSU/+FST8ZB2TghkSqGC5RoaYFLXOQ1keJG4HCZ4ymps/SXoM9b5lzRVBr2aNmKkuE/kkLNTG/I1diOShnweMmykekLp1p0gAOBjsNDbYkvrUOje2Za4Hcu7CGwafs5SxaJjOH5MYSlucehQHZoC1eOvYCU0TFlmdUkJGN18BdQYyeG/ZHYEUXMOXkfb2jB8p9jIzJjA8nd+lbFaHVj2wFEfhYjXpRgiecvaqucAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1wpQkRyv6nnC7720vS3YgdEfkq9MKC9rJPjTvOv/Ak=;
 b=d7HXtc1je5K57g36XKwAgl2ALcLJe8Pe3B8SOPgxT2Kn9JOFzuFRSglYo19y3E8b5dHMKKwDYNFQE8shFGalEc9Q4TpSgAq0x1lgKpfrP6ZVCRaFIGsuiFPrlRLfQQbC3U12PWHGuANVz1ekTElkfS7QL/2BGNuTZcBRrV4c5y9+QVI0lwVXkJy1i2pUG6QJ1zzrTnG8I/qxQTaDF1+4Mw42y5f0Qg9JmVYz2TVu2sxU+4WE4RlMJJPV7sg9HXaenAMsExYWMzJkWzlfC4zEhkumiYAUEqrIeW3KE1Qi2Rbo4tSrlHqvWlZxO4U2ysXKGblOMgYMkURVRV+MeemGyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1wpQkRyv6nnC7720vS3YgdEfkq9MKC9rJPjTvOv/Ak=;
 b=XaKZdLhfgdvNUyadrAaZOlTkREq6DV8N/uXHIZ8lTC65kpotG5tOM5cvjlMeRxyYO+Ltoh/RpdXFhFg1n+cWvtuj5s9dmO7UxtvNr6tUZCQ+mWga74XmyGUFzopdV5CTgQ9nsXMEmCS6fYnUsZ2YdIBq+bYjbKBrKq28UZ7WSeYZLLu25QUuqQMbDOLAyWjXq6nnJcS1aIJ2bCgnNNm5SOhcVZlwRU8Q5G/eI4T3RT5okDW5DScn2WMn4Jof6vieBsooFrY/7sGZYi2kaLov1QucFM8xXqYVmKCwDnXxum1a4A0ybG7qjf5EDvdUC9IT7Afi7j8XDZJa9Whm4T+VDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS4PR12MB9660.namprd12.prod.outlook.com (2603:10b6:8:281::6) by
 DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.12; Fri, 30 Jan 2026 19:30:20 +0000
Received: from DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f]) by DS4PR12MB9660.namprd12.prod.outlook.com
 ([fe80::f962:80d7:e25:bf3f%3]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 19:30:20 +0000
Message-ID: <67ffa9f9-64b4-4015-b374-c7ab545c5200@nvidia.com>
Date: Fri, 30 Jan 2026 11:29:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Content-Language: en-US
To: Andre Przywara <andre.przywara@arm.com>, Salman Nabi
 <salman.nabi@arm.com>, sudeep.holla@arm.com, mark.rutland@arm.com,
 lpieralisi@kernel.org
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260119122729.287522-1-salman.nabi@arm.com>
 <20260119122729.287522-2-salman.nabi@arm.com>
 <bf1addf9-5e28-46c6-8943-6a359630e533@nvidia.com>
 <8e4b3940-bea0-4c75-80ec-8c5a87cd24a5@arm.com>
From: Vedashree Vidwans <vvidwans@nvidia.com>
In-Reply-To: <8e4b3940-bea0-4c75-80ec-8c5a87cd24a5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To DS4PR12MB9660.namprd12.prod.outlook.com
 (2603:10b6:8:281::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PR12MB9660:EE_|DM6PR12MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: c1638bf5-467e-4877-bffd-08de60360146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGJzT05Xb3UzN1BOcmoxQlVkMkIybWlodlFRWmhaQ0RrNFBmM2M5NTZ4TWtl?=
 =?utf-8?B?Nk9KKzJzRWZyZ0IrTjQ5Skh6cSs2NFJKbENaUkVQS3dwaWlpdmVDYjJ3WnFU?=
 =?utf-8?B?YjhnWlkySjJ6SWFCZjZiTnRHRTByYVhCR2hEMjNrWjdFTzNFQmYzYmphTjZV?=
 =?utf-8?B?eDZId3pNVUgwZGg1LzJwMFlGVXNBVjFGNzBaQWY5b3FLRXduekh1V3RYbmRN?=
 =?utf-8?B?RHNZejdNeE9ZVWVGZTFsVk1PYmEySHRTZW9VS2RORTlmdkhBeDJ1U2wvMFIr?=
 =?utf-8?B?TFdGMHkvcnZidXlIMkt1OTdCOEk0bXd5NXRLQ25oZXVMR2g0OGJydkVmZnYw?=
 =?utf-8?B?YjNObjFPN2lMNlpzVFBLQkRFTi9nZjJOdFVDQytGN3BqcWcrQWlzOWJ5a0FY?=
 =?utf-8?B?c09JYkVwanlJMjVleldsS2VkeUdrV0traVRkKzQwZzREWUtXSEJZcFhUTUlR?=
 =?utf-8?B?cUpuOUM3QXc3OXZKY2l1Q2RSLytFTUUrV0FoUEVnUUVBTllkUXhPQS8vZVVF?=
 =?utf-8?B?MExDUUJBWThlZWdwYThVUkVNL2w1T0tVSU5BeDJKbEJHaE90NDl1bWpIREhx?=
 =?utf-8?B?ZmhLTnZZNW9pbVhxTTdjQ01VUVhISmVLQitiWnZ0ZUlWb2xLM1dMdnNxQWUy?=
 =?utf-8?B?ZWxnTDFHSVJCdEVNSCtVaEZzVWlHNGRLRlc3aXBDS1BOTWNWUFRFYnhWeG92?=
 =?utf-8?B?aWUwdFNkMjFubm1JdkxwZUJzTTdOSjRxaTdvb1NjM2g0ODZ6dWlRbXJVZUh2?=
 =?utf-8?B?eU1GWUFEcTFvZk1TWDVranZFZDRHLzQrbFF6dWd5NURsdTdTREJvaFlUQTBx?=
 =?utf-8?B?c2UzU0lMT2ljcFBJSDY3UStES1dGa3laZU1PTlZDVnVJVFpMbm95alp3VnpQ?=
 =?utf-8?B?ZWhaTjFUdkxNb3pxTXpORHNjWEhtTUJZRlNDdlBMMU1pc0crbjRWZk10UnFI?=
 =?utf-8?B?ZEg0NWduQXMyQTdwN3ZyUFN0OGg5ZjloNkdtSkJEM2ZCa3hDWWo2cE11S1Nn?=
 =?utf-8?B?bWZxM3NQeG9MRUFiUWhDRjlWUnRIM25sY3JDdURRcElwV3dlcHZWTDM1RHFk?=
 =?utf-8?B?cjZFdXQ4SzM2ZmRPS2VZOWZFZVhOa0VHcUYvWksrTWdXcmI4U3d5bUJFeWc4?=
 =?utf-8?B?czJ0alUrZmlZVmhNUjVOSDNyNmp2RDI5ZVZkY2ZSUGd3MDVEYjY5T3pEcGx1?=
 =?utf-8?B?Tk5yaFY4N0NRSSs3N1B4MmszMThpNEdGbXNMM0JkZU5SalBCTzRWMkJjcE4r?=
 =?utf-8?B?QWF4UkI2WTA0YUY1WHBSdW5YVmRaWUdPQ0ZjVWNoRy9NV3ROYTUxV2RxRzhh?=
 =?utf-8?B?bnlyOVd4RU82eHpIeEtzVkZabFRKUXhseUF3RUtITmx1ZDBJcXlOZDljZFlJ?=
 =?utf-8?B?SEZYMFZncDhUV1hVWDluVEpHQWlvZzFaRUhhZWl6aHQ0YzhnUUlEZlRWY0Qr?=
 =?utf-8?B?ZEdaZXdZZHBuL0xmeFZ3NE1zRlNyMnFvdWt2Z2MxVUVtY1AxZUQ2Q012YXow?=
 =?utf-8?B?SHZXS0crZks3c1BUb09zbUJQWFUvYk5Fc1dZWFRvaWVkdGsreUFlcXdJNkF5?=
 =?utf-8?B?b0RTYnR6WW42MTllT2pOM0VqMGlKa0xldEZYcEZzYWF4aXNnTHd3VWlMNlBO?=
 =?utf-8?B?V1BadjRrc05sMUwwQ3M2SFV3N3U5cEdleGsrZFkrQ29QZGFRaUVZYXdJbGpn?=
 =?utf-8?B?YzhLTW5GWm9zTXZtWUJJU2ZXdXFUVWtJaDBhV0RyQXN1aTNFemFMZ3pGb3lV?=
 =?utf-8?B?WnZGOGIxYzRsYWVhOG1WdUR0NTQ0U3hpaDAwb2FwYWZHNmJFTlJwYkFKSFh1?=
 =?utf-8?B?c2tDTDN6UXZOMzI0NEJmaGFFcnc0YlJuUGVpK0RoQU1FcHE1dExlcnZIbGJL?=
 =?utf-8?B?WW1tTjZzZG5UZDkwVTE4bFo4NDFGQ1Z0eVMwaElTc0krWUlTV0FjWW5MaGdM?=
 =?utf-8?B?UEpjaGgvTkVkRGZuVE55UnpuSEJmdmpwcjlMSVZEMyszN2pGQW93eVZjK2t4?=
 =?utf-8?B?YTVHMjQvY1R0bi9VcWhONXNvaTl3UURMa0RzK0dBV2gyY3V4N1JyRHRYRFE3?=
 =?utf-8?B?Yk5pbGtiQUpFUVpNU0lYNnViN1QrVGNwcm52elQ5RE9Oam5aRTdCbTM0bjJy?=
 =?utf-8?Q?nS6c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PR12MB9660.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUJiYjBmUXZVSjE0dnFVYjVSNFFCSVhSc1paM3FtOFp4ODFvby9uZk83Yjds?=
 =?utf-8?B?M0orWDF4eXF0MHVQOCtsS2lBeWFDWWtMVUs1dXI1VDFpenVMVWljWExXVGhu?=
 =?utf-8?B?T01YMFJEYitUVlBnVEdacytvYlhJbzZzTWdPbHM3MXpBejBnVFNTeWlFQ1lj?=
 =?utf-8?B?bmROS243U3lyUHQ3a2laUkZNRU5wZ085K0ZhT0dXc0NVWXVWNWYwcHFtaWZJ?=
 =?utf-8?B?OTIzVTZZa0pWc3lOQ2dZcHdNc0xFQmlWWEpjU1ByV0xRYXhvY2VBR1I0Mm1F?=
 =?utf-8?B?cEc1dnJuSi9oemFDYlRRdWM4ZG9DN3BuRjhnUlkrTXpab25EMEVPbjMzNjQ3?=
 =?utf-8?B?UUx3MVVScUhXQm1aaDdhRHByZEwrMEZkeDdoV015R0w2Vk53NDJzNU1jdzV4?=
 =?utf-8?B?Zmp1WnZJZEwyMzZVVE0xc3FKd3p4aDh0UXlpSnhVVnZ3SzJqYjVvZjk3MkRV?=
 =?utf-8?B?NjNzNXQ2eXIrenl5TXV1U0taVzNxQ05oVjhyWWwweVJXU3ZiOTdhTnRKY2lM?=
 =?utf-8?B?Zk1JdkhSYmVhWjVMbTNqcEdRaEdQSkhUTUYzTVV1VUNOY3RDOVppMDJMN3gy?=
 =?utf-8?B?V1JHRjlud2oxdVVYQUIwT3ZKeSsybWpjR1VVaVR5bUd6VkV0RkpyQUJXbTZq?=
 =?utf-8?B?aGVwL0dHeGxwelc2U25IVmU5ZitZVlE0WndYWTVRZGtSUy95WTlEWTdlQ1FE?=
 =?utf-8?B?Z1grL1IzNmdtMXFQejRaUVZ2VHpNWVFSSkw3c2lIMDZLbHh5TVNVc1l6VFVq?=
 =?utf-8?B?VFlvM2JoUjVoRys5MjljL3BEbkxUSlNESDFIRDJCUUJhdzlvRngrYmlYSU92?=
 =?utf-8?B?QnVSL0lPL3o0UWwrNnlDVWNSWUhVZ3paVCtRTDhIcFpmTHNyM0VCcUZzSEly?=
 =?utf-8?B?ZTlPUjV1cXBwYU9PK2wzTnMyNFlHN05GZWNneUlLa1d4OWE0UTZ0L1lRWnND?=
 =?utf-8?B?Q1VLU1FOVWFjalRLODdTSzF6R2t2T1F4WEo1Yms2UHYybW1YRXZJY0ZTZExN?=
 =?utf-8?B?bHplTzBUR2xYWURhN1FXQnRnbklJRWVwczRVU2tvWldZeUJxN1dyTzJBTUxW?=
 =?utf-8?B?eXJ4QkVYMUhrSHJkVWxxNS8vNWN2THpIaytWN2VXY3c5UDgrVmdVazAwY1JW?=
 =?utf-8?B?S2VjK01RQ0dhUFJ3WThKZW8yWE41ZS90VEoxUkt5YnBzTFZ4Q1dzY0l0SnJE?=
 =?utf-8?B?dWo3eGMxMG9kRVpDRXlzZnlydWdCaVNlTVJ5WTZFWWQyZzNReXc5RnBiTVhv?=
 =?utf-8?B?bzJkR3hBQjJyMWRHWHdkUUErVmU0V3JNaENrUlExWHcwQ1V2T3d1MW11NFFw?=
 =?utf-8?B?aEI3c09JWEhQZGhWOWlSSXdFMFY4eTRGMkk5ZWpPQ1B0WnBGYWI3T0VSdExx?=
 =?utf-8?B?dEhwNnlkSktOclpYdlVUWWdaY3BSYmQ0d0dCWGM2Ty9RN3RBRWRRQlAydWdj?=
 =?utf-8?B?UGErbXRIbHhUcnBFZit0V2o2N1oybERjWjhwMGs3aW95eVlRdGJ2SVN5YmVQ?=
 =?utf-8?B?cjM0eWpFNUpQSHh6czUwb29zQnllZmxTc0RqME1JWGg5M1FkZXNMQ1BsOTNo?=
 =?utf-8?B?MXZNQUQ0RUUzdUhUblBGeCtDVXRDbkpoU0h5YUthRmNIeSt1aVkvNUZyRnlt?=
 =?utf-8?B?eVdjRUFQRjlHODBBWml0RWF3clZIdWUrYmQ2ZkpwMlkzMXpFYmF4N3d6M3pv?=
 =?utf-8?B?M3RsaFRJZWNXS2w2VDd5VXdWRm9kK3RQVnNJbzFjUE1yT0xjSm80TkVGb2xL?=
 =?utf-8?B?VFo1S3UzOC9icDl4N2ZtWjB3OUhLWDRYQXp6VDY5czFjeWNWRzBtYVg5NUhs?=
 =?utf-8?B?OFFNOUJZc1lQOVp3aU9RQVA3bHZ6dlJvK1MyR1d4U3NVUDFNMFZDOVBoNDJP?=
 =?utf-8?B?bnJ3S3cxTndNNFZOY2JkR2x3cWtweE0rUys3cENZQnBhQ2k1Qk1ablJRRHVn?=
 =?utf-8?B?UUdzSWs1T0piMFV3aFRGVktQYnJZTnlEblpZNVVPUTdBYythK3lOUVBkakdt?=
 =?utf-8?B?d2Z4bTlpbXBqZjhORldERUpuVlpIeGovVjFBVjJWaUdoK0tKTVhPdVVzeDd2?=
 =?utf-8?B?OGhBczc3TENwYTN2b1RnWmVMUHg1eXdIbCtSY0dBNGNXQUF5WEpGVkM4dDIy?=
 =?utf-8?B?TURVL1gzNU9VZSt2NGtkcnE1WVlseUJpRG9sYkdiQk5OdlZVcEFOL2duTVlU?=
 =?utf-8?B?RU9Gb3pEdktLUno5MGYxWThUVkN1ZmRSdXltbHdlWFlNS0lvdUhhdVhJaFNX?=
 =?utf-8?B?QTJlT1V6MG1vU0krOTVNdnJTcDI1SlduSkhlTm1JK3MwdDFXK0puejdTLzNF?=
 =?utf-8?B?MmQ3M2M5Q3J4ZzFEUE5LcHRoLy8xMzNjQ3R4QTluL2Y4MStDQW1KUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1638bf5-467e-4877-bffd-08de60360146
X-MS-Exchange-CrossTenant-AuthSource: DS4PR12MB9660.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:30:20.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qym8Ne5RBeDgHPE9xtXwAxtSLWodI7S6oUc0sdjO5xijVEShUSMkG3yLb5oOTsdvdpe1pVmMWJkt0ei9Et8GsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4124

Hi Andre,

On 1/29/26 09:26, Andre Przywara wrote:
> Hi Vedashree,
> 
> many thanks for having a look!
> 
> On 1/28/26 00:01, Vedashree Vidwans wrote:
>> Hello,
>>
>> On 1/19/26 04:27, Salman Nabi wrote:
>>> The Arm Live Firmware Activation (LFA) is a specification [1] to 
>>> describe
>>> activating firmware components without a reboot. Those components
>>> (like TF-A's BL31, EDK-II, TF-RMM, secure paylods) would be updated the
>>> usual way: via fwupd, FF-A or other secure storage methods, or via some
> 
> [ ... ]
> 
>>>   drivers/firmware/smccc/Kconfig  |   8 +
>>>   drivers/firmware/smccc/Makefile |   1 +
>>>   drivers/firmware/smccc/lfa_fw.c | 668 ++++++++++++++++++++++++++++++++
>>>   3 files changed, 677 insertions(+)
>>>   create mode 100644 drivers/firmware/smccc/lfa_fw.c
>>>
> [ ... ]
>>> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/ 
>>> smccc/ lfa_fw.c
>>> new file mode 100644
>>> index 000000000000..ce54049b7190
>>> --- /dev/null
>>> +++ b/drivers/firmware/smccc/lfa_fw.c
>>> @@ -0,0 +1,668 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (C) 2025 Arm Limited
>>> + */
> 
> [ ... ]
> 
>>> +
>>> +static int call_lfa_activate(void *data)
>>> +{
>>> +    struct image_props *attrs = data;
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +
>>> +    reg.a0 = LFA_1_0_FN_ACTIVATE;
>>> +    reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>>> +    /*
>>> +     * As we do not support updates requiring a CPU reset (yet),
>>> +     * we pass 0 in reg.a3 and reg.a4, holding the entry point and 
>>> context
>>> +     * ID respectively.
>>> +     * cpu_rendezvous_forced is set by the administrator, via sysfs,
>>> +     * cpu_rendezvous is dictated by each firmware component.
>>> +     */
>>> +    reg.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
>>> +
>>> +    for (;;) {
>>> +        arm_smccc_1_2_invoke(&reg, &reg);
>>> +
>>> +        if ((long)reg.a0 < 0) {
>>> +            pr_err("ACTIVATE for image %s failed: %s\n",
>>> +                attrs->image_name, lfa_error_strings[-reg.a0]);
>>> +            return reg.a0;
>>> +        }
>>> +        if (!(reg.a1 & LFA_ACTIVATE_CALL_AGAIN))
>>> +            break; /* ACTIVATE successful */
>>> +    }
>> The implementation uses same 'struct arm_smccc_1_2_regs reg' as
>> input and output for arm_smccc_1_2_invoke(). Here, reg.a0 (function 
>> ID), reg.a1 (fw_seq_id) and reg.a2 (cpu rendezvous) are initialized 
>> once before the loop and arm_smccc_1_2_invoke() overwrites the whole 
>> register set on every iteration. That means inputs (a0, a1, a2) can be 
>> clobbered between loop iterations unless reassigned each time.
>> Suggestion: Re-initialize input members of reg on each loop iteration 
>> or use a separate 'struct arm_smccc_1_2_regs' for output to avoid 
>> input corruption.
> 
> Ah, that's a good point and indeed a bug, thanks for spotting this! Will 
> fix it.
> 
>>> +
>>> +    return reg.a0;
>>> +}
>>> +
>>> +static int activate_fw_image(struct image_props *attrs)
>>> +{
>>> +    int ret;
>>> +
>>> +    mutex_lock(&lfa_lock);
>>> +    if (attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous)
>>> +        ret = stop_machine(call_lfa_activate, attrs, cpu_online_mask);
>>> +    else
>>> +        ret = call_lfa_activate(attrs);
>>> +
>>> +    if (ret != 0) {
>>> +        mutex_unlock(&lfa_lock);
>>> +        return lfa_cancel(attrs);
>>> +    }
>>> +
>>> +    /*
>>> +     * Invalidate fw_seq_ids (-1) for all images as the seq_ids and the
>>> +     * number of firmware images in the LFA agent may change after a
>>> +     * successful activation attempt. Negate all image flags as well.
>>> +     */
>>> +    attrs = NULL;
>>> +    list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>>> +        set_image_flags(attrs, -1, 0b1000, 0, 0);
>>> +    }
>>> +
>>> +    update_fw_images_tree();
>>> +
>>> +    /*
>>> +     * Removing non-valid image directories at the end of an 
>>> activation.
>>> +     * We can't remove the sysfs attributes while in the respective
>>> +     * _store() handler, so have to postpone the list removal to a
>>> +     * workqueue.
>>> +     */
>>> +    INIT_WORK(&fw_images_update_work, remove_invalid_fw_images);
>>> +    queue_work(fw_images_update_wq, &fw_images_update_work);
>>> +    mutex_unlock(&lfa_lock);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int prime_fw_image(struct image_props *attrs)
>>> +{
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +    int ret;
>>> +
>>> +    mutex_lock(&lfa_lock);
>>> +    /* Avoid SMC calls on invalid firmware images */
>>> +    if (attrs->fw_seq_id == -1) {
>>> +        pr_err("Arm LFA: Invalid firmware sequence id\n");
>>> +        mutex_unlock(&lfa_lock);
>>> +
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    if (attrs->may_reset_cpu) {
>>> +        pr_err("CPU reset not supported by kernel driver\n");
>>> +        mutex_unlock(&lfa_lock);
>>> +
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /*
>>> +     * LFA_PRIME/ACTIVATE will return 1 in reg.a1 if the firmware
>>> +     * priming/activation is still in progress. In that case
>>> +     * LFA_PRIME/ACTIVATE will need to be called again.
>>> +     * reg.a1 will become 0 once the prime/activate process completes.
>>> +     */
>>> +    reg.a0 = LFA_1_0_FN_PRIME;
>>> +    reg.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>>> +    for (;;) {
>>> +        arm_smccc_1_2_invoke(&reg, &reg);
>>> +
>>> +        if ((long)reg.a0 < 0) {
>>> +            pr_err("LFA_PRIME for image %s failed: %s\n",
>>> +                attrs->image_name, lfa_error_strings[-reg.a0]);
>>> +            mutex_unlock(&lfa_lock);
>>> +
>>> +            return reg.a0;
>>> +        }
>>> +        if (!(reg.a1 & LFA_PRIME_CALL_AGAIN)) {
>>> +            ret = 0;
>>> +            break; /* PRIME successful */
>>> +        }
>>> +    }
>> Similar comment to call_lfa_activate(). Suggestion to either re-assign 
>> 'struct arm_smccc_1_2_regs' input values on each loop iteration or use 
>> a separate 'struct arm_smccc_1_2_regs' for output to avoid input 
>> corruption between loop iterations. This matches the intended 
>> 'CALL_AGAIN' protocal while keeping the inputs stable across retries.
> 
> Indeed, good catch.
> 
>>> +
>>> +    mutex_unlock(&lfa_lock);
>>> +    return ret;
>> The introduction of separate 'ret' cariable does not appear necessary 
>> for functional correctness. The SMCCC status is conveyed via reg.a0 on 
>> each iteration, so returning reg.a0 should preserve existing behavior.
>> If 'ret' must be kept, consider initializing it to 0 at declaration 
>> time. That avoids setting ret = 0 inside 'PRIME successful' path and 
>> leads to simpler control flow.
> 
> Right, looks like a leftover from a previous version, it's indeed not 
> needed.
> 
>>> +}
>>> +
>>> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute 
>>> *attr,
>>> +             char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                         image_attrs[LFA_ATTR_NAME]);
>>> +
>>> +    return sysfs_emit(buf, "%s\n", attrs->image_name);
>>> +}
>>> +
>>> +static ssize_t activation_capable_show(struct kobject *kobj,
>>> +                       struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_ACT_CAPABLE]);
>>> +
>>> +    return sysfs_emit(buf, "%d\n", attrs->activation_capable);
>>> +}
>>> +
>>> +static ssize_t activation_pending_show(struct kobject *kobj,
>>> +                       struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_ACT_PENDING]);
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +
>>> +    /*
>>> +     * Activation pending status can change anytime thus we need to 
>>> update
>>> +     * and return its current value
>>> +     */
>>> +    reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>>> +    reg.a1 = attrs->fw_seq_id;
>>> +    arm_smccc_1_2_invoke(&reg, &reg);
>>> +    if (reg.a0 == LFA_SUCCESS)
>>> +        attrs->activation_pending = !!(reg.a3 & BIT(1));
>>> +
>>> +    return sysfs_emit(buf, "%d\n", attrs->activation_pending);
>>> +}
>>> +
>>> +static ssize_t may_reset_cpu_show(struct kobject *kobj,
>>> +                  struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_MAY_RESET_CPU]);
>>> +
>>> +    return sysfs_emit(buf, "%d\n", attrs->may_reset_cpu);
>>> +}
>>> +
>>> +static ssize_t cpu_rendezvous_show(struct kobject *kobj,
>>> +                   struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_CPU_RENDEZVOUS]);
>>> +
>>> +    return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous);
>>> +}
>>> +
>>> +static ssize_t force_cpu_rendezvous_store(struct kobject *kobj,
>>> +                      struct kobj_attribute *attr,
>>> +                      const char *buf, size_t count)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
>>> +    int ret;
>>> +
>>> +    ret = kstrtobool(buf, &attrs->cpu_rendezvous_forced);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static ssize_t force_cpu_rendezvous_show(struct kobject *kobj,
>>> +                     struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                image_attrs[LFA_ATTR_FORCE_CPU_RENDEZVOUS]);
>>> +
>>> +    return sysfs_emit(buf, "%d\n", attrs->cpu_rendezvous_forced);
>>> +}
>>> +
>>> +static ssize_t current_version_show(struct kobject *kobj,
>>> +                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                image_attrs[LFA_ATTR_CURRENT_VERSION]);
>>> +    u32 maj, min;
>>> +
>>> +    maj = attrs->current_version >> 32;
>>> +    min = attrs->current_version & 0xffffffff;
>>> +    return sysfs_emit(buf, "%u.%u\n", maj, min);
>>> +}
>>> +
>>> +static ssize_t pending_version_show(struct kobject *kobj,
>>> +                    struct kobj_attribute *attr, char *buf)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_ACT_PENDING]);
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +    u32 maj, min;
>>> +
>>> +    /*
>>> +     * Similar to activation pending, this value can change 
>>> following an
>>> +     * update, we need to retrieve fresh info instead of stale 
>>> information.
>>> +     */
>>> +    reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>>> +    reg.a1 = attrs->fw_seq_id;
>>> +    arm_smccc_1_2_invoke(&reg, &reg);
>>> +    if (reg.a0 == LFA_SUCCESS) {
>>> +        if (reg.a5 != 0 && attrs->activation_pending)
>>> +        {
>>> +            attrs->pending_version = reg.a5;
>>> +            maj = reg.a5 >> 32;
>>> +            min = reg.a5 & 0xffffffff;
>>> +        }
>>> +    }
>>> +
>>> +    return sysfs_emit(buf, "%u.%u\n", maj, min);
>>> +}
>>> +
>>> +static ssize_t activate_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>> +                  const char *buf, size_t count)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                     image_attrs[LFA_ATTR_ACTIVATE]);
>>> +    int ret;
>>> +
>>> +    ret = prime_fw_image(attrs);
>>> +    if (ret) {
>>> +        pr_err("Firmware prime failed: %s\n",
>>> +            lfa_error_strings[-ret]);
>>> +        return -ECANCELED;
>>> +    }
>>> +
>>> +    ret = activate_fw_image(attrs);
>>> +    if (ret) {
>>> +        pr_err("Firmware activation failed: %s\n",
>>> +            lfa_error_strings[-ret]);
>>> +        return -ECANCELED;
>>> +    }
>>> +
>>> +    pr_info("Firmware activation succeeded\n");
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static ssize_t cancel_store(struct kobject *kobj, struct 
>>> kobj_attribute *attr,
>>> +                const char *buf, size_t count)
>>> +{
>>> +    struct image_props *attrs = container_of(attr, struct image_props,
>>> +                         image_attrs[LFA_ATTR_CANCEL]);
>>> +    int ret;
>>> +
>>> +    ret = lfa_cancel(attrs);
>>> +    if (ret != 0)
>>> +        return ret;
>>> +
>>> +    return count;
>>> +}
>>> +
>>> +static struct kobj_attribute image_attrs_group[LFA_ATTR_NR_IMAGES] = {
>>> +    [LFA_ATTR_NAME]            = __ATTR_RO(name),
>>> +    [LFA_ATTR_CURRENT_VERSION]    = __ATTR_RO(current_version),
>>> +    [LFA_ATTR_PENDING_VERSION]    = __ATTR_RO(pending_version),
>>> +    [LFA_ATTR_ACT_CAPABLE]        = __ATTR_RO(activation_capable),
>>> +    [LFA_ATTR_ACT_PENDING]        = __ATTR_RO(activation_pending),
>>> +    [LFA_ATTR_MAY_RESET_CPU]    = __ATTR_RO(may_reset_cpu),
>>> +    [LFA_ATTR_CPU_RENDEZVOUS]    = __ATTR_RO(cpu_rendezvous),
>>> +    [LFA_ATTR_FORCE_CPU_RENDEZVOUS]    = 
>>> __ATTR_RW(force_cpu_rendezvous),
>>> +    [LFA_ATTR_ACTIVATE]        = __ATTR_WO(activate),
>>> +    [LFA_ATTR_CANCEL]        = __ATTR_WO(cancel)
>>> +};
>>> +
>>> +static void clean_fw_images_tree(void)
>>> +{
>>> +    struct image_props *attrs, *tmp;
>>> +
>>> +    list_for_each_entry_safe(attrs, tmp, &lfa_fw_images, image_node)
>>> +        delete_fw_image_node(attrs);
>>> +}
>>> +
>>> +static int update_fw_image_node(char *fw_uuid, int seq_id,
>>> +                      u32 image_flags, u64 reg_current_ver,
>>> +                      u64 reg_pending_ver)
>>> +{
>>> +    const char *image_name = "(unknown)";
>>> +    struct image_props *attrs;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * If a fw_image is already in the images list then we just update
>>> +     * its flags and seq_id instead of trying to recreate it.
>>> +     */
>>> +    list_for_each_entry(attrs, &lfa_fw_images, image_node) {
>>> +        if (!strcmp(attrs->image_dir->name, fw_uuid)) {
>>> +            set_image_flags(attrs, seq_id, image_flags,
>>> +                    reg_current_ver, reg_pending_ver);
>>> +            return 0;
>>> +        }
>>> +    }
>>> +
>>> +    attrs = kzalloc(sizeof(*attrs), GFP_KERNEL);
>>> +    if (!attrs)
>>> +        return -ENOMEM;
>>> +
>>> +    for (int i = 0; i < ARRAY_SIZE(fw_images_uuids); i++) {
>>> +        if (!strcmp(fw_images_uuids[i].uuid, fw_uuid))
>>> +            image_name = fw_images_uuids[i].name;
>>> +    }
>> I would recommend using fw_uuid as the image_name when UUID is not
>> found in fw_images_uuids[], currently the driver assigns 'unknown'
>> in such case.
>> There is a valid possibility that platform-specific FW images, not
>> listed in fw_images_uuids[], are used by LFA agent for live FW
>> activation. In such scenarios, falling back to 'unknown' would lose
>> important information especially when errors surface in
>> call_lfa_activate(). Using UUID directly would indicate which
>> image failed or behaved unexpectedly.
> 
> Well, I think if you want to identify an image clearly, you always have 
> to use the UUID, as shown by the directory name. The "name" sysfs file 
> is there just for convenience, to make this easier for *users* when 
> dealing with well-known firmware image. As you rightly said, we can 
> never guarantee that the kernel knows a certain UUID, and it wouldn't be 
> necessary for proper operation at all.
> So I was expecting this name to be only used by reporting scripts or 
> such. But indeed some "unknown" string is a bit fragile as a placeholder 
> name, I was wondering if we should just provide an empty string in this 
> case? This would allow scripts to detect this special case reliably and 
> provide their own rendering then.
> Does this make sense?
Thank you for teh clarification, this helps. I agree that UUID is the 
canonical identifier and that 'name' sysfs file is mainly for user 
convenience.
One concern I have is around error reporting. For example, if 
call_lfa_activate() fails, the kernel prints:
ACTIVATE for image <name_string> failed: LFA_BUSY

If the 'name_string' is "unknown" or an empty string, the error message 
doesn't indicate which firmware component failed activation, especially 
on system with multiple LFA-capable FW images.
In such cases, having meaningful fallback identifier is helpful for 
debugging. Using UUID in the error log would help identify which FW 
image encountered the failure. This avoids ambiguity and makes error 
triage much easier, especially when platform-specific firmware images 
are not listed in fw_images_uuids[] but are still valid LFA components.
So eitehr of the following would solve the issue:
1. Use fw_uuid as the fallback image_name
2. Update error print in call_lfa_activate() and prime_fw_image() to use 
UUID instead of image_name.

Best,
Veda
> 
> Cheers,
> Andre
> 
>> Thank you,
>> Veda
>>> +
>>> +    attrs->image_dir = kobject_create_and_add(fw_uuid, lfa_dir);
>>> +    if (!attrs->image_dir)
>>> +        return -ENOMEM;
>>> +
>>> +    INIT_LIST_HEAD(&attrs->image_node);
>>> +    attrs->image_name = image_name;
>>> +    attrs->cpu_rendezvous_forced = 1;
>>> +    set_image_flags(attrs, seq_id, image_flags, reg_current_ver,
>>> +            reg_pending_ver);
>>> +
>>> +    /*
>>> +     * The attributes for each sysfs file are constant (handler 
>>> functions,
>>> +     * name and permissions are the same within each directory), but we
>>> +     * need a per-directory copy regardless, to get a unique handle
>>> +     * for each directory, so that container_of can do its magic.
>>> +     * Also this requires an explicit sysfs_attr_init(), since it's 
>>> a new
>>> +     * copy, to make LOCKDEP happy.
>>> +     */
>>> +    memcpy(attrs->image_attrs, image_attrs_group,
>>> +           sizeof(attrs->image_attrs));
>>> +    for (int i = 0; i < LFA_ATTR_NR_IMAGES; i++) {
>>> +        struct attribute *attr = &attrs->image_attrs[i].attr;
>>> +
>>> +        sysfs_attr_init(attr);
>>> +        ret = sysfs_create_file(attrs->image_dir, attr);
>>> +        if (ret) {
>>> +            pr_err("creating sysfs file for uuid %s: %d\n",
>>> +                   fw_uuid, ret);
>>> +            clean_fw_images_tree();
>>> +
>>> +            return ret;
>>> +        }
>>> +    }
>>> +    list_add(&attrs->image_node, &lfa_fw_images);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int update_fw_images_tree(void)
>>> +{
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +    struct uuid_regs image_uuid;
>>> +    char image_id_str[40];
>>> +    int ret, num_of_components;
>>> +
>>> +    num_of_components = get_nr_lfa_components();
>>> +    if (num_of_components <= 0) {
>>> +        pr_err("Error getting number of LFA components\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    for (int i = 0; i < num_of_components; i++) {
>>> +        reg.a0 = LFA_1_0_FN_GET_INVENTORY;
>>> +        reg.a1 = i; /* fw_seq_id under consideration */
>>> +        arm_smccc_1_2_invoke(&reg, &reg);
>>> +        if (reg.a0 == LFA_SUCCESS) {
>>> +            image_uuid.uuid_lo = reg.a1;
>>> +            image_uuid.uuid_hi = reg.a2;
>>> +
>>> +            snprintf(image_id_str, sizeof(image_id_str), "%pUb",
>>> +                 &image_uuid);
>>> +            ret = update_fw_image_node(image_id_str, i,
>>> +                            reg.a3, reg.a4, reg.a5);
>>> +            if (ret)
>>> +                return ret;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static int __init lfa_init(void)
>>> +{
>>> +    struct arm_smccc_1_2_regs reg = { 0 };
>>> +    int err;
>>> +
>>> +    reg.a0 = LFA_1_0_FN_GET_VERSION;
>>> +    arm_smccc_1_2_invoke(&reg, &reg);
>>> +    if (reg.a0 == -LFA_NOT_SUPPORTED) {
>>> +        pr_info("Live Firmware activation: no firmware agent found\n");
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    fw_images_update_wq = alloc_workqueue("fw_images_update_wq",
>>> +                         WQ_UNBOUND | WQ_MEM_RECLAIM, 1);
>>> +    if (!fw_images_update_wq) {
>>> +        pr_err("Live Firmware Activation: Failed to allocate 
>>> workqueue.\n");
>>> +
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    pr_info("Live Firmware Activation: detected v%ld.%ld\n",
>>> +        reg.a0 >> 16, reg.a0 & 0xffff);
>>> +
>>> +    lfa_dir = kobject_create_and_add("lfa", firmware_kobj);
>>> +    if (!lfa_dir)
>>> +        return -ENOMEM;
>>> +
>>> +    mutex_lock(&lfa_lock);
>>> +    err = update_fw_images_tree();
>>> +    if (err != 0)
>>> +        kobject_put(lfa_dir);
>>> +
>>> +    mutex_unlock(&lfa_lock);
>>> +    return err;
>>> +}
>>> +module_init(lfa_init);
>>> +
>>> +static void __exit lfa_exit(void)
>>> +{
>>> +    flush_workqueue(fw_images_update_wq);
>>> +    destroy_workqueue(fw_images_update_wq);
>>> +
>>> +    mutex_lock(&lfa_lock);
>>> +    clean_fw_images_tree();
>>> +    mutex_unlock(&lfa_lock);
>>> +
>>> +    kobject_put(lfa_dir);
>>> +}
>>> +module_exit(lfa_exit);
>>> +
>>> +MODULE_DESCRIPTION("ARM Live Firmware Activation (LFA)");
>>> +MODULE_LICENSE("GPL");
>>
> 

