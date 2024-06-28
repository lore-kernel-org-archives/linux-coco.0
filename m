Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB123D0
	for <linux-coco@lists.linux.dev>; Fri, 28 Jun 2024 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594968; cv=fail; b=bBbGhSLwqKyKZdj2/zCUD+oIJXng3AWjkCSyPgbZnUbeccuxRINN1nmDop/Xs1XlLCfb4vsr2/lzKVlyJVXwaf9Yu6PzEciiJk7KSdqMVv2WxzILyx1IilFlOeSs8oBNerQzsBDAiVmwx3y4oX+7cNVUnDAsmAwwBme5xURkk08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594968; c=relaxed/simple;
	bh=aJ0gZCiTkPwcMWUS9ARkJXbp+gF0BhzBk8cFLj0j7y4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=IPMhh3/X2E1Dbb/LkTpDlsC6W4zjnRdUx+LNZADP88EgdvSdy+cjyA96MTyZ00fEg4B9z3B9xLR0ui7jgGy8MLFhdEgNEPWDQn2zO8llnVmeFuy7lR3ASRMyvmaB0adyCcSJm80FlgK9ogWjr+kLfVoRZFki46ErZ+ve6c03GIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDLHvot5; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDLHvot5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719594967; x=1751130967;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aJ0gZCiTkPwcMWUS9ARkJXbp+gF0BhzBk8cFLj0j7y4=;
  b=XDLHvot5ndrDbwlciLb8rSQA6Q4PljQl0mjD8k2j5wsSijl67ca7JhM4
   77LPwKuiqqT0Eeg71XqD/S3euF0oJLRUAc/qV7VIr7P5FdTW/rx4jSPjx
   9oa8eOW0M2wOJHkIFiH8e8iXrw4kn7CLiL+GX48+5edHnKO8KBDAkoWm3
   Aj+2diwZ4ybR6Pj80gG/yjSBu7s8OGYHEgWX+zDc9pCRZmz0Rbu+WtHQT
   xhHH9sEBhPF4v4fr20kUKnyNBCJK+21f8QsjcK3W8KuUT6YxbeS6GdJ90
   jbvtCIF0a+eI8lzfDAU8MM17qLGwIM9kwoA1/dcZiWHa+Gsm+2VB8PYgP
   g==;
X-CSE-ConnectionGUID: bQHqgtMdRuW8mFlgmZK1Og==
X-CSE-MsgGUID: f7jp4ILBTa6Jil1FaXkFzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27475745"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="27475745"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 10:16:06 -0700
X-CSE-ConnectionGUID: GFFLzGM1S/qxbpKtxHdRiA==
X-CSE-MsgGUID: av8vBMthQ5ilMT4gXPnWsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49272630"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 10:16:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 10:16:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 10:16:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 10:16:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 10:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFoEh5KOHwAr+Je6+Xq0G0laBNp8yQAeCBkUD+SyxplKD56EFOItgV0Rpb1NKeUFVg/AQaAyGefkPQpZzO5bWG07FqBSPdK+JFJxiYZDWblJVsSIaHrbyKH/DzlFR/m0iFYjN82QHPqta4tEkK5+ODbjztDddjDXdsP7y8+Oe3x9W0IevW2cFMw1pOTkyTIRc0OmEnphZ/epbq6lIN+XGafpAaDg8slZo8aPsuMPRUHt0WYvNfgsjsV22YaXHnbuoom6yCQuDB59HnLTJEoTml9RCD+oDSJxlCM796jDI7pVgIUxmhrKRXP1OWClEZCQsf44hAKZUhY+zqt+VyhaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w7tV4QkQeT3gffXOr2SbrgJPdQQwteXKBroST8t+Aw=;
 b=d6xGvgTU6E3WweyTSE4E6BW0PvShhx/k6wmkthjg74nneAUAhlf3QVsbAhQThbfWjCXEJxr7KU6osZbbDKGLC7cHboW2M2cRneA4fMCilfXpEVzw7OQZ1nlE0z/2i8ZW2/+wxro5miKU+RCLHOA+GOB6KbEr7MJug+64/I1AUKtKAC27ww6n2/q4yhlZd2FZRZxmZdKBZIhEjsOFyk0m/6QwIMpvXj8VPMBAv4G/X0bK+iSVyKdUoXREzqtfh3an1zxr6hMp5QXjBjaVE35TsiFBDkef7/bftbmB8V35+um1+bBRS1I5SeFpIyOnoqd6aqvdlPPdvXX4A0xNnrULuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.28; Fri, 28 Jun
 2024 17:15:59 +0000
Received: from DM6PR11MB4739.namprd11.prod.outlook.com
 ([fe80::8547:750f:1865:925c]) by DM6PR11MB4739.namprd11.prod.outlook.com
 ([fe80::8547:750f:1865:925c%4]) with mapi id 15.20.7719.028; Fri, 28 Jun 2024
 17:15:57 +0000
Message-ID: <016dd1a5-b1ac-c413-e750-f785e47145f8@intel.com>
Date: Sat, 29 Jun 2024 01:17:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] x86/virt/tdx: accurately distinguishes TDX module loading
 situations
Content-Language: en-US
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
CC: <dave.hansen@linux.intel.com>, <linux-coco@lists.linux.dev>, "Miao, Jun"
	<jun.miao@intel.com>
References: <20240622175037.2051612-1-jun.miao@intel.com>
 <2sejjb666z5rzxzinqtkvyh2q4726fgaq5cqvxi57xd6mqu2o7@ixhcmkmumxhr>
From: Jun Miao <jun.miao@intel.com>
In-Reply-To: <2sejjb666z5rzxzinqtkvyh2q4726fgaq5cqvxi57xd6mqu2o7@ixhcmkmumxhr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To DM6PR11MB4739.namprd11.prod.outlook.com (2603:10b6:5:2a0::22)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4739:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a0706b-133a-425d-94da-08dc9795f988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFJKSWs2aXhpcmROckJCTE16Uk9lOVlJOFJmL3BKVWpOVVp2V3hvTlVFVmY1?=
 =?utf-8?B?TzRoNUlRMWp1ZUFMT1FlN0RYR241Sks2ZitWdCtITm1sbFBHaHB3ZUdkaVcy?=
 =?utf-8?B?ZUFYdm1HQzdTK3pRQ1hSN0ZvYkp3cEJQc21SZlc0YTN0R1hIU2pkb3huakpU?=
 =?utf-8?B?blhIeUlvZzltQ25td0RDbGxsbUZEUVRLWVhkd3AxNVkrMlBNb3B3VmkybEdR?=
 =?utf-8?B?K1JGdk5kUU9LVVdXSFdTU1J5ZHpYNXNyS2hDUXJWcVIvZ21xOFZlZXErZ2Qr?=
 =?utf-8?B?ZDBzcW55b0pFMS91dG5vNmpGUTZIT3gyMjM4YzFRRWRJUFl0TDJuWlNtenEr?=
 =?utf-8?B?Sm43TUVGSGF4SEFhb2FJVXBlZTAyb2ZqbHhmNEN0ci96eGVrTGtUWVNEMzVM?=
 =?utf-8?B?YjdBVUNxSFUwVTJoRUV4UzN4amVzeGpVVVg0SW4vMERYbGdhc1N5NkVYbWtk?=
 =?utf-8?B?SFVBSEpOb3V4d3FzQlRJZE8wNWdFbWlCTlNWWXVKRWNzOXNIN0gxaXNZZStR?=
 =?utf-8?B?MU5hbllyTlRJVmdoeE44NDllYzU3WUFzM092UDRSd0dnVFYxRFh5aFpmUkhh?=
 =?utf-8?B?d3lFRzJySFo1YmFlMWxGNy9LS0hWdG1uSFI4eitKb3BQM2tSR3JNZU8rWldB?=
 =?utf-8?B?ckZwT3JoSUkzTkZGNEo4RGZKeDFURTg0RkZCZTZrQkg1WjdRT0xlMEdTR1pm?=
 =?utf-8?B?NjRjejl2SFl1bDJGZThQRTFpRGFtVGpCVTduU08vdjFiTkVmejJaK2NWSE5N?=
 =?utf-8?B?NHhnWXVhNHk4UjlibGJPV3VGc3djd3hZdTdweDFzTmpoSXRMY01Kdzk5SFdq?=
 =?utf-8?B?VUlMRnBwVENFUG50ZXdURlA0Z1B5dEpielk3cXJlZUM2bFMvNEFiL3o0T0pF?=
 =?utf-8?B?cThLUXVKQ3FwNFBOUTFTWmhjWmhxVTFqU1diZzBKaGpRUDQwaTdNd2FPQk5D?=
 =?utf-8?B?MUZoTFhkR3E3TXlmeVRyM3NnWS90eEpPK05XT3pvSzdRSnVjbkdTeUxRTnht?=
 =?utf-8?B?dzRsV3c3S1owNjFJS01FSjRrdVJlejhkMDVHZUNkd3BaZm9DRWFWeTdwaFVO?=
 =?utf-8?B?VERCc0h5enk2aHduQzlkcXNLa1lialhTTWtRRjBZVm1UOFRxWjV2UGVBNWlU?=
 =?utf-8?B?MHdwNmhyQWx2cjZKWVpRcHBUaE9XYVQ3MWRHb2NMa2NTZEF0UTJDSUZNMFNR?=
 =?utf-8?B?czNuMmJZdGF0SngyRkFNSDR5cGE3R09tbTB3dk5Cdlp6ZWZ4UUJRbTZXSTZC?=
 =?utf-8?B?cmZwL1RRQTJvTDk1SGtsNkYrc3pJSlJLcnRxbVdSQ2ZrUS9wdHNFWUxMVVlU?=
 =?utf-8?B?TlRWZ1MvTXZKSkt1ai9HU0tMaUlaQ1h4UllheXVWWlhxektZZk0wSEpOdWhY?=
 =?utf-8?B?akgxa2Z5VVdzOXlrcnZyY0tpR1RHTVM1S0hESkRTOUFzcnYvRmEzc0lvOEd5?=
 =?utf-8?B?Ymh3Rk1uMlBxeHBReVpaaXpZcUlvNG1RRGJqUysvby9oaCtzenJUU3BRVlpX?=
 =?utf-8?B?a2pFSzhlTkZHRlEweVoydlA5MVZYRmIrK2JpRmlFbWFlZ3hHNjUxMk43UHlR?=
 =?utf-8?B?cGg2clNIS1crOVlBQXg3aHFQdFVmK3R6K3V1NjRJWVdySFNlVitOTEpMcWxr?=
 =?utf-8?B?eU5tbUZaaU5PYVNLaG5XWlZnZWZ1TEF4MXc0WmYrOFJ1Z1kzNHM3UzBWc2Q0?=
 =?utf-8?B?UWtCTERBMksvT00zWTcxVzdvajJ3S0dXVjRBRUY0WEtuRi9HQ0YvMUhmd0pQ?=
 =?utf-8?B?V1NmSVlGdUc0S0FKM1Zzby8zTEhIdnY4R3JOa0RISlRtMnVZaGRRQTNDYzFU?=
 =?utf-8?B?YW5vUGZMU2w4VjdHTEI4UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHZab0VpNjF6WVZ4TG44a2gyc0lJcEkwQUFmaU12YzFlVFhBOXdxTnd0YnBy?=
 =?utf-8?B?bHIvUnRFMXJHRmpsYnYxbGNrZjRaWENieTVmMWt5SXBvYnR0UVVFOEtrOTFt?=
 =?utf-8?B?eDYzc2FyUWVaZDJiZkRqNnRkMjgzd0lLYTBQbmNEbnhHaVNLTENUK3ZyQlZJ?=
 =?utf-8?B?NGZZUFBZU0s0MTdtZkEvZXRydk9xS1pNT2lrYVhKdjNmVjFDcG5FRmt2L3Fp?=
 =?utf-8?B?UTdCU1NMY2hsYklHbVYxdXp6OHBUdW9iczZweXlBSDdvRk5PblEyWXFpbmdW?=
 =?utf-8?B?MStyQm5Lb3BQZFZFRmRMdGVjb0VscTh2VitnTXZuOGRQaUJRSnJwbWVlMzhp?=
 =?utf-8?B?SGpqdm9uZXh2TEExWVZ4OWx4d2FCYXg3bzhvSlBmcjgrNFFDWmZpZmJ4eVVP?=
 =?utf-8?B?MVFsT2xPNEpJS3REWDJrRlVsS0F1NVdGUW1hOWtBc0VEYzNGelVuZXlEVysy?=
 =?utf-8?B?WHRnM2haTmRLM1dNZEJjT1FoUFpZbGZ0bFVBeGhaMWVQbGhRYm1FV1ZBZ1R6?=
 =?utf-8?B?TTV1US9maGZjbXFRd043VVlTYkI4WGhFV05GL3pjcUpoYWpOMVpxU3oyOFg3?=
 =?utf-8?B?UXM5Uk5tVWhQMnFSTEdyN1pvcUFMU21YSDhtZW01UldaV3ZvRzBJN2ZXUlZY?=
 =?utf-8?B?azJtSU9GUVRBL0NNR0cxVUY1N3ltYklZRUczVktZVVNIYVNKaURpWjRwbzBk?=
 =?utf-8?B?dUF0N29xTUM4c1huWWVrWW1Bdm5SeFVwdjZHT2svZTZibzlVU1ZaVDF0Z1ZQ?=
 =?utf-8?B?Mnp4bGIzTU5zQlBlT3VRVUk2QVdPZXR0MnB6L0tYK0hBWEpQTkFOK1d5S1ZC?=
 =?utf-8?B?c2xlM3hWUTArcHFBWDY0cFRUVEg5d2FlbkR6RUEvUzZHL2xsQ20xVFNCUGhO?=
 =?utf-8?B?SjlFUUpRaEhieW1BYUlpTVV1ZjRUWXM0N2JIbEZ4RnlXZTVSSm10VTdLYndk?=
 =?utf-8?B?ZzA1K2haMHI3cTFXY0YvQkVCcU0ralU0bGtDQ0hFOGtFNDhFNzJyL2s4bkp4?=
 =?utf-8?B?bCtRTDAzWTdMUDQ3enE3VDV0anZ4Mm5uNVFMcFJ4YUU1WDJIVjBoSWdnWjBu?=
 =?utf-8?B?cnlta1BqMmtDN1FFcG02YmtzOUM2VisvaVQwUEVMOGNmd2JSVG10V0pEMmRk?=
 =?utf-8?B?eU1XeFdCbFgySktJOXJMVXNQUDFmaGowOGZTVk15ZzhrckpqNTRkNzZDOHIy?=
 =?utf-8?B?Q3g4ZmU3Zlp4Q3l0S3ZzaVhSWUtZcHR1dXk3Mk1kOXVSb0kvU1JEZWF3ZkVY?=
 =?utf-8?B?cENkQkh3WHBOVmwxN2UyNHB6UllsMGU0MkhFQzdHTTEyRXc3OVFFVDh3MjRj?=
 =?utf-8?B?NFlYa09Ma0VtUUFDaFNXb1pQNDhlNHZERnYyd1JUOGZEUTRKNUdwSkFQcC9i?=
 =?utf-8?B?Q04wUmRqYVZFTUpVbHNQU1YzRUQzS1V3bXBkaGhwZzJtQkpEL3ZXbklha0ha?=
 =?utf-8?B?T25aMDdSTEJNNk5sRGNmR3hQdWFQaGkwbS84VE1LYk83Vlg0c0ZNQkN4T0xo?=
 =?utf-8?B?ZXgrUThGM0tJbUdLWFpYS3MwOW40dzgrakZMNndUT0lwREMxZHY5RStic3JX?=
 =?utf-8?B?YVZpd0FjTjk4dmhtM0xFYTkzYW9xZlJlUEJoWi9MOXkyOSswcXNsUWtiQWJr?=
 =?utf-8?B?OU9GcFlCd0dqUjBZaFd2MW5VQ2UreHpPZElJZHg3NFlnanlmQlN1d1ZlYkNN?=
 =?utf-8?B?OXRZR0VTWHErSm5jTTdhY2ZsWUVqR1c0aHlsYnk0eE9DQ0tVV2RkWmUvTkpq?=
 =?utf-8?B?NStLVlFzcGlueGQxVVBCYk1uODEvcy95ZjlNV0FkOUdpejJGNDJNQlBYWG53?=
 =?utf-8?B?MW5BdDJzRHVpa2xQLzVyOEFjdUI2LzhsanVFL0E5d1VQOWM3SDNuY2pmN3I4?=
 =?utf-8?B?SHBYanJ5Z1BRVENFaG1XdVFpL2c2aHI0NS85a21jeDF0cmFXSTA2cXZLNENG?=
 =?utf-8?B?UHBOQWlOZjFvNlh3dDdBY2RDWkxRWXYxNGk3VWxmVnl0cDFncGMwUExmQ0NG?=
 =?utf-8?B?MTdZc0VPc1VWUkdUcE9OVmQ5RG9MMGpJWWNkK2I0bnExUlY0alJQOVJMT1Fi?=
 =?utf-8?B?aG1FZHVvT1V3eWp6TkIwbXMwcHBJazZWVEVqUVpWQ3ZVOEs5QzRwT3g1Q2h6?=
 =?utf-8?Q?txNTm6+P5wh0QIPTAivah+N+q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a0706b-133a-425d-94da-08dc9795f988
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 17:15:57.2960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFJL9Vo6O5JNRxGM70OgudeXCF24i94DbnPC0NAZcJTZI0sDYG4yeyWdbJCQKAtp+DNVI2wf/n46BiuBT8XbzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-OriginatorOrg: intel.com


On 6/24/24 19:26, Kirill A. Shutemov wrote:
> On Sun, Jun 23, 2024 at 01:50:37AM +0800, Jun Miao wrote:
>> The first SEAMCALL is important to response the state of TDX Module/BIOS.
>>
>> In actual incorrect BIOS setup or deployment, the sysinit_ret will be
>> -EOPNOTSUPP. But the message "module not loaded" isn`t enough to describe
>> the accurate loading situation when module loaded but SEAMCALL failed
>> for some BIOS wrong setting. So add the error return operation code number.
> Do you want to actually check for EOPNOTSUPP and print a
> user-understandable message for it?

It`s like this: I am a customer service support engineer, I awlays 
deploy TDX on site such as ByteDance/meituan
TDX is not simple but full stack.If boot up a TD guest, the follwing 
three requirements must be met:
     - The IFWI includes the correct seamldr and module in the BIOS, as 
the same time have the ability to load the TDX module.
     - Setting the TDX series of options, such as TME/SGX in the bios.
     - At last, loading the kernel, check if it can be boot with below 
demsg(when loaded successfully)

dmesg | grep - i tdx
[0.303913] virt/tdx: BIOS enabled: private KeyID range [64, 128)
[0.303916] virt/tdx: Disable Kexec. Turn off TDX in the BIOS to use KEXEC.
[0.303918] virt/tdx: Disable ACPI S3. Turn off TDX in the BIOS to use 
ACPI S3.
[4.846924] usb usb1: Manufacturer: Linux 6.6.0-tdx.1.0.v1 xhci-hcd
[4.847748] usb usb2: Manufacturer: Linux 6.6.0-tdx.1.0.v1 xhci-hcd
[6.577811] BOOT_IMAGE=(hd0,gpt2)/vmlinuz-6.6.0-tdx.1.0.v1
[17.723174] virt/tdx: 1575964 KB? allocated for PAMT
[17.723185] virt/tdx: module initialized

But this time,? It took a lot of effort to find the SEAMLDR.bin loading 
failed, since enable the bios debug need OEM cooperation
Got the bios log below as:

[TdxDxe]: [TDX_LATE-HANDLE_SEAMLDR] LoadTdxSeamldr BEGIN FATAL ERROR - 
RaiseTpl withOldTpl(0x1F) > NewTpl(0x10) ASSERT 
[DxeCore]e:\w\r\MdeModulePkg\Core\Dxe\Event\Tpl.c(66): ((BOOLEAN)(0==1))

[TdxDxe]: [TDX_LATE-HANDLE_SEAMLDR LoadTdxSeamldr END (Load Error)

But In the kernel, there is too little log message to find the error 
like this(loading failed):
dmesg | grep - i tdx
[0.303913] virt/tdx: BIOS enabled: private KeyID range [64, 
128)[0.303916] virt/tdx: Disable Kexec. Turn off TDX in the BIOS to use 
KEXEC.
[0.303918] virt/tdx: Disable ACPI S3. Turn off TDX in the BIOS to use 
ACPI S3.

I add the printk in the kernel and find the sysinit_ret = -19 = -EOPNOTSUPP
 From the current logic,? no ¡°module not loaded¡± always meaning module 
loaded.? But in fact, sysinit_ret is -EOPNOTSUPP(-19).
I will believe the module block at next seamcall: TDH_SYS_LP_INIT, which 
is misleading.

 >    if (sysinit_ret == -ENODEV)
 >    pr_err("module not loaded\n");
... ...
 >    ret = seamcall_prerr(TDH_SYS_LP_INIT,&args);?? ?

However I also use the old bkc kernel, there is a useful message to find 
such issues.¡± SEAMRR is not enabled by BIOS¡± to remind me where the 
problem lies.
In order to more accurately find the problems, add some printing 
reminders here will help the On site deployment engineer like me. ?

The story is a bit long. Thank you again for reading it over. Looking 
forward to your suggestions.

---
Jun Miao


>
>> Signed-off-by: Jun Miao <jun.miao@intel.com>
>> ---
>>   arch/x86/virt/vmx/tdx/tdx.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
>> index 4e2b2e2ac9f9..787dfaf44036 100644
>> --- a/arch/x86/virt/vmx/tdx/tdx.c
>> +++ b/arch/x86/virt/vmx/tdx/tdx.c
>> @@ -122,10 +122,14 @@ static int try_init_module_global(void)
>>   	/*
>>   	 * The first SEAMCALL also detects the TDX module, thus
>>   	 * it can fail due to the TDX module is not loaded.
>> -	 * Dump message to let the user know.
>> +	 * Dump more detailed message to let the user know.
>>   	 */
>>   	if (sysinit_ret == -ENODEV)
>>   		pr_err("module not loaded\n");
>> +	else if (sysinit_ret)
>> +		pr_warn("module loaded error ret=%d\n",sysinit_ret);
> s/loaded/load/
>
>> +	else
>> +		pr_info("module loaded\n");
>>   
>>   	sysinit_done = true;
>>   out:
>> -- 
>> 2.32.0
>>
