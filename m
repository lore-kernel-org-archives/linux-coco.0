Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CB136358
	for <linux-coco@lists.linux.dev>; Thu,  8 May 2025 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746666421; cv=fail; b=mImHKTk26Dhd2nOJYQ8b/69796S/Hs4fIy97F5WIMiLQrcxvc/lbKvOI1RMwSnSrtU4fF8LNwqHKNiuHN83Fc/zblRHtASu67tR/Sd+k/flLKf9bgzjgn+UkXMEvUqO4owsI3CUMnPedRwllP6GNyPkuDFzSFxFWNyG86hPz0qU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746666421; c=relaxed/simple;
	bh=m37admWUFtFXgE1QGdzf1sjmt9tbkbESljp9DRUtUBM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ge3wwyygDrLHDbY0jnuJN9SHdBz1atui75F3/VNMi5W2elsHHWISEAyBRkO6KngYjmJcz8nPfc2MFH1iZAPq8j+7tVaU06Ot5RU6ippT3zSD0gWjidQq5czJUV8CqlmoiYb1bMOAM/kLD0utzJigmWeej5pixIgkazi0VWUz/sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5I7K5Kp; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5I7K5Kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746666419; x=1778202419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=m37admWUFtFXgE1QGdzf1sjmt9tbkbESljp9DRUtUBM=;
  b=b5I7K5KpyIZcObO+aOggz1hsKb3biCbL55KubrFiQg5N4SsQpKXhT84l
   SAVuEpbwo1/O3NB5ZvB9r019ycFbZnUPOA1/49tHXKWdyKlG4uHvipGO3
   UiyAtMjFH+DAnZY7auLvUuYfTK4cb4FBOkvVoiQZDbZshIDU0YCEkzZqU
   aiRd7/xfOlIxCSIv98riIFgsmvPVGi8Z27HxL5H/1S7THrIz4HYL/0Gcy
   dgY37FNofRGiuepHE7OrEKxoUKWKP6GiZMKdUC9kk6uK2CIwQiQ3Q2s0J
   2aRnq6WGBh5LRh5utCT/C3A1BX2FPAf7+b2791vFEvPNXSTA7eKFiUOp+
   w==;
X-CSE-ConnectionGUID: rcSrkmZuTP2nWw+rGycXig==
X-CSE-MsgGUID: uroWB1ndSTSi5eXoVynaFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59779800"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59779800"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:06:56 -0700
X-CSE-ConnectionGUID: tjfpLbmqQmSdHzFukZHlTg==
X-CSE-MsgGUID: /2nCfjnaQrKMOUwTDY8pjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; 
   d="scan'208";a="136008510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 18:06:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 18:06:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 18:06:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 18:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zReLIUarERV8LDJfygQhmQ7gkkpafXpLkePpsFHvjG4JstSxqm+CB978dNrgj8i+2eDpr7iuLrofEAO61lYaQ/2TyxCcMH+W0k+tIb29grB7Hk6qCPCJQP/f/TQPuTy1c/J18wroyEjuzCArER38ChEV/4oh+/ZfRfXzVjmr0VTIEhLZaFpkzopZeKttbRAjtP06ndTUtrCDRvZ04oUc1GBkFJL+Ewl2YhMd8Bq2D4YyWliWfrJTZbogGrjQW+MJB77U4uJ1m5Kokv2YyyaOD9ZxKtSB73Bi0e35rUxu1n/ontHYVGUgxIz6DqC1vsntMzZEZP/8lsYJLvi6EMczxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f03/04g4Vzp7IdzSXJyC8UN82RS1H3IaBHjLK2RTktw=;
 b=OM/94vk/gf5rTEGs82O80VKr3M5YfA+hVcxpAqrtyJt1BGp4m7HFw0pG36ER4Fn5ZxETJjKuGjdL0CCT9qjP4kwym1e0sVAcsSF77rW1caAzcAf1/17nTcVmGY3YKFLkECjRhK8i3Xmm05X8fAKyJ0Sht0nD7h0I/rNPVYHYWkMGb9NqPV+BZ1JJEw8ZoBSKzVMGPczqgYbgu9HIck2SVKGNpT+KWIMiNdN8pgNtBJhMqaJXVRUMdkH3J6dlVmuinTiS+fKw8n5r2RgEPFQtH3k+Rzx9lnxOYvtsjZVvM0ZxorEIaWqHCZR88YyzRAzMpDgNNf9gBDeWkbQ/Tx+SYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB8202.namprd11.prod.outlook.com (2603:10b6:8:18b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 01:06:09 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 01:06:09 +0000
From: Dan Williams <dan.j.williams@intel.com>
To: <linux-coco@lists.linux.dev>
CC: <cedric.xing@intel.com>
Subject: [PATCH v7 5/7] virt: tdx-guest: Expose TDX MRs as sysfs attributes
Date: Wed, 7 May 2025 18:06:06 -0700
Message-ID: <20250508010606.4129953-1-dan.j.williams@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506-tdx-rtmr-v6-5-ac6ff5e9d58a@intel.com>
References: <20250506-tdx-rtmr-v6-5-ac6ff5e9d58a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0378.namprd04.prod.outlook.com
 (2603:10b6:303:81::23) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB8202:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf624ce-8787-4eae-5a27-08dd8dcc846e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUNvWHh0SXhEaisybjZ1NmEzUjUvVXlJVGxqSWl0alJ6dzFFRENNN080RWhk?=
 =?utf-8?B?d0xRN2g5SmptTWZwaytGaG40TTlvSHFmbUg4Ky9VNTFmU29qaW1uTG9UUENZ?=
 =?utf-8?B?NktmdkNOakZqeCs1Sy9XSS9jZ1lSNFJDVVMxbFZneTVpWGluVS9BbENFVVNH?=
 =?utf-8?B?UWQvenlBeGNiS05zMEphcDFmTURSR2xkYUdxUXUwZU1oaUFVcHRNaHlQK083?=
 =?utf-8?B?aGF2OFF4bDUxNDI0ZzFJQ0llSjBueVByQUpyMDJ3am9QSTY0Z0M3c05NU3NB?=
 =?utf-8?B?anhYT1VnMlNweDkyRFFuS3J1ZGZuckIzNTYyQVUwZURySE5lbnFSSkpiUUxn?=
 =?utf-8?B?RE8yeVhEZFpsdHBDQmVnWGZnWm1iT3Vka0F6WFlGbmNDZHJ6N092anVydFow?=
 =?utf-8?B?c0xqVmExamJQNzFYRlVzREtEclFKSmFnL2RiL08vSmhwRWoxYzA1ZUw4cnhj?=
 =?utf-8?B?UDU5d2NheXFPZFB5V1FDeGFVVU5KM1crd0d1aHp1VEhUWlVKNVJCYXhSajlv?=
 =?utf-8?B?WEdaYU5GZGJBaWthMXR0bUNKNGlZcDVPUkxYYXVKcko1QWFyeDhYdW9UTHda?=
 =?utf-8?B?MGFXZmRUSzNRdlhyRFJQcnAxSGpQeGtCRTNNbXp3ajJpZHVpdmNKMVlPeFR1?=
 =?utf-8?B?R0s2bStveWFhOFg2YVVIMWRYMHNLRTBSbWFCTVdBbnBTbHV6MnRyYTF2ZHRx?=
 =?utf-8?B?Q0R6T3BSbE94NjY1MlJGTGFCbFZNVVZzMDR3cGk3Ym1hYURNaXhHNmVybDR6?=
 =?utf-8?B?MmM3ZFVXTDd2di9mTnZMZVd6ZWpVQ0Vkc1VFY2NIQTBSUGhaZU5VT2U3QnpK?=
 =?utf-8?B?SitWNWJ5ZDNvWEN2UFVENHFRS0JoYjRURXBSbFZ6UVh1czJRblE2WlpxUWJm?=
 =?utf-8?B?ZjloejFKU2s4a0hyam5yRFdxS25vN2hvbnZrWG01dmtnNmlZYTN3MWJFQ0RY?=
 =?utf-8?B?TXVlQUExb3dpMm92clJsTVdWWDh5WXlBcUJIQ2tHcU9JV0pzYUhDLzZNdmtj?=
 =?utf-8?B?R25zd21HcFRiZnpvM1AwaFlMbW5jWVB1Q2VRblhOT1VxeXJISFA4WEhtWUtP?=
 =?utf-8?B?ZGZIOUxYYU9HMklmNkV1eWtVa3pxdGt1K1hZOXhPMEJVWE9GSXVIMmw5RllD?=
 =?utf-8?B?TTBZQ2djNmRmTFVCQk5ra3hDZHpVZ3EzMFl0THpoY1VJTkJTcXVPanJ4SmVr?=
 =?utf-8?B?OG45cXcyZ1JGUmJpcjlIMyt3ODk2V21aa3c1TVhTYm5xQmFsTlluSHBMMDlk?=
 =?utf-8?B?b0NPd2cyazJJak0zZy9qTGp6QmZ6S0pGNUNOKzlkeTlXNEhGNkhjWUk5bnIr?=
 =?utf-8?B?ZTRZL1BXbitNaVpkem4vUXhVaXNLdFphSE4wQTVDR21EWlRKOXVqRlRXL1ZR?=
 =?utf-8?B?eXFCM29zVWRVTUs5WHBWRDBvNHJvUlFXdFBKYld6MWdVdFIrYkJERE1udkdS?=
 =?utf-8?B?ejQ1SnJRK3YrUDdyS0o2Y0w1dlJPY0xLZEZEUVgzY01zbTZ2Y1RBNmlxYnFv?=
 =?utf-8?B?ZytZMS9wdEo3MjJWQzNDdkhFYm9rd2kvR3FTVVBEM2xxZS9WM3A1dktzcUo3?=
 =?utf-8?B?K0VLdFhrL0dyNWF2bEF6SHFWOGxMRmVnMlBmM3U0YnJXcTlKVUZWa1BPa3Fm?=
 =?utf-8?B?Vnl2Z3dWc09QNDQzSkVJZTkzWEd3aHA5K3NxLzBhYU9odHRGcHJLVWJXa0Jy?=
 =?utf-8?B?UDJ0TlZHUVZtS1FWRmUwRFFZK2t5ZWVEdncyY0pxREFveUFKNTVpRGhJSjVT?=
 =?utf-8?B?R0h0M0o5cFQvbkVmcWVhV2R5VkloSEt0eTVlNkQ3c253by9EZm9uREh3NjNB?=
 =?utf-8?B?cWxENmJLdmNFZDRHWVNLTDIzQlNmL0ZoQ2hNb1NLSnB5QmN2K05SWTVIOVNw?=
 =?utf-8?Q?6b/9f8b2SLXB7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNIT0tDUXVHWXl4dTNNZ0tvTHI5Y3gzUUlPTXE4ZURXOFNPbjh6VXYzRkc0?=
 =?utf-8?B?aUxqTWJ2SUhJdGZ0MnJKWHM3RU5WbTI2UmxYSGkrelJkZmtId08wdFRDN1Vq?=
 =?utf-8?B?ZGxmMDAzMU9TS01oblhKZ0JwQjFiV0JFYmRqSEdFR200ZmlBVXRxSjdob2tj?=
 =?utf-8?B?TGlEUXBpNXIrblVXWEdLQjFrWnkxdFUwVUVuTlpsbGM2K3QySFJDVTBlYlQ3?=
 =?utf-8?B?OUlmUHBWNlpteEZLYUFMV0cvQkdVc2JOblU1VS82cUFrK0hyNXNHWUFndVc1?=
 =?utf-8?B?VXJhb3dIdk9uTUNpbG9xdmQzTHkxQVB0WjY3ZWVqVWdGRThNaW1oRmRUZ0tP?=
 =?utf-8?B?T2gyNU1nWndYNGtRV2pjUjNaQldJWmQ1YzhIZjVhd3VQOEJzZ2xIeXlCcVhT?=
 =?utf-8?B?OVlWUkIwOUtQSFloWjhiRW9QSkdsSXc0UlBnNjNTbklMbERaTytSNm1NZm1p?=
 =?utf-8?B?d3pHZnVuVDlWaUU1TVgvY0pkODhQTXhRN2hETHJaMXRaMG82aXFLL3I4RW9a?=
 =?utf-8?B?cVlTUlQ2aERHckFNZCtEVVgyRC9yOG5vTmtnWERyMWprR1pNK2ZoVTFVelAz?=
 =?utf-8?B?NzU0cklRRk1yU2w0aVUxTW1HTnhieHQ1VDRUTW9VQnFMQWlEMytOdG93ZG5k?=
 =?utf-8?B?dVRXQmlHQ3V6S2RkQXhGSG4ydFQ1bmVzQzdackV1RkR2bWJXZTdhWnFXLy8r?=
 =?utf-8?B?d0lFTG9TeU1zTGtKUGpEbXJNWkU2SlVNdklvNENGZHo3Z2c5RE9nYlNJcXlW?=
 =?utf-8?B?aEU2TkJBcFM0anduUTB0RDdWNVc1enFMNnJwcW8xRHBHUU9wQTh3bWZpZHpr?=
 =?utf-8?B?bFlqOFhMdWlxNUtQTW0rcnA2NXJaNEVKZW5Iei9KazBGRHNqcExDQ28rSklr?=
 =?utf-8?B?dkZKU0pNa3llL0RIdmFRc1kzSGcwcmdUVFA4ejdvWW4wdmZtMVJQYnE5Wmho?=
 =?utf-8?B?Z0MvODh2Z0c2VEJ4ZGozSnNjdG1YNzZvK0lJbzFmOElmTW04UFBJY29ydTI0?=
 =?utf-8?B?bjBmTUE5MVViT3dza3RtcWxieEJ0VlJWdnpDY3lBeHpVSmRZSU1MNk90VFNx?=
 =?utf-8?B?aldkcjdXVUdORWZhMTdsZWNuZDdDTXJyLzJtU3Z5WGdtVjdtQzRzYlBQZkxJ?=
 =?utf-8?B?V2dxd0Vqc3RSRWpjdXFDVkcvVUthZHhNQ09tTngzb1RObUlKU0FLMlFSeDA4?=
 =?utf-8?B?K2FwM2xsb2xXc2xtT1ByZWRwNzE5YVAxQ0ZoTytjNlozQnMvNjNjcmxUZzFw?=
 =?utf-8?B?SFB5aG9kUWpUeDc1Zi9CT0tJT1d3eHQ4VDhEZndiTko2U0JoWmkxRmlJZ1Fw?=
 =?utf-8?B?VFIvMVhzZVJSREpnc21oNWZCVnJKMFZBL0YxeUlPZTFCcHRJSjZERlpNcFQ5?=
 =?utf-8?B?Qk5QYlZLYmM2dS9MVHJaK1BKVWtpMUNlSjI5R0VOUk94R2ppUnUxYWZKMTZN?=
 =?utf-8?B?RzA1aU42a0FxSjBleVhIWEpmN1E5elVmc3R5cHdDZ09ESXd2NkhJN3hWaDR0?=
 =?utf-8?B?QTY4dW5IRklyc0VyUmpPOHRtYWNaeDBWMzVwWUoreWhKSjErRWloamVGTWFR?=
 =?utf-8?B?UXFVYTl1VEEwdjc3U2p5dnNZWTd0UE5SMjhZNFpBcWMvS0x4YVJqK3hWd2pC?=
 =?utf-8?B?dlVvZ3FrR3cvOHJhZzBBa25aTGVudkY0ZGg0c1RxMGx2dkhGT2VuSDV5QUNO?=
 =?utf-8?B?VUFWazZxM1lHTGl0K0U2eHdmamVFa0pHZ2t5UWN4aVA2Z0xxdmZvT1VBWjdZ?=
 =?utf-8?B?aHowSmZYK20vWm1oczRUZU5tdmE3VytQcmZlMFNrN256WXZDSUhvd3RrZ2Fy?=
 =?utf-8?B?Rm9DUUNYL2ZnQnRFTEZ0eUJmSW1kZWdCNHVuakRBWkxNMnlNQ2EvUFRoUWlp?=
 =?utf-8?B?OEw4Q0NYZS83UFo3dDZLelM5bk5sd2I3bGRROWpWaithdTFDQkhZL25MWUpB?=
 =?utf-8?B?VXdIbVBXcURVdE9BaGpRQk1nUjFMSmZDMUNmRWlsNlp0bjE1OHNJOVVXWFdz?=
 =?utf-8?B?Q1IwbFAyTUhxNGV6QkhxMHhpdVYxWEJOY0dPOFptRjQydnhkMzlOcFpSWmJz?=
 =?utf-8?B?UnFlLzZwNzBLbm5TQ3dhdmxRRU40c2FPUXhUSGxKY05wK1p6VEpGL2pQOGN4?=
 =?utf-8?B?eUlWKzR6MFZpU3hNNHd3emRyUVNsL3JvcW1idlB3TENnK3Q3QzB0SkhUQmFL?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf624ce-8787-4eae-5a27-08dd8dcc846e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 01:06:09.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwT2aKL7WR+XbPkzMkX3dgtdMHnxKCF0xpsLtHd6PAe9z5owc2q1UTKFmKNTJV85cNJfzT1VrussvImQ77cDO8dTy2+f8xTJhEN51x85qSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8202
X-OriginatorOrg: intel.com

From: Cedric Xing <cedric.xing@intel.com>

Expose the most commonly used TDX MRs (Measurement Registers) as sysfs
attributes. Use the ioctl() interface of /dev/tdx_guest to request a full
TDREPORT for access to other TD measurements.

Directory structure of TDX MRs inside a TDVM is as follows:

/sys/class/misc/tdx_guest
└── measurements
    ├── mrconfigid
    ├── mrowner
    ├── mrownerconfig
    ├── mrtd:sha384
    ├── rtmr0:sha384
    ├── rtmr1:sha384
    ├── rtmr2:sha384
    └── rtmr3:sha384

Read the file/attribute to retrieve the current value of an MR. Write to
the file/attribute (if writable) to extend the corresponding RTMR. Refer to
Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest for more
information.

Signed-off-by: Cedric Xing <cedric.xing@intel.com>
Acked-by: Dionna Amalie Glaze <dionnaglaze@google.com>
[djbw: fixup exit order]
Signed-off-by: Dan Williams <dan.j.williams@intel.com>
---
 .../sysfs-devices-virtual-misc-tdx_guest      |  63 ++++++++
 MAINTAINERS                                   |   1 +
 drivers/virt/coco/tdx-guest/Kconfig           |   1 +
 drivers/virt/coco/tdx-guest/tdx-guest.c       | 151 +++++++++++++++++-
 4 files changed, 214 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest

diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
new file mode 100644
index 000000000000..8fca56c8c9df
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
@@ -0,0 +1,63 @@
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/MRNAME[:HASH]
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		Value of a TDX measurement register (MR). MRNAME and HASH above
+		are placeholders. The optional suffix :HASH is used for MRs
+		that have associated hash algorithms. See below for a complete
+		list of TDX MRs exposed via sysfs. Refer to Intel TDX Module
+		ABI Specification for the definition of TDREPORT and the full
+		list of TDX measurements.
+
+		Intel TDX Module ABI Specification can be found at:
+		https://www.intel.com/content/www/us/en/developer/tools/trust-domain-extensions/documentation.html#architecture
+
+		See also:
+		https://docs.kernel.org/driver-api/coco/measurement-registers.html
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrconfigid
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRCONFIGID - 48-byte immutable storage typically used for
+		software-defined ID for non-owner-defined configuration of the
+		guest TD – e.g., run-time or OS configuration.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrowner
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNER - 48-byte immutable storage typically used for
+		software-defined ID for the guest TD’s owner.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrownerconfig
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MROWNERCONFIG - 48-byte immutable storage typically used
+		for software-defined ID for owner-defined configuration of the
+		guest TD – e.g., specific to the workload rather than the
+		run-time or OS.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/mrtd:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RO) MRTD - Measurement of the initial contents of the TD.
+
+What:		/sys/devices/virtual/misc/tdx_guest/measurements/rtmr[0123]:sha384
+Date:		April, 2025
+KernelVersion:	v6.16
+Contact:	linux-coco@lists.linux.dev
+Description:
+		(RW) RTMR[0123] - 4 Run-Time extendable Measurement Registers.
+		Read from any of these returns the current value of the
+		corresponding RTMR. Write extends the written buffer to the
+		RTMR. All writes must start at offset 0 and be 48 bytes in
+		size. Partial writes will result in EINVAL returned by the
+		write() syscall.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8bf8a818bce5..912e16ace0b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26321,6 +26321,7 @@ L:	x86@kernel.org
 L:	linux-coco@lists.linux.dev
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
+F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
 F:	arch/x86/boot/compressed/tdx*
 F:	arch/x86/coco/tdx/
 F:	arch/x86/include/asm/shared/tdx.h
diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
index 22dd59e19431..dbbdc14383b1 100644
--- a/drivers/virt/coco/tdx-guest/Kconfig
+++ b/drivers/virt/coco/tdx-guest/Kconfig
@@ -2,6 +2,7 @@ config TDX_GUEST_DRIVER
 	tristate "TDX Guest driver"
 	depends on INTEL_TDX_GUEST
 	select TSM_REPORTS
+	select TSM_MEASUREMENTS
 	help
 	  The driver provides userspace interface to communicate with
 	  the TDX module to request the TDX guest details like attestation
diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
index 224e7dde9cde..15810fb02d98 100644
--- a/drivers/virt/coco/tdx-guest/tdx-guest.c
+++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2022 Intel Corporation
  */
 
+#define pr_fmt(fmt)			KBUILD_MODNAME ": " fmt
+
 #include <linux/kernel.h>
 #include <linux/miscdevice.h>
 #include <linux/mm.h>
@@ -15,14 +17,146 @@
 #include <linux/set_memory.h>
 #include <linux/io.h>
 #include <linux/delay.h>
+#include <linux/sockptr.h>
 #include <linux/tsm.h>
-#include <linux/sizes.h>
+#include <linux/tsm-mr.h>
 
 #include <uapi/linux/tdx-guest.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/tdx.h>
 
+/* TDREPORT buffer */
+static u8 *tdx_report_buf;
+
+/* Lock to serialize TDG.MR.REPORT and TDG.MR.RTMR.EXTEND TDCALLs */
+static DEFINE_MUTEX(mr_lock);
+
+/* TDREPORT fields */
+enum {
+	TDREPORT_reportdata = 128,
+	TDREPORT_tee_tcb_info = 256,
+	TDREPORT_tdinfo = TDREPORT_tee_tcb_info + 256,
+	TDREPORT_attributes = TDREPORT_tdinfo,
+	TDREPORT_xfam = TDREPORT_attributes + sizeof(u64),
+	TDREPORT_mrtd = TDREPORT_xfam + sizeof(u64),
+	TDREPORT_mrconfigid = TDREPORT_mrtd + SHA384_DIGEST_SIZE,
+	TDREPORT_mrowner = TDREPORT_mrconfigid + SHA384_DIGEST_SIZE,
+	TDREPORT_mrownerconfig = TDREPORT_mrowner + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr0 = TDREPORT_mrownerconfig + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr1 = TDREPORT_rtmr0 + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr2 = TDREPORT_rtmr1 + SHA384_DIGEST_SIZE,
+	TDREPORT_rtmr3 = TDREPORT_rtmr2 + SHA384_DIGEST_SIZE,
+	TDREPORT_servtd_hash = TDREPORT_rtmr3 + SHA384_DIGEST_SIZE,
+};
+
+static int tdx_do_report(sockptr_t data, sockptr_t tdreport)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		u8 *reportdata = tdx_report_buf + TDREPORT_reportdata;
+		int ret;
+
+		if (!sockptr_is_null(data) &&
+		    copy_from_sockptr(reportdata, data, TDX_REPORTDATA_LEN))
+			return -EFAULT;
+
+		ret = tdx_mcall_get_report0(reportdata, tdx_report_buf);
+		if (WARN_ONCE(ret, "tdx_mcall_get_report0() failed: %d", ret))
+			return ret;
+
+		if (!sockptr_is_null(tdreport) &&
+		    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
+			return -EFAULT;
+	}
+	return 0;
+}
+
+static int tdx_do_extend(u8 mr_ind, const u8 *data)
+{
+	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
+		/*
+		 * TDX requires @extend_buf to be 64-byte aligned.
+		 * It's safe to use REPORTDATA buffer for that purpose because
+		 * tdx_mr_report/extend_lock() are mutually exclusive.
+		 */
+		u8 *extend_buf = tdx_report_buf + TDREPORT_reportdata;
+		int ret;
+
+		memcpy(extend_buf, data, SHA384_DIGEST_SIZE);
+
+		ret = tdx_mcall_extend_rtmr(mr_ind, extend_buf);
+		if (WARN_ONCE(ret, "tdx_mcall_extend_rtmr(%u) failed: %d", mr_ind, ret))
+			return ret;
+	}
+	return 0;
+}
+
+#define TDX_MR_(r) .mr_value = (void *)TDREPORT_##r, TSM_MR_(r, SHA384)
+static struct tsm_measurement_register tdx_mrs[] = {
+	{ TDX_MR_(rtmr0) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr1) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr2) | TSM_MR_F_RTMR },
+	{ TDX_MR_(rtmr3) | TSM_MR_F_RTMR },
+	{ TDX_MR_(mrtd) },
+	{ TDX_MR_(mrconfigid) | TSM_MR_F_NOHASH },
+	{ TDX_MR_(mrowner) | TSM_MR_F_NOHASH },
+	{ TDX_MR_(mrownerconfig) | TSM_MR_F_NOHASH },
+};
+#undef TDX_MR_
+
+static int tdx_mr_refresh(const struct tsm_measurements *tm)
+{
+	return tdx_do_report(KERNEL_SOCKPTR(NULL), KERNEL_SOCKPTR(NULL));
+}
+
+static int tdx_mr_extend(const struct tsm_measurements *tm,
+			 const struct tsm_measurement_register *mr,
+			 const u8 *data)
+{
+	return tdx_do_extend(mr - tm->mrs, data);
+}
+
+static struct tsm_measurements tdx_measurements = {
+	.mrs = tdx_mrs,
+	.nr_mrs = ARRAY_SIZE(tdx_mrs),
+	.refresh = tdx_mr_refresh,
+	.write = tdx_mr_extend,
+};
+
+static const struct attribute_group *tdx_mr_init(void)
+{
+	const struct attribute_group *g;
+	int rc;
+
+	u8 *buf __free(kfree) = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
+
+	tdx_report_buf = buf;
+	rc = tdx_mr_refresh(&tdx_measurements);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * @mr_value was initialized with the offset only, while the base
+	 * address is being added here.
+	 */
+	for (size_t i = 0; i < ARRAY_SIZE(tdx_mrs); ++i)
+		*(long *)&tdx_mrs[i].mr_value += (long)buf;
+
+	g = tsm_mr_create_attribute_group(&tdx_measurements);
+	if (!IS_ERR(g))
+		tdx_report_buf = no_free_ptr(buf);
+
+	return g;
+}
+
+static void tdx_mr_deinit(const struct attribute_group *mr_grp)
+{
+	tsm_mr_free_attribute_group(mr_grp);
+	kfree(tdx_report_buf);
+}
+
 /*
  * Intel's SGX QE implementation generally uses Quote size less
  * than 8K (2K Quote data + ~5K of certificate blob).
@@ -285,10 +419,16 @@ static const struct file_operations tdx_guest_fops = {
 	.unlocked_ioctl = tdx_guest_ioctl,
 };
 
+static const struct attribute_group *tdx_attr_groups[] = {
+	NULL, /* measurements */
+	NULL
+};
+
 static struct miscdevice tdx_misc_dev = {
 	.name = KBUILD_MODNAME,
 	.minor = MISC_DYNAMIC_MINOR,
 	.fops = &tdx_guest_fops,
+	.groups = tdx_attr_groups,
 };
 
 static const struct x86_cpu_id tdx_guest_ids[] = {
@@ -311,9 +451,13 @@ static int __init tdx_guest_init(void)
 	if (!x86_match_cpu(tdx_guest_ids))
 		return -ENODEV;
 
+	tdx_attr_groups[0] = tdx_mr_init();
+	if (IS_ERR(tdx_attr_groups[0]))
+		return PTR_ERR(tdx_attr_groups[0]);
+
 	ret = misc_register(&tdx_misc_dev);
 	if (ret)
-		return ret;
+		goto deinit_mr;
 
 	quote_data = alloc_quote_buf();
 	if (!quote_data) {
@@ -332,6 +476,8 @@ static int __init tdx_guest_init(void)
 	free_quote_buf(quote_data);
 free_misc:
 	misc_deregister(&tdx_misc_dev);
+deinit_mr:
+	tdx_mr_deinit(tdx_attr_groups[0]);
 
 	return ret;
 }
@@ -342,6 +488,7 @@ static void __exit tdx_guest_exit(void)
 	tsm_unregister(&tdx_tsm_ops);
 	free_quote_buf(quote_data);
 	misc_deregister(&tdx_misc_dev);
+	tdx_mr_deinit(tdx_attr_groups[0]);
 }
 module_exit(tdx_guest_exit);
 

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
prerequisite-patch-id: bed73447560f59cfff2355f96ab28e8befc944c1
prerequisite-patch-id: 20487f32f35e67a3f986536e6f50bf34a12107f1
prerequisite-patch-id: 923b85a31f60c3bc1535ea2ae281547adb1dc0aa
prerequisite-patch-id: 3060593965fe5c2f2e124bceaf226b1abb9fe971
-- 
2.49.0

