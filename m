Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B9712DDA5
	for <linux-coco@lists.linux.dev>; Thu, 13 Jun 2024 16:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718295190; cv=fail; b=Z4r/ZgMM4d1eY8PrBo2MhEoqbuZeIsuC4PTRcckMT+LJQK6tEX1ZaE7dA27Y0EDKIRc5XOEQeuNpwS9CjMzzF25JS0n4uOPruhVgz2Jru4f0jZsYxcj6vWp/etY2YM/wK8sJCFmoQaH8Me1pY1qpj3ISELvGmOw98RqHAFSfVEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718295190; c=relaxed/simple;
	bh=YFJ5bIxXWeua59NjLtZ6hrHSmZjXZBQKGuJPvq9VP0Y=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oW/0gD2cuErmdzXUMzZjsvyuUX01/yPi3SNNGYNtXL42RVs4svGPdXdO6j920U4VtjiZkVMwnO4JqKeMYT3NbBZvWPqYio1ZkwMsOexnrFEnFhMnJ9Z1DB3K0AczeOqm32HTPlEASB/j2YjjbbVpCBSN0q6yknODQhoSBR9amEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+l6tcls; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+l6tcls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718295186; x=1749831186;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=YFJ5bIxXWeua59NjLtZ6hrHSmZjXZBQKGuJPvq9VP0Y=;
  b=R+l6tclsm4idhrlB7uKQ8ggedwSgAr54RE3QElMCom4+0JEGzMk4QHhZ
   lsPGt/GeoGF/PsgDXywGz9W2lP4g9kImewDiwtNL6ziWqEt4CVGx02mKd
   hHCl7j8IBL5xbs0KB9jZv0kSs3GDlP6vkezPy8QGsGEU/nBv+mJQqUi0h
   HQZiAhI6yKR3q0uJbl0/NBOtYjn5jn9FDV/ZlmjDiJTpOML+U1tOLvcfz
   hXjUzOOnVZUR6JWgYcx64FePlclk87eNtlNjaRvrSQ4HDM4bvmxQ+RWiU
   pBh78HAo27KuFxjTr1Lk9UPpzKh39Cj1/G+W+WXrbrR3OPm+NFonJlrtA
   Q==;
X-CSE-ConnectionGUID: +fMkrT3VS+eGo/RliTHKeA==
X-CSE-MsgGUID: I3Gso+ekRgCfH5taX8ktzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25769685"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="25769685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 09:10:46 -0700
X-CSE-ConnectionGUID: QIWKdc4zR1eBlcmes+sHeg==
X-CSE-MsgGUID: 6hW84rz7Q86zPR2y0Jlv3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40135477"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 09:10:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 09:10:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 09:10:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 09:10:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 09:10:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XV7roG/eE6eW8WNxJPcFBETOK29lPvnJAiHcSKlzkyit/FSYgcze2/mx3kC0eR/q2SzjBZZaJ25OiAzLPlRaglwIhauonr4YzXH37FQVYiyTYpR2gqyuhyZSV5yeJErAg6RTg+g8GeogfHTXQ58VwAZSKVSvPymzh4FP+w58ckssLyv1+b8WMPitW4TOvtmLdFZKVfpYv8j0UTzgtVkRS/tN2orP6whiY41at2bdPXTJi6xWRCLYoFWVJrPNu8zhKJGU6HKxgE2X3z7/4w1ZPT8t1s3gKLOSWhAAlZM92jaNJhmtCosqE/yAEDa7KHnF8v9ZMz3G6QNOz1HLeCp6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFJ5bIxXWeua59NjLtZ6hrHSmZjXZBQKGuJPvq9VP0Y=;
 b=mtVxpheucgomKfEAAiDpYc/PcIL4Wh3xLyk8Y008h35VnVRlric3v4dM2YqoPbuQzgeGcffCCUt3sedhym5m79uIpzZ9aI85sMUGWkxZpl8BhSruJU8iYXG2oe+1nplPQ2d7CoxWu5IxNESCTylJN9JKhHTZLaIQJkbXHXPM40tA5d1jRDFtoRCb6wcjhHofZjSjszJMIEuC6vldOvFjg11MXgWrgb0hzSx7vYJMf9JbGQH6uayiAG90ITnibkmJ8Ku0/48218ao7BAkVMN3BXWI7lJTOKBvpd1xQMChUh3I+wTpg2FTASQTVtL/nQPryZrS3SX+vCgOkifyEwTv8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13)
 by DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Thu, 13 Jun
 2024 16:10:37 +0000
Received: from LV2PR11MB5976.namprd11.prod.outlook.com
 ([fe80::d099:e70d:142b:c07d]) by LV2PR11MB5976.namprd11.prod.outlook.com
 ([fe80::d099:e70d:142b:c07d%3]) with mapi id 15.20.7633.021; Thu, 13 Jun 2024
 16:10:37 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"lirongqing@baidu.com" <lirongqing@baidu.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] virt: tdx-guest: Fix the decrypted failure memory free
Thread-Topic: [PATCH] virt: tdx-guest: Fix the decrypted failure memory free
Thread-Index: AQHavaw6hwGjZ7/u30eHuKhcq8lQNw==
Date: Thu, 13 Jun 2024 16:10:37 +0000
Message-ID: <0f6752d0ff95ba9d4fdafdfba1b37c9a140c773d.camel@intel.com>
References: <20240613111931.43123-1-lirongqing@baidu.com>
In-Reply-To: <20240613111931.43123-1-lirongqing@baidu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR11MB5976:EE_|DS0PR11MB8763:EE_
x-ms-office365-filtering-correlation-id: ee51dccc-32fc-426c-37f0-08dc8bc35d2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|376009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?Tk5Kc3d6Kzc2VnQwb3FsZWg2WkkycWdCZzBSS2FhZU5RQWhqNENnQUw3Qm84?=
 =?utf-8?B?alVVN1h6Q2IySFpqcHVxQkgzNGNMWVFiS1dxU0l2UG5kQ000M09kdzhGQldG?=
 =?utf-8?B?ZEhWcjRxQzNTbXRtNXAzaWwvaURJS0k5WWIwMUhxbjM3ZU5aeDcwRmRLQmxk?=
 =?utf-8?B?RTZ6eitVTUM4ZjE4dFZNQWNKUmVCSU5QWHRTOGhxc2g3QXVQQnJRTUlhUmt2?=
 =?utf-8?B?NWpQY3BOYnpFNEN1WnhtTFB0cCs3ZFp1UWRFMEZrN1Ixd2I4TUV3aERGZUo4?=
 =?utf-8?B?TFdzTFE5bWpLRzZUalhmR0NISlNicytqcG1mUVR3UmdNcHFBSFczQ2tGQ09Y?=
 =?utf-8?B?OWNSVUpZSXlMcmMvakFRMnBYT2M5WGpJS1ZwdFJRSnBaL2ZRN1RTR3RKUDJn?=
 =?utf-8?B?bjRwSDJVU3g4VEF0eUw2ekU2NWJYYXFzMm1ZT1B0c3FaaUhhQ0pOY0lxQXU3?=
 =?utf-8?B?UUZMRkU5bGpQMUtsZlNJYzhpTlFwcGhmUWRCcURTM1FPTjUxVVQ4b2ZNYXFD?=
 =?utf-8?B?SjFhbXdhSHp1RGFkQjhHTWdvMHBwT24yNXJzK2JZRTBMZWtwMHZlUkxUUlFP?=
 =?utf-8?B?cFI0QzN2VzA4N0U1NEhWTExlLzVEZFd6eUlIbzJzbnhNeld1YnJLK05YVVdL?=
 =?utf-8?B?d2pxWUdmbzlkV3lmMzZ1Tk45em9QRWtzdTRNV2Y2Y0RkUU5OWTNwbGtsbmt2?=
 =?utf-8?B?MDhyL2RhNG1mTHVES2VibGQrQ1ZuZFpzaGRZVm5TVnR3YjdyK05ENW85UStL?=
 =?utf-8?B?ZTBoWGM5UklpVDUvVkxuaHozeHg3WDYyZVpqazFmaStObVVTb3dxb0gzNUlh?=
 =?utf-8?B?YWQ5bGwvNXgvQ0gydjArL095cE5VVUluRXV4cmJqZmpYczdxeGRYbTFEamJ4?=
 =?utf-8?B?WjdEZ2dIZ1Q5OC9jd0VFOUk1c3B0UTV0UnVYMnlELytGMXpPMDRONWVqcFpQ?=
 =?utf-8?B?RHpBbURSOUVNdE5pNkVtRU9Ob29rcmtqN0s3b3YxNjJXdlRIcDBpcUpnL2hG?=
 =?utf-8?B?djVTNk9qK25CTWllbTllK3VTbkF5SjJ6Q2JwUVkvT055TXA1VVY1ZnNkSkh3?=
 =?utf-8?B?NUhUc0hsbGRrSTRGNC9HOU1oUDRLK0kzQWwyUXNXMGlLVXVieVBuRzQ3NE5U?=
 =?utf-8?B?MEtxNE55NWNYMFJpWkR6ZUJVYnhBelloRTlSMFBVTW04VzRNdVc2a3h0dVBD?=
 =?utf-8?B?d2d1WXlXdTJUd0w1dEpGRitJbFhDQUh2RVNQLzRrb0RteTFHTnFyaFJrVWZv?=
 =?utf-8?B?eWp3VDhTMExiN2t6dWR2cDZ1ZXNuNzBnTVVIRk85Z0pxS1R3TFIrZHVRTnlo?=
 =?utf-8?B?Q0RsVS9SQlgrUXR2c1RaY1RqdWRzM0xTQ3V5ODVXWkRIWGhNcFV6WGYycWpz?=
 =?utf-8?B?VFFmZGYrcFRWa2JYbkY0N3N3VWU0cnl3L082c2dVU3JPRC84R3d1R2RSd0xN?=
 =?utf-8?B?eWowVW5SL24yS1lnL2dOc2YrK0hQd2dhY1ZxdW8wSFdDcWpWcXBGS3FKV0F1?=
 =?utf-8?B?VWt6NUU5R3RkLzZManRjbU1CUGo2Zmx3cW5VZ2x3emxCME1naVhGekpDaXEz?=
 =?utf-8?B?UitHNXcvRFp2T1NQVWpReDR2NHFRN1BGMS9tMEpPaVp5bWg1V01VOE9CM0hX?=
 =?utf-8?B?OWk4RnhmTlc3RWVGbEx4Z29rOHlRV1RGYlIxVXRxdDdSNzJyYk4vYkVtZitG?=
 =?utf-8?B?WW5UaGRWWmUzSE0wRm10TC9rdVZSUUhZUnBSMmQyRkt3NVhKUVV2R2pFNGJv?=
 =?utf-8?B?WFRiTEtJd2xsSXpTOFNmcHROQU8wSVhGQVpnT2FZbmZjcnBxUERYekJrcW8r?=
 =?utf-8?Q?90hfUTmCeWr/6BPK4jUDVdJys/O43ZFSDGl6Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR11MB5976.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzVLZnlnQUNIa0hZaldEOVc2anZoMWR2bGZXQy9jVmdDdFh6bVFpcm5YNk1I?=
 =?utf-8?B?dkgyN2J0ZTYyTXpFdC84aVVCa0UzM3B4WWNOK0dNeEMxMWVTNzI1V2JxVFlm?=
 =?utf-8?B?bkRwcmJmdEJpaktwdmpBNjBvRGJINk5tMDdXRVhwbmxNN0x5MHp0c1ZZWlBp?=
 =?utf-8?B?RE16dkR4QmJkZUM0emIrRDIvRWw0MjdkN0xXU3ozNHRTeEFwdlVGWHV1bkRE?=
 =?utf-8?B?UTIrNUVaWGdQdytIVGRVRVVvV1FKbkhUUm5LbklWcTkreXBSTGdXVjVTaTJO?=
 =?utf-8?B?bytvS1owUlRwTytiaVJKQ1R6L1cvbEhMMjlNeGFMdkU0dzB4aDJwbFdDWmFh?=
 =?utf-8?B?VkV6Y2ZqZndFUGk4VXoxOUhFMXZNd09WcjB3RjNvblZVbE9xZ2ZMYjFCNEc3?=
 =?utf-8?B?NDRyMC92bTBXQVlGbTJtMmNvdE9ET055elhoS2hlYWRWd3piNEZIZnNjeEY5?=
 =?utf-8?B?bnd1bUxFdjdJUG1NY1l5QUcrazZyREhnSmhZQTZZNGp5TSsyb3pMOFJLenpj?=
 =?utf-8?B?SGU5ZUN6di9JOVh3Tld2NStmUzZNMmE4RENYWnNxZTBsR2Zhcndqa290TzBM?=
 =?utf-8?B?T3BOaEhYTkJoeElzUGU4RlZlZGp6QnN6dWs4QW5FcVVhemxhcU1IMWwyNEVs?=
 =?utf-8?B?SW9tcVdTaVp2K0pucjcxMUhySTM5L2dybnpkMWFYSVlMUzBkaUwvTG1TbnlE?=
 =?utf-8?B?STZyR2ZEUWlYWDNYbjZBUVdzS3hYUVc3VHZEUEFFTWZ1OVVrUFNGcDRlMkpX?=
 =?utf-8?B?dFJRWURoZXVVZDFGSlNJYmZnNVdoTXFkVk1NRVlVU0VlQ1N2eXBKb3Q2STJ4?=
 =?utf-8?B?RmZlL0tZdGZCdEp5VUp5SW9ZZUhCa2JrbnRNeEI1dzJQYWtHOUt0SU9SOTJo?=
 =?utf-8?B?b2d1NVhHYW5zM2JBWGNvZE40c2ZrK1Z0bFlFcjYvSGczMU5KV0tFOGgwUWxq?=
 =?utf-8?B?U2RIdVJrUS9pRzNiSmJpMzE4M0dZdTdvWFFybXJzMTJsWTZLcTNJQ2VkdkFR?=
 =?utf-8?B?cVAyU21YS2dseitDZWEwSCtmdndmYUk1OTFqNkUzcHI4VjVLa0M4eUpiVWMy?=
 =?utf-8?B?MnBWeGRwSVg0U1NBS0NDZWI1UDhaZ054V0VzNEJNdUk1VStQYTJGc0RoTHcv?=
 =?utf-8?B?K3k3VjVBL3p2T3VhS1YyMDZob2FHOWJ2UjlSS3RxWWtwdDBXaFZESGxXdXJw?=
 =?utf-8?B?akJ1aFFLZ21DQUc1aktXMmVFVk5WTFBLV2VZMjRMM0tNOW93OHJwNHJBWTY0?=
 =?utf-8?B?Wk5HNEpUSzd4eUVFNnNmVlFPQjgrTlRydEluT2NjaWtDV1JIVGRxRDAvQ0t4?=
 =?utf-8?B?cU1yR0dCamJhNGlOeXNwOW9Rc3Jjd0VmbW5BeFcvK3ZpNzYzdXlHOUJid2RU?=
 =?utf-8?B?Q0RBTkkwTXlGY0NOVmd2UytRVTZnbE9JTlJUajdvbUIwL0RkMWJnczgzL005?=
 =?utf-8?B?WUhaTVZ6UU9SbG5OeUlaaGoxYXZhMzhQa004T25YaStMQk5aSEExcVZBUjBU?=
 =?utf-8?B?RkdVRkloSnhRYnRDZFlDU2g2VnhCTUpyOUczV21GeGpyQjJ2M1J3bDcwRHht?=
 =?utf-8?B?TEhEWEc2eUkrZ0Z0R0RSOENmWnlhaElZVFZKMFNmVU1GanpaVEZvVnRId2xs?=
 =?utf-8?B?STRmbnhzTFZiVTZxQ1ZVc0VVcUY3V1hhb3o1a3Z6Q3c5M252eEFwUzFmajZB?=
 =?utf-8?B?MURXL05EemhjSS9qSzNKSnVWTUQrQ05OVFg2U3c4aXMyWUQ0UUlYVENWLzZM?=
 =?utf-8?B?dEQ1cnRwZTAvOHJKUGNvS3pSamlNa1o1VEw4UnR1TyttazN4bUd5OE5wVnZu?=
 =?utf-8?B?TzFBSWdLcWt1NDhweEtxZ0h1clh4L2cwTyswZDlPNytLRUdzYTRKUG02aVZB?=
 =?utf-8?B?Q3hMS1paQ1ZMSktrY2I3bkxJTEdFU285QjZFQUE4U1A2ZkVoNGRYdjZDaW1R?=
 =?utf-8?B?ZEpSQXVnZzl4ajRFbFBRYTZhc0FsNkNmOVNVZVJlNVpQc0YrYWhYeG5NUlJv?=
 =?utf-8?B?RXVVSUEzYUJuNXBWQmRzVklZa1JaNzczK0p4TnRXUnBpZ2hwanJMWlBCbG1l?=
 =?utf-8?B?ZHI5dWhhWVZIdWRLN1pNZ2FBbml4NU40RzJKNWRGYzVIQW1rS1JIQkpLdXFy?=
 =?utf-8?B?V1FEdHJNYS9YZUNYQVVLQXZjazhVRGNsVEV5Um1ER2VubG8zSlJ0UjZVNzBk?=
 =?utf-8?Q?nHuMH0D4ofNDYBOggStq+18=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C01B380F2A111C41B90EBA3BA4950973@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB5976.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee51dccc-32fc-426c-37f0-08dc8bc35d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 16:10:37.7485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CkiTuQJkO67c018I2zVJgLQ2mYkvlvRmnTLGmDc7702uw9B8l1Yx0JKMqrIVAHmvnGKKx+ZzA4Xe7nBUd9+LUU9v0pZm43vSCQS/ScsJ6rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
X-OriginatorOrg: intel.com

VGhhbmtzLg0KDQpPbiBUaHUsIDIwMjQtMDYtMTMgYXQgMTk6MTkgKzA4MDAsIExpIFJvbmdRaW5n
IHdyb3RlOg0KPiBJbiBDb0NvIFZNcyBpdCBpcyBwb3NzaWJsZSBmb3IgdGhlIHVudHJ1c3RlZCBo
b3N0IHRvIGNhdXNlDQo+IHNldF9tZW1vcnlfZW5jcnlwdGVkKCkgb3Igc2V0X21lbW9yeV9kZWNy
eXB0ZWQoKSB0byBmYWlsIHN1Y2ggdGhhdCBhbg0KPiBlcnJvciBpcyByZXR1cm5lZCBhbmQgdGhl
IHJlc3VsdGluZyBtZW1vcnkgaXMgc2hhcmVkLiBDYWxsZXJzIG5lZWQgdG8NCj4gdGFrZSBjYXJl
IHRvIGhhbmRsZSB0aGVzZSBlcnJvcnMgdG8gYXZvaWQgcmV0dXJuaW5nIGRlY3J5cHRlZCAoc2hh
cmVkKQ0KPiBtZW1vcnkgdG8gdGhlIHBhZ2UgYWxsb2NhdG9yLCB3aGljaCBjb3VsZCBsZWFkIHRv
IGZ1bmN0aW9uYWwgb3Igc2VjdXJpdHkNCj4gaXNzdWVzLg0KPiANCj4gV2hlbiBzZXRfbWVtb3J5
X2RlY3J5cHRlZCgpIGZhaWxzLCB0aGUgbWVtb3J5IHNob3VsZCBiZSBlbmNyeXB0ZWQNCj4gdmlh
IHNldF9tZW1vcnlfZW5jcnlwdGVkKCk7IGlmIGVuY3J5cHRpbmcgdGhlIG1lbW9yeSBmYWlscywg
bGVhayBpdA0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGkgUm9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFp
ZHUuY29tPg0KPiAtLS0NCj4gwqBkcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvdGR4LWd1ZXN0
LmMgfCAzICsrLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vlc3QvdGR4
LWd1ZXN0LmMgYi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtDQo+IGd1ZXN0L3RkeC1ndWVzdC5jDQo+
IGluZGV4IDEyNTNiZjcuLjYzMjcxZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlydC9jb2Nv
L3RkeC1ndWVzdC90ZHgtZ3Vlc3QuYw0KPiArKysgYi9kcml2ZXJzL3ZpcnQvY29jby90ZHgtZ3Vl
c3QvdGR4LWd1ZXN0LmMNCj4gQEAgLTEyNSw3ICsxMjUsOCBAQCBzdGF0aWMgdm9pZCAqYWxsb2Nf
cXVvdGVfYnVmKHZvaWQpDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IE5VTEw7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoc2V0X21lbW9yeV9kZWNyeXB0ZWQo
KHVuc2lnbmVkIGxvbmcpYWRkciwgY291bnQpKSB7DQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBmcmVlX3BhZ2VzX2V4YWN0KGFkZHIsIGxlbik7DQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAoIXNldF9tZW1vcnlfZW5jcnlwdGVkKCh1bnNpZ25lZCBsb25nKWFk
ZHIsIGNvdW50KSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBmcmVlX3BhZ2VzX2V4YWN0KGFkZHIsIGxlbik7DQoNCkluIHRoZSBvdGhlciBjYXNlcyB0
aGUgZ2VuZXJhbCBjb25zZW5zdXMgd2FzIHRvIG5vdCBvcHRpbWl6ZSBmb3IgdGhpcyBmYWlsdXJl
Lg0KQXMgaW4sIGRvbid0IHRyeSB0byByZS1lbmNyeXB0IHRoZSBwYWdlcyBmaXJzdCwganVzdCBn
aXZlIHVwIGFuZCBsZWFrIHRoZW0gb24NCnRoZSBmaXJzdCBmYWlsdXJlLiBTbyB0aGUgZml4IGNv
dWxkIGp1c3QgYmUgdG8gcmVtb3ZlIHRoZSBmcmVlX3BhZ2VzX2V4YWN0KCkNCmNhbGwuIEkgdGhp
bmsgd2Ugc2hvdWxkIHN0aWNrIHdpdGggdGhhdCBwYXR0ZXJuLg0KDQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7DQo+IMKgwqDCoMKgwqDCoMKgwqB9DQoNCk9u
IGFub3RoZXIgbm90ZSwgaXQgbG9va3MgbGlrZSB0aGF0IHRoaXMgb25lIHBvcHBlZCB1cCBhZnRl
ciB3ZSBtYWRlIHRoZQ0KcHJldmlvdXMgc3dlZXAgdG8gZml4IHRoZSBwYXR0ZXJuLiBNYXliZSBp
dCB3YXMgaW4tZmxpZ2h0IGF0IHRoZSB0aW1lLCBidXQgc2luY2UNCml0IGV2ZW4gcG9wcGVkIHVw
IGluIFREWCBzcGVjaWZpYyBjb2RlLCBpdCBtYWtlcyBtZSB3b25kZXIgYWdhaW4gYWJvdXQgaG93
IHdlDQpjYW4ga2VlcCBvbiB0b3Agb2YgdGhlIHByb2JsZW0uDQo=
