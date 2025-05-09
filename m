Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812E8F77
	for <linux-coco@lists.linux.dev>; Fri,  9 May 2025 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746756473; cv=fail; b=ePIfCzDW8QdC6jpi693aCP0RsqhS1ttbstBkCNSSKMlt0rWL1KzuX6a6Z/ntd5pH8GfhVi7bPjyx643G5NMLCJhdldgvFR/n2/KpFeUwahqS58U5bLxhHnrMv3TEXTkn/1BpmG1Ljb5IGUP4aPjGRN/Safbtze8X3T6/3jggqV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746756473; c=relaxed/simple;
	bh=+z/awwqVNyokI7CIZb01NmwAfNfsigECuEgoUCIyAjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/Pa9aI7Lk3V0Q4yoHB9erdQ6Vnv0Eq7QcT5gYtnLJbKfQmgZzsH25krPsWTnzsfXUHRDv5TE+Er0OS6dLBv5EA6q5aOQgS1iVDMHAbd7AMixQRIOHK61nXP5g+wNQFHrcf6aRf1kJ3Wtisa/qPJd5ZRd3D9JtOZI1ngRqPqheE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGA9Aq2M; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGA9Aq2M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746756471; x=1778292471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=+z/awwqVNyokI7CIZb01NmwAfNfsigECuEgoUCIyAjg=;
  b=iGA9Aq2MRhhuzEVwR30HqKnWdRN3AeqUdljEPSq2/g/B+3ynP8MMnFO3
   vJ/QkjEqom0w1gh5MnNLuZ0z3bFQoKkLRHfz/IJANTMbvkCF+YG/tdQ+7
   Z8XBzbONGmKH9lz92hdU+pZyhCLA+1x23Gm/wUA3yrK2f6k5hvZGPYVVS
   y8bHkUyD0jfst6mQyis4aUy3XF1SwQ8nvRxmM0tSZSRIj38PmEuiPWAJg
   6SB4Qw/PwMhcBIblETdzoUgLq1D/qnRGxzPwxpSCV4KmBXQffuVEMtsj2
   gvtYviVSGOx5EH/vKDVbDo4bAUqxCbbMLQM4VR1wL+VObH9tsWsUS8Kmw
   g==;
X-CSE-ConnectionGUID: 6772SP4ATweBi6j3HNBPBg==
X-CSE-MsgGUID: 2q9QlCo7RCeJh4bL9appEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="66100480"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="66100480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:07:50 -0700
X-CSE-ConnectionGUID: mzlYZM/GRty/yemLXoY+EQ==
X-CSE-MsgGUID: f8CfoBDASc+zfiDGDTBkAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136862528"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 19:07:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 19:07:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 19:07:49 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 19:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxOiulMdiq6t0n7UE4ND0Vj/ThbsdK+3wk3i2/QYDY0VlyR6YplaCs0Kz/eXr7QKp46dXy8eKErTY10Z+GlRuRiYRuqtGlB0SN44IftXFp2ti7DRTnTzH25xbZu1ZIa/PpmzxZFtH1vdwOGXxrZfjySY24Va+N2ry484NKC5zeYfrvbvXWAyLzI+zepqfOrOpOUVZYk7+x8ISb8RDUh0no/hUTKDClll9hrvQy14HKttQkymBC3zGcOOo0YPKbpQe6XsLK6S/VZ+nJumJvyboKN1jRaLNUNLnopA4HSRr77IiWZPR5AXAKgqb3VIQE/VQO/Eav1H1BxB/fdDHeITNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9VI1zwpUjtFVGReKtlLZTIeFWDRisqlv+FMY06G3oo=;
 b=BLzUzLJvhINOgkbOYfliYL8yUBMv7lXoGyEq4ZjM9Zhv8E/HVISwfjSEW/ZtxIv4k7xVwBpFd2JhotwxVNHbVBV8ul8GTnjmlnxGONBaEwpaZJnMLH4p1x7vE8KcpEA0gsf0xXGf6I97kT/05TVqAq8QC3t1UXy6lzgqBdvuIk869UyG2ziAtUCx3agslGUaWXViP7nJxnRRo/cZJ2lwtjJcY25dE3ZgS1NHueUx77ppPGOHfEsqheWDebrA50jeo7ZAnoD9PuRPS9T93yt9b8nSUV+oAwNfUzf2sa91OISmhZ2j6iyVv9eyQM9CmEu9GOn3aT6aPbkBPu2xNOW/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB7641.namprd11.prod.outlook.com (2603:10b6:510:27b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 02:07:42 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 02:07:42 +0000
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
CC: <cedric.xing@intel.com>
Subject: [PATCH v8 1/7] tsm-mr: Add TVM Measurement Register support
Date: Thu, 8 May 2025 19:07:39 -0700
Message-ID: <20250509020739.882913-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509010104.669669-1-dan.j.williams@intel.com>
References: <20250509010104.669669-1-dan.j.williams@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:303:8c::10) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB7641:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d623c3-85d3-43b1-a470-08dd8e9e47eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nNY/B7086gDh8i7gJm63nBphJkuHenj1/mO/cVv9E4slHJAiJfvjLLXYtqr+?=
 =?us-ascii?Q?18ss5uLbfXiyYS+GzAweD6bWMi/qZDZKuAHySvK3OIc/2uSm6EqReMB2Dflv?=
 =?us-ascii?Q?5Pm5S19a9KyNTxGINPChEqGRCYI0HiGub2znLsYsDF61gFvyK+BwOdaqXgBl?=
 =?us-ascii?Q?VJsrXxG5CamxGnG2P/jSwgsundF+ZhjsLqKsvgtyCEtcKC/rCICoV6YmkMlx?=
 =?us-ascii?Q?7Vsz8V4++7t3s2iA7TT4nzkl/6VkjEV4nx2EAL6t97NO7kAyp6k3KrAfElst?=
 =?us-ascii?Q?SSKcAZhKHMcERqRa+5WRtVHv5IQ9DRGEIB546MZLmzS5wz8YlvI45LAmODcB?=
 =?us-ascii?Q?Ooa3GZbDbvrwEypTyUO8UudRVoqDSxj2f5mLgcJGDy+G9UqGMuO3880IXLWZ?=
 =?us-ascii?Q?swfyueazYSM5h2kwwNF1gByfDOGe/Y6GEmcrTcXAj59cvKzOOIo/SjiiJ1fo?=
 =?us-ascii?Q?oQp8ssKwt/k/9KTk0WdRPooAxChmpE1Rwf6QIHMXScUirXu757H3izIXaB30?=
 =?us-ascii?Q?7Uk47c0PnYeQ9swLtMzluYPouZrgfIBPOS2GbpawfjJfFU4Os+Mw/4i2RGH6?=
 =?us-ascii?Q?Vkz0QpHLAZZdxe8p/CaXlJ/K5+7VJsCGvRgatR8TL1vTGO/JqAdY0E7fcBqx?=
 =?us-ascii?Q?gw+RpN64n0jdLX3vV/RrIs2ODddUrHBKiQ4NMwKONFBD9N/uuq4yt5+Sd2n+?=
 =?us-ascii?Q?4KptF7YjS3GU88MIuZyyKdYDAazWoLWjhJOuQhOoZA+yE3iEuUCkAqRw7zCJ?=
 =?us-ascii?Q?6GsVh2WNeSgztcTkLRHAK2E5Mr5RMd/oK3e0R6K/EinK0BteGYx2F9Kk8lXc?=
 =?us-ascii?Q?s7WBcEPIaa/QyPyW5RkhC5Y/aK3KtDkfS57p0DYhyJqQv9Njakty7U7cL1tA?=
 =?us-ascii?Q?J97UR/JDoJwYRVcLFM3brp5HbvnF3rxOvtMPVwiyTHu5mbRkNgT3MHdpXtJc?=
 =?us-ascii?Q?UCfxjc+FpIl5j/wN3jEHFBZQ4KishcqYcPRE/uI6ae/7re31ZDoRvAgIBwUu?=
 =?us-ascii?Q?+5xfgOCVF7kMExCKf2rCBajWMXVxPGfKerVvfJ7h2mx0zM465AUAC96ynnpy?=
 =?us-ascii?Q?mSKD/9JWWGg7kxCQo+BxFweXfaremRreogmfUtcPtvHgpfGICw56MqtV5Xly?=
 =?us-ascii?Q?fkDBw5B6ZrvSGAY0KlpoSrvyDm7absa/WBbt9eH2HxF4rFxArxjUn01oRVtS?=
 =?us-ascii?Q?0h5l0quzaE7VSmpblhbMyusRUCiDrXGLT46/emivEvJf7JmUzZ0x/Cm/Zzup?=
 =?us-ascii?Q?vrbw34NHQ+drx/gTVkxcpGNT2o4pszZvfpD+uP8CQIj9s0eFxmqaUOQaIPIV?=
 =?us-ascii?Q?1UamaJL80d3RPkFqV7Mn7HLK/hiwTYRAyYQFzM8Oj9hbIAFMI7Y9D61k6Ta9?=
 =?us-ascii?Q?p4JUhu6B7xJ0xAfulCk60Z2fjrex?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aC8RfPu3dBLncUi1QgYp4Vd+XEly/gFe2ZNPfbeifcI8LnxiFYT6OlDeDpQl?=
 =?us-ascii?Q?YXHP9bmnfCToGqz/iibl2ZqPOgjpXLhNKt0S1w+UvpaKha5gmvBc8mMzyCul?=
 =?us-ascii?Q?wspZgOFgBAuCm0yIuvZGXU9pvwyPK6qUYTbPFmWsxXsn4F0yMVgqz6E77XpD?=
 =?us-ascii?Q?rspZRb+hjVMhJ/wPBqs5O5fiju2Rr4uzpWY1PQU1Jm9JmmdCbOyZJzs+yJY+?=
 =?us-ascii?Q?4Xm88/GTfP1R8GAhccr0jMz+pdQlqyfZmvzKmSJhFQl5e/VoXggCXTrcUo5M?=
 =?us-ascii?Q?XTgiQmYrsyK7/uW+XSYInlS3NOvi8tr3TSRw9+wmkh9oiG+yIbd3ex5EEXa3?=
 =?us-ascii?Q?JZS+chd/bBl8rH5bFlJxQ6NWHI0MnkIx+C+j8dVys35PYKpVgZztNI4P/KFD?=
 =?us-ascii?Q?I+CgxgtCuQkFW0AzM3QKKqmdwIpVosLppPi+PIWUeoduj9Em6XK33Hfyqsij?=
 =?us-ascii?Q?RaolT2fNZAqiU3AYuSR3MklVGoK8xMrPB4lJo3Asr4RliCV1+IAMOgT91lI/?=
 =?us-ascii?Q?w6qmZYQq0dnxuWAAkA5CQX74UdxMvK2NdHaoyK5hAsCvPaZwnXxzaIslmXFO?=
 =?us-ascii?Q?JrfI/9uXikhqpV1fxT94n8ZNAeTGhv8EDGnUSsTEkrW3DPldpAxI47Wxedib?=
 =?us-ascii?Q?3IijKLialA7necCOiNYUwiTJ6Yrj/8oJpt/S7QSdz6GRakCudkk2MnJ/Q520?=
 =?us-ascii?Q?OSIPS9o9zUEA8D8Giweb7eJGmxlpaHKU9sjQQ/BVf+vYskoxona2qIt8xtpw?=
 =?us-ascii?Q?hA4P0g0GoshuOxXFy+w5YbwBvuXJskD5aSdyw7rjBe1fdqU/8g90IVeCeKT2?=
 =?us-ascii?Q?MMoWhP09/LoOIDgAUxI/5LTf+pCKh1WdOenqSSWKj/BgYjLN5bocMQh8Ry+m?=
 =?us-ascii?Q?TikGfPiw+Qfr9TcOYBjc5Keay1HLq6CXFurLCsabU93MQlO8Fz7SRNyYFyNy?=
 =?us-ascii?Q?qpbjjS0ELl3ec5D54/XwuVja8YydmoeCtlgtY+jAXhU+5QvLn1scDu13JpoP?=
 =?us-ascii?Q?FVwqD+PyQHy3+E4wUmDQOnwUR55XLch/1N8Kj8hfi6hMMbsD/KBbv8FPxfQs?=
 =?us-ascii?Q?Lc2TKhw54D0RXwQNgFJ40f3aw6zAKR+DAR4dwtIwaviKvO5WXa8QrD7dd1Sj?=
 =?us-ascii?Q?z9Ig2guvBqwcQZZvFlQooK6zjByzva6efLRR8TgkXcnf8kJcy7nuSnPGYX+Y?=
 =?us-ascii?Q?7lFMq/gGiYqXTLvNsJyoOQh/sE3RIuIPkZ9ZBWdphcuJGTTUFcSQt43l2krq?=
 =?us-ascii?Q?iyJmjfiWugvm9ZJhc1M9oNjUnGejOGaq3bM5XWvqNyPMdYR4DPYXXG2bTd18?=
 =?us-ascii?Q?8EqpQb3Ufkq96i4bvHEBZL+3wxG9e/DzD5AYmH/QN+eH5a1PHa/npHTC/s25?=
 =?us-ascii?Q?FaUdpf+iD9mFlckpGxPNVmfW4HhDrWYvnTM4LbYSpOzLjhYne0G2uT6/K5VJ?=
 =?us-ascii?Q?ZyWsLPgh5sSwlc20lcDNenSvrq3FipV34TCzG+pMYARDmgH549BmH8wzlICi?=
 =?us-ascii?Q?Ww9SXTyIJPCAwmsxLUiq7x7itBoq1y9gHb7iIOG4ANSC4pTXNJ93b2oylYll?=
 =?us-ascii?Q?h97HWpSrxMkl3b3c7UuFtXlfrMwHv4mMNNBQ2rTLdeUIjI+rKG7olDGOTubH?=
 =?us-ascii?Q?6g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d623c3-85d3-43b1-a470-08dd8e9e47eb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:07:42.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGb68Y2ipBW+rZAfj3AYgA/jKJdj5UjZWdPpxf5X2wD5Sibq0GffWvaYJJDEpK9xHHPUrbO1c5WARmlY/VAYQafxmaFxV9LAI6BdcVdzv/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7641
X-OriginatorOrg: intel.com

From: Cedric Xing <cedric.xing@intel.com>

Introduce new TSM Measurement helper library (tsm-mr) for TVM guest drivers
to expose MRs (Measurement Registers) as sysfs attributes, with Crypto
Agility support.

Add the following new APIs (see include/linux/tsm-mr.h for details):

- tsm_mr_create_attribute_group(): Take on input a `struct
  tsm_measurements` instance, which includes one `struct
  tsm_measurement_register` per MR with properties like `TSM_MR_F_READABLE`
  and `TSM_MR_F_WRITABLE`, to determine the supported operations and create
  the sysfs attributes accordingly. On success, return a `struct
  attribute_group` instance that will typically be included by the guest
  driver into `miscdevice.groups` before calling misc_register().

- tsm_mr_free_attribute_group(): Free the memory allocated to the attrubute
  group returned by tsm_mr_create_attribute_group().

tsm_mr_create_attribute_group() creates one attribute for each MR, with
names following this pattern:

        MRNAME[:HASH]

- MRNAME - Placeholder for the MR name, as specified by
  `tsm_measurement_register.mr_name`.
- :HASH - Optional suffix indicating the hash algorithm associated with
  this MR, as specified by `tsm_measurement_register.mr_hash`.

Support Crypto Agility by allowing multiple definitions of the same MR
(i.e., with the same `mr_name`) with distinct HASH algorithms.

NOTE: Crypto Agility, introduced in TPM 2.0, allows new hash algorithms to
be introduced without breaking compatibility with applications using older
algorithms. CC architectures may face the same challenge in the future,
needing new hashes for security while retaining compatibility with older
hashes, hence the need for Crypto Agility.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
[djbw: fixup bin_attr const conflict]
Link: https://patch.msgid.link/20250509010104.669669-1-dan.j.williams@intel.com
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
Changes since v7:
* move to bin_attr_new so that this change compiles on both pre and post
  'constify bin_attr' baselines

 Documentation/driver-api/coco/index.rst       |  12 +
 .../driver-api/coco/measurement-registers.rst |  12 +
 Documentation/driver-api/index.rst            |   1 +
 MAINTAINERS                                   |   5 +-
 drivers/virt/coco/Kconfig                     |   5 +
 drivers/virt/coco/Makefile                    |   1 +
 drivers/virt/coco/tsm-mr.c                    | 251 ++++++++++++++++++
 include/linux/tsm-mr.h                        |  89 +++++++
 include/trace/events/tsm_mr.h                 |  80 ++++++
 9 files changed, 454 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/driver-api/coco/index.rst
 create mode 100644 Documentation/driver-api/coco/measurement-registers.rst
 create mode 100644 drivers/virt/coco/tsm-mr.c
 create mode 100644 include/linux/tsm-mr.h
 create mode 100644 include/trace/events/tsm_mr.h

diff --git a/Documentation/driver-api/coco/index.rst b/Documentation/driver-api/coco/index.rst
new file mode 100644
index 000000000000..af9f08ca0cfd
--- /dev/null
+++ b/Documentation/driver-api/coco/index.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+======================
+Confidential Computing
+======================
+
+.. toctree::
+   :maxdepth: 1
+
+   measurement-registers
+
+.. only::  subproject and html
diff --git a/Documentation/driver-api/coco/measurement-registers.rst b/Documentation/driver-api/coco/measurement-registers.rst
new file mode 100644
index 000000000000..cef85945a9a7
--- /dev/null
+++ b/Documentation/driver-api/coco/measurement-registers.rst
@@ -0,0 +1,12 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+=====================
+Measurement Registers
+=====================
+
+.. kernel-doc:: include/linux/tsm-mr.h
+   :internal:
+
+.. kernel-doc:: drivers/virt/coco/tsm-mr.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 16e2c4ec3c01..3e2a270bd828 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -81,6 +81,7 @@ Subsystem-specific APIs
    acpi/index
    backlight/lp855x-driver.rst
    clk
+   coco/index
    console
    crypto/index
    dmaengine/index
diff --git a/MAINTAINERS b/MAINTAINERS
index 69511c3b2b76..5d36823d26b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24648,8 +24648,9 @@ M:	Dan Williams <dan.j.williams@intel.com>
 L:	linux-coco@lists.linux.dev
 S:	Maintained
 F:	Documentation/ABI/testing/configfs-tsm
-F:	drivers/virt/coco/tsm.c
-F:	include/linux/tsm.h
+F:	Documentation/driver-api/coco/
+F:	drivers/virt/coco/tsm*.c
+F:	include/linux/tsm*.h
 
 TRUSTED SERVICES TEE DRIVER
 M:	Balint Dobszay <balint.dobszay@arm.com>
diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
index ff869d883d95..737106d5dcbc 100644
--- a/drivers/virt/coco/Kconfig
+++ b/drivers/virt/coco/Kconfig
@@ -7,6 +7,11 @@ config TSM_REPORTS
 	select CONFIGFS_FS
 	tristate
 
+config TSM_MEASUREMENTS
+	select CRYPTO_HASH_INFO
+	select CRYPTO
+	bool
+
 source "drivers/virt/coco/efi_secret/Kconfig"
 
 source "drivers/virt/coco/pkvm-guest/Kconfig"
diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
index c3d07cfc087e..eb6ec5c1d2e1 100644
--- a/drivers/virt/coco/Makefile
+++ b/drivers/virt/coco/Makefile
@@ -3,6 +3,7 @@
 # Confidential computing related collateral
 #
 obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
+obj-$(CONFIG_TSM_MEASUREMENTS)	+= tsm-mr.o
 obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
 obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
 obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
new file mode 100644
index 000000000000..1f0c43a516fb
--- /dev/null
+++ b/drivers/virt/coco/tsm-mr.c
@@ -0,0 +1,251 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright(c) 2024-2025 Intel Corporation. All rights reserved. */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/tsm_mr.h>
+
+/*
+ * struct tm_context - contains everything necessary to implement sysfs
+ * attributes for MRs.
+ * @rwsem: protects the MR cache from concurrent access.
+ * @agrp: contains all MR attributes created by tsm_mr_create_attribute_group().
+ * @tm: input to tsm_mr_create_attribute_group() containing MR definitions/ops.
+ * @in_sync: %true if MR cache is up-to-date.
+ * @mrs: array of &struct bin_attribute, one for each MR.
+ *
+ * This internal structure contains everything needed to implement
+ * tm_digest_read() and tm_digest_write().
+ *
+ * Given tm->refresh() is potentially expensive, tm_digest_read() caches MR
+ * values and calls tm->refresh() only when necessary. Only live MRs (i.e., with
+ * %TSM_MR_F_LIVE set) can trigger tm->refresh(), while others are assumed to
+ * retain their values from the last tm->write(). @in_sync tracks if there have
+ * been tm->write() calls since the last tm->refresh(). That is, tm->refresh()
+ * will be called only when a live MR is being read and the cache is stale
+ * (@in_sync is %false).
+ *
+ * tm_digest_write() sets @in_sync to %false and calls tm->write(), whose
+ * semantics is arch and MR specific. Most (if not all) writable MRs support the
+ * extension semantics (i.e., tm->write() extends the input buffer into the MR).
+ */
+struct tm_context {
+	struct rw_semaphore rwsem;
+	struct attribute_group agrp;
+	const struct tsm_measurements *tm;
+	bool in_sync;
+	struct bin_attribute mrs[];
+};
+
+static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
+			      const struct bin_attribute *attr, char *buffer,
+			      loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	int rc;
+
+	ctx = attr->private;
+	rc = down_read_interruptible(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	/*
+	 * @ctx->in_sync indicates if the MR cache is stale. It is a global
+	 * instead of a per-MR flag for simplicity, as most (if not all) archs
+	 * allow reading all MRs in oneshot.
+	 *
+	 * ctx->refresh() is necessary only for LIVE MRs, while others retain
+	 * their values from their respective last ctx->write().
+	 */
+	if ((mr->mr_flags & TSM_MR_F_LIVE) && !ctx->in_sync) {
+		up_read(&ctx->rwsem);
+
+		rc = down_write_killable(&ctx->rwsem);
+		if (rc)
+			return rc;
+
+		if (!ctx->in_sync) {
+			rc = ctx->tm->refresh(ctx->tm);
+			ctx->in_sync = !rc;
+			trace_tsm_mr_refresh(mr, rc);
+		}
+
+		downgrade_write(&ctx->rwsem);
+	}
+
+	memcpy(buffer, mr->mr_value + off, count);
+	trace_tsm_mr_read(mr);
+
+	up_read(&ctx->rwsem);
+	return rc ?: count;
+}
+
+static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
+			       const struct bin_attribute *attr, char *buffer,
+			       loff_t off, size_t count)
+{
+	struct tm_context *ctx;
+	const struct tsm_measurement_register *mr;
+	ssize_t rc;
+
+	/* partial writes are not supported */
+	if (off != 0 || count != attr->size)
+		return -EINVAL;
+
+	ctx = attr->private;
+	mr = &ctx->tm->mrs[attr - ctx->mrs];
+
+	rc = down_write_killable(&ctx->rwsem);
+	if (rc)
+		return rc;
+
+	rc = ctx->tm->write(ctx->tm, mr, buffer);
+
+	/* mark MR cache stale */
+	if (!rc) {
+		ctx->in_sync = false;
+		trace_tsm_mr_write(mr, buffer);
+	}
+
+	up_write(&ctx->rwsem);
+	return rc ?: count;
+}
+
+/**
+ * tsm_mr_create_attribute_group() - creates an attribute group for measurement
+ * registers (MRs)
+ * @tm: pointer to &struct tsm_measurements containing the MR definitions.
+ *
+ * This function creates attributes corresponding to the MR definitions
+ * provided by @tm->mrs.
+ *
+ * The created attributes will reference @tm and its members. The caller must
+ * not free @tm until after tsm_mr_free_attribute_group() is called.
+ *
+ * Context: Process context. May sleep due to memory allocation.
+ *
+ * Return:
+ * * On success, the pointer to a an attribute group is returned; otherwise
+ * * %-EINVAL - Invalid MR definitions.
+ * * %-ENOMEM - Out of memory.
+ */
+const struct attribute_group *
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
+{
+	size_t nlen;
+
+	if (!tm || !tm->mrs)
+		return ERR_PTR(-EINVAL);
+
+	/* aggregated length of all MR names */
+	nlen = 0;
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_LIVE) && !tm->refresh)
+			return ERR_PTR(-EINVAL);
+
+		if ((tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) && !tm->write)
+			return ERR_PTR(-EINVAL);
+
+		if (!tm->mrs[i].mr_name)
+			return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			continue;
+
+		if (tm->mrs[i].mr_hash >= HASH_ALGO__LAST)
+			return ERR_PTR(-EINVAL);
+
+		/* MR sysfs attribute names have the form of MRNAME:HASH */
+		nlen += strlen(tm->mrs[i].mr_name) + 1 +
+			strlen(hash_algo_name[tm->mrs[i].mr_hash]) + 1;
+	}
+
+	/*
+	 * @attrs and the MR name strings are combined into a single allocation
+	 * so that we don't have to free MR names one-by-one in
+	 * tsm_mr_free_attribute_group()
+	 */
+	const struct bin_attribute * const *attrs __free(kfree) =
+		kzalloc(sizeof(*attrs) * (tm->nr_mrs + 1) + nlen, GFP_KERNEL);
+	struct tm_context *ctx __free(kfree) =
+		kzalloc(struct_size(ctx, mrs, tm->nr_mrs), GFP_KERNEL);
+	char *name, *end;
+
+	if (!ctx || !attrs)
+		return ERR_PTR(-ENOMEM);
+
+	/* @attrs is followed immediately by MR name strings */
+	name = (char *)&attrs[tm->nr_mrs + 1];
+	end = name + nlen;
+
+	for (size_t i = 0; i < tm->nr_mrs; ++i) {
+		/* break const for init */
+		struct bin_attribute **bas = (struct bin_attribute **)attrs;
+
+		bas[i] = &ctx->mrs[i];
+		sysfs_bin_attr_init(bas[i]);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_NOHASH)
+			bas[i]->attr.name = tm->mrs[i].mr_name;
+		else if (name < end) {
+			bas[i]->attr.name = name;
+			name += snprintf(name, end - name, "%s:%s",
+					 tm->mrs[i].mr_name,
+					 hash_algo_name[tm->mrs[i].mr_hash]);
+			++name;
+		} else
+			return ERR_PTR(-EINVAL);
+
+		/* check for duplicated MR definitions */
+		for (size_t j = 0; j < i; ++j)
+			if (!strcmp(bas[i]->attr.name, bas[j]->attr.name))
+				return ERR_PTR(-EINVAL);
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_READABLE) {
+			bas[i]->attr.mode |= 0444;
+			bas[i]->read_new = tm_digest_read;
+		}
+
+		if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
+			bas[i]->attr.mode |= 0200;
+			bas[i]->write_new = tm_digest_write;
+		}
+
+		bas[i]->size = tm->mrs[i].mr_size;
+		bas[i]->private = ctx;
+	}
+
+	if (name != end)
+		return ERR_PTR(-EINVAL);
+
+	init_rwsem(&ctx->rwsem);
+	ctx->agrp.name = "measurements";
+	ctx->agrp.bin_attrs_new = no_free_ptr(attrs);
+	ctx->tm = tm;
+	return &no_free_ptr(ctx)->agrp;
+}
+EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
+
+/**
+ * tsm_mr_free_attribute_group() - frees the attribute group returned by
+ * tsm_mr_create_attribute_group()
+ * @attr_grp: attribute group returned by tsm_mr_create_attribute_group()
+ *
+ * Context: Process context.
+ */
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp)
+{
+	if (!IS_ERR_OR_NULL(attr_grp)) {
+		kfree(attr_grp->bin_attrs);
+		kfree(container_of(attr_grp, struct tm_context, agrp));
+	}
+}
+EXPORT_SYMBOL_GPL(tsm_mr_free_attribute_group);
diff --git a/include/linux/tsm-mr.h b/include/linux/tsm-mr.h
new file mode 100644
index 000000000000..50a521f4ac97
--- /dev/null
+++ b/include/linux/tsm-mr.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __TSM_MR_H
+#define __TSM_MR_H
+
+#include <crypto/hash_info.h>
+
+/**
+ * struct tsm_measurement_register - describes an architectural measurement
+ * register (MR)
+ * @mr_name: name of the MR
+ * @mr_value: buffer containing the current value of the MR
+ * @mr_size: size of the MR - typically the digest size of @mr_hash
+ * @mr_flags: bitwise OR of one or more flags, detailed below
+ * @mr_hash: optional hash identifier defined in include/uapi/linux/hash_info.h.
+ *
+ * A CC guest driver encloses an array of this structure in struct
+ * tsm_measurements to detail the measurement facility supported by the
+ * underlying CC hardware.
+ *
+ * @mr_name and @mr_value must stay valid until this structure is no longer in
+ * use.
+ *
+ * @mr_flags is the bitwise-OR of zero or more of the flags below.
+ *
+ * * %TSM_MR_F_READABLE - the sysfs attribute corresponding to this MR is readable.
+ * * %TSM_MR_F_WRITABLE - the sysfs attribute corresponding to this MR is writable.
+ *   The semantics is typically to extend the MR but could vary depending on the
+ *   architecture and the MR.
+ * * %TSM_MR_F_LIVE - this MR's value may differ from the last value written, so
+ *   must be read back from the underlying CC hardware/firmware.
+ * * %TSM_MR_F_RTMR - bitwise-OR of %TSM_MR_F_LIVE and %TSM_MR_F_WRITABLE.
+ * * %TSM_MR_F_NOHASH - this MR does NOT have an associated hash algorithm.
+ *   @mr_hash will be ignored when this flag is set.
+ */
+struct tsm_measurement_register {
+	const char *mr_name;
+	void *mr_value;
+	u32 mr_size;
+	u32 mr_flags;
+	enum hash_algo mr_hash;
+};
+
+#define TSM_MR_F_NOHASH 1
+#define TSM_MR_F_WRITABLE 2
+#define TSM_MR_F_READABLE 4
+#define TSM_MR_F_LIVE 8
+#define TSM_MR_F_RTMR (TSM_MR_F_LIVE | TSM_MR_F_WRITABLE)
+
+#define TSM_MR_(mr, hash)                              \
+	.mr_name = #mr, .mr_size = hash##_DIGEST_SIZE, \
+	.mr_hash = HASH_ALGO_##hash, .mr_flags = TSM_MR_F_READABLE
+
+/**
+ * struct tsm_measurements - defines the CC architecture specific measurement
+ * facility and methods for updating measurement registers (MRs)
+ * @mrs: Array of MR definitions.
+ * @nr_mrs: Number of elements in @mrs.
+ * @refresh: Callback function to load/sync all MRs from TVM hardware/firmware
+ *           into the kernel cache.
+ * @write: Callback function to write to the MR specified by the parameter @mr.
+ *         Typically, writing to an MR extends the input buffer to that MR.
+ *
+ * The @refresh callback is invoked when an MR with %TSM_MR_F_LIVE set is being
+ * read and the cache is stale. It must reload all MRs with %TSM_MR_F_LIVE set.
+ * The function parameter @tm is a pointer pointing back to this structure.
+ *
+ * The @write callback is invoked whenever an MR is being written. It takes two
+ * additional parameters besides @tm:
+ *
+ * * @mr - points to the MR (an element of @tm->mrs) being written.
+ * * @data - contains the bytes to write and whose size is @mr->mr_size.
+ *
+ * Both @refresh and @write should return 0 on success and an appropriate error
+ * code on failure.
+ */
+struct tsm_measurements {
+	const struct tsm_measurement_register *mrs;
+	size_t nr_mrs;
+	int (*refresh)(const struct tsm_measurements *tm);
+	int (*write)(const struct tsm_measurements *tm,
+		     const struct tsm_measurement_register *mr, const u8 *data);
+};
+
+const struct attribute_group *
+tsm_mr_create_attribute_group(const struct tsm_measurements *tm);
+void tsm_mr_free_attribute_group(const struct attribute_group *attr_grp);
+
+#endif
diff --git a/include/trace/events/tsm_mr.h b/include/trace/events/tsm_mr.h
new file mode 100644
index 000000000000..f40de4ad3e2d
--- /dev/null
+++ b/include/trace/events/tsm_mr.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM tsm_mr
+
+#if !defined(_TRACE_TSM_MR_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_TSM_MR_H
+
+#include <linux/tracepoint.h>
+#include <linux/tsm-mr.h>
+
+TRACE_EVENT(tsm_mr_read,
+
+	TP_PROTO(const struct tsm_measurement_register *mr),
+
+	TP_ARGS(mr),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__string(hash, mr->mr_flags & TSM_MR_F_NOHASH ?
+			 "data" : hash_algo_name[mr->mr_hash])
+		__dynamic_array(u8, d, mr->mr_size)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__assign_str(hash);
+		memcpy(__get_dynamic_array(d), mr->mr_value, __get_dynamic_array_len(d));
+	),
+
+	TP_printk("[%s] %s:%s", __get_str(mr), __get_str(hash),
+		  __print_hex_str(__get_dynamic_array(d), __get_dynamic_array_len(d)))
+);
+
+TRACE_EVENT(tsm_mr_refresh,
+
+	TP_PROTO(const struct tsm_measurement_register *mr, int rc),
+
+	TP_ARGS(mr, rc),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__field(int, rc)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__entry->rc = rc;
+	),
+
+	TP_printk("[%s] %s:%d", __get_str(mr),
+		  __entry->rc ? "failed" : "succeeded", __entry->rc)
+);
+
+TRACE_EVENT(tsm_mr_write,
+
+	TP_PROTO(const struct tsm_measurement_register *mr, const u8 *data),
+
+	TP_ARGS(mr, data),
+
+	TP_STRUCT__entry(
+		__string(mr, mr->mr_name)
+		__string(hash, mr->mr_flags & TSM_MR_F_NOHASH ?
+			 "data" : hash_algo_name[mr->mr_hash])
+		__dynamic_array(u8, d, mr->mr_size)
+	),
+
+	TP_fast_assign(
+		__assign_str(mr);
+		__assign_str(hash);
+		memcpy(__get_dynamic_array(d), data, __get_dynamic_array_len(d));
+	),
+
+	TP_printk("[%s] %s:%s", __get_str(mr), __get_str(hash),
+		  __print_hex_str(__get_dynamic_array(d), __get_dynamic_array_len(d)))
+);
+
+#endif
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

