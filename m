Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE81F3B9E
	for <linux-coco@lists.linux.dev>; Sat, 18 Oct 2025 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760755695; cv=fail; b=MaGoWTuADtUcx7mkkX6HKNONlBjZrYmvUiPJSBK3qW93O1WVLAun8adzEjC2vE/jsLS0RrfeAv4n38fE+1+KMR3zd1Owu5hut8w50+dCWKXyooB6fwWykP6keX00KythuovG1cmTm1OU0PYNASGZkDuofiy8sK2KwuHlq2rvj+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760755695; c=relaxed/simple;
	bh=rsnpIUVRtxTi20Xpt9UGcltP5YmVMIG4rFjEHd2hiNU=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=kF9pHC/xKfcNBrPnbPcyfoDM7hXqUuQP7kzTQiTQst5snZTceyiP+X4xDcOn/3LViY0uowhKdVhgYT3lW2aiBW4M8JcMtyRdxyCM2sk6Qn3Ai8kxYFoQ/omFo6Gq7ZR1Fn2HN2MnEdJ4OpY8Iazt4CzTGOGxh5GS3vUm+I8qDyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnusAmlu; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnusAmlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760755695; x=1792291695;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=rsnpIUVRtxTi20Xpt9UGcltP5YmVMIG4rFjEHd2hiNU=;
  b=CnusAmlumPsXqQGy5318oc15oXQtBe3w5FiXj9zrwIB+4kIj9pElkFNk
   DnlHomff88hdnaQ84ufRSV8zZrr9zNIGOpBWRm+MYD5mzLEesGfpKcHJ0
   d1+zouHb1Ro5df7iDJlLzzvQH4D/wCX/0oSQ7wse/LDpu9POmTxN3Cbdg
   qtwfKZbqxwl+iXnSSkdlBrWAxqdUY+W7f8QpzQOZrYYqrrweHuTAp8dWx
   dKbwts3Yn7aOYOqQ+FBlPRGfbdmgUxpIePHC/AoWaQxqA08mMlQ7cBlZW
   63/nQMVYfZSyRpNm5Azty5VjKYWsbSmoWRoxezR9TSRjBDBXeA96kD4HA
   Q==;
X-CSE-ConnectionGUID: q6O486FxSMSyzCqBbt5MCA==
X-CSE-MsgGUID: KkaE9OoNQ+mXb4Be9h1ZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74409484"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74409484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:48:06 -0700
X-CSE-ConnectionGUID: htUryi/oR4ubZ44ynkC2Xw==
X-CSE-MsgGUID: NmVuUMJwSgiVfaf34ViDGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182818180"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 19:47:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 12:18:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 12:18:38 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 12:18:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0RQVUIzbPTnglV1zJ2n+30PQ4ZYfw8bmijc2Cl/MLlQzBT0Kt3wM4S7QXu4/5oP7T4ZKFBrkU9vRJw53jsm90YBTpXhX0bxyW3LnOsbvgZdKoeJao8D+EFqud7SM688MW2k1Q1/Pynrpb17pdKCCbwRdyie+Vv+KLuVzNkD3wuyyfPuixKmI6PN4ewZJC9oFnFiz3Npio6gSgPeCAPt5VIGzj/Rc70hZd8/HMwbMcjEt6NNDi9gN1TygPjYHPWHEcWibNVvNSf38X1/jXvIeK7N35Kq2lPO/7MtLI99gskoHbfIa9Fo8thus/QoJm+GdCZh3nuSqzm+1tktFamXQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjvAkxyDzXb9aLYtkQD1jEvqvLBCioNZj3AMrTRbVpU=;
 b=tbBRhimg7wDUopvUrRpTl2+NcuXr41iysF7JH+vrROjG6IPL0969yzkmk6hjQTPQebztvWitTxmaDXm2dPnGAMx95HKN26p/YwmrjcNFyFJ82Mn21CO2TFaI/6Z5Vl5tJoFz5JGYEi/XotAf3HUkVr3toGzcRbP3XKsnBdF/W6HSoyFFSbgQ5alRXWh6p3hubpSKg188+FoeIwKjsC9H1C0+Bq3bUg3IkUEUKdUyazeBMnGEWz5vpm+5kDHv87Nwb3TQ1NRrvXIgyd80Qq0A2uiBAAVhwbnBHKf8QoE4KOFuLC88zA+72ul0YIunQXfsENfBTukANFUnJtWQ1J1WSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH3PR11MB7252.namprd11.prod.outlook.com (2603:10b6:610:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 19:18:31 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 19:18:31 +0000
From: <dan.j.williams@intel.com>
Date: Fri, 17 Oct 2025 12:18:29 -0700
To: Alexey Kardashevskiy <aik@amd.com>, <dan.j.williams@intel.com>,
	<linux-coco@lists.linux.dev>, <linux-pci@vger.kernel.org>
CC: <yilun.xu@linux.intel.com>, <aneesh.kumar@kernel.org>,
	<gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, "Lukas
 Wunner" <lukas@wunner.de>, Samuel Ortiz <sameo@rivosinc.com>
Message-ID: <68f29685afcd8_2a20100fb@dwillia2-mobl4.notmuch>
In-Reply-To: <43070157-cfc3-4ef2-8b2a-e677515e8bce@amd.com>
References: <20250827035126.1356683-1-dan.j.williams@intel.com>
 <20250827035126.1356683-8-dan.j.williams@intel.com>
 <eeca3820-01dd-4abc-a437-cf46dc718ab6@amd.com>
 <68ba3c9f508ed_75e3100ef@dwillia2-mobl4.notmuch>
 <43070157-cfc3-4ef2-8b2a-e677515e8bce@amd.com>
Subject: Re: [PATCH v5 07/10] PCI/IDE: Add IDE establishment helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH3PR11MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: f67f3dec-650b-45e3-3163-08de0db1f549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3VrbEpkR0RkRTM4TnJsZHlaWHpCWEt5N1cwRDhuQTY4SE9sQXk3R0dmNDd6?=
 =?utf-8?B?UTRscFVlbDM1NFRBRUt2THY4eDJiVE9vdk5KVzhTczgvYmdjU0IvVkd3a3pS?=
 =?utf-8?B?N0NNS2UwS0tsK1M4TmdpVTVxNWR0SW9pamZQVkx6NTU1b3pqcWZSN1hTT05I?=
 =?utf-8?B?V3Jqd1VLNEFwNHRRQkVZc0dPQWsxUFBvNGJLVVk4bHYzMEh2RkE4RHI5N1Rq?=
 =?utf-8?B?eWF2eGxodC9HZDZ0cHU2SVdJK2JFVDRKVUI0YUdaMi9UTlg2alVvMDRFMVpj?=
 =?utf-8?B?NW5RTkJJN2taY3V3MVhQYzJuTjFKKy9hZHBvVSt1VlUwdEVJY0xybnNNODRL?=
 =?utf-8?B?ZnY5TWZpL21sdDhJZVVUbU9GcmpWdkcwNDRVemFqN0FiZzFjWEExQ1cxNEJn?=
 =?utf-8?B?c1ZzN0JkZW1qVDFEMnJVTWtLZld2ZWxNUDZHdjVhcjVQK2svaUkyU2tIMGhB?=
 =?utf-8?B?enRtTC84VmpPTXh6QWYwbFhhUjU4bGFWTmkwQ3VLRmZwVlZxNDdHR1pRL2tW?=
 =?utf-8?B?cW5ScTlKekRuMzZ0NUk0dktWS1BmcnRySTAvQ1hadWVQdUFSaWg1OEJWRUhv?=
 =?utf-8?B?NUdneWphbWQ5Wmh4aHhjUFgzck00cFBYWXhkN3ZZdElrSjNQVDhXNmdEd1ky?=
 =?utf-8?B?T09DeVppUTIxdkJyUWxhTjIweVc4RWlFR1FTR1NYc000VWIxZGFjVld0OWJw?=
 =?utf-8?B?V005VU9lOWExYVJpZUxJQ3M4cHA0Qkc4QzlOTE5KK1VkeFdoYjFWVnZudGVn?=
 =?utf-8?B?VmhPQ0JDWTNsakZXWFhMV01hVlozZTZUVHJzZVhEdHRvOW15cWQ1VndFRjEx?=
 =?utf-8?B?cmlVdlBUcVVQVkh1aXNqWFR2UTF5cUJra1E4VnJHWC8xS3ZmS2JsYzU4aSt1?=
 =?utf-8?B?ekdOYU42ZW5aRXFWWlgvOU9SZUMrVWlyZWpxWnNoYmlaRTRpV3c0Q0Y5VWtt?=
 =?utf-8?B?NUdEeUNwU05VcTd2aDRRM2FCQVVkSG5ZMEtUYWk1ZjdORGZvZjN0dm9OVEZL?=
 =?utf-8?B?bFpvTlpZTHNlNy93SDFMRGlBeUxyVmNZTEEzR1pqNC9Sbk1tbVBpLzBCVG1J?=
 =?utf-8?B?aER1SVpRTHBxeDNxNVZIcUNQeWJJcEVUSUl5alVCcTNhT3lzaFBqeSs2Zm5q?=
 =?utf-8?B?TUgrVDNGZTJhTkdLbVZ0RjVKaitNakVFaWw1S3ZhSklHTkM3NFgwZENZdGFF?=
 =?utf-8?B?MGdneU14L2pvNmF3QTlaVnFvSWZOejBaY0J2SExiWnFjMDlVRWhHbnRzeTYz?=
 =?utf-8?B?c0laenNUQVlrdndnbitHdDZ6VWRMVjloQ1NFQk96RVUxcTh5UUo3aTdBcGlz?=
 =?utf-8?B?UjJabGV6c29mdnBCZGxlV3MzWG16K0o4UHRmVS93RmdMYmhKcDNXekhvdzV2?=
 =?utf-8?B?eThBSUdYcmRNQlJDTEpQaWk4bFVNM1JyUDJlODdXVlNqYjN5UnYyZGVWcDBZ?=
 =?utf-8?B?aDJvT1VWQ2hDRXJRQW1tQ0dMMk5SRTNaS0Q4dmJTVGxBaHlPUk11RmVqMUdu?=
 =?utf-8?B?eHlMellEM3BHdks5Uk1DdmRURVlzWEgwejRpTFc5aDA1cWw2QXhUZlYxWklq?=
 =?utf-8?B?cTNLQllVVUdwek5KcFRJb013L3QvMVY0ZG5hQWhCekZKdWxEMUtTVzhIeWM1?=
 =?utf-8?B?S1h5QUdzN1R4SkQrcjduQ05mSGJreGZEVzZPWDZ4ekViMG1RYnhTUHdNNjE0?=
 =?utf-8?B?ZW01eWwzbTdxQSthOGEvWjBYVXVjWTNQdnJETE1nN0pDVXZDZnY1cVlOM0pI?=
 =?utf-8?B?ZjhuMWFKWmIzNzdqalZTL3ltVUxKL1FnSnpHUHMyZm9rc2pZN2pFYUxBcHFr?=
 =?utf-8?B?UjE1bW9tRUdwS3l5RGlxWmxXL0FXWTVQQmxMUktndmhYN1hxaGVLSGJUd3dw?=
 =?utf-8?B?YTUwM2Rtai9hMWNhMmpaVlE3SDB5RlBiYjlNM0pSV1hWczhLeURWN3RjcE0z?=
 =?utf-8?Q?xfW6vfPFwWm3pfuOlIkbN/unRr6B0HlR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ui9WUXRLOFFGRExJL05qd0lTa3U2a202VnIzc1IySzF2b0IxcjV6SWRYenJa?=
 =?utf-8?B?cnpUdUhHVzJGTG5scFk2NXJXSlFyMlVveG5rSU1OQ0VsbzNLVGtCbzBPRmp1?=
 =?utf-8?B?SjZyUXc1YUQ4VUNHK0tyaWh3MXYzdkJwREtyc1lsOXpPQXZHUkU2UUdpbnI5?=
 =?utf-8?B?TU1wM3JwU3RkYWRWOE83M1hNN0ZrMWozWi80VjZTRGNScjFwR1dwZzlaZDcy?=
 =?utf-8?B?cXpwWC9OWXBxOHNsNUxSSzBSMHRpQ2lYSk9BUDc2OEJCcHpDYVlmdDRWZFNV?=
 =?utf-8?B?L3ZmRmVxWVZaTGhoWWI3ci9sOUZ6OXVnbU9IMHg5d25COXNXT3JQUFJwOEZE?=
 =?utf-8?B?U25OeTJpdktsWjQzMnZ5YkF1WWo2V3BuMUVPOGlVV2ZEclU0dWJ2cHNpdk5n?=
 =?utf-8?B?SWM2Ky80TUFaemkzYVBUV3VCUVhSbzlFVnJGdkpDSWlDWFMxbVh6YUhBWGRD?=
 =?utf-8?B?ZDR1eDFadzBraGRGRWh4UkxlVFNYL0wrR0NwUmpCZmc5dXNIM3ZCNTJqeG1E?=
 =?utf-8?B?ZDZZWjd6NlNZaUNuaklMbS9WcE9WaUVTd1o5L1prVlhZVFpubisydndLdFJs?=
 =?utf-8?B?b0xpb0s1TERaQ3J6azJscHRGV25mUlJJbk5YMlk5TnRPZG1uNDJWSUlhTnRi?=
 =?utf-8?B?OXFtMmRlNUN4Vk5Nbk9sVVh5dzZvOTl3dzV5UXd4WFYvb2lLV3V6ME44bkhO?=
 =?utf-8?B?S2ZLdDhRR1NFTHhrSC9jcEpISjB1OWVkejNKaWZHTWJpNXZmOExBQUhXUTFL?=
 =?utf-8?B?cVFJYWorUnhlZ0J6VHE5dkxHelIwT3dTNC9FdkQzaHoyd1k3ci8rOTdFc08w?=
 =?utf-8?B?Ukh0bXl3MFRDLytNRlkwN3lGdWg1b3ptUUF0djVrbk5mQ1U2Wi9LL2pHTkFr?=
 =?utf-8?B?NW9NRy95U2RyUWdKSitwRWpBSjFicWNjazNWUmI0VVNMOFdSSGE3Qm1VYVpT?=
 =?utf-8?B?c2J0L2RlUlg0VW1hUVNzWXZ6dzk1QjlpWWFDMURIdHVlOU5Bcy9xS1RsWGpr?=
 =?utf-8?B?TFJsMDlKb3RTOU1ZMmVpS1dyV0U0bWFOeHJhalhoU2U2VEVFWmFVMGFrU1JK?=
 =?utf-8?B?QktBWGNzNDFPSkRaWHE0ZVlBek1KdU9qNXBIZmRzNUtoUlZ6Zy90bll5WWJY?=
 =?utf-8?B?NGt3M2dZZCtLaWFDOFJhNXR6OG5mMUtIeXM5T2ZWYXpSN0NJeHhYZzVkaUJT?=
 =?utf-8?B?RVhDU1ZjY05GOVI5d1JvbEdWaXFEU3FKWlNHWGRNeDkwNHFVMllnbGUvdWRL?=
 =?utf-8?B?WXdQNG5vQnZDUXpzazNJNzA2QjZ5OUdtMkNDUWdZc0cyZHVHSnhPcnEwUU0v?=
 =?utf-8?B?THBIYit3V0w3SDg3TXl0cWdGYzVuemF6di80ZFF3c0hlTzNudlgySGNGenVu?=
 =?utf-8?B?aEIxd0EyYko5blY3Mk40cEExNUVuTGFOZ3VITlNCWmpEbHVxeERlZitYSjNs?=
 =?utf-8?B?cUR2cXQvbkxzK0liM2sxdHlhVU1BN0FCdzlzMjRJOGoxUzJuQU41dWhKdWUr?=
 =?utf-8?B?bkY0M09CZVRBOE5sUjNYTm02WjNNbUVsYXZSNlJNdFRob09ONGJYVUhyMWFl?=
 =?utf-8?B?ZTZoUDd4UUQ5MktLWXZad2E5N2J3R0FNeFpPQU44WjJWUXpoVEMrSlZoZUNG?=
 =?utf-8?B?Y1E0ZUlrOHpTMDF1dnlkUnVZR2p3NlREaUo1YTJ2cWFVZDV1MzhqTTkzNjlD?=
 =?utf-8?B?OWlWS3llTGNOZDlNNVMxc1RrVW9HOHhnQW1aSEtMamtuZVl4Ym5wV3B6aXlT?=
 =?utf-8?B?K21BZ0lYa0Q4U01idjBoYXZtVDUwN3RVYmZXcHpGK1RqT0hBYXJQVlBBcWcw?=
 =?utf-8?B?Y2RhaHJSclpXSWxIOFh6TzdHcmozWGJBR0lhRU1hQ3FzNldGRFoyVG1PZUd4?=
 =?utf-8?B?RW5STHQ0T1AwRGpHQ1d2VXZHT2dzM0g5eW93aXRqNE9MT3B1S3lLZEUvRHJO?=
 =?utf-8?B?d0llalZFd0hac3doRXpkT1NzZk83RnVBc1cxTUV0WXdFbUp6c1hacmxhODBL?=
 =?utf-8?B?UTJLeEhUSTd6UGlVd2xhanB3bHczYXZlRFpBbE9vUTg4MlpVM2k1eXR6VENi?=
 =?utf-8?B?eTVCQUQyOVo0U0NnaDhMdkdYT0xGRVpYRjNiYTE2ZlpHVHptenBsTERaY0hi?=
 =?utf-8?B?Vjl6Skd2QWpmb3FjSTZXVlZ3Ylc1Mk9HTmNrZHRvVjJvZVV0RFA1QUxmaWh6?=
 =?utf-8?B?TEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f3dec-650b-45e3-3163-08de0db1f549
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 19:18:31.1133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: thI/6vYVO6YVJbHBP+59nT9iyaO29v9NX6T8uelLXXHJ7Su3j8moIXWYk6O96jc09ScQmBGYdjhnhS6oeqbP/12WK1Y4ZCFeGoJgFOz85U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7252
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
[..]
> > diff --git a/include/linux/pci-ide.h b/include/linux/pci-ide.h
> > index cf1f7a10e8e0..a2d3fb4a289b 100644
> > --- a/include/linux/pci-ide.h
> > +++ b/include/linux/pci-ide.h
> > @@ -24,6 +24,8 @@ enum pci_ide_partner_select {
> >    * @rid_start: Partner Port Requester ID range start
> >    * @rid_start: Partner Port Requester ID range end
> >    * @stream_index: Selective IDE Stream Register Block selection
> > + * @default_stream: Endpoint uses this stream for all upstream TLPs regardless of
> > + * 		    address and RID association registers
> >    * @setup: flag to track whether to run pci_ide_stream_teardown() for this
> >    *	   partner slot
> >    * @enable: flag whether to run pci_ide_stream_disable() for this partner slot
> > @@ -32,6 +34,7 @@ struct pci_ide_partner {
> >   	u16 rid_start;
> >   	u16 rid_end;
> >   	u8 stream_index;
> > +	unsigned int default_stream:1;
> 
> 
> This sets "Default" on both ends and the rootport does not need it in
> my setup (it does not seem to affect anything though) - the  rootport
> always knows the stream ID from the RMP entry of a MMIO being
> accessed. May be move it to pci_ide_partner? Thanks,

Sounds good.
